DROP SCHEMA IF EXISTS solution_5_lab CASCADE;
CREATE SCHEMA solution_5_lab;
SET SEARCH_PATH = solution_5_lab;

-- Создаём таблицу special_table
CREATE TABLE special_table (
    id integer PRIMARY KEY,
    table_name varchar(255) not null,
    column_name varchar(255) not null,
    current_max_value integer not null
);

-- Добавляем запись
INSERT INTO special_table (id, table_name, column_name, current_max_value)
VALUES (1, 'special_table', 'id', 1);

-- Создаем хранимую процедуру, которая создает триггеры и возвращает следующее целое число в столбце
CREATE OR REPLACE FUNCTION getNextValue(a_table_name VARCHAR, a_column_name VARCHAR) RETURNS INTEGER AS $$
DECLARE
    next_value INTEGER;
    special_id INTEGER;
BEGIN
    -- Проверяем, есть ли запись в special_table
    SELECT id, current_max_value INTO special_id, next_value
    FROM special_table
    WHERE table_name = a_table_name AND column_name = a_column_name;

    IF FOUND THEN
        -- Увеличиваем текущее максимальное значение
        next_value := next_value + 1;
        UPDATE special_table SET current_max_value = next_value WHERE id = special_id;
    ELSE
        -- Если записи нет, вычисляем максимальное значение в таблице
        EXECUTE format('SELECT COALESCE(MAX(%I), 0) FROM %I', a_column_name, a_table_name) INTO next_value;
        next_value := next_value + 1;

        -- Создаём новую запись в special_table
        SELECT COALESCE(MAX(id), 0) + 1 INTO special_id FROM special_table;
        INSERT INTO special_table (id, table_name, column_name, current_max_value)
        VALUES (special_id, a_table_name, a_column_name, next_value);
    END IF;

    -- Создание функции для триггера
    EXECUTE format($q$
        CREATE OR REPLACE FUNCTION insert_update_%s_for_%s() RETURNS TRIGGER AS $func$
            BEGIN
                IF (TG_OP = 'INSERT' OR TG_OP = 'UPDATE') THEN
                    IF NEW.%I > (SELECT current_max_value
                                 FROM special_table
                                 WHERE table_name = '%s' AND column_name = '%s') THEN
                        UPDATE special_table
                        SET current_max_value = NEW.%I
                        WHERE table_name = '%s' AND column_name = '%s';
                    END IF;
                END IF;
                RETURN NEW;
            END;
        $func$ LANGUAGE plpgsql;
    $q$, a_column_name, a_table_name, a_column_name, a_table_name, a_column_name,
                   a_column_name, a_table_name, a_column_name);

    -- Создание триггера
    EXECUTE format($q$
        CREATE OR REPLACE TRIGGER trigger_on_insert_update_%s_for_%s
            AFTER INSERT OR UPDATE OF %I ON %I
            FOR EACH ROW
            EXECUTE FUNCTION insert_update_%s_for_%s();
    $q$, a_column_name, a_table_name, a_column_name, a_table_name, a_column_name, a_table_name);

    RETURN next_value;
END;
$$ LANGUAGE plpgsql;


-- Создаём таблицу test
CREATE TABLE test (
    id INT NOT NULL
);


-- -- ТЕСТ 1. SQL-инъекция
-- SELECT getNextValue('special_table; DROP TABLE special_table;', 'id');


-- -- ТЕСТ 2. Вызов ХФ для пустой таблицы
-- SELECT getNextValue('test', 'id');


-- ТЕСТ 3. INSERT 1 строки
INSERT INTO test VALUES (3);
-- ТЕСТ 3. таблица
SELECT * FROM special_table;
-- ТЕСТ 3. getNextValue
SELECT getNextValue('test', 'id');
-- ТЕСТ 3. таблица
SELECT * FROM special_table;


-- ТЕСТ 4. INSERT нескольких строк, где первое значение меньше второго
INSERT INTO test VALUES (5), (8);
-- ТЕСТ 4. таблица
SELECT * FROM special_table;

-- ТЕСТ 5. INSERT нескольких строк, где первое значение больше второго
INSERT INTO test VALUES (12), (10);
-- ТЕСТ 5. таблица
SELECT * FROM special_table;


-- ТЕСТ 6. UPDATE поля
UPDATE test SET id = 16 WHERE id = 5;
-- ТЕСТ 6. таблица
SELECT * FROM special_table;

-- ТЕСТ 7. UPDATE поля
UPDATE test SET id = 2 WHERE id = 3;
-- ТЕСТ 7. таблица
SELECT * FROM special_table;

-- ТЕСТ 8. UPDATE нескольких полей
-- ТЕСТ 8. таблица test до изменений
SELECT * FROM test;
UPDATE test SET id = id + 1
WHERE id % 2 = 0;
-- ТЕСТ 8. таблица test после изменений
SELECT * FROM test;
-- ТЕСТ 8. таблица
SELECT * FROM special_table;