CREATE DATABASE IF NOT EXISTS UniversityDB;
USE UniversityDB;
DROP TABLE IF EXISTS Enrollments, Students, Courses;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Age INT CHECK (Age >= 18)
);
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT CHECK (Credits > 0)
);
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Students VALUES
(1, 'Alice', 'alice@example.com', 20),
(2, 'Bob', 'bob@example.com', 22),
(3, 'Charlie', 'charlie@example.com', 19),
(4, 'Amanda', 'amanda@example.com', 23),
(5, 'Daniel', 'daniel@example.com', 21);
INSERT INTO Courses VALUES
(101, 'Database Systems', 3),
(102, 'Networks', 4),
(103, 'Operating Systems', 3);
INSERT INTO Enrollments VALUES
(1001, 1, 101, '2024-09-01'),
(1002, 2, 101, '2024-09-01'),
(1003, 2, 102, '2024-09-01'),
(1004, 3, 103, '2024-09-01'),
(1005, 4, 101, '2024-09-01'),
(1006, 5, 103, '2024-09-01');
SELECT * FROM Students
WHERE Age > 21;
SELECT * FROM Students
WHERE Name LIKE 'A%';
SELECT * FROM Students
WHERE Age BETWEEN 20 AND 23;
SELECT * FROM Enrollments
WHERE CourseID IN (101, 103);
SELECT S.*
FROM Students S
WHERE S.StudentID NOT IN (
    SELECT StudentID FROM Enrollments WHERE CourseID = 102
);
SELECT COUNT(*) AS TotalStudents FROM Students;
SELECT AVG(Age) AS AverageAge FROM Students;
SELECT MAX(Age) AS Oldest, MIN(Age) AS Youngest FROM Students;
SELECT SUM(Credits) AS TotalCredits FROM Courses;
SELECT C.CourseName, COUNT(E.StudentID) AS EnrolledStudents
FROM Courses C
JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY C.CourseName;
SELECT C.CourseName, COUNT(*) AS TotalEnrolled
FROM Enrollments E
JOIN Courses C ON E.CourseID = C.CourseID
GROUP BY C.CourseName
HAVING COUNT(*) > 2;
