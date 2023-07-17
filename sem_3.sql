-- 1. Создание БД
CREATE DATABASE IF NOT EXISTS lesson_3;

USE lesson_3;

CREATE TABLE IF NOT EXISTS staff
(
id INT PRIMARY KEY AUTO_INCREMENT,
firstname VARCHAR(45),
lastname VARCHAR(45),
post VARCHAR(45),
seniority INT,
salary DECIMAL(8,2),
age INT
);

TRUNCATE staff; -- Очистка таблицы от данных, остаются только имена столбцов

INSERT staff (firstname, lastname, post, seniority, salary, age)
VALUES

('Вася', 'Петров', 'Начальник', 40, 100000, 60),
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
SELECT *
FROM staff;

SELECT
id,
salary,
CONCAT(firstname, " ", lastname) AS fullname -- "Антон" + " " + "Антонов" = "Антон Антонов"
FROM staff
ORDER BY salary DESC;

-- ORDER BY, топ-5 самых высокооплачиваемых специалистов
SELECT
id,
salary,
CONCAT(firstname, " ", lastname) AS fullname -- "Антон" + " " + "Антонов" = "Антон Антонов"
FROM staff
ORDER BY salary DESC
LIMIT 5; -- Изначальная сортировка идет по воз-ю, DESC - по убыванию

INSERT staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', 30, 70000, 50);
-- Сделаем сортировку по 3 полям
SELECT
id,
salary,
firstname,
lastname
FROM staff
ORDER BY lastname DESC, firstname DESC, salary DESC;

SELECT DISTINCT lastname
FROM staff
ORDER BY lastname DESC
LIMIT 3 ;

SELECT
post AS p,
ROUND(AVG(salary), 2) AS average,
MIN(salary) AS min_salary,
MAX(salary) AS max_salary,
SUM(salary) AS sum_salary,
MAX(salary) - MIN(salary) AS diff,
COUNT(salary) AS `count` -- буква ё на англ.
FROM staff
WHERE post != "Уборщик"
GROUP BY post
ORDER BY average ;
/*
FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
LIMIT
*/

