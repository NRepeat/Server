CREATE TABLE Workers (
    id SERIAL PRIMARY KEY,
    name varchar(50) NOT NULL,
    birthday DATE NOT NULL CHECK(
        birthday > '1900-01-01'
        AND birthday < current_date
    )
)
ALTER TABLE workers
ADD COLUMN vacation_number NUMERIC(2) NOT NULL DEFAULT 0 CONSTRAINT "invalid vacation number" CHECK(vacation_number > 0),
    ADD COLUMN email VARCHAR(256) UNIQUE
ALTER TABLE workers
ALTER COLUMN email
SET NOT NULL;
ALTER TABLE workers
ADD CONSTRAINT "no empty value allowed in email section " CHECK (email != '')
ALTER TABLE workers
ADD COLUMN salary MONEY DEFAULT 500
ALTER TABLE workers
    RENAME TO employees;
INSERT INTO employees (
        name,
        birthday,
        vacation_number,
        email,
        selery
    )
VALUES (
        'Mykyta',
        '05-02-1990',
        1,
        'mykyta@gmail.com',
        600
    )
INSERT INTO employees (name, birthday, vacation_number, email, selery)
VALUES (
        'Світлана',
        '1990-01-01',
        1,
        'svitlana@example.com',
        1200
    ),
    (
        'Ярослав',
        '1943-01-01',
        1,
        'yaroslav@example.com',
        1500
    ),
    (
        'Павло',
        '1930-01-01',
        1,
        'pavlo@example.com',
        1000
    );


UPDATE employees
SET salary = 2000
WHERE "name" = 'Павло';

UPDATE employees
SET birthday = '1936-01-01'
WHERE id = 4;


UPDATE employees
SET salary = 700
WHERE salary < 400::money;


UPDATE employees
SET vacation_number = 5
WHERE id > 2 AND id <= 8;


UPDATE employees
SET salary = salary + 200::money
WHERE id = 7;


SELECT *
FROM employees
WHERE id = 3;
SELECT *
FROM employees
WHERE salary < 800::money;
SELECT *
FROM employees
WHERE salary <> 500::money;
SELECT salary, vacation_number
FROM employees
WHERE "name" = 'Євген';
SELECT *
FROM employees
WHERE "name" = 'Петро';
SELECT *
FROM employees
WHERE "name" <> 'Петро';
SELECT *
FROM employees
WHERE birthday = current_date - interval '27 years' OR salary = 1000::money;

SELECT *
FROM employees
WHERE birthday > current_date - interval '25 years' AND birthday < current_date - interval '28 years';

SELECT *
FROM employees
WHERE (birthday > current_date - interval '27 years' AND birthday < current_date - interval '23 years')
   OR (salary > 400::money AND salary < 1000::money);


DELETE FROM employees
WHERE id = 7;


DELETE FROM employees
WHERE "name" = 'Микола';
 
 
DELETE FROM employees
WHERE vacation_number > 20;
