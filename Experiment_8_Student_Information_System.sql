CREATE DATABASE IF NOT EXISTS StudentDB;
USE StudentDB;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Address VARCHAR(100)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Credits INT,
    Capacity INT
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollDate DATE,
    Status VARCHAR(20),
    Grade CHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE
);

INSERT INTO Students VALUES
(1, 'Aarav', 19, 'Bhubaneswar'),
(2, 'Diya', 20, 'Rourkela'),
(3, 'Rohan', 21, 'Sambalpur'),
(4, 'Sneha', 19, 'Cuttack'),
(5, 'Kabir', 22, 'Puri');

INSERT INTO Courses VALUES
(101, 'DBMS', 4, 60),
(102, 'Artificial Intelligence', 4, 50),
(103, 'Python Programming', 3, 60),
(104, 'Operating Systems', 4, 45),
(105, 'Computer Networks', 3, 50);

INSERT INTO Enrollments VALUES
(1, 1, 101, '2026-08-01', 'Active', 'A'),
(2, 2, 102, '2026-08-02', 'Active', 'B'),
(3, 3, 103, '2026-08-03', 'Active', 'A'),
(4, 4, 101, '2026-08-04', 'Active', 'B'),
(5, 5, 104, '2026-08-05', 'Active', 'A');

SELECT * FROM Students;
SELECT * FROM Courses;

SELECT S.StudentID, S.Name, C.CourseName, E.Status
FROM Enrollments E
JOIN Students S ON E.StudentID = S.StudentID
JOIN Courses C ON E.CourseID = C.CourseID;

SELECT C.CourseName, S.Name, E.EnrollDate
FROM Enrollments E
JOIN Students S ON E.StudentID = S.StudentID
JOIN Courses C ON E.CourseID = C.CourseID;

UPDATE Courses SET Capacity = Capacity - 1 WHERE CourseID = 101;
UPDATE Enrollments SET Status = 'Completed', Grade = 'O' WHERE EnrollmentID = 1;
UPDATE Courses SET Capacity = Capacity + 10 WHERE CourseID = 102;
DELETE FROM Students WHERE StudentID = 5;
DELETE FROM Courses WHERE CourseID = 105;

ALTER TABLE Students ADD Email VARCHAR(100);
ALTER TABLE Students DROP COLUMN Address;
RENAME TABLE Enrollments TO Registrations;
TRUNCATE TABLE Registrations;

INSERT INTO Registrations VALUES
(1, 1, 101, '2026-08-01', 'Active', 'A'),
(2, 2, 102, '2026-08-02', 'Active', 'B'),
(3, 3, 103, '2026-08-03', 'Completed', 'A');

ALTER TABLE Students MODIFY Name VARCHAR(50) NOT NULL;
ALTER TABLE Students ADD CONSTRAINT chk_age CHECK (Age >= 18);

SELECT S.Name, C.CourseName
FROM Students S
INNER JOIN Registrations R ON S.StudentID = R.StudentID
INNER JOIN Courses C ON R.CourseID = C.CourseID;

SELECT S.Name, R.CourseID, R.Status
FROM Students S
LEFT JOIN Registrations R ON S.StudentID = R.StudentID;

SELECT COUNT(*) AS Total_Students FROM Students;
SELECT MAX(Credits) AS Max_Credits, MIN(Credits) AS Min_Credits FROM Courses;
SELECT COUNT(*) AS Active_Enrollments FROM Registrations WHERE Status = 'Active';

CREATE VIEW ActiveEnrollmentsView AS
SELECT C.CourseName, S.Name AS StudentName, R.EnrollDate
FROM Registrations R
JOIN Students S ON R.StudentID = S.StudentID
JOIN Courses C ON R.CourseID = C.CourseID
WHERE R.Status = 'Active';

SELECT * FROM ActiveEnrollmentsView;

DELIMITER //
CREATE PROCEDURE GetActiveEnrollments()
BEGIN
    SELECT * FROM ActiveEnrollmentsView;
END //
DELIMITER ;

CALL GetActiveEnrollments();
