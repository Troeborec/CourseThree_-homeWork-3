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
Получите имена и фамилии сотрудников, а также города, в которых они проживают.

    skypro=# SELECT employee.first_name AS ИМЯ,
skypro-# employee.last_name AS ФАМИЛИЯ,
skypro-# city.city_name AS ГОРОД
skypro-# FROM employee
skypro-# INNER JOIN city ON employee.city_id = city.city_id;
  ИМЯ   | ФАМИЛИЯ  | ГОРОД
--------+----------+--------
 Artem  | Seregin  | Лондон
 Nikita | Ivantsov | Москва
 Nikita | Rozhnov  | Москва
 Lidia  | Socova   | Лондон
 Lidia  | Mironova | Лондон
(5 ёЄЁюъ)

    Получите города, а также имена и фамилии сотрудников, которые в них проживают.
    skypro=# SELECT city.city_name AS ГОРОД,
skypro-# employee.first_name AS ИМЯ,
skypro-# employee.last_name AS ФАМИЛИЯ
skypro-# FROM employee
skypro-# RIGHT JOIN city ON employee.city_id = city.city_id;
      ГОРОД      |  ИМЯ   | ФАМИЛИЯ
-----------------+--------+----------
 Лондон          | Artem  | Seregin
 Москва          | Nikita | Ivantsov
 Москва          | Nikita | Rozhnov
 Лондон          | Lidia  | Socova
 Лондон          | Lidia  | Mironova
 Санкт-Петербург |        |
 Калифорния      |        |
(7 ёЄЁюъ)
    Получите имена всех сотрудников и названия всех городов.

    skypro=# SELECT employee.first_name AS ИМЯ,
skypro-# city.city_name AS ГОРОД
skypro-# FROM employee
skypro-# FULL JOIN city ON employee.city_id = city.city_id;
  ИМЯ   |      ГОРОД
--------+-----------------
 Artem  | Лондон
 Nikita | Москва
 Nikita | Москва
 Lidia  | Лондон
 Lidia  | Лондон
        | Санкт-Петербург
        | Калифорния
(7 ёЄЁюъ)

    skypro=# SELECT employee.first_name AS ИМЯ,
skypro-# city.city_name AS ГОРОД
skypro-# FROM employee
skypro-# LEFT JOIN city ON employee.city_id = city.city_id;
  ИМЯ   | ГОРОД
--------+--------
 Artem  | Лондон
 Nikita | Москва
 Nikita | Москва
 Lidia  | Лондон
 Lidia  | Лондон
(5 ёЄЁюъ)

    Получите имена городов, в которых никто не живет.
    skypro=# SELECT city.city_name AS ГОРОД
skypro-# FROM employee
skypro-# RIGHT JOIN city ON employee.city_id = city.city_id
skypro-# WHERE employee.first_name IS NULL;
      ГОРОД
-----------------
 Санкт-Петербург
 Калифорния
(2 ёЄЁюъш)

    skypro=# SELECT * FROM employee
skypro-# CROSS JOIN city;
 id | first_name | last_name | gender | age | city_id | city_id |    city_name
----+------------+-----------+--------+-----+---------+---------+-----------------
  6 | Artem      | Seregin   | boy    |  12 |       2 |       1 | Москва
  5 | Nikita     | Ivantsov  | boy    |  25 |       1 |       1 | Москва
  4 | Nikita     | Rozhnov   | boy    |  22 |       1 |       1 | Москва
  2 | Lidia      | Socova    | girl   |  63 |       2 |       1 | Москва
  1 | Lidia      | Mironova  | girl   |  21 |       2 |       1 | Москва
  6 | Artem      | Seregin   | boy    |  12 |       2 |       2 | Лондон
  5 | Nikita     | Ivantsov  | boy    |  25 |       1 |       2 | Лондон
  4 | Nikita     | Rozhnov   | boy    |  22 |       1 |       2 | Лондон
  2 | Lidia      | Socova    | girl   |  63 |       2 |       2 | Лондон
  1 | Lidia      | Mironova  | girl   |  21 |       2 |       2 | Лондон
  6 | Artem      | Seregin   | boy    |  12 |       2 |       3 | Калифорния
  5 | Nikita     | Ivantsov  | boy    |  25 |       1 |       3 | Калифорния
  4 | Nikita     | Rozhnov   | boy    |  22 |       1 |       3 | Калифорния
  2 | Lidia      | Socova    | girl   |  63 |       2 |       3 | Калифорния
  1 | Lidia      | Mironova  | girl   |  21 |       2 |       3 | Калифорния
  6 | Artem      | Seregin   | boy    |  12 |       2 |       4 | Санкт-Петербург
  5 | Nikita     | Ivantsov  | boy    |  25 |       1 |       4 | Санкт-Петербург
  4 | Nikita     | Rozhnov   | boy    |  22 |       1 |       4 | Санкт-Петербург
  2 | Lidia      | Socova    | girl   |  63 |       2 |       4 | Санкт-Петербург
  1 | Lidia      | Mironova  | girl   |  21 |       2 |       4 | Санкт-Петербург
(20 ёЄЁюъ)