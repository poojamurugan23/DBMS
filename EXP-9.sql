CREATE DATABASE IF NOT EXISTS UniversityDB;
USE UniversityDB;
DROP TABLE IF EXISTS Enrollments, Courses, Students;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Department VARCHAR(50),
    Status VARCHAR(10)  
);
INSERT INTO Students (StudentID, Name, Age, Department, Status) VALUES
(1, 'Alice', 20, 'Computer Science', 'Active'),
(2, 'Bob', 22, 'Electronics', 'Inactive'),
(3, 'Charlie', 21, 'Computer Science', 'Active'),
(4, 'David', 23, 'Mechanical', 'Active'),
(5, 'Eve', 22, 'Computer Science', 'Inactive');
CREATE VIEW ActiveStudents AS
SELECT StudentID, Name, Department
FROM Students
WHERE Status = 'Active';
CREATE INDEX idx_name_dept ON Students (Name, Department);
SELECT * FROM Students WHERE Name = 'Alice' AND Department = 'Computer Science';
SELECT * FROM ActiveStudents;
