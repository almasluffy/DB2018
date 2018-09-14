CREATE DATABASE lab2;

CREATE TABLE countries (
  country_id SERIAL PRIMARY KEY,
  country_name varchar(255),
  region_id int,
  population int
);

INSERT INTO countries values (1, 'Iran' ,223,18000000);

SELECT *from countries;

INSERT INTO countries (country_id,country_name) VALUES ( 2,'Iraq');

UPDATE countries SET region_id = NULL ;

INSERT INTO countries (country_id, country_name,region_id,population )
    values (22 ,'Russia',23,23000000),
           (12 ,'Argentina',15,10320000),
           (99 ,'Brazil',45,7600000);

ALTER TABLE countries
    ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries values (34,default ,67,5340000);

INSERT INTO countries (country_id , country_name) values (default , default );

CREATE TABLE countries_new(
  LIKE countries
);

INSERT INTO countries_new
SELECT * FROM countries;

SELECT * FROM countries_new;

UPDATE countries_new SET region_id = 1 WHERE region_id is NULL;

UPDATE countries_new SET population = population + (population*0.1)
    RETURNING country_name, population AS "New Population";

DELETE FROM countries WHERE population < 100000;

DELETE FROM countries_new
AS firstC USING countries AS secondC
WHERE firstC.country_id=secondC.country_id
RETURNING *;

DELETE FROM countries
RETURNING *;