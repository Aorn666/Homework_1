USE lesson_3;

SELECT * FROM staff;

-- Ранжирование
-- Вывести список всех сотрудников и указать место в общем списке по ЗП
SELECT 
	salary,
    post,
    CONCAT(firstname, " ", lastname) AS fullname, -- Вася Петров
    DENSE_RANK() OVER(ORDER BY salary DESC) AS `DENSE_RANK`
FROM staff;

-- Вывести список всех сотрудников и указать место в общем списке по ЗП
-- Для каждой должности 
SELECT 
	salary,
    post,
    CONCAT(firstname, " ", lastname) AS fullname, -- Вася Петров
    DENSE_RANK() OVER(PARTITION BY post ORDER BY salary DESC) AS `DENSE_RANK`
FROM staff;

-- Проверка ФНС, ищем самых высокооплачиваемых сотрудников 
SELECT *
FROM (SELECT 
	salary,
    post,
    CONCAT(firstname, " ", lastname) AS fullname, -- Вася Петров
    DENSE_RANK() OVER(PARTITION BY post ORDER BY salary DESC) AS `DENSE_RANK`
FROM staff) rank_salary
WHERE `DENSE_RANK` =  1;

-- Скользящее среднее за март: ф(-1) + м(0) + а(1) / 3
-- SELECT 
-- 	salary,
--     post,
--     CONCAT(firstname, " ", lastname) AS fullname, -- Вася Петров
--     ROUND(AVG(salary) OVER w, 2) AS `avg`
-- FROM staff
-- WINDOW w AS 
-- (
-- 	ORDER BY salary DESC
--     ROWS BETWEEN 1 PRECEDING -- от предыдущей
-- 	AND 1 FOLLOWING
-- );

-- Агрегация. По должностям:
-- средняя ЗП(1)
-- суммарную ЗП (2)
-- процентное соотношение отдельно взятой ЗП внутри должности к суммарной ЗП(3)
SELECT 
	salary,
    post,
    CONCAT(firstname, " ", lastname) AS fullname,
    SUM(salary) OVER w AS sum_salary,
    AVG(salary) OVER w AS avg_salary,
    ROUND(salary * 100 / SUM(salary) OVER w, 2) AS percent_sum_salary,
    ROUND(salary * 100 / SUM(salary) OVER(), 2) AS pr1,
    SUM(salary) OVER() AS `sum`
FROM staff
WINDOW w AS (PARTITION BY post);

-- Представления 
SELECT
	COUNT(*) AS count_staff,
    post,
    AVG(salary) AS `avg`
FROM staff
GROUP BY post
ORDER BY count_staff DESC;

CREATE OR REPLACE VIEW count_post
AS 
SELECT
	COUNT(*) AS count_staff,
    post,
    AVG(salary) AS `avg`
FROM staff
GROUP BY post
ORDER BY count_staff DESC;

SELECT * -- count_staff, post, `avg`
FROM count_post
WHERE post != "Начальник";

-- Список медиафайлов пользователей с количеством лайков 
-- (Используя JOIN)]
-- ТОП3 файла по популярности (макс кол.во лайков)
USE vk_db;
SELECT
	u.firstname,
    m.id,
    u.lastname,
	m.filename AS media_name,
    COUNT(l.id) AS total_likes
FROM media m
LEFT JOIN likes l ON l.media_id = m.id
JOIN users u ON u.id = m.user_id 
GROUP BY m.id
ORDER BY total_likes DESC
LIMIT 3;