-- New script in postgres.
-- Date: Sep 9, 2022
-- Time: 4:10:43 PM

SELECT * FROM person;

SELECT id, first_name,country_of_birth, gender FROM person 
WHERE country_of_birth = 'China' AND gender = 'Female';

SELECT * FROM person WHERE 
	country_of_birth = 'China' 
	OR country_of_birth = 'France'
	OR country_of_birth = 'Brasil';

SELECT * FROM person WHERE
	country_of_birth IN ('China', 'France', 'Brasil'); 

-- Selects an interval
SELECT * FROM person
	WHERE date_of_birth BETWEEN DATE '2020-01-01' AND '2021-01-02';

-- Pattern matching
SELECT * FROM person
	WHERE email LIKE '%.com';

SELECT * FROM person
	WHERE email LIKE '%google%';

SELECT country_of_birth FROM person
	WHERE country_of_birth LIKE 'P%';

SELECT country_of_birth FROM person
	WHERE country_of_birth LIKE 'A____%';

-- Unique columns fields
SELECT DISTINCT country_of_birth FROM person;

-- counting and gruping columns
SELECT country_of_birth, count(*) FROM person
	GROUP BY country_of_birth ORDER BY count(*)

-- car table
SELECT round(avg(price), 2) FROM car;	
SELECT min(price) FROM car;
SELECT max(price) FROM car;
SELECT make, model, min(price) FROM car GROUP BY make, model;
-- sums all the price
SELECT sum(price) FROM car;

SELECT make, sum(price), count(price) FROM car GROUP BY make;
SELECT make, price, price * 0.10, price ^ 2, round(price ^ 3, 2) FROM car;

-- Aliasing
SELECT
	make,
	price AS original_price,
	(price * 0.10) AS ten_percent,
	(price ^ 2) AS squared,
	round(price ^ 3, 2) AS cubed_rounded
FROM
	car;

-- Dropping constraints
ALTER TABLE person DROP CONSTRAINT person_pkey;
-- creating a new record (row)
insert into person (id, first_name, last_name, email, gender, date_of_birth, country_of_birth) values (1, 'Basilio', 'Walbrun', 'bwalbrun0@adobe.com', 'Male', '2008-09-10', 'China');
SELECT * FROM person;
ALTER TABLE person ADD PRIMARY KEY (id);

-- Delete & Update a record (row)
DELETE FROM person WHERE id = 1001;
DELETE FROM person WHERE gender = 'Female' AND country_of_birth = 'China';
SELECT * FROM person WHERE country_of_birth = 'China' AND gender != 'Male';
UPDATE person SET email = 'carlotita@rivera.com' WHERE id = 2;
UPDATE person SET first_name = 'Carlotita', last_name = 'Rivera' WHERE id = 2;
