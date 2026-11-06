CREATE DATABASE IF NOT EXISTS Exp6DB;
USE Exp6DB;

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Salary DECIMAL(10,2) DEFAULT 15000,
    Mobile VARCHAR(15),
    DeptID INT
);

ALTER TABLE Employee
ADD CONSTRAINT fk_dept FOREIGN KEY (DeptID) REFERENCES Department(DeptID);

ALTER TABLE Employee
ADD CONSTRAINT chk_salary CHECK (Salary >= 10000);

ALTER TABLE Employee
ADD CONSTRAINT uq_mobile UNIQUE (Mobile);

INSERT INTO Department VALUES (10, 'IT'), (20, 'HR');

INSERT INTO Employee (EmpID, EmpName, Email, Salary, Mobile, DeptID)
VALUES (1, 'Rajesh', 'rajesh@mail.com', 25000, '9876543210', 10);

ALTER TABLE Employee ALTER Salary SET DEFAULT 20000;
ALTER TABLE Employee DROP INDEX uq_mobile;
