SET @num = 25;
SET @name = 'Kanharam';
SET @today = '2026-11-06';
SELECT @num AS Number_Var, @name AS String_Var, @today AS Date_Var;

CREATE DATABASE IF NOT EXISTS Lab1DB;
USE Lab1DB;

CREATE TABLE DataTypesDemo (
    id INT,
    price DECIMAL(8,2),
    student_name VARCHAR(50),
    join_date DATE
);

INSERT INTO DataTypesDemo VALUES (1, 499.50, 'Rahul Sharma', '2026-08-01');
SELECT * FROM DataTypesDemo;

SELECT 
    20 + 10 AS Addition,
    20 - 10 AS Subtraction,
    20 * 10 AS Multiplication,
    20 / 10 AS Division,
    20 % 3  AS Modulus;

SELECT 
    (10 = 10)  AS Equal_To,
    (10 < 20)  AS Less_Than,
    (20 > 10)  AS Greater_Than,
    (10 <= 10) AS Less_Or_Equal,
    (20 >= 15) AS Greater_Or_Equal,
    (10 <> 20) AS Not_Equal;

CREATE TABLE Students (
    roll_no INT,
    name VARCHAR(50),
    marks INT,
    city VARCHAR(50)
);

INSERT INTO Students VALUES
(1, 'Aman', 85, 'Bhubaneswar'),
(2, 'Suman', 72, 'Rourkela'),
(3, 'Rajesh', 90, 'Sambalpur'),
(4, 'Kiran', 60, 'Cuttack');

SELECT * FROM Students WHERE marks > 70 AND city = 'Bhubaneswar';
SELECT * FROM Students WHERE city = 'Rourkela' OR city = 'Sambalpur';
SELECT * FROM Students WHERE city IN ('Bhubaneswar', 'Cuttack');
SELECT * FROM Students WHERE marks BETWEEN 70 AND 90;
SELECT * FROM Students WHERE name LIKE 'S%';
SELECT * FROM Students WHERE NOT city = 'Cuttack';
