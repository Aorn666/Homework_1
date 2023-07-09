-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. 
CREATE DATABASE IF NOT EXISTS homework_database;
use homework_database;
DROP TABLE IF EXISTS mobile_phones; 
CREATE TABLE IF NOT EXISTS  mobile_phones (
  `id_mobile_phones` INT NOT NULL AUTO_INCREMENT,
  `models_mobile_phones` VARCHAR(45) NOT NULL,
  `manufacturers_mobile_phones` VARCHAR(45) NOT NULL,
  `prices_mobile_phones` DECIMAL NULL,
  `quantity_mobile_phones` INT NOT NULL,
  PRIMARY KEY (`id_mobile_phones`));
  
-- Заполните БД данными
INSERT INTO `homework_database`.`mobile_phones` 
  (`models_mobile_phones`, `manufacturers_mobile_phones`, `prices_mobile_phones`, `quantity_mobile_phones`) 
VALUES 
('Galaxy S22 Ultra', 'Samsung', 91575, 2),
('Galaxy A03 4/64 Gb', 'Samsung', 7451, 100),
('Galaxy A23 4/64 Gb', 'Samsung', 12395, 50),
('Galaxy Note20 Ultra 12/256 Gb', 'Samsung', 52196, 1),
('iPhone 11 128 Gb', 'Apple', 37453, 2),
('iPhone 12 64 Gb', 'Apple', 46296, 15),
('iPhone 13 128 Gb', 'Apple', 52544, 72),
('Redmi Note 10 Pro 6/128 Gb', 'Xiaomi', 17566, 23),
('Redmi 10 2022 4/64 Gb', 'Xiaomi', 11553, 2),
('Redmi A1+ 2/32 Gb', 'Xiaomi', 5911, 88);

SELECT * FROM mobile_phones;

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT models_mobile_phones, manufacturers_mobile_phones, prices_mobile_phones 
FROM mobile_phones
WHERE quantity_mobile_phones > 2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT * FROM mobile_phones
WHERE manufacturers_mobile_phones = 'Samsung';

