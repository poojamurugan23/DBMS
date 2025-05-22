USE UniversityDB;
DELIMITER $$
CREATE FUNCTION GetStudentAge(sID INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE resultAge INT;
    SELECT Age INTO resultAge FROM Students WHERE StudentID = sID;
    RETURN resultAge;
END$$
DELIMITER ;
SELECT GetStudentAge(1) AS AgeOfStudent1;
DELIMITER $$
CREATE FUNCTION GetEnrollmentCount(sID INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE countEnrollments INT;
    SELECT COUNT(*) INTO countEnrollments FROM Enrollments WHERE StudentID = sID;
    RETURN countEnrollments;
END$$
DELIMITER ;
SELECT GetEnrollmentCount(1) AS EnrollmentsOfStudent1;
DELIMITER $$
CREATE PROCEDURE AddStudent (
    IN pStudentID INT,
    IN pName VARCHAR(100),
    IN pAge INT
)
BEGIN
    INSERT INTO Students (StudentID, Name, Age)
    VALUES (pStudentID, pName, pAge);
END$$
DELIMITER ;
CALL AddStudent(5, 'Eva', 21);
DELIMITER $$
CREATE PROCEDURE UpdateStudentName (
    IN pStudentID INT,
    IN pNewName VARCHAR(100)
)
BEGIN
    UPDATE Students SET Name = pNewName WHERE StudentID = pStudentID;
END$$
DELIMITER ;
CALL UpdateStudentName(5, 'Eva Green');
DELIMITER $$
CREATE PROCEDURE GetStudentsByCourse (
    IN pCourseID INT
)
BEGIN
    SELECT S.StudentID, S.Name, C.CourseName
    FROM Students S
    JOIN Enrollments E ON S.StudentID = E.StudentID
    JOIN Courses C ON E.CourseID = C.CourseID
    WHERE C.CourseID = pCourseID;
END$$
DELIMITER ;
CALL GetStudentsByCourse(101);
