USE lesson_3;

SELECT * FROM staff;

-- Создадим процедуру , которая будет выводить статус сотрудника по ЗП:
-- от 0 до 49 999 вкл-но, то это "Средняя ЗП" 
-- от 50 000 до 69 999 вкл-но, то это "ЗП выше средней"
-- ЗП > 70 000 , то "Высокая ЗП"

-- Номер сотрудника (id), статус сотрудника в отдельную переменную - итог 
DROP PROCEDURE IF EXISTS get_status;
DELIMITER $$ -- Начало процедуры для сервера , "$$" - символ - разделитель, как ";"
CREATE PROCEDURE get_status
(
	IN staff_number INT, -- id сотрудника, параметр только для чтения 
	OUT staff_status VARCHAR(45) 
)
BEGIN
	DECLARE staff_salary DOUBLE; -- NULL
    
	SELECT salary INTO staff_salary -- Добавляет ЗП сотрудника по условию staff_number = id в переменную 
    FROM staff -- staff_salary
    WHERE staff_number = id; -- staff_number = 5, ЗП будет 5 сотрудника
	
    IF staff_salary BETWEEN 0 AND 49999
		THEN SET staff_status = "Средняя ЗП";
        
	ELSEIF staff_salary BETWEEN 50000 AND 69999
		THEN SET staff_status = "ЗП выше средней";
        
	ELSEIF staff_salary >= 70000
		THEN SET staff_status = "Высокая ЗП";
	END IF;

END $$ 
DELIMITER ;
-- '$$ -- Конец процедуры, причем, для сервера' at line 23	0.000 sec

DROP PROCEDURE IF EXISTS print_numbers;
DELIMITER //
CREATE PROCEDURE print_numbers
(
	IN input_numbers INT -- N 
)
BEGIN
	DECLARE n INT;
    DECLARE result VARCHAR(45) DEFAULT "";
    SET n = input_numbers;

	REPEAT
		SET result = CONCAT(result, n, ",");
        SET n = n - 1;
        UNTIL n <= 0 -- Условие выхода из цикла: когда n - отрицательное или равно 0
	END REPEAT;
	SELECT result;
END //

CALL print_numbers(4);
