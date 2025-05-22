-- Step 1: Create the database
CREATE DATABASE IF NOT EXISTS TestDB;

-- Step 2: Use the database
USE TestDB;

-- Step 3: Create a simple table
CREATE TABLE Students (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT
);

-- Step 4: Insert some data
INSERT INTO Students (ID, Name, Age) VALUES
(1, 'Krithika', 20),
(2, 'Arun', 22),
(3, 'Meera', 19);

-- Step 5: View the data
SELECT * FROM Students;
