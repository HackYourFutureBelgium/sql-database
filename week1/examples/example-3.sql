-- SQL Data Manipulation Language (DML)

-- Create a new database 
CREATE DATABASE IF NOT EXISTS example;

-- Select the 'example' database for use
USE example;

-- Create a table named 'students' with columns for student id, name, age, and grade
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY, -- Primary Key with auto-increment
    name VARCHAR(100) NOT NULL,                -- Student name, cannot be null
    age INT NOT NULL,                          -- Student age, cannot be null
    grade VARCHAR(2) NOT NULL                  -- Student grade, cannot be null, e.g., 'A+'
);

-- Task 1: INSERT INTO
-- Insert new rows of data into the 'students' table
INSERT INTO students (name, age, grade) VALUES ('Alice Johnson', 20, 'A');
INSERT INTO students (name, age, grade) VALUES ('Bob Smith', 22, 'B');
INSERT INTO students (name, age, grade) VALUES ('Charlie Brown', 21, 'C');
INSERT INTO students (name, age, grade) VALUES ('Diana Prince', 23, 'A+');

-- Task 2: SELECT to verify inserts
-- Select all records from the 'students' table to verify the insertions
SELECT * FROM students;

-- Task 3: UPDATE
-- Update the grade for a student with a specific id
UPDATE students
SET grade = 'B+'
WHERE student_id = 3;

-- Task 4: SELECT to verify update
-- Select all records from the 'students' table to verify the update
SELECT * FROM students;

-- Task 5: DELETE FROM
-- Delete a student record with a specific id
DELETE FROM students
WHERE student_id = 2;

-- Task 6: SELECT to verify deletion
-- Select all records from the 'students' table to verify the deletion
SELECT * FROM students;
