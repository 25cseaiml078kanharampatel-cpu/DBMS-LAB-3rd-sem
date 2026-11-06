CREATE DATABASE IF NOT EXISTS Exp4DB;
USE Exp4DB;

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Designation VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employee VALUES
(1, 'Sameer', 'Manager', 25000),
(2, 'Rohit', 'Developer', 18000),
(3, 'Allen', 'Analyst', 35000),
(4, 'Sagar', 'Developer', 12000),
(5, 'Umesh', 'Clerk', 9000),
(6, 'Ramesh', 'Tester', NULL);

SELECT * FROM Employee WHERE Salary BETWEEN 10000 AND 30000;
SELECT * FROM Employee WHERE Salary NOT BETWEEN 10000 AND 30000;
SELECT * FROM Employee WHERE Designation IN ('Manager', 'Developer');
SELECT * FROM Employee WHERE Designation NOT IN ('Manager', 'Developer');
SELECT * FROM Employee WHERE Salary IS NULL;
SELECT * FROM Employee WHERE Salary IS NOT NULL;

SELECT EmpName FROM Employee WHERE EmpName LIKE 'S%';
SELECT EmpName FROM Employee WHERE EmpName LIKE '%r';
SELECT EmpName FROM Employee WHERE EmpName LIKE '%u%';
SELECT EmpName FROM Employee WHERE EmpName LIKE '%a%';
SELECT EmpName FROM Employee WHERE EmpName LIKE '%ll%';
SELECT EmpName FROM Employee WHERE EmpName LIKE '%e%';

SELECT * FROM Employee WHERE Salary = 25000;
SELECT * FROM Employee WHERE Salary != 25000;
SELECT * FROM Employee WHERE Salary > 20000;
SELECT * FROM Employee WHERE Salary < 20000;
SELECT * FROM Employee WHERE Salary >= 18000;
SELECT * FROM Employee WHERE Salary <= 18000;

SELECT * FROM Employee WHERE Designation = 'Developer' AND Salary > 15000;
SELECT * FROM Employee WHERE Designation = 'Manager' OR Salary < 10000;

SELECT * FROM Employee ORDER BY EmpName ASC;
SELECT * FROM Employee ORDER BY EmpName DESC;
SELECT DISTINCT Designation FROM Employee;

SELECT Designation, AVG(Salary) AS Avg_Salary
FROM Employee
GROUP BY Designation
HAVING AVG(Salary) > 15000;

DELETE FROM Employee WHERE EmpName LIKE 'U%';
UPDATE Employee SET Salary = 22000 WHERE EmpName LIKE 'R%';

SELECT 
    EmpName,
    Salary,
    Salary + 2000 AS Salary_With_Bonus,
    Salary - (Salary * 0.10) AS Salary_After_Tax,
    Salary * 2 AS Double_Salary
FROM Employee;
