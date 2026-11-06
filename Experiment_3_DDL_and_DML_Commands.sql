CREATE DATABASE IF NOT EXISTS Exp3DB;
USE Exp3DB;

CREATE TABLE Persons (
    PersonID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    City VARCHAR(50)
);

DESC Persons;

INSERT INTO Persons VALUES
(101, 'Amit', 'IT', 'Bhubaneswar'),
(102, 'Priya', 'HR', 'Rourkela'),
(103, 'Rohan', 'Finance', 'Sambalpur');

SELECT PersonID, Name, Department FROM Persons;

ALTER TABLE Persons ADD Salary INT;
ALTER TABLE Persons MODIFY City VARCHAR(100);
ALTER TABLE Persons DROP COLUMN City;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(50)
);

INSERT INTO Employees VALUES (1, 'Suresh', 'Sales'), (2, 'Neha', 'IT');
RENAME TABLE Employees TO Staff;

UPDATE Staff SET Department = 'Marketing' WHERE EmpID = 1;
DELETE FROM Staff WHERE EmpID = 2;
TRUNCATE TABLE Persons;
DROP TABLE Persons;
