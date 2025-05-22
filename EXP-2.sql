CREATE DATABASE IF NOT EXISTS UniversityDB;
USE UniversityDB;
CREATE TABLE IF NOT EXISTS Students (StudentID INT PRIMARY KEY, Name VARCHAR(100) NOT NULL,Email VARCHAR(100) UNIQUE,Age INT CHECK (Age >= 18));
CREATE TABLE IF NOT EXISTS Courses (CourseID INT PRIMARY KEY,CourseName VARCHAR(100) NOT NULL, Credits INT CHECK (Credits > 0));
CREATE TABLE IF NOT EXISTS Enrollments ( EnrollmentID INT PRIMARY KEY,StudentID INT, CourseID INT, EnrollmentDate DATE, FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE ON UPDATE CASCADE,FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE ON UPDATE CASCADE);
INSERT INTO Students (StudentID, Name, Email, Age)
VALUES (1, 'Alice Johnson', 'alice@example.com', 20),(2, 'Bob Smith', 'bob@example.com', 22);
INSERT INTO Courses (CourseID, CourseName, Credits)
VALUES (101, 'Database Systems', 3),(102, 'Computer Networks', 4);
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES (1001, 1, 101, '2024-09-01'),(1002, 2, 102, '2024-09-01');
SELECT * FROM Students; 
SELECT * FROM Courses;
SELECT * FROM Enrollments;
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES (1003, 99, 101, '2024-09-01');
DELETE FROM Courses WHERE CourseID = 102;
SELECT * FROM Enrollments;
