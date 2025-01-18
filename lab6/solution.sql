-- Создание схемы и таблицы для экспериментов
DROP SCHEMA IF EXISTS solution_6_lab CASCADE;
CREATE SCHEMA solution_6_lab;
SET SEARCH_PATH = solution_6_lab;

CREATE TABLE inventory (
    item_id SERIAL PRIMARY KEY,
    item_name VARCHAR(100),
    item_cost DECIMAL
);

INSERT INTO inventory (item_name, item_cost) VALUES
    ('Item A', 10.00),
    ('Item B', 20.00),
    ('Item C', 30.00);


-- 1. Проблема "Грязное чтение" (Dirty Read)
-- Уровень изоляции READ UNCOMMITTED в Postgres работает как READ COMMITTED
BEGIN TRANSACTION ISOLATION LEVEL READ UNCOMMITTED; -- Транзакция 1
SELECT * FROM inventory; -- Чтение всех данных

BEGIN TRANSACTION; -- Транзакция 2
UPDATE inventory SET item_cost = 15.00 WHERE item_id = 1; -- Изменение стоимости Item A
ROLLBACK; -- Отмена изменений

SELECT * FROM inventory; -- Чтение данных, включая отменённые изменения (грязное чтение)
COMMIT;
-- Решение: Использовать уровень READ COMMITTED, чтобы избежать грязного чтения.
-- Но под капотом и так используется READ COMMITTED, поэтому таблицы одинаковые.


-- 2. Проблема "Неповторяющееся чтение" (Non-repeatable Read или Fuzzy Read)
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; -- Транзакция 1
SELECT item_cost FROM inventory WHERE item_id = 1; -- Первое чтение стоимости Item A

BEGIN TRANSACTION; -- Транзакция 2
UPDATE inventory SET item_cost = 15.00 WHERE item_id = 1; -- Изменение стоимости Item A
COMMIT; -- Фиксация изменений

SELECT item_cost FROM inventory WHERE item_id = 1; -- Повторное чтение стоимости Item A (значение изменилось)
COMMIT;
-- Решение: Использовать уровень REPEATABLE READ, чтобы гарантировать, что данные не изменятся в рамках одной транзакции.


-- 3. Проблема "Потерянное обновление" (Lost Update)
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; -- Транзакция 1
SELECT * FROM inventory WHERE item_id = 1;
UPDATE inventory SET item_cost = item_cost + 5 WHERE item_id = 1; -- Увеличение стоимости Item A
SELECT * FROM inventory WHERE item_id = 1;

BEGIN TRANSACTION; -- Транзакция 2
UPDATE inventory SET item_cost = 15.00 WHERE item_id = 1; -- Установка фиксированной стоимости Item A
COMMIT;

COMMIT;
SELECT * FROM inventory WHERE item_id = 1; -- Потеря обновления из Транзакции 1
-- Решение: Использовать блокировку или уровень SERIALIZABLE для предотвращения конфликта изменений.


-- 4. Проблема "Фантомное чтение" (Phantom Read)
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- Транзакция 1
SELECT * FROM inventory WHERE item_cost < 30.00; -- Чтение данных (Item A, Item B)

BEGIN TRANSACTION; -- Транзакция 2
INSERT INTO inventory (item_name, item_cost) VALUES ('Item D', 25.00); -- Добавление нового элемента
COMMIT; -- Фиксация изменений

SELECT * FROM inventory WHERE item_cost < 30.00; -- Повторное чтение (фантомные данные видны: Item D)
COMMIT;
-- Решение: Использовать уровень SERIALIZABLE, чтобы исключить фантомные данные.


-- 5. Использование SERIALIZABLE для исключения всех аномалий
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- Транзакция 1
UPDATE inventory SET item_cost = 10.00 WHERE item_id = 1; -- Попытка изменения
SELECT * FROM inventory WHERE item_id = 1;

BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE; -- Транзакция 2
UPDATE inventory SET item_cost = 20.00 WHERE item_id = 1; -- Попытка изменения заблокируется
-- Должна завершиться после завершения Транзакции 1
END;
COMMIT;
SELECT * FROM inventory WHERE item_id = 1;