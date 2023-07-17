-- После "--" ставится пробел
# Однострочный коммент, как в Питоне
/*
Это
многострочный
комментарий
*/

-- 1. Создание БД, с которой будем взаим-ть
-- snake_case для имен столбцов, БД, таблиц
CREATE DATABASE IF NOT EXISTS lesson_1; -- Создали БД с именем lesson_1

-- 2. Подключение к БД
USE lesson_1;

-- 3. Создание таблицы - студент - избегаем можественного числа 
DROP TABLE IF EXISTS student; -- Удаляю таблицу со студентами, если она существует
CREATE TABLE IF NOT EXISTS student
(
-- Формула столбца: имястолбца тип_данных свойства (необ)
-- PRIMARY KEY = UNIQUE NOT NULL
id INT PRIMARY KEY AUTO_INCREMENT, -- первичный ключ, автоинкремент
firstname VARCHAR(45), -- строчка на 45 символов
email VARCHAR(45) NOT NULL, -- строчка на 45 символов
phone VARCHAR(45)
);

-- 4. Таблица заполняется магическими данными
INSERT student(firstname,email,phone)
VALUES
("Андрей", "fjwfjjqf@gmail.com", NULL), -- id = 1
("Антон", "fjwfjjqf@gmail.com", "6939926962"), -- id = 2
("Артем", "fjwfjjqf@gmail.com", "+7-999-888-77-66"), -- id = 3
("Алексей", "fjwfjjqf@gmail.com", "+7-999-888-77-66"), -- id = 4
("Александр", "fjwfjjqf@gmail.com", "+7-999-888-77-66"), -- id = 5
("Александра", "fjwfjjqf@gmail.com", "+7-999-888-77-66"), -- id = 6
("Виктор", "fjwfjjqf@gmail.com", "+7-999-888-77-66"); -- id = 7
SELECT * FROM student;

-- Получение информации о студентах: имена почты 
SELECT firstname, email
FROM student;

-- Получение информации о Антоне, его почту и телефон 
SELECT email, phone, firstname
FROM student
WHERE firstname = "АНТОН"; -- капс в имени не имеет значения

-- Получаем данные обо всех студентах кроме Антона
SELECT email, phone, firstname
FROM student
WHERE firstname != "АНТОН"; -- "<>" и "!=" - одно и то же

-- Найти инфо о студентах, имена которых начинаются с буквы "А"
SELECT email, phone, firstname
FROM student
WHERE firstname LIKE "А%";

