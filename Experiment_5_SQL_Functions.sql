CREATE DATABASE IF NOT EXISTS Exp5DB;
USE Exp5DB;

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Designation VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    JoinDate DATE
);

INSERT INTO Employee VALUES
(1, 'Ankit', 'Developer', 'IT', 45678.56, '2021-05-10'),
(2, 'Sneha', 'Manager', 'HR', 60250.75, '2019-08-15'),
(3, 'Vikram', 'Analyst', 'IT', 38900.20, '2023-01-20'),
(4, 'Pooja', 'Executive', 'Finance', 32100.80, '2022-11-05');

SELECT EmpName, UPPER(EmpName) AS Upper_Name, LOWER(EmpName) AS Lower_Name FROM Employee;
SELECT EmpName, LENGTH(EmpName) AS Name_Length FROM Employee;
SELECT CONCAT(EmpName, ' - ', Designation) AS Employee_Profile FROM Employee;
SELECT EmpName, SUBSTRING(EmpName, 1, 3) AS Short_Name FROM Employee;
SELECT EmpName, Salary, ROUND(Salary, 0) AS Rounded_Salary FROM Employee;
SELECT EmpName, Salary, ABS(Salary - 50000) AS Diff_From_50K FROM Employee;
SELECT CURDATE() AS Today_Date, NOW() AS Current_DateTime;
SELECT EmpName, JoinDate, ROUND(DATEDIFF(CURDATE(), JoinDate) / 365, 1) AS Years_Of_Service FROM Employee;

SELECT 
    COUNT(*) AS Total_Employees,
    MAX(Salary) AS Max_Salary,
    MIN(Salary) AS Min_Salary,
    AVG(Salary) AS Avg_Salary,
    SUM(Salary) AS Total_Salary
FROM Employee;

SELECT 
    Department,
    COUNT(*) AS Emp_Count,
    SUM(Salary) AS Total_Dept_Salary,
    AVG(Salary) AS Avg_Dept_Salary
FROM Employee
GROUP BY Department;
