
CREATE DATABASE IF NOT EXISTS SchoolDB;
USE SchoolDB;
CREATE TABLE IF NOT EXISTS Students (StudentID INT PRIMARY KEY,  Name VARCHAR(100) NOT NULL,Email VARCHAR(100) UNIQUE,                Age INT CHECK (Age >= 18),         
    Grade CHAR(1) CHECK (Grade IN ('A','B','C','D','F')));
INSERT INTO Students (StudentID, Name, Email, Age, Grade)
VALUES (1, 'Alice Johnson', 'alice@example.com', 20, 'A');
INSERT INTO Students (StudentID, Name, Email, Age, Grade)
VALUES (2, 'Bob Smith', 'bob@example.com', 22, 'B');
INSERT INTO Students (StudentID, Name, Email, Age, Grade) VALUES (3, 'Charlie Brown', 'charlie@example.com', 18, 'C');
UPDATE Students
SET Grade = 'A' WHERE StudentID = 2;
DELETE FROM Students
WHERE StudentID = 1;
SELECT * FROM Students;