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
(4, 'Daniel', 'daniel@example.com', 23);
INSERT INTO Courses VALUES
(101, 'Database Systems', 3),
(102, 'Computer Networks', 4),
(103, 'Operating Systems', 3);
INSERT INTO Enrollments VALUES
(1001, 1, 101, '2024-09-01'),
(1002, 2, 102, '2024-09-01'),
(1003, 3, 103, '2024-09-01'),
(1004, 1, 102, '2024-09-02'),
(1005, 4, 101, '2024-09-03');
SELECT * FROM Students
WHERE Age > (
    SELECT AVG(Age) FROM Students
);
SELECT Name FROM Students
WHERE StudentID IN (
    SELECT StudentID FROM Enrollments
    WHERE CourseID = (
        SELECT CourseID FROM Courses WHERE CourseName = 'Database Systems'
    )
);
SELECT CourseName FROM Courses
WHERE CourseID NOT IN (
    SELECT CourseID FROM Enrollments
    WHERE StudentID = (
        SELECT StudentID FROM Students WHERE Name = 'Alice'
    )
);
SELECT E.EnrollmentID, S.Name AS StudentName, C.CourseName, E.EnrollmentDate
FROM Enrollments E
INNER JOIN Students S ON E.StudentID = S.StudentID
INNER JOIN Courses C ON E.CourseID = C.CourseID;
SELECT S.Name, COUNT(E.CourseID) AS TotalCourses
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
GROUP BY S.Name;
SELECT Name FROM Students
WHERE StudentID IN (
    SELECT StudentID FROM Enrollments
    WHERE CourseID = (SELECT CourseID FROM Courses WHERE CourseName = 'Database Systems')
)
AND StudentID IN (
    SELECT StudentID FROM Enrollments
    WHERE CourseID = (SELECT CourseID FROM Courses WHERE CourseName = 'Computer Networks')
);
