USE UniversityDB;
DROP TABLE IF EXISTS Enrollments, Courses, Students;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Age INT
);
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT
);
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
START TRANSACTION;
INSERT INTO Students (StudentID, Name, Email, Age)
VALUES (10, 'Frank', 'frank@example.com', 21);
SAVEPOINT BeforeCourse;
INSERT INTO Courses (CourseID, CourseName, Credits)
VALUES (200, 'Artificial Intelligence', 3);
INSERT INTO Courses (CourseID, CourseName, Credits)
VALUES (210, 'Duplicate Course', 4); 
ROLLBACK TO BeforeCourse;
COMMIT;
CREATE USER IF NOT EXISTS 'appuser'@'localhost' IDENTIFIED BY 'password123';
GRANT SELECT, INSERT ON UniversityDB.Students TO 'appuser'@'localhost';
SHOW GRANTS FOR 'appuser'@'localhost';
REVOKE INSERT ON UniversityDB.Students FROM 'appuser'@'localhost';
