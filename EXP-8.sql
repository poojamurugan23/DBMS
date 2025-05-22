CREATE DATABASE IF NOT EXISTS TriggerDemo;
USE TriggerDemo;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT
);
CREATE TABLE Student_Audit (
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    OperationType VARCHAR(10),
    StudentID INT,
    Name VARCHAR(100),
    Age INT,
    OperationTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER //
CREATE TRIGGER trg_after_insert
AFTER INSERT ON Students
FOR EACH ROW
BEGIN
    INSERT INTO Student_Audit (OperationType, StudentID, Name, Age)
    VALUES ('INSERT', NEW.StudentID, NEW.Name, NEW.Age);
END;
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER trg_after_update
AFTER UPDATE ON Students
FOR EACH ROW
BEGIN
    INSERT INTO Student_Audit (OperationType, StudentID, Name, Age)
    VALUES ('UPDATE', NEW.StudentID, NEW.Name, NEW.Age);
END;
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER trg_after_delete
AFTER DELETE ON Students
FOR EACH ROW
BEGIN
    INSERT INTO Student_Audit (OperationType, StudentID, Name, Age)
    VALUES ('DELETE', OLD.StudentID, OLD.Name, OLD.Age);
END;
//
DELIMITER ;
INSERT INTO Students (StudentID, Name, Age) VALUES (1, 'Alice', 20);
UPDATE Students SET Age = 21 WHERE StudentID = 1;
DELETE FROM Students WHERE StudentID = 1;
SELECT * FROM Student_Audit;
