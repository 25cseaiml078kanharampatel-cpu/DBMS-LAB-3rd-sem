CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(50),
    PubYear INT,
    AvailableCopies INT
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    MemberName VARCHAR(50),
    Phone VARCHAR(15),
    Address VARCHAR(100)
);

CREATE TABLE IssueReturn (
    IssueID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    IssueDate DATE,
    ReturnDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID) ON DELETE CASCADE
);

INSERT INTO Books VALUES
(1, 'Database System Concepts', 'Korth', 2019, 10),
(2, 'Artificial Intelligence', 'Stuart Russell', 2021, 8),
(3, 'Let Us C', 'Yashavant Kanetkar', 2017, 15),
(4, 'Python Crash Course', 'Eric Matthes', 2023, 12),
(5, 'Operating System Concepts', 'Galvin', 2018, 6);

INSERT INTO Members VALUES
(101, 'Kanharam', '9876543210', 'Gunupur'),
(102, 'Rahul', '9876543211', 'Rourkela'),
(103, 'Priya', '9876543212', 'Sambalpur'),
(104, 'Aman', '9876543213', 'Jharsuguda'),
(105, 'Neha', '9876543214', 'Bhubaneswar');

INSERT INTO IssueReturn VALUES
(1, 1, 101, '2026-10-01', NULL, 'Issued'),
(2, 2, 102, '2026-10-02', NULL, 'Issued'),
(3, 3, 103, '2026-10-03', '2026-10-15', 'Returned'),
(4, 4, 104, '2026-10-04', NULL, 'Issued'),
(5, 5, 105, '2026-10-05', NULL, 'Issued');

SELECT * FROM Books;
SELECT * FROM Members;

SELECT I.IssueID, B.Title, M.MemberName, I.Status
FROM IssueReturn I
JOIN Books B ON I.BookID = B.BookID
JOIN Members M ON I.MemberID = M.MemberID;

SELECT B.Title, M.MemberName, I.IssueDate
FROM IssueReturn I
JOIN Books B ON I.BookID = B.BookID
JOIN Members M ON I.MemberID = M.MemberID;

UPDATE Books SET AvailableCopies = AvailableCopies - 1 WHERE BookID = 1;
UPDATE IssueReturn SET Status = 'Returned', ReturnDate = '2026-10-20' WHERE IssueID = 1;
UPDATE Books SET AvailableCopies = AvailableCopies + 5 WHERE BookID = 2;
DELETE FROM Members WHERE MemberID = 105;
DELETE FROM Books WHERE BookID = 5;

ALTER TABLE Books ADD ISBN VARCHAR(20);
ALTER TABLE Members DROP COLUMN Address;
RENAME TABLE IssueReturn TO Transactions;
TRUNCATE TABLE Transactions;

INSERT INTO Transactions VALUES
(1, 1, 101, '2026-10-01', NULL, 'Issued'),
(2, 2, 102, '2026-10-02', NULL, 'Issued'),
(3, 3, 103, '2026-10-03', '2026-10-15', 'Returned');

ALTER TABLE Books MODIFY Title VARCHAR(100) NOT NULL;
ALTER TABLE Members ADD CONSTRAINT chk_phone CHECK (LENGTH(Phone) = 10);

SELECT M.MemberName, B.Title
FROM Members M
INNER JOIN Transactions T ON M.MemberID = T.MemberID
INNER JOIN Books B ON T.BookID = B.BookID;

SELECT M.MemberName, T.BookID, T.Status
FROM Members M
LEFT JOIN Transactions T ON M.MemberID = T.MemberID;

SELECT COUNT(*) AS Total_Books FROM Books;
SELECT MAX(PubYear) AS Latest_Year, MIN(PubYear) AS Oldest_Year FROM Books;
SELECT COUNT(*) AS Currently_Issued_Books FROM Transactions WHERE Status = 'Issued';

CREATE VIEW IssuedBooksView AS
SELECT B.Title, M.MemberName, T.IssueDate
FROM Transactions T
JOIN Books B ON T.BookID = B.BookID
JOIN Members M ON T.MemberID = M.MemberID
WHERE T.Status = 'Issued';

SELECT * FROM IssuedBooksView;

DELIMITER //
CREATE PROCEDURE GetIssuedBooks()
BEGIN
    SELECT * FROM IssuedBooksView;
END //
DELIMITER ;

CALL GetIssuedBooks();
