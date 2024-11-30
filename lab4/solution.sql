DROP SCHEMA IF EXISTS solution_4_lab CASCADE;

CREATE SCHEMA solution_4_lab;
SET SEARCH_PATH = solution_4_lab;

-- Создание таблицы Car_Dealerships
CREATE TABLE Car_Dealerships (
    car_dealership_id SERIAL PRIMARY KEY,
    address VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(100)
);

INSERT INTO Car_Dealerships (address, phone, email)
VALUES
    ('г. Москва, ул. Примерная, д. 10', '+7 (495) 123-45-67', 'moscow@example.com'),
    ('г. Санкт-Петербург, пр. Невский, д. 24', '+7 (812) 234-56-78', 'spb@example.com'),
    ('г. Казань, ул. Кремлёвская, д. 15', '+7 (843) 345-67-89', 'kazan@example.com'),
    ('г. Екатеринбург, ул. Ленина, д. 30', '+7 (343) 456-78-90', 'ekb@example.com'),
    ('г. Новосибирск, ул. Советская, д. 5', '+7 (383) 567-89-01', 'nsk@example.com');


-- Создание таблицы Employees
CREATE TABLE Employees (
    employee_id SERIAL PRIMARY KEY,
    car_dealership_id INT REFERENCES Car_Dealerships(car_dealership_id),
    employee_name VARCHAR(100),
    role VARCHAR(50),
    date_employment DATE,
    date_dismissal DATE NULL
);

INSERT INTO Employees (car_dealership_id, employee_name, role, date_employment, date_dismissal)
VALUES
-- Директора
(1, 'Иванов Иван Иванович', 'Директор', '2015-05-01', NULL),
(2, 'Петров Петр Петрович', 'Директор', '2016-06-15', NULL),
(3, 'Сидоров Алексей Николаевич', 'Директор', '2017-07-20', NULL),
(4, 'Кузнецов Андрей Сергеевич', 'Директор', '2018-08-10', NULL),
(5, 'Смирнова Ольга Викторовна', 'Директор', '2019-09-05', NULL),

-- Менеджеры
(1, 'Соколова Анна Дмитриевна', 'Менеджер', '2020-01-10', NULL),
(1, 'Федоров Михаил Павлович', 'Менеджер', '2021-03-15', NULL),
(1, 'Васильев Артем Олегович', 'Менеджер', '2022-04-20', NULL),
(2, 'Николаева Мария Сергеевна', 'Менеджер', '2020-02-01', NULL),
(2, 'Борисов Игорь Николаевич', 'Менеджер', '2021-05-10', NULL),
(2, 'Алексеев Дмитрий Андреевич', 'Менеджер', '2022-06-15', NULL),
(3, 'Михайлова Елена Владимировна', 'Менеджер', '2020-03-05', NULL),
(3, 'Орлов Роман Евгеньевич', 'Менеджер', '2021-07-10', NULL),
(3, 'Козлов Константин Юрьевич', 'Менеджер', '2022-08-25', NULL),
(4, 'Ершов Александр Игоревич', 'Менеджер', '2020-04-10', NULL),
(4, 'Гордеева Ксения Олеговна', 'Менеджер', '2021-09-05', NULL),
(4, 'Тихонов Николай Павлович', 'Менеджер', '2022-11-15', NULL),
(5, 'Чернова Дарья Ивановна', 'Менеджер', '2020-05-20', NULL),
(5, 'Семенов Григорий Максимович', 'Менеджер', '2021-10-10', NULL),
(5, 'Белов Виталий Валерьевич', 'Менеджер', '2023-01-15', NULL),

-- Другие должности
(1, 'Гаврилова Виктория Олеговна', 'Бухгалтер', '2015-06-10', NULL),
(2, 'Рыжов Артем Андреевич', 'Юрист', '2016-07-15', NULL),
(3, 'Ильин Сергей Геннадьевич', 'Механик', '2017-08-20', NULL),
(4, 'Панова Ольга Александровна', 'Маркетолог', '2018-09-25', NULL),
(5, 'Куликова Екатерина Владимировна', 'Логист', '2019-10-30', NULL),

-- Уволенные сотрудники
(1, 'Захаров Евгений Николаевич', 'Менеджер', '2019-01-15', '2021-12-31'),
(2, 'Лебедева Наталья Ивановна', 'Менеджер', '2018-03-20', '2020-11-15'),
(3, 'Шестаков Павел Сергеевич', 'Механик', '2019-06-25', '2021-09-10'),
(4, 'Громова Инна Васильевна', 'Менеджер', '2017-07-05', '2020-03-15'),
(5, 'Гришин Олег Вячеславович', 'Логист', '2016-05-10', '2019-08-25');


-- Создание таблицы Clients
CREATE TABLE Clients (
    client_id SERIAL PRIMARY KEY,
    client_name VARCHAR(100),
    client_passport_details VARCHAR(50),
    driver_license VARCHAR(20),
    client_phone VARCHAR(20),
    client_email VARCHAR(100)
);

INSERT INTO Clients (client_name, client_passport_details, driver_license, client_phone, client_email)
VALUES
    ('Иванов Иван Иванович', '4510 123456', '77 12 345678', '+7 (999) 123-45-67', 'ivanov@example.com'),
    ('Петров Петр Петрович', '4511 654321', '77 13 876543', '+7 (999) 234-56-78', 'petrov@example.com'),
    ('Сидорова Анна Владимировна', '4512 789012', '77 14 234567', '+7 (999) 345-67-89', 'sidorova@example.com'),
    ('Кузнецов Алексей Сергеевич', '4513 345678', '77 15 678901', '+7 (999) 456-78-90', 'kuznetsov@example.com'),
    ('Смирнов Артем Олегович', '4514 987654', '77 16 543210', '+7 (999) 567-89-01', 'smirnov@example.com'),
    ('Гаврилова Мария Николаевна', '4515 123890', '77 17 345678', '+7 (999) 678-90-12', 'gavrilova@example.com'),
    ('Орлов Роман Дмитриевич', '4516 098765', '77 18 987654', '+7 (999) 789-01-23', 'orlov@example.com'),
    ('Михайлова Ольга Павловна', '4517 567890', '77 19 432109', '+7 (999) 890-12-34', 'mikhailova@example.com'),
    ('Васильев Дмитрий Аркадьевич', '4518 432109', '77 20 567890', '+7 (999) 901-23-45', 'vasiliev@example.com'),
    ('Чернова Инна Валерьевна', '4519 654321', '77 21 098765', '+7 (999) 012-34-56', 'chernova@example.com'),
    ('Тихонов Павел Андреевич', '4520 789012', '77 22 123890', '+7 (999) 123-45-67', 'tikhonov@example.com'),
    ('Семенов Олег Викторович', '4521 345678', '77 23 345678', '+7 (999) 234-56-78', 'semenov@example.com'),
    ('Громова Елена Николаевна', '4522 987654', '77 24 678901', '+7 (999) 345-67-89', 'gromova@example.com'),
    ('Куликов Артем Геннадьевич', '4523 123890', '77 25 543210', '+7 (999) 456-78-90', 'kulikov@example.com'),
    ('Шестаков Андрей Сергеевич', '4524 098765', '77 26 987654', '+7 (999) 567-89-01', 'shestakov@example.com'),
    ('Захарова Инга Владимировна', '4525 567890', '77 27 432109', '+7 (999) 678-90-12', 'zaharova@example.com'),
    ('Панова Виктория Александровна', '4526 432109', '77 28 567890', '+7 (999) 789-01-23', 'panova@example.com'),
    ('Рыжов Алексей Иванович', '4527 654321', '77 29 098765', '+7 (999) 890-12-34', 'ryzhov@example.com'),
    ('Борисова Анастасия Павловна', '4528 789012', '77 30 123890', '+7 (999) 901-23-45', 'borisova@example.com'),
    ('Лебедев Сергей Викторович', '4529 345678', '77 31 345678', '+7 (999) 012-34-56', 'lebedev@example.com'),
    ('Морозова Вера Павловна', '4530 234567', '77 32 234567', '+7 (999) 234-56-78', 'morozova@example.com'),
    ('Дмитриева Алина Олеговна', '4531 123456', '77 33 345678', '+7 (999) 345-67-89', 'dmitrieva@example.com'),
    ('Новиков Виктор Степанович', '4532 345678', '77 34 456789', '+7 (999) 456-78-90', 'novikov@example.com'),
    ('Чернов Роман Олегович', '4533 456789', '77 35 567890', '+7 (999) 567-89-01', 'chernov@example.com'),
    ('Петрова Юлия Игоревна', '4534 567890', '77 36 678901', '+7 (999) 678-90-12', 'petrova@example.com'),
    ('Федоров Сергей Павлович', '4535 678901', '77 37 789012', '+7 (999) 789-01-23', 'fedorov@example.com'),
    ('Егорова Ксения Дмитриевна', '4536 789012', '77 38 890123', '+7 (999) 890-12-34', 'egorova@example.com'),
    ('Антонов Игорь Павлович', '4537 890123', '77 39 901234', '+7 (999) 901-23-45', 'antonov@example.com'),
    ('Трофимова Светлана Олеговна', '4538 901234', '77 40 012345', '+7 (999) 012-34-56', 'trofimova@example.com'),
    ('Григорьев Илья Анатольевич', '4539 012345', '77 41 123456', '+7 (999) 123-45-67', 'grigoryev@example.com'),
    ('Климова Виктория Михайловна', '4540 123456', '77 42 234567', '+7 (999) 234-56-78', 'klimova@example.com'),
    ('Лаврова Наталья Александровна', '4541 234567', '77 43 345678', '+7 (999) 345-67-89', 'lavrova@example.com'),
    ('Николаев Вячеслав Никитович', '4542 345678', '77 44 456789', '+7 (999) 456-78-90', 'nikolaev@example.com'),
    ('Баркова Татьяна Геннадьевна', '4543 456789', '77 45 567890', '+7 (999) 567-89-01', 'barkova@example.com'),
    ('Мартынова Надежда Игоревна', '4544 567890', '77 46 678901', '+7 (999) 678-90-12', 'martynova@example.com'),
    ('Зуева Ольга Анатольевна', '4545 678901', '77 47 789012', '+7 (999) 789-01-23', 'zueva@example.com');

-- Создание таблицы Models
CREATE TABLE Models (
    model_id SERIAL PRIMARY KEY,
    model_name VARCHAR(100),
    model_year INT,
    available_for_order BOOLEAN
);

INSERT INTO Models (model_name, model_year, available_for_order)
VALUES
    ('Volkswagen Polo', 2024, TRUE),
    ('Volkswagen Golf', 2023, TRUE),
    ('Volkswagen Passat', 2022, TRUE),
    ('Volkswagen Tiguan', 2024, TRUE),
    ('Volkswagen Touareg', 2023, TRUE),
    ('Volkswagen Jetta', 2022, TRUE),
    ('Volkswagen Arteon', 2023, TRUE),
    ('Volkswagen Multivan', 2024, TRUE),
    ('Volkswagen Caddy', 2023, TRUE),
    ('Volkswagen Sharan', 2023, TRUE),
    ('Volkswagen ID.Buzz', 2023, TRUE),
    ('Volkswagen Amarok', 2023, TRUE),
    ('Volkswagen T-Cross', 2022, TRUE),
    ('Volkswagen T-Roc', 2023, TRUE),
    ('Volkswagen Scirocco', 2017, FALSE);


-- Создание таблицы Equipments
CREATE TABLE Equipments (
    equipment_id SERIAL PRIMARY KEY,
    equipment_name VARCHAR(100),
    equipment_description TEXT
);

INSERT INTO Equipments (equipment_name, equipment_description)
VALUES
-- Volkswagen Polo
('Trendline', 'Базовая комплектация: кондиционер, стальные диски, простая аудиосистема'),
('Comfortline', 'Улучшенная комплектация: климат-контроль, литые диски, мультимедиа с сенсорным экраном'),
('Highline', 'Топовая комплектация: кожаный салон, круиз-контроль, система помощи парковки'),

-- Volkswagen Golf
('Base', 'Базовая комплектация: тканевый салон, кондиционер, стандартная аудиосистема'),
('Style', 'Средний уровень: климат-контроль, улучшенные материалы отделки, мультимедиа с дисплеем 8 дюймов'),
('R-Line', 'Спортивная версия: агрессивный дизайн, спортивные сиденья, система выбора режимов движения'),

-- Volkswagen Passat
('Trendline', 'Базовая версия: тканевый салон, кондиционер, стальные диски'),
('Comfortline', 'Средняя комплектация: кожаный руль, двухзонный климат-контроль, мультимедиа'),
('Elegance', 'Топовая комплектация: матричные фары, премиальная аудиосистема, кожа и алькантара в салоне'),

-- Volkswagen Tiguan
('Base', 'Начальная комплектация: тканевый салон, стандартная мультимедиа, кондиционер'),
('Life', 'Средняя комплектация: климат-контроль, улучшенные материалы салона, литые диски'),
('R-Line', 'Спортивная комплектация: спортивный руль, аэродинамический обвес, электронные помощники'),

-- Volkswagen Touareg
('Atmosphere', 'Элегантная комплектация: кожа, дерево, премиальная аудиосистема'),
('Elegance', 'Роскошная версия: улучшенная отделка, адаптивный круиз-контроль, система ночного видения'),
('R-Line', 'Спортивная версия: спортивные сиденья, мощный двигатель, расширенные функции безопасности'),

-- Volkswagen Jetta
('Base', 'Базовая версия: тканевый салон, кондиционер, стандартная аудиосистема'),
('Comfort', 'Средняя комплектация: улучшенные материалы, мультимедиа с дисплеем, литые диски'),
('GLI', 'Спортивная версия: агрессивный дизайн, мощный двигатель, спортивные сиденья'),

-- Volkswagen Arteon
('Elegance', 'Роскошная версия: премиальная отделка, кожа, мультимедиа высокого уровня'),
('R-Line', 'Спортивная версия: спортивные сиденья, уникальный дизайн интерьера и экстерьера'),

-- Volkswagen Multivan
('Base', 'Базовая версия: тканевый салон, кондиционер, мультимедиа'),
('Business', 'Бизнес-версия: кожаный салон, расширенная мультимедиа, адаптивный круиз-контроль'),

-- Volkswagen Caddy
('Base', 'Базовая версия: тканевый салон, кондиционер, стальные диски'),
('Life', 'Средний уровень: литые диски, мультимедиа с дисплеем 8 дюймов, улучшенная отделка'),

-- Volkswagen Sharan
('Base', 'Базовая комплектация: кондиционер, тканевый салон, мультимедиа'),
('Highline', 'Топовая комплектация: кожаный салон, панорамная крыша, премиальная аудиосистема'),

-- Volkswagen ID.Buzz
('Pro', 'Стандартная версия: тканевый салон, электрические сиденья, мультимедиа с дисплеем 10 дюймов'),
('Pro S', 'Расширенная версия: премиальная отделка, панорамная крыша, улучшенная батарея'),

-- Volkswagen Amarok
('Base', 'Базовая версия: тканевый салон, стандартная мультимедиа, стальные диски'),
('Aventura', 'Топовая версия: кожаный салон, премиальная аудиосистема, расширенные функции безопасности'),

-- Volkswagen T-Cross
('Base', 'Базовая комплектация: кондиционер, стандартная мультимедиа, тканевый салон'),
('Life', 'Средняя версия: улучшенные материалы отделки, литые диски, мультимедиа с экраном 8 дюймов'),

-- Volkswagen T-Roc
('Base', 'Базовая версия: тканевый салон, стандартная мультимедиа, кондиционер'),
('Style', 'Средняя комплектация: климат-контроль, литые диски, мультимедиа с большим экраном'),

-- Volkswagen Scirocco
('Base', 'Базовая версия: тканевый салон, кондиционер, стальные диски'),
('R', 'Спортивная версия: мощный двигатель, спортивные сиденья, уникальный дизайн');


-- Создание таблицы Colors
CREATE TABLE Colors (
    color_id SERIAL PRIMARY KEY,
    color_name VARCHAR(50)
);

INSERT INTO Colors (color_name)
VALUES
    ('Pure White'),
    ('Deep Black Pearl'),
    ('Reflex Silver'),
    ('Oryx White Pearl'),
    ('Moonstone Grey'),
    ('Atlantic Blue'),
    ('Kings Red'),
    ('Lapiz Blue'),
    ('Dolphin Grey'),
    ('Pyrite Silver'),
    ('Manganese Grey'),
    ('Nightshade Blue'),
    ('Starlight Blue'),
    ('Golden Green'),
    ('Ravenna Blue'),
    ('Energetic Orange'),
    ('Turmeric Yellow'),
    ('Candy White'),
    ('Tornado Red'),
    ('Dark Burgundy');


-- Создание таблицы Model_Equipments (М:М)
CREATE TABLE Model_Equipments (
    equipment_id INT REFERENCES Equipments(equipment_id),
    model_id INT REFERENCES Models(model_id),
    PRIMARY KEY (equipment_id, model_id)
);

INSERT INTO Model_Equipments (equipment_id, model_id)
VALUES
-- Volkswagen Polo
(1, 1), -- Trendline для Polo
(2, 1), -- Comfortline для Polo
(3, 1), -- Highline для Polo

-- Volkswagen Golf
(4, 2), -- Base для Golf
(5, 2), -- Style для Golf
(6, 2), -- R-Line для Golf

-- Volkswagen Passat
(7, 3), -- Trendline для Passat
(8, 3), -- Comfortline для Passat
(9, 3), -- Elegance для Passat

-- Volkswagen Tiguan
(10, 4), -- Base для Tiguan
(11, 4), -- Life для Tiguan
(12, 4), -- R-Line для Tiguan

-- Volkswagen Touareg
(13, 5), -- Atmosphere для Touareg
(14, 5), -- Elegance для Touareg
(15, 5), -- R-Line для Touareg

-- Volkswagen Jetta
(16, 6), -- Base для Jetta
(17, 6), -- Comfort для Jetta
(18, 6), -- GLI для Jetta

-- Volkswagen Arteon
(19, 7), -- Elegance для Arteon
(20, 7), -- R-Line для Arteon

-- Volkswagen Multivan
(21, 8), -- Base для Multivan
(22, 8), -- Business для Multivan

-- Volkswagen Caddy
(23, 9), -- Base для Caddy
(24, 9), -- Life для Caddy

-- Volkswagen Sharan
(25, 10), -- Base для Sharan
(26, 10), -- Highline для Sharan

-- Volkswagen ID.Buzz
(27, 11), -- Pro для ID.Buzz
(28, 11), -- Pro S для ID.Buzz

-- Volkswagen Amarok
(29, 12), -- Base для Amarok
(30, 12), -- Aventura для Amarok

-- Volkswagen T-Cross
(31, 13), -- Base для T-Cross
(32, 13), -- Life для T-Cross

-- Volkswagen T-Roc
(33, 14), -- Base для T-Roc
(34, 14), -- Style для T-Roc

-- Volkswagen Scirocco
(35, 15), -- Base для Scirocco
(36, 15); -- R для Scirocco


-- Создание таблицы Model_Colors (М:М)
CREATE TABLE Model_Colors (
    color_id INT REFERENCES Colors(color_id),
    model_id INT REFERENCES Models(model_id),
    PRIMARY KEY (color_id, model_id)
);

INSERT INTO Model_Colors (color_id, model_id)
VALUES
-- Volkswagen Polo
(1, 1), -- Pure White для Polo
(2, 1), -- Deep Black Pearl для Polo
(3, 1), -- Reflex Silver для Polo
(4, 1), -- Oryx White Pearl для Polo
(5, 1), -- Moonstone Grey для Polo

-- Volkswagen Golf
(1, 2), -- Pure White для Golf
(2, 2), -- Deep Black Pearl
(3, 2), -- Reflex Silver для Golf
(7, 2), -- Nightshade Blue для Golf
(8, 2), -- Starlight Blue для Golf
(9, 2), -- Golden Green для Golf

-- Volkswagen Passat
(2, 3), -- Deep Black Pearl для Passat
(5, 3), -- Moonstone Grey для Passat
(6, 3), -- Atlantic Blue для Passat
(7, 3), -- Nightshade Blue для Passat
(10, 3), -- Tornado Red для Passat

-- Volkswagen Tiguan
(1, 4), -- Pure White для Tiguan
(4, 4), -- Oryx White Pearl для Tiguan
(11, 4), -- Ravenna Blue для Tiguan
(12, 4), -- Energetic Orange для Tiguan
(6, 4), -- Atlantic Blue для Tiguan

-- Volkswagen Touareg
(1, 5), -- Pure White для Touareg
(2, 5), -- Deep Black Pearl для Touareg
(3, 5), -- Reflex Silver для Touareg
(13, 5), -- Dark Burgundy для Touareg
(5, 5), -- Moonstone Grey для Touareg

-- Volkswagen Jetta
(1, 6), -- Pure White для Jetta
(2, 6), -- Deep Black Pearl для Jetta
(4, 6), -- Oryx White Pearl для Jetta
(6, 6), -- Atlantic Blue для Jetta
(7, 6), -- Nightshade Blue для Jetta

-- Volkswagen Arteon
(3, 7), -- Reflex Silver для Arteon
(4, 7), -- Oryx White Pearl для Arteon
(6, 7), -- Atlantic Blue для Arteon
(5, 7), -- Moonstone Grey для Arteon
(10, 7), -- Tornado Red для Arteon

-- Volkswagen Multivan
(1, 8), -- Pure White для Multivan
(5, 8), -- Moonstone Grey для Multivan
(7, 8), -- Nightshade Blue для Multivan
(9, 8), -- Manganese Grey для Multivan
(11, 8), -- Ravenna Blue для Multivan

-- Volkswagen Caddy
(1, 9), -- Pure White для Caddy
(2, 9), -- Deep Black Pearl для Caddy
(3, 9), -- Reflex Silver для Caddy
(5, 9), -- Moonstone Grey для Caddy
(13, 9), -- Dark Burgundy для Caddy

-- Volkswagen Sharan
(1, 10), -- Pure White для Sharan
(6, 10), -- Atlantic Blue для Sharan
(5, 10), -- Moonstone Grey для Sharan
(3, 10), -- Reflex Silver для Sharan
(9, 10), -- Manganese Grey для Sharan

-- Volkswagen ID.Buzz
(1, 11), -- Pure White для ID.Buzz
(4, 11), -- Oryx White Pearl для ID.Buzz
(6, 11), -- Atlantic Blue для ID.Buzz
(13, 11), -- Dark Burgundy для ID.Buzz
(12, 11), -- Energetic Orange для ID.Buzz

-- Volkswagen Amarok
(2, 12), -- Deep Black Pearl для Amarok
(1, 12), -- Pure White для Amarok
(9, 12), -- Manganese Grey для Amarok
(7, 12), -- Nightshade Blue для Amarok
(10, 12), -- Tornado Red для Amarok

-- Volkswagen T-Cross
(1, 13), -- Pure White для T-Cross
(6, 13), -- Atlantic Blue для T-Cross
(7, 13), -- Nightshade Blue для T-Cross
(3, 13), -- Reflex Silver для T-Cross
(12, 13), -- Energetic Orange для T-Cross

-- Volkswagen T-Roc
(1, 14), -- Pure White для T-Roc
(7, 14), -- Nightshade Blue для T-Roc
(6, 14), -- Atlantic Blue для T-Roc
(9, 14), -- Manganese Grey для T-Roc
(10, 14), -- Tornado Red для T-Roc

-- Volkswagen Scirocco
(1, 15), -- Pure White для Scirocco
(2, 15), -- Deep Black Pearl для Scirocco
(7, 15), -- Nightshade Blue для Scirocco
(10, 15), -- Tornado Red для Scirocco
(12, 15); -- Energetic Orange для Scirocco


-- Создание таблицы Cars_Available
CREATE TABLE Cars_Available (
    vin VARCHAR(20) PRIMARY KEY,
    car_dealership_id INT REFERENCES Car_Dealerships(car_dealership_id),
    model_id INT REFERENCES Models(model_id),
    equipment_id INT REFERENCES Equipments(equipment_id),
    color_id INT REFERENCES Colors(color_id)
);

INSERT INTO Cars_Available (vin, car_dealership_id, model_id, equipment_id, color_id)
VALUES
-- Для автосалона 1 (car_dealership_id = 1)
('VIN123456789012345', 1, 1, 1, 1), -- Polo, Trendline, Pure White
('VIN123456789012346', 1, 1, 2, 2), -- Polo, Comfortline, Deep Black Pearl
('VIN123456789012347', 1, 1, 3, 3), -- Polo, Highline, Reflex Silver
('VIN123456789012348', 1, 1, 1, 4), -- Polo, Trendline, Oryx White Pearl
('VIN123456789012349', 1, 1, 2, 5), -- Polo, Comfortline, Moonstone Grey
('VIN123456789012350', 1, 2, 4, 1), -- Golf, Base, Pure White
('VIN123456789012351', 1, 2, 5, 2), -- Golf, Style, Deep Black Pearl
('VIN123456789012352', 1, 2, 6, 3), -- Golf, R-Line, Reflex Silver
('VIN123456789012353', 1, 3, 7, 6), -- Passat, Trendline, Atlantic Blue
('VIN123456789012354', 1, 3, 8, 7), -- Passat, Comfortline, Nightshade Blue

-- Для автосалона 2 (car_dealership_id = 2)
('VIN223456789012345', 2, 4, 10, 8), -- Tiguan, Base, Oryx White Pearl
('VIN223456789012346', 2, 4, 11, 5), -- Tiguan, Life, Moonstone Grey
('VIN223456789012347', 2, 4, 12, 6), -- Tiguan, R-Line, Atlantic Blue
('VIN223456789012348', 2, 4, 10, 9), -- Tiguan, Base, Manganese Grey
('VIN223456789012349', 2, 5, 13, 3), -- Touareg, Atmosphere, Reflex Silver
('VIN223456789012350', 2, 5, 14, 7), -- Touareg, Elegance, Nightshade Blue
('VIN223456789012351', 2, 5, 15, 2), -- Touareg, R-Line, Deep Black Pearl
('VIN223456789012352', 2, 6, 16, 1), -- Jetta, Base, Pure White
('VIN223456789012353', 2, 6, 17, 4), -- Jetta, Comfort, Oryx White Pearl
('VIN223456789012354', 2, 6, 18, 6), -- Jetta, GLI, Atlantic Blue

-- Для автосалона 3 (car_dealership_id = 3)
('VIN323456789012345', 3, 7, 19, 11), -- Arteon, Elegance, Ravenna Blue
('VIN323456789012346', 3, 7, 20, 8), -- Arteon, R-Line, Starlight Blue
('VIN323456789012347', 3, 7, 19, 9), -- Arteon, Elegance, Manganese Grey
('VIN323456789012348', 3, 8, 21, 5), -- Multivan, Base, Moonstone Grey
('VIN323456789012349', 3, 8, 22, 7), -- Multivan, Business, Nightshade Blue
('VIN323456789012350', 3, 9, 23, 10), -- Caddy, Base, Tornado Red
('VIN323456789012351', 3, 9, 24, 6), -- Caddy, Life, Atlantic Blue
('VIN323456789012352', 3, 10, 25, 3), -- Sharan, Base, Reflex Silver
('VIN323456789012353', 3, 10, 26, 4), -- Sharan, Highline, Oryx White Pearl
('VIN323456789012354', 3, 11, 27, 5), -- ID.Buzz, Pro, Moonstone Grey

-- Для автосалона 4 (car_dealership_id = 4)
('VIN423456789012345', 4, 12, 29, 12), -- Amarok, Base, Energetic Orange
('VIN423456789012346', 4, 12, 30, 13), -- Amarok, Aventura, Dark Burgundy
('VIN423456789012347', 4, 13, 31, 2), -- T-Cross, Base, Deep Black Pearl
('VIN423456789012348', 4, 13, 32, 4), -- T-Cross, Life, Oryx White Pearl
('VIN423456789012349', 4, 14, 33, 7), -- T-Roc, Base, Nightshade Blue
('VIN423456789012350', 4, 14, 34, 1), -- T-Roc, Style, Pure White
('VIN423456789012351', 4, 15, 35, 6), -- Scirocco, Base, Atlantic Blue
('VIN423456789012352', 4, 15, 36, 5), -- Scirocco, R, Moonstone Grey
('VIN423456789012353', 4, 1, 3, 1), -- Polo, Trendline, Pure White
('VIN423456789012354', 4, 1, 2, 8); -- Polo, Comfortline, Starlight Blue


-- Создание таблицы Order_Statuses
CREATE TABLE Order_Status (
    status_id SERIAL PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

INSERT INTO Order_Status (status_name)
VALUES
    ('Pending'),
    ('In Progress'),
    ('Completed'),
    ('Cancelled');

-- Создание таблицы Orders
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    model_id INT,
    equipment_id INT,
    color_id INT,
    order_date DATE,
    status_id INT REFERENCES Order_Status(status_id),
    FOREIGN KEY (model_id, equipment_id) REFERENCES Model_Equipments(model_id, equipment_id),
    FOREIGN KEY (model_id, color_id) REFERENCES Model_Colors(model_id, color_id)
);

INSERT INTO Orders (model_id, equipment_id, color_id, order_date, status_id)
VALUES
-- 1. Polo
(1, 1, 1, '2024-01-15', 1), -- Pending
(1, 2, 2, '2024-02-22', 2), -- In Progress
(1, 3, 3, '2024-03-10', 3), -- Completed
(1, 2, 4, '2024-04-17', 4), -- Cancelled
(1, 1, 5, '2024-05-09', 1), -- Pending

-- 2. Golf
(2, 4, 1, '2024-03-01', 3), -- Completed
(2, 5, 2, '2024-03-25', 2), -- In Progress
(2, 6, 3, '2024-06-30', 1), -- Pending
(2, 5, 9, '2024-07-15', 4), -- Cancelled
(2, 4, 7, '2024-08-11', 3), -- Completed

-- 3. Passat
(3, 7, 5, '2024-01-10', 2), -- In Progress
(3, 8, 2, '2024-02-14', 1), -- Pending
(3, 9, 6, '2024-04-23', 3), -- Completed
(3, 8, 7, '2024-05-30', 4), -- Cancelled
(3, 7, 10, '2024-06-25', 2), -- In Progress

-- 4. Tiguan
(4, 10, 1, '2024-02-18', 1), -- Pending
(4, 11, 4, '2024-03-29', 3), -- Completed
(4, 12, 1, '2024-04-10', 2), -- In Progress
(4, 10, 11, '2024-06-05', 1), -- Pending
(4, 12, 12, '2024-07-20', 4), -- Cancelled

-- 5. Touareg
(5, 13, 1, '2024-01-24', 2), -- In Progress
(5, 14, 2, '2024-02-05', 1), -- Pending
(5, 15, 3, '2024-03-12', 3), -- Completed
(5, 13, 5, '2024-05-02', 4), -- Cancelled
(5, 14, 13, '2024-07-02', 3); -- Completed


-- Создание таблицы Payment_Types
CREATE TABLE Payment_Types (
    payment_type_id SERIAL PRIMARY KEY,
    type VARCHAR(50)
);

INSERT INTO Payment_Types (type)
VALUES
    ('Cash'),
    ('Credit Card'),
    ('Bank Transfer');


-- Создание таблицы Payments
CREATE TABLE Payments (
    payment_number SERIAL PRIMARY KEY,
    payment_amount DECIMAL(10, 2),
    discount DECIMAL(10, 2),
    total DECIMAL(10, 2),
    payment_type_id INT REFERENCES Payment_Types(payment_type_id),
    payment_date DATE
);

INSERT INTO Payments (payment_amount, discount, total, payment_type_id, payment_date)
VALUES
    (1000000, 50000, 950000, 1, '2024-01-12'), -- Cash, 1 млн, с учетом скидки
    (2500000, 100000, 2400000, 2, '2024-02-15'), -- Credit Card, 2.5 млн, с учетом скидки
    (1500000, 0, 1500000, 3, '2024-03-05'), -- Bank Transfer, 1.5 млн
    (5000000, 200000, 4800000, 1, '2024-04-20'), -- Cash, 5 млн
    (1200000, 10000, 1190000, 2, '2024-05-10'), -- Credit Card, 1.2 млн, с учетом скидки
    (3000000, 150000, 2850000, 3, '2024-06-25'), -- Bank Transfer, 3 млн, с учетом скидки
    (4500000, 100000, 4400000, 1, '2024-07-13'), -- Cash, 4.5 млн
    (2200000, 50000, 2150000, 2, '2024-08-09'), -- Credit Card, 2.2 млн, с учетом скидки
    (3300000, 120000, 3180000, 3, '2024-09-30'), -- Bank Transfer, 3.3 млн, с учетом скидки
    (6000000, 300000, 5700000, 1, '2024-10-01'), -- Cash, 6 млн
    (7000000, 0, 7000000, 2, '2024-11-01'), -- Credit Card, 7 млн
    (1600000, 50000, 1550000, 3, '2024-12-02'), -- Bank Transfer, 1.6 млн, с учетом скидки
    (2300000, 100000, 2200000, 1, '2024-01-25'), -- Cash, 2.3 млн
    (5000000, 0, 5000000, 2, '2024-02-05'), -- Credit Card, 5 млн
    (2700000, 200000, 2500000, 3, '2024-03-12'), -- Bank Transfer, 2.7 млн, с учетом скидки
    (2000000, 70000, 1930000, 1, '2024-04-22'), -- Cash, 2 млн, с учетом скидки
    (3800000, 150000, 3650000, 2, '2024-05-17'), -- Credit Card, 3.8 млн, с учетом скидки
    (1400000, 50000, 1350000, 3, '2024-06-01'), -- Bank Transfer, 1.4 млн, с учетом скидки
    (6200000, 300000, 5900000, 1, '2024-07-21'), -- Cash, 6.2 млн
    (2500000, 100000, 2400000, 2, '2024-08-15'), -- Credit Card, 2.5 млн, с учетом скидки
    (3200000, 150000, 3050000, 3, '2024-09-05'), -- Bank Transfer, 3.2 млн, с учетом скидки
    (5500000, 250000, 5250000, 1, '2024-10-14'), -- Cash, 5.5 млн
    (1900000, 70000, 1830000, 2, '2024-11-25'), -- Credit Card, 1.9 млн, с учетом скидки
    (4200000, 150000, 4050000, 3, '2024-12-20'), -- Bank Transfer, 4.2 млн, с учетом скидки
    (2600000, 100000, 2500000, 1, '2024-01-30'), -- Cash, 2.6 млн
    (3400000, 200000, 3200000, 2, '2024-02-17'), -- Credit Card, 3.4 млн, с учетом скидки
    (1800000, 50000, 1750000, 3, '2024-03-03'), -- Bank Transfer, 1.8 млн, с учетом скидки
    (4100000, 150000, 3950000, 1, '2024-04-02'), -- Cash, 4.1 млн
    (3900000, 0, 3900000, 2, '2024-05-12'); -- Credit Card, 3.9 млн


-- Создание таблицы Agreements
CREATE TABLE Agreements (
    agreement_id SERIAL PRIMARY KEY,
    car_dealership_id INT REFERENCES Car_Dealerships(car_dealership_id),
    manager_id INT REFERENCES Employees(employee_id),
    client_id INT REFERENCES Clients(client_id),
    order_id INT REFERENCES Orders(order_id),
    vin VARCHAR(20),
    agreement_date DATE,
    payment_id INT REFERENCES Payments(payment_number),
    warranty_start_date DATE,
    warranty_end_date DATE
);

INSERT INTO Agreements (car_dealership_id, manager_id, client_id, order_id, vin, agreement_date, payment_id, warranty_start_date, warranty_end_date)
VALUES
    (1, 1, 1, 1, 'VIN123456789012345', '2024-01-20', 1, '2024-01-20', '2027-01-20'), -- Cash, Polo
    (2, 2, 2, 2, 'VIN223456789012346', '2024-02-18', 2, '2024-02-18', '2027-02-18'), -- Credit Card, Golf
    (3, 3, 3, 3, 'VIN323456789012347', '2024-03-15', 3, '2024-03-15', '2027-03-15'), -- Bank Transfer, Passat
    (1, 4, 4, 4, NULL, '2024-04-10', 4, '2024-04-10', '2027-04-10'), -- Cash, Polo (Cancelled)
    (2, 5, 5, 5, 'VIN223456789012348', '2024-05-05', 5, '2024-05-05', '2027-05-05'), -- Credit Card, Golf
    (3, 6, 6, 6, NULL, '2024-06-01', 6, '2024-06-01', '2027-06-01'), -- Bank Transfer, Passat (Cancelled)
    (4, 7, 7, 7, 'VIN423456789012349', '2024-07-10', 7, '2024-07-10', '2027-07-10'), -- Cash, Tiguan
    (5, 8, 8, 8, 'VIN523456789012350', '2024-08-15', 8, '2024-08-15', '2027-08-15'), -- Credit Card, Touareg
    (1, 9, 9, 9, NULL, '2024-09-20', 9, '2024-09-20', '2027-09-20'), -- Cash, Polo (Cancelled)
    (2, 10, 10, 10, 'VIN223456789012351', '2024-10-05', 10, '2024-10-05', '2027-10-05'), -- Credit Card, Golf
    (3, 11, 11, 11, 'VIN323456789012352', '2024-11-11', 11, '2024-11-11', '2027-11-11'), -- Bank Transfer, Passat
    (4, 12, 12, 12, 'VIN423456789012353', '2024-12-15', 12, '2024-12-15', '2027-12-15'), -- Cash, Tiguan
    (5, 13, 13, 13, 'VIN523456789012354', '2024-01-10', 13, '2024-01-10', '2027-01-10'), -- Credit Card, Touareg
    (1, 14, 14, 14, 'VIN123456789012356', '2024-02-20', 14, '2024-02-20', '2027-02-20'), -- Cash, Polo
    (2, 15, 15, 15, 'VIN223456789012357', '2024-03-25', 15, '2024-03-25', '2027-03-25'), -- Credit Card, Golf
    (3, 16, 16, 16, NULL, '2024-04-18', 16, '2024-04-18', '2027-04-18'), -- Bank Transfer, Passat (Cancelled)
    (4, 17, 17, 17, 'VIN423456789012358', '2024-05-23', 17, '2024-05-23', '2027-05-23'), -- Cash, Tiguan
    (5, 18, 18, 18, 'VIN523456789012359', '2024-06-15', 18, '2024-06-15', '2027-06-15'), -- Credit Card, Touareg
    (1, 19, 19, 19, NULL, '2024-07-30', 19, '2024-07-30', '2027-07-30'), -- Cash, Polo (Cancelled)
    (2, 20, 20, 20, 'VIN223456789012360', '2024-08-01', 20, '2024-08-01', '2027-08-01'), -- Credit Card, Golf
    (3, 21, 21, 21, 'VIN323456789012361', '2024-09-25', 21, '2024-09-25', '2027-09-25'), -- Bank Transfer, Passat
    (4, 22, 22, 22, 'VIN423456789012362', '2024-10-18', 22, '2024-10-18', '2027-10-18'), -- Cash, Tiguan
    (5, 23, 23, 23, 'VIN523456789012363', '2024-11-15', 23, '2024-11-15', '2027-11-15'); -- Credit Card, Touareg
DROP SCHEMA IF EXISTS test3 CASCADE;

CREATE SCHEMA test3;
SET SEARCH_PATH = test3;

-- Создание таблицы Car_Dealerships
CREATE TABLE Car_Dealerships (
    car_dealership_id SERIAL PRIMARY KEY,
    address VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(100)
);

INSERT INTO Car_Dealerships (address, phone, email)
VALUES
    ('г. Москва, ул. Примерная, д. 10', '+7 (495) 123-45-67', 'moscow@example.com'),
    ('г. Санкт-Петербург, пр. Невский, д. 24', '+7 (812) 234-56-78', 'spb@example.com'),
    ('г. Казань, ул. Кремлёвская, д. 15', '+7 (843) 345-67-89', 'kazan@example.com'),
    ('г. Екатеринбург, ул. Ленина, д. 30', '+7 (343) 456-78-90', 'ekb@example.com'),
    ('г. Новосибирск, ул. Советская, д. 5', '+7 (383) 567-89-01', 'nsk@example.com');


-- Создание таблицы Employees
CREATE TABLE Employees (
    employee_id SERIAL PRIMARY KEY,
    car_dealership_id INT REFERENCES Car_Dealerships(car_dealership_id),
    employee_name VARCHAR(100),
    role VARCHAR(50),
    date_employment DATE,
    date_dismissal DATE NULL
);

INSERT INTO Employees (car_dealership_id, employee_name, role, date_employment, date_dismissal)
VALUES
-- Директора
(1, 'Иванов Иван Иванович', 'Директор', '2015-05-01', NULL),
(2, 'Петров Петр Петрович', 'Директор', '2016-06-15', NULL),
(3, 'Сидоров Алексей Николаевич', 'Директор', '2017-07-20', NULL),
(4, 'Кузнецов Андрей Сергеевич', 'Директор', '2018-08-10', NULL),
(5, 'Смирнова Ольга Викторовна', 'Директор', '2019-09-05', NULL),

-- Менеджеры
(1, 'Соколова Анна Дмитриевна', 'Менеджер', '2020-01-10', NULL),
(1, 'Федоров Михаил Павлович', 'Менеджер', '2021-03-15', NULL),
(1, 'Васильев Артем Олегович', 'Менеджер', '2022-04-20', NULL),
(2, 'Николаева Мария Сергеевна', 'Менеджер', '2020-02-01', NULL),
(2, 'Борисов Игорь Николаевич', 'Менеджер', '2021-05-10', NULL),
(2, 'Алексеев Дмитрий Андреевич', 'Менеджер', '2022-06-15', NULL),
(3, 'Михайлова Елена Владимировна', 'Менеджер', '2020-03-05', NULL),
(3, 'Орлов Роман Евгеньевич', 'Менеджер', '2021-07-10', NULL),
(3, 'Козлов Константин Юрьевич', 'Менеджер', '2022-08-25', NULL),
(4, 'Ершов Александр Игоревич', 'Менеджер', '2020-04-10', NULL),
(4, 'Гордеева Ксения Олеговна', 'Менеджер', '2021-09-05', NULL),
(4, 'Тихонов Николай Павлович', 'Менеджер', '2022-11-15', NULL),
(5, 'Чернова Дарья Ивановна', 'Менеджер', '2020-05-20', NULL),
(5, 'Семенов Григорий Максимович', 'Менеджер', '2021-10-10', NULL),
(5, 'Белов Виталий Валерьевич', 'Менеджер', '2023-01-15', NULL),

-- Другие должности
(1, 'Гаврилова Виктория Олеговна', 'Бухгалтер', '2015-06-10', NULL),
(2, 'Рыжов Артем Андреевич', 'Юрист', '2016-07-15', NULL),
(3, 'Ильин Сергей Геннадьевич', 'Механик', '2017-08-20', NULL),
(4, 'Панова Ольга Александровна', 'Маркетолог', '2018-09-25', NULL),
(5, 'Куликова Екатерина Владимировна', 'Логист', '2019-10-30', NULL),

-- Уволенные сотрудники
(1, 'Захаров Евгений Николаевич', 'Менеджер', '2019-01-15', '2021-12-31'),
(2, 'Лебедева Наталья Ивановна', 'Менеджер', '2018-03-20', '2020-11-15'),
(3, 'Шестаков Павел Сергеевич', 'Механик', '2019-06-25', '2021-09-10'),
(4, 'Громова Инна Васильевна', 'Менеджер', '2017-07-05', '2020-03-15'),
(5, 'Гришин Олег Вячеславович', 'Логист', '2016-05-10', '2019-08-25');


-- Создание таблицы Clients
CREATE TABLE Clients (
    client_id SERIAL PRIMARY KEY,
    client_name VARCHAR(100),
    client_passport_details VARCHAR(50),
    driver_license VARCHAR(20),
    client_phone VARCHAR(20),
    client_email VARCHAR(100)
);

INSERT INTO Clients (client_name, client_passport_details, driver_license, client_phone, client_email)
VALUES
    ('Иванов Иван Иванович', '4510 123456', '77 12 345678', '+7 (999) 123-45-67', 'ivanov@example.com'),
    ('Петров Петр Петрович', '4511 654321', '77 13 876543', '+7 (999) 234-56-78', 'petrov@example.com'),
    ('Сидорова Анна Владимировна', '4512 789012', '77 14 234567', '+7 (999) 345-67-89', 'sidorova@example.com'),
    ('Кузнецов Алексей Сергеевич', '4513 345678', '77 15 678901', '+7 (999) 456-78-90', 'kuznetsov@example.com'),
    ('Смирнов Артем Олегович', '4514 987654', '77 16 543210', '+7 (999) 567-89-01', 'smirnov@example.com'),
    ('Гаврилова Мария Николаевна', '4515 123890', '77 17 345678', '+7 (999) 678-90-12', 'gavrilova@example.com'),
    ('Орлов Роман Дмитриевич', '4516 098765', '77 18 987654', '+7 (999) 789-01-23', 'orlov@example.com'),
    ('Михайлова Ольга Павловна', '4517 567890', '77 19 432109', '+7 (999) 890-12-34', 'mikhailova@example.com'),
    ('Васильев Дмитрий Аркадьевич', '4518 432109', '77 20 567890', '+7 (999) 901-23-45', 'vasiliev@example.com'),
    ('Чернова Инна Валерьевна', '4519 654321', '77 21 098765', '+7 (999) 012-34-56', 'chernova@example.com'),
    ('Тихонов Павел Андреевич', '4520 789012', '77 22 123890', '+7 (999) 123-45-67', 'tikhonov@example.com'),
    ('Семенов Олег Викторович', '4521 345678', '77 23 345678', '+7 (999) 234-56-78', 'semenov@example.com'),
    ('Громова Елена Николаевна', '4522 987654', '77 24 678901', '+7 (999) 345-67-89', 'gromova@example.com'),
    ('Куликов Артем Геннадьевич', '4523 123890', '77 25 543210', '+7 (999) 456-78-90', 'kulikov@example.com'),
    ('Шестаков Андрей Сергеевич', '4524 098765', '77 26 987654', '+7 (999) 567-89-01', 'shestakov@example.com'),
    ('Захарова Инга Владимировна', '4525 567890', '77 27 432109', '+7 (999) 678-90-12', 'zaharova@example.com'),
    ('Панова Виктория Александровна', '4526 432109', '77 28 567890', '+7 (999) 789-01-23', 'panova@example.com'),
    ('Рыжов Алексей Иванович', '4527 654321', '77 29 098765', '+7 (999) 890-12-34', 'ryzhov@example.com'),
    ('Борисова Анастасия Павловна', '4528 789012', '77 30 123890', '+7 (999) 901-23-45', 'borisova@example.com'),
    ('Лебедев Сергей Викторович', '4529 345678', '77 31 345678', '+7 (999) 012-34-56', 'lebedev@example.com'),
    ('Морозова Вера Павловна', '4530 234567', '77 32 234567', '+7 (999) 234-56-78', 'morozova@example.com'),
    ('Дмитриева Алина Олеговна', '4531 123456', '77 33 345678', '+7 (999) 345-67-89', 'dmitrieva@example.com'),
    ('Новиков Виктор Степанович', '4532 345678', '77 34 456789', '+7 (999) 456-78-90', 'novikov@example.com'),
    ('Чернов Роман Олегович', '4533 456789', '77 35 567890', '+7 (999) 567-89-01', 'chernov@example.com'),
    ('Петрова Юлия Игоревна', '4534 567890', '77 36 678901', '+7 (999) 678-90-12', 'petrova@example.com'),
    ('Федоров Сергей Павлович', '4535 678901', '77 37 789012', '+7 (999) 789-01-23', 'fedorov@example.com'),
    ('Егорова Ксения Дмитриевна', '4536 789012', '77 38 890123', '+7 (999) 890-12-34', 'egorova@example.com'),
    ('Антонов Игорь Павлович', '4537 890123', '77 39 901234', '+7 (999) 901-23-45', 'antonov@example.com'),
    ('Трофимова Светлана Олеговна', '4538 901234', '77 40 012345', '+7 (999) 012-34-56', 'trofimova@example.com'),
    ('Григорьев Илья Анатольевич', '4539 012345', '77 41 123456', '+7 (999) 123-45-67', 'grigoryev@example.com'),
    ('Климова Виктория Михайловна', '4540 123456', '77 42 234567', '+7 (999) 234-56-78', 'klimova@example.com'),
    ('Лаврова Наталья Александровна', '4541 234567', '77 43 345678', '+7 (999) 345-67-89', 'lavrova@example.com'),
    ('Николаев Вячеслав Никитович', '4542 345678', '77 44 456789', '+7 (999) 456-78-90', 'nikolaev@example.com'),
    ('Баркова Татьяна Геннадьевна', '4543 456789', '77 45 567890', '+7 (999) 567-89-01', 'barkova@example.com'),
    ('Мартынова Надежда Игоревна', '4544 567890', '77 46 678901', '+7 (999) 678-90-12', 'martynova@example.com'),
    ('Зуева Ольга Анатольевна', '4545 678901', '77 47 789012', '+7 (999) 789-01-23', 'zueva@example.com');

-- Создание таблицы Models
CREATE TABLE Models (
    model_id SERIAL PRIMARY KEY,
    model_name VARCHAR(100),
    model_year INT,
    available_for_order BOOLEAN
);

INSERT INTO Models (model_name, model_year, available_for_order)
VALUES
    ('Volkswagen Polo', 2024, TRUE),
    ('Volkswagen Golf', 2023, TRUE),
    ('Volkswagen Passat', 2022, TRUE),
    ('Volkswagen Tiguan', 2024, TRUE),
    ('Volkswagen Touareg', 2023, TRUE),
    ('Volkswagen Jetta', 2022, TRUE),
    ('Volkswagen Arteon', 2023, TRUE),
    ('Volkswagen Multivan', 2024, TRUE),
    ('Volkswagen Caddy', 2023, TRUE),
    ('Volkswagen Sharan', 2023, TRUE),
    ('Volkswagen ID.Buzz', 2023, TRUE),
    ('Volkswagen Amarok', 2023, TRUE),
    ('Volkswagen T-Cross', 2022, TRUE),
    ('Volkswagen T-Roc', 2023, TRUE),
    ('Volkswagen Scirocco', 2017, FALSE);


-- Создание таблицы Equipments
CREATE TABLE Equipments (
    equipment_id SERIAL PRIMARY KEY,
    equipment_name VARCHAR(100),
    equipment_description TEXT
);

INSERT INTO Equipments (equipment_name, equipment_description)
VALUES
-- Volkswagen Polo
('Trendline', 'Базовая комплектация: кондиционер, стальные диски, простая аудиосистема'),
('Comfortline', 'Улучшенная комплектация: климат-контроль, литые диски, мультимедиа с сенсорным экраном'),
('Highline', 'Топовая комплектация: кожаный салон, круиз-контроль, система помощи парковки'),

-- Volkswagen Golf
('Base', 'Базовая комплектация: тканевый салон, кондиционер, стандартная аудиосистема'),
('Style', 'Средний уровень: климат-контроль, улучшенные материалы отделки, мультимедиа с дисплеем 8 дюймов'),
('R-Line', 'Спортивная версия: агрессивный дизайн, спортивные сиденья, система выбора режимов движения'),

-- Volkswagen Passat
('Trendline', 'Базовая версия: тканевый салон, кондиционер, стальные диски'),
('Comfortline', 'Средняя комплектация: кожаный руль, двухзонный климат-контроль, мультимедиа'),
('Elegance', 'Топовая комплектация: матричные фары, премиальная аудиосистема, кожа и алькантара в салоне'),

-- Volkswagen Tiguan
('Base', 'Начальная комплектация: тканевый салон, стандартная мультимедиа, кондиционер'),
('Life', 'Средняя комплектация: климат-контроль, улучшенные материалы салона, литые диски'),
('R-Line', 'Спортивная комплектация: спортивный руль, аэродинамический обвес, электронные помощники'),

-- Volkswagen Touareg
('Atmosphere', 'Элегантная комплектация: кожа, дерево, премиальная аудиосистема'),
('Elegance', 'Роскошная версия: улучшенная отделка, адаптивный круиз-контроль, система ночного видения'),
('R-Line', 'Спортивная версия: спортивные сиденья, мощный двигатель, расширенные функции безопасности'),

-- Volkswagen Jetta
('Base', 'Базовая версия: тканевый салон, кондиционер, стандартная аудиосистема'),
('Comfort', 'Средняя комплектация: улучшенные материалы, мультимедиа с дисплеем, литые диски'),
('GLI', 'Спортивная версия: агрессивный дизайн, мощный двигатель, спортивные сиденья'),

-- Volkswagen Arteon
('Elegance', 'Роскошная версия: премиальная отделка, кожа, мультимедиа высокого уровня'),
('R-Line', 'Спортивная версия: спортивные сиденья, уникальный дизайн интерьера и экстерьера'),

-- Volkswagen Multivan
('Base', 'Базовая версия: тканевый салон, кондиционер, мультимедиа'),
('Business', 'Бизнес-версия: кожаный салон, расширенная мультимедиа, адаптивный круиз-контроль'),

-- Volkswagen Caddy
('Base', 'Базовая версия: тканевый салон, кондиционер, стальные диски'),
('Life', 'Средний уровень: литые диски, мультимедиа с дисплеем 8 дюймов, улучшенная отделка'),

-- Volkswagen Sharan
('Base', 'Базовая комплектация: кондиционер, тканевый салон, мультимедиа'),
('Highline', 'Топовая комплектация: кожаный салон, панорамная крыша, премиальная аудиосистема'),

-- Volkswagen ID.Buzz
('Pro', 'Стандартная версия: тканевый салон, электрические сиденья, мультимедиа с дисплеем 10 дюймов'),
('Pro S', 'Расширенная версия: премиальная отделка, панорамная крыша, улучшенная батарея'),

-- Volkswagen Amarok
('Base', 'Базовая версия: тканевый салон, стандартная мультимедиа, стальные диски'),
('Aventura', 'Топовая версия: кожаный салон, премиальная аудиосистема, расширенные функции безопасности'),

-- Volkswagen T-Cross
('Base', 'Базовая комплектация: кондиционер, стандартная мультимедиа, тканевый салон'),
('Life', 'Средняя версия: улучшенные материалы отделки, литые диски, мультимедиа с экраном 8 дюймов'),

-- Volkswagen T-Roc
('Base', 'Базовая версия: тканевый салон, стандартная мультимедиа, кондиционер'),
('Style', 'Средняя комплектация: климат-контроль, литые диски, мультимедиа с большим экраном'),

-- Volkswagen Scirocco
('Base', 'Базовая версия: тканевый салон, кондиционер, стальные диски'),
('R', 'Спортивная версия: мощный двигатель, спортивные сиденья, уникальный дизайн');


-- Создание таблицы Colors
CREATE TABLE Colors (
    color_id SERIAL PRIMARY KEY,
    color_name VARCHAR(50)
);

INSERT INTO Colors (color_name)
VALUES
    ('Pure White'),
    ('Deep Black Pearl'),
    ('Reflex Silver'),
    ('Oryx White Pearl'),
    ('Moonstone Grey'),
    ('Atlantic Blue'),
    ('Kings Red'),
    ('Lapiz Blue'),
    ('Dolphin Grey'),
    ('Pyrite Silver'),
    ('Manganese Grey'),
    ('Nightshade Blue'),
    ('Starlight Blue'),
    ('Golden Green'),
    ('Ravenna Blue'),
    ('Energetic Orange'),
    ('Turmeric Yellow'),
    ('Candy White'),
    ('Tornado Red'),
    ('Dark Burgundy');


-- Создание таблицы Model_Equipments (М:М)
CREATE TABLE Model_Equipments (
    equipment_id INT REFERENCES Equipments(equipment_id),
    model_id INT REFERENCES Models(model_id),
    PRIMARY KEY (equipment_id, model_id)
);

INSERT INTO Model_Equipments (equipment_id, model_id)
VALUES
-- Volkswagen Polo
(1, 1), -- Trendline для Polo
(2, 1), -- Comfortline для Polo
(3, 1), -- Highline для Polo

-- Volkswagen Golf
(4, 2), -- Base для Golf
(5, 2), -- Style для Golf
(6, 2), -- R-Line для Golf

-- Volkswagen Passat
(7, 3), -- Trendline для Passat
(8, 3), -- Comfortline для Passat
(9, 3), -- Elegance для Passat

-- Volkswagen Tiguan
(10, 4), -- Base для Tiguan
(11, 4), -- Life для Tiguan
(12, 4), -- R-Line для Tiguan

-- Volkswagen Touareg
(13, 5), -- Atmosphere для Touareg
(14, 5), -- Elegance для Touareg
(15, 5), -- R-Line для Touareg

-- Volkswagen Jetta
(16, 6), -- Base для Jetta
(17, 6), -- Comfort для Jetta
(18, 6), -- GLI для Jetta

-- Volkswagen Arteon
(19, 7), -- Elegance для Arteon
(20, 7), -- R-Line для Arteon

-- Volkswagen Multivan
(21, 8), -- Base для Multivan
(22, 8), -- Business для Multivan

-- Volkswagen Caddy
(23, 9), -- Base для Caddy
(24, 9), -- Life для Caddy

-- Volkswagen Sharan
(25, 10), -- Base для Sharan
(26, 10), -- Highline для Sharan

-- Volkswagen ID.Buzz
(27, 11), -- Pro для ID.Buzz
(28, 11), -- Pro S для ID.Buzz

-- Volkswagen Amarok
(29, 12), -- Base для Amarok
(30, 12), -- Aventura для Amarok

-- Volkswagen T-Cross
(31, 13), -- Base для T-Cross
(32, 13), -- Life для T-Cross

-- Volkswagen T-Roc
(33, 14), -- Base для T-Roc
(34, 14), -- Style для T-Roc

-- Volkswagen Scirocco
(35, 15), -- Base для Scirocco
(36, 15); -- R для Scirocco


-- Создание таблицы Model_Colors (М:М)
CREATE TABLE Model_Colors (
    color_id INT REFERENCES Colors(color_id),
    model_id INT REFERENCES Models(model_id),
    PRIMARY KEY (color_id, model_id)
);

INSERT INTO Model_Colors (color_id, model_id)
VALUES
-- Volkswagen Polo
(1, 1), -- Pure White для Polo
(2, 1), -- Deep Black Pearl для Polo
(3, 1), -- Reflex Silver для Polo
(4, 1), -- Oryx White Pearl для Polo
(5, 1), -- Moonstone Grey для Polo

-- Volkswagen Golf
(1, 2), -- Pure White для Golf
(2, 2), -- Deep Black Pearl
(3, 2), -- Reflex Silver для Golf
(7, 2), -- Nightshade Blue для Golf
(8, 2), -- Starlight Blue для Golf
(9, 2), -- Golden Green для Golf

-- Volkswagen Passat
(2, 3), -- Deep Black Pearl для Passat
(5, 3), -- Moonstone Grey для Passat
(6, 3), -- Atlantic Blue для Passat
(7, 3), -- Nightshade Blue для Passat
(10, 3), -- Tornado Red для Passat

-- Volkswagen Tiguan
(1, 4), -- Pure White для Tiguan
(4, 4), -- Oryx White Pearl для Tiguan
(11, 4), -- Ravenna Blue для Tiguan
(12, 4), -- Energetic Orange для Tiguan
(6, 4), -- Atlantic Blue для Tiguan

-- Volkswagen Touareg
(1, 5), -- Pure White для Touareg
(2, 5), -- Deep Black Pearl для Touareg
(3, 5), -- Reflex Silver для Touareg
(13, 5), -- Dark Burgundy для Touareg
(5, 5), -- Moonstone Grey для Touareg

-- Volkswagen Jetta
(1, 6), -- Pure White для Jetta
(2, 6), -- Deep Black Pearl для Jetta
(4, 6), -- Oryx White Pearl для Jetta
(6, 6), -- Atlantic Blue для Jetta
(7, 6), -- Nightshade Blue для Jetta

-- Volkswagen Arteon
(3, 7), -- Reflex Silver для Arteon
(4, 7), -- Oryx White Pearl для Arteon
(6, 7), -- Atlantic Blue для Arteon
(5, 7), -- Moonstone Grey для Arteon
(10, 7), -- Tornado Red для Arteon

-- Volkswagen Multivan
(1, 8), -- Pure White для Multivan
(5, 8), -- Moonstone Grey для Multivan
(7, 8), -- Nightshade Blue для Multivan
(9, 8), -- Manganese Grey для Multivan
(11, 8), -- Ravenna Blue для Multivan

-- Volkswagen Caddy
(1, 9), -- Pure White для Caddy
(2, 9), -- Deep Black Pearl для Caddy
(3, 9), -- Reflex Silver для Caddy
(5, 9), -- Moonstone Grey для Caddy
(13, 9), -- Dark Burgundy для Caddy

-- Volkswagen Sharan
(1, 10), -- Pure White для Sharan
(6, 10), -- Atlantic Blue для Sharan
(5, 10), -- Moonstone Grey для Sharan
(3, 10), -- Reflex Silver для Sharan
(9, 10), -- Manganese Grey для Sharan

-- Volkswagen ID.Buzz
(1, 11), -- Pure White для ID.Buzz
(4, 11), -- Oryx White Pearl для ID.Buzz
(6, 11), -- Atlantic Blue для ID.Buzz
(13, 11), -- Dark Burgundy для ID.Buzz
(12, 11), -- Energetic Orange для ID.Buzz

-- Volkswagen Amarok
(2, 12), -- Deep Black Pearl для Amarok
(1, 12), -- Pure White для Amarok
(9, 12), -- Manganese Grey для Amarok
(7, 12), -- Nightshade Blue для Amarok
(10, 12), -- Tornado Red для Amarok

-- Volkswagen T-Cross
(1, 13), -- Pure White для T-Cross
(6, 13), -- Atlantic Blue для T-Cross
(7, 13), -- Nightshade Blue для T-Cross
(3, 13), -- Reflex Silver для T-Cross
(12, 13), -- Energetic Orange для T-Cross

-- Volkswagen T-Roc
(1, 14), -- Pure White для T-Roc
(7, 14), -- Nightshade Blue для T-Roc
(6, 14), -- Atlantic Blue для T-Roc
(9, 14), -- Manganese Grey для T-Roc
(10, 14), -- Tornado Red для T-Roc

-- Volkswagen Scirocco
(1, 15), -- Pure White для Scirocco
(2, 15), -- Deep Black Pearl для Scirocco
(7, 15), -- Nightshade Blue для Scirocco
(10, 15), -- Tornado Red для Scirocco
(12, 15); -- Energetic Orange для Scirocco


-- Создание таблицы Cars_Available
CREATE TABLE Cars_Available (
    vin VARCHAR(20) PRIMARY KEY,
    car_dealership_id INT REFERENCES Car_Dealerships(car_dealership_id),
    model_id INT REFERENCES Models(model_id),
    equipment_id INT REFERENCES Equipments(equipment_id),
    color_id INT REFERENCES Colors(color_id)
);

INSERT INTO Cars_Available (vin, car_dealership_id, model_id, equipment_id, color_id)
VALUES
-- Для автосалона 1 (car_dealership_id = 1)
('VIN123456789012345', 1, 1, 1, 1), -- Polo, Trendline, Pure White
('VIN123456789012346', 1, 1, 2, 2), -- Polo, Comfortline, Deep Black Pearl
('VIN123456789012347', 1, 1, 3, 3), -- Polo, Highline, Reflex Silver
('VIN123456789012348', 1, 1, 1, 4), -- Polo, Trendline, Oryx White Pearl
('VIN123456789012349', 1, 1, 2, 5), -- Polo, Comfortline, Moonstone Grey
('VIN123456789012350', 1, 2, 4, 1), -- Golf, Base, Pure White
('VIN123456789012351', 1, 2, 5, 2), -- Golf, Style, Deep Black Pearl
('VIN123456789012352', 1, 2, 6, 3), -- Golf, R-Line, Reflex Silver
('VIN123456789012353', 1, 3, 7, 6), -- Passat, Trendline, Atlantic Blue
('VIN123456789012354', 1, 3, 8, 7), -- Passat, Comfortline, Nightshade Blue

-- Для автосалона 2 (car_dealership_id = 2)
('VIN223456789012345', 2, 4, 10, 8), -- Tiguan, Base, Oryx White Pearl
('VIN223456789012346', 2, 4, 11, 5), -- Tiguan, Life, Moonstone Grey
('VIN223456789012347', 2, 4, 12, 6), -- Tiguan, R-Line, Atlantic Blue
('VIN223456789012348', 2, 4, 10, 9), -- Tiguan, Base, Manganese Grey
('VIN223456789012349', 2, 5, 13, 3), -- Touareg, Atmosphere, Reflex Silver
('VIN223456789012350', 2, 5, 14, 7), -- Touareg, Elegance, Nightshade Blue
('VIN223456789012351', 2, 5, 15, 2), -- Touareg, R-Line, Deep Black Pearl
('VIN223456789012352', 2, 6, 16, 1), -- Jetta, Base, Pure White
('VIN223456789012353', 2, 6, 17, 4), -- Jetta, Comfort, Oryx White Pearl
('VIN223456789012354', 2, 6, 18, 6), -- Jetta, GLI, Atlantic Blue

-- Для автосалона 3 (car_dealership_id = 3)
('VIN323456789012345', 3, 7, 19, 11), -- Arteon, Elegance, Ravenna Blue
('VIN323456789012346', 3, 7, 20, 8), -- Arteon, R-Line, Starlight Blue
('VIN323456789012347', 3, 7, 19, 9), -- Arteon, Elegance, Manganese Grey
('VIN323456789012348', 3, 8, 21, 5), -- Multivan, Base, Moonstone Grey
('VIN323456789012349', 3, 8, 22, 7), -- Multivan, Business, Nightshade Blue
('VIN323456789012350', 3, 9, 23, 10), -- Caddy, Base, Tornado Red
('VIN323456789012351', 3, 9, 24, 6), -- Caddy, Life, Atlantic Blue
('VIN323456789012352', 3, 10, 25, 3), -- Sharan, Base, Reflex Silver
('VIN323456789012353', 3, 10, 26, 4), -- Sharan, Highline, Oryx White Pearl
('VIN323456789012354', 3, 11, 27, 5), -- ID.Buzz, Pro, Moonstone Grey

-- Для автосалона 4 (car_dealership_id = 4)
('VIN423456789012345', 4, 12, 29, 12), -- Amarok, Base, Energetic Orange
('VIN423456789012346', 4, 12, 30, 13), -- Amarok, Aventura, Dark Burgundy
('VIN423456789012347', 4, 13, 31, 2), -- T-Cross, Base, Deep Black Pearl
('VIN423456789012348', 4, 13, 32, 4), -- T-Cross, Life, Oryx White Pearl
('VIN423456789012349', 4, 14, 33, 7), -- T-Roc, Base, Nightshade Blue
('VIN423456789012350', 4, 14, 34, 1), -- T-Roc, Style, Pure White
('VIN423456789012351', 4, 15, 35, 6), -- Scirocco, Base, Atlantic Blue
('VIN423456789012352', 4, 15, 36, 5), -- Scirocco, R, Moonstone Grey
('VIN423456789012353', 4, 1, 3, 1), -- Polo, Trendline, Pure White
('VIN423456789012354', 4, 1, 2, 8); -- Polo, Comfortline, Starlight Blue


-- Создание таблицы Order_Statuses
CREATE TABLE Order_Status (
    status_id SERIAL PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

INSERT INTO Order_Status (status_name)
VALUES
    ('Pending'),
    ('In Progress'),
    ('Completed'),
    ('Cancelled');

-- Создание таблицы Orders
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    model_id INT,
    equipment_id INT,
    color_id INT,
    order_date DATE,
    status_id INT REFERENCES Order_Status(status_id),
    FOREIGN KEY (model_id, equipment_id) REFERENCES Model_Equipments(model_id, equipment_id),
    FOREIGN KEY (model_id, color_id) REFERENCES Model_Colors(model_id, color_id)
);

INSERT INTO Orders (model_id, equipment_id, color_id, order_date, status_id)
VALUES
-- 1. Polo
(1, 1, 1, '2024-01-15', 1), -- Pending
(1, 2, 2, '2024-02-22', 2), -- In Progress
(1, 3, 3, '2024-03-10', 3), -- Completed
(1, 2, 4, '2024-04-17', 4), -- Cancelled
(1, 1, 5, '2024-05-09', 1), -- Pending

-- 2. Golf
(2, 4, 1, '2024-03-01', 3), -- Completed
(2, 5, 2, '2024-03-25', 2), -- In Progress
(2, 6, 3, '2024-06-30', 1), -- Pending
(2, 5, 9, '2024-07-15', 4), -- Cancelled
(2, 4, 7, '2024-08-11', 3), -- Completed

-- 3. Passat
(3, 7, 5, '2024-01-10', 2), -- In Progress
(3, 8, 2, '2024-02-14', 1), -- Pending
(3, 9, 6, '2024-04-23', 3), -- Completed
(3, 8, 7, '2024-05-30', 4), -- Cancelled
(3, 7, 10, '2024-06-25', 2), -- In Progress

-- 4. Tiguan
(4, 10, 1, '2024-02-18', 1), -- Pending
(4, 11, 4, '2024-03-29', 3), -- Completed
(4, 12, 1, '2024-04-10', 2), -- In Progress
(4, 10, 11, '2024-06-05', 1), -- Pending
(4, 12, 12, '2024-07-20', 4), -- Cancelled

-- 5. Touareg
(5, 13, 1, '2024-01-24', 2), -- In Progress
(5, 14, 2, '2024-02-05', 1), -- Pending
(5, 15, 3, '2024-03-12', 3), -- Completed
(5, 13, 5, '2024-05-02', 4), -- Cancelled
(5, 14, 13, '2024-07-02', 3); -- Completed


-- Создание таблицы Payment_Types
CREATE TABLE Payment_Types (
    payment_type_id SERIAL PRIMARY KEY,
    type VARCHAR(50)
);

INSERT INTO Payment_Types (type)
VALUES
    ('Cash'),
    ('Credit Card'),
    ('Bank Transfer');


-- Создание таблицы Payments
CREATE TABLE Payments (
    payment_number SERIAL PRIMARY KEY,
    payment_amount DECIMAL(10, 2),
    discount DECIMAL(10, 2),
    total DECIMAL(10, 2),
    payment_type_id INT REFERENCES Payment_Types(payment_type_id),
    payment_date DATE
);

INSERT INTO Payments (payment_amount, discount, total, payment_type_id, payment_date)
VALUES
    (1000000, 50000, 950000, 1, '2024-01-12'), -- Cash, 1 млн, с учетом скидки
    (2500000, 100000, 2400000, 2, '2024-02-15'), -- Credit Card, 2.5 млн, с учетом скидки
    (1500000, 0, 1500000, 3, '2024-03-05'), -- Bank Transfer, 1.5 млн
    (5000000, 200000, 4800000, 1, '2024-04-20'), -- Cash, 5 млн
    (1200000, 10000, 1190000, 2, '2024-05-10'), -- Credit Card, 1.2 млн, с учетом скидки
    (3000000, 150000, 2850000, 3, '2024-06-25'), -- Bank Transfer, 3 млн, с учетом скидки
    (4500000, 100000, 4400000, 1, '2024-07-13'), -- Cash, 4.5 млн
    (2200000, 50000, 2150000, 2, '2024-08-09'), -- Credit Card, 2.2 млн, с учетом скидки
    (3300000, 120000, 3180000, 3, '2024-09-30'), -- Bank Transfer, 3.3 млн, с учетом скидки
    (6000000, 300000, 5700000, 1, '2024-10-01'), -- Cash, 6 млн
    (7000000, 0, 7000000, 2, '2024-11-01'), -- Credit Card, 7 млн
    (1600000, 50000, 1550000, 3, '2024-12-02'), -- Bank Transfer, 1.6 млн, с учетом скидки
    (2300000, 100000, 2200000, 1, '2024-01-25'), -- Cash, 2.3 млн
    (5000000, 0, 5000000, 2, '2024-02-05'), -- Credit Card, 5 млн
    (2700000, 200000, 2500000, 3, '2024-03-12'), -- Bank Transfer, 2.7 млн, с учетом скидки
    (2000000, 70000, 1930000, 1, '2024-04-22'), -- Cash, 2 млн, с учетом скидки
    (3800000, 150000, 3650000, 2, '2024-05-17'), -- Credit Card, 3.8 млн, с учетом скидки
    (1400000, 50000, 1350000, 3, '2024-06-01'), -- Bank Transfer, 1.4 млн, с учетом скидки
    (6200000, 300000, 5900000, 1, '2024-07-21'), -- Cash, 6.2 млн
    (2500000, 100000, 2400000, 2, '2024-08-15'), -- Credit Card, 2.5 млн, с учетом скидки
    (3200000, 150000, 3050000, 3, '2024-09-05'), -- Bank Transfer, 3.2 млн, с учетом скидки
    (5500000, 250000, 5250000, 1, '2024-10-14'), -- Cash, 5.5 млн
    (1900000, 70000, 1830000, 2, '2024-11-25'), -- Credit Card, 1.9 млн, с учетом скидки
    (4200000, 150000, 4050000, 3, '2024-12-20'), -- Bank Transfer, 4.2 млн, с учетом скидки
    (2600000, 100000, 2500000, 1, '2024-01-30'), -- Cash, 2.6 млн
    (3400000, 200000, 3200000, 2, '2024-02-17'), -- Credit Card, 3.4 млн, с учетом скидки
    (1800000, 50000, 1750000, 3, '2024-03-03'), -- Bank Transfer, 1.8 млн, с учетом скидки
    (4100000, 150000, 3950000, 1, '2024-04-02'), -- Cash, 4.1 млн
    (3900000, 0, 3900000, 2, '2024-05-12'); -- Credit Card, 3.9 млн


-- Создание таблицы Agreements
CREATE TABLE Agreements (
    agreement_id SERIAL PRIMARY KEY,
    car_dealership_id INT REFERENCES Car_Dealerships(car_dealership_id),
    manager_id INT REFERENCES Employees(employee_id),
    client_id INT REFERENCES Clients(client_id),
    order_id INT REFERENCES Orders(order_id),
    vin VARCHAR(20),
    agreement_date DATE,
    payment_id INT REFERENCES Payments(payment_number),
    warranty_start_date DATE,
    warranty_end_date DATE
);

INSERT INTO Agreements (car_dealership_id, manager_id, client_id, order_id, vin, agreement_date, payment_id, warranty_start_date, warranty_end_date)
VALUES
    (1, 1, 1, 1, 'VIN123456789012345', '2024-01-20', 1, '2024-01-20', '2027-01-20'), -- Cash, Polo
    (2, 2, 2, 2, NULL, '2024-02-18', 2, '2024-02-18', '2027-02-18'), -- Credit Card, Golf
    (3, 3, 3, 3, 'VIN323456789012347', '2024-03-15', 3, '2024-03-15', '2027-03-15'), -- Bank Transfer, Passat
    (1, 4, 4, 4, NULL, '2024-04-10', 4, '2024-04-10', '2027-04-10'), -- Cash, Polo (Cancelled)
    (2, 5, 5, 5, 'VIN223456789012348', '2024-05-05', 5, '2024-05-05', '2027-05-05'), -- Credit Card, Golf
    (3, 6, 6, 6, 'VIN223456789012346', '2024-06-01', 6, '2024-06-01', '2027-06-01'), -- Bank Transfer, Passat (Cancelled)
    (4, 7, 7, 7, NULL, '2024-07-10', 7, '2024-07-10', '2027-07-10'), -- Cash, Tiguan
    (5, 8, 8, 8, 'VIN523456789012350', '2024-08-15', 8, '2024-08-15', '2027-08-15'), -- Credit Card, Touareg
    (1, 9, 9, 9, NULL, '2024-09-20', 9, '2024-09-20', '2027-09-20'), -- Cash, Polo (Cancelled)
    (2, 10, 10, 10, 'VIN223456789012351', '2024-10-05', 10, '2024-10-05', '2027-10-05'), -- Credit Card, Golf
    (3, 11, 11, 11, NULL, '2024-11-11', 11, '2024-11-11', '2027-11-11'), -- Bank Transfer, Passat
    (4, 12, 12, 12, 'VIN423456789012353', '2024-12-15', 12, '2024-12-15', '2027-12-15'), -- Cash, Tiguan
    (5, 13, 13, 13, 'VIN523456789012354', '2024-01-10', 13, '2024-01-10', '2027-01-10'), -- Credit Card, Touareg
    (1, 14, 14, 14, NULL, '2024-02-20', 14, '2024-02-20', '2027-02-20'), -- Cash, Polo
    (2, 15, 15, 15, NULL, '2024-03-25', 15, '2024-03-25', '2027-03-25'), -- Credit Card, Golf
    (3, 16, 16, 16, 'VIN423456789012349', '2024-04-18', 16, '2024-04-18', '2027-04-18'), -- Bank Transfer, Passat (Cancelled)
    (4, 17, 17, 17, 'VIN423456789012358', '2024-05-23', 17, '2024-05-23', '2027-05-23'), -- Cash, Tiguan
    (5, 18, 18, 18, NULL, '2024-06-15', 18, '2024-06-15', '2027-06-15'), -- Credit Card, Touareg
    (1, 19, 19, 19, 'VIN323456789012352', '2024-07-30', 19, '2024-07-30', '2027-07-30'), -- Cash, Polo (Cancelled)
    (2, 20, 20, 20, NULL, '2024-08-01', 20, '2024-08-01', '2027-08-01'), -- Credit Card, Golf
    (3, 21, 21, 21, NULL, '2024-09-25', 21, '2024-09-25', '2027-09-25'), -- Bank Transfer, Passat
    (4, 22, 22, 22, 'VIN423456789012362', '2024-10-18', 22, '2024-10-18', '2027-10-18'), -- Cash, Tiguan
    (5, 23, 23, 23, 'VIN523456789012363', '2024-11-15', 23, '2024-11-15', '2027-11-15');

-- запрос, выдающий информацию о заказах всех клиентов
SELECT address, e.employee_name, client_name, os.status_name, vin, p.total FROM agreements
JOIN solution_4_lab.car_dealerships cd on agreements.car_dealership_id = cd.car_dealership_id
JOIN solution_4_lab.employees e on agreements.manager_id = e.employee_id
JOIN solution_4_lab.clients c on agreements.client_id = c.client_id
JOIN solution_4_lab.payments p on agreements.payment_id = p.payment_number
JOIN solution_4_lab.orders o on agreements.order_id = o.order_id
JOIN solution_4_lab.order_status os on o.status_id = os.status_id