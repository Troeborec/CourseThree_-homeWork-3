skypro=# CREATE TABLE city (
    skypro(# city_id BIGSERIAL NOT NULL PRIMARY KEY,
        skypro(# city_name VARCHAR(60) NOT NULL
        skypro(# );
CREATE TABLE
    skypro=# ALTER TABLE employee
    skypro-# ADD COLUMN city_id INT;
ALTER TABLE
    skypro=# ALTER TABLE employee ADD FOREIGN KEY (city_id)
    skypro-# REFERENCES city (city_id);
ALTER TABLE
    skypro=# SELECT employee, city
    skypro-# FROM employee
    skypro-# INNER JOIN city
    skypro-# ON employee.city_id = city.city_id;
employee | city
----------+------
(0 ёЄЁюъ)
    skypro=# INSERT INTO city (
skypro(# city_name)
skypro-# VALUES ('Москва'),
skypro-# ('Лондон'),
skypro-# ('Калифорния'),
skypro-# ('Санкт-Петербург');
INSERT 0 4
skypro=# SELECT * FROM city;
 city_id |    city_name
---------+-----------------
       1 | Москва
       2 | Лондон
       3 | Калифорния
       4 | Санкт-Петербург
(4 ёЄЁюъш)
    skypro=# SELECT employee.first_name AS Имя,
skypro-# employee.last_name AS Фамилия,
skypro-# city.city_name AS Город
skypro-# FROM employee
skypro-# INNER JOIN city ON employee.city_id = city.city_id;
 Имя | Фамилия | Город
-----+---------+-------
(0 ёЄЁюъ)
    skypro=# SELECT city.city_name AS Город,
skypro-# employee.first_name AS Имя,
skypro-# employee.last_name AS Фамилия
skypro-# FROM employee
skypro-# RIGHT JOIN city ON employee.city_id = city.city_id;
      Город      | Имя | Фамилия
-----------------+-----+---------
 Лондон          |     |
 Санкт-Петербург |     |
 Москва          |     |
 Калифорния      |     |
(4 ёЄЁюъш)
    skypro=# SELECT employee.first_name AS Имя,
skypro-# city.city_name  AS Город
skypro-# FROM employee
skypro-# FULL JOIN city ON employee.city_id = city.city_id;
  Имя   |      Город
--------+-----------------
 Lidia  |
 Artem  |
 Nikita |
 Nikita |
 Lidia  |
        | Лондон
        | Санкт-Петербург
        | Москва
        | Калифорния
(9 ёЄЁюъ)
    skypro=# SELECT employee.first_name AS Имя,
skypro-# city.city_name AS Город
skypro-# FROM employee
skypro-# LEFT JOIN city ON employee.city_id = city.city_id;
  Имя   | Город
--------+-------
 Lidia  |
 Artem  |
 Nikita |
 Nikita |
 Lidia  |
(5 ёЄЁюъ)
    /Почему - то не отоброжается, не могу понять