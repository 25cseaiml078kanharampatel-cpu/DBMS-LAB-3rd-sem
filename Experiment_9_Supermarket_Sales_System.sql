CREATE DATABASE IF NOT EXISTS SupermarketDB;
USE SupermarketDB;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Phone VARCHAR(15),
    Address VARCHAR(100)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SaleDate DATE,
    Quantity INT,
    Status VARCHAR(20),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

INSERT INTO Products VALUES
(1, 'Milk 1L', 60.00, 100),
(2, 'Bread', 40.00, 80),
(3, 'Rice 5Kg', 350.00, 50),
(4, 'Cooking Oil 1L', 150.00, 70),
(5, 'Sugar 1Kg', 45.00, 90);

INSERT INTO Customers VALUES
(101, 'Ramesh', '9876543210', 'Bhubaneswar'),
(102, 'Suresh', '9876543211', 'Rourkela'),
(103, 'Mahesh', '9876543212', 'Sambalpur'),
(104, 'Anita', '9876543213', 'Cuttack'),
(105, 'Sunita', '9876543214', 'Puri');

INSERT INTO Sales VALUES
(1, 1, 101, '2026-10-01', 2, 'Pending'),
(2, 2, 102, '2026-10-02', 1, 'Completed'),
(3, 3, 103, '2026-10-03', 1, 'Completed'),
(4, 4, 104, '2026-10-04', 3, 'Pending'),
(5, 5, 105, '2026-10-05', 2, 'Completed');

SELECT * FROM Products;
SELECT * FROM Customers;

SELECT S.SaleID, P.ProductName, C.CustomerName, S.Quantity, S.Status
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
JOIN Customers C ON S.CustomerID = C.CustomerID;

SELECT P.ProductName, C.CustomerName, S.SaleDate
FROM Sales S
JOIN Products P ON S.ProductID = P.ProductID
JOIN Customers C ON S.CustomerID = C.CustomerID;

UPDATE Products SET Stock = Stock - 2 WHERE ProductID = 1;
UPDATE Sales SET Status = 'Completed' WHERE SaleID = 1;
UPDATE Products SET Price = Price * 1.10 WHERE ProductID = 3;
DELETE FROM Customers WHERE CustomerID = 105;
DELETE FROM Products WHERE ProductID = 5;

ALTER TABLE Products ADD ExpiryDate DATE;
ALTER TABLE Customers DROP COLUMN Address;
RENAME TABLE Sales TO Transactions;
TRUNCATE TABLE Transactions;

INSERT INTO Transactions VALUES
(1, 1, 101, '2026-10-01', 2, 'Completed'),
(2, 2, 102, '2026-10-02', 1, 'Completed'),
(3, 3, 103, '2026-10-03', 1, 'Pending');

ALTER TABLE Products MODIFY ProductName VARCHAR(50) NOT NULL;
ALTER TABLE Products ADD CONSTRAINT chk_price CHECK (Price > 0);

SELECT C.CustomerName, P.ProductName
FROM Customers C
INNER JOIN Transactions T ON C.CustomerID = T.CustomerID
INNER JOIN Products P ON T.ProductID = P.ProductID;

SELECT C.CustomerName, T.ProductID, T.Status
FROM Customers C
LEFT JOIN Transactions T ON C.CustomerID = T.CustomerID;

SELECT COUNT(*) AS Total_Products FROM Products;
SELECT MAX(Price) AS Max_Price, MIN(Price) AS Min_Price FROM Products;
SELECT COUNT(*) AS Completed_Sales_Count FROM Transactions WHERE Status = 'Completed';

CREATE VIEW CompletedSalesView AS
SELECT P.ProductName, C.CustomerName, T.SaleDate
FROM Transactions T
JOIN Products P ON T.ProductID = P.ProductID
JOIN Customers C ON T.CustomerID = C.CustomerID
WHERE T.Status = 'Completed';

SELECT * FROM CompletedSalesView;

DELIMITER //
CREATE PROCEDURE GetCompletedSales()
BEGIN
    SELECT * FROM CompletedSalesView;
END //
DELIMITER ;

CALL GetCompletedSales();
