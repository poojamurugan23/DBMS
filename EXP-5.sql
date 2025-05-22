CREATE DATABASE IF NOT EXISTS UniversityDB;
USE UniversityDB;
DROP TABLE IF EXISTS Enrollments, Courses, Students;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT
);
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100)
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
(1, 'Alice', 20),
(2, 'Bob', 22),
(3, 'Charlie', 19),
(4, 'Daniel', 21);
INSERT INTO Courses VALUES
(101, 'Database Systems'),
(102, 'Networks'),
(103, 'Operating Systems');
INSERT INTO Enrollments VALUES
(1001, 1, 101, '2024-09-01'),
(1002, 2, 102, '2024-09-01'),
(1003, 3, 103, '2024-09-01');
SELECT * FROM Students
NATURAL JOIN Enrollments;
SELECT S.StudentID, S.Name, E.CourseID, E.EnrollmentDate
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID;
SELECT C.CourseName, E.StudentID
FROM Courses C
JOIN Enrollments E ON C.CourseID = E.CourseID;
SELECT S.StudentID, S.Name, E.CourseID
FROM Students S
LEFT JOIN Enrollments E ON S.StudentID = E.StudentID;
SELECT S.StudentID, S.Name, E.CourseID
FROM Students S
RIGHT JOIN Enrollments E ON S.StudentID = E.StudentID;
SELECT S.StudentID, S.Name, E.CourseID
FROM Students S
LEFT JOIN Enrollments E ON S.StudentID = E.StudentID
UNION
SELECT S.StudentID, S.Name, E.CourseID
FROM Students S
RIGHT JOIN Enrollments E ON S.StudentID = E.StudentID;
