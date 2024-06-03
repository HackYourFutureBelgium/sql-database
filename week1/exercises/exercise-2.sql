-- SQL Data Definition Language (DDL)

-- Task 1: Create a new database for this exercise
CREATE DATABASE ______________ example;

-- Task 2: Select the 'example' database for use
_____ example;

-- Task 3: CREATE TABLE
-- Create a table named 'employees' with columns for employee id, name, position, and salary
CREATE TABLE employees (
    employee_id INT _______________________, -- Primary Key with auto-increment
    name VARCHAR(100) NOT NULL,                 -- Employee name, cannot be null
    position VARCHAR(50) NOT NULL,              -- Employee position, cannot be null
    salary ___________ NOT NULL              -- Employee salary, cannot be null, e.g., 2000.89
);

-- Task 4: Show the structure of the 'employees' table
_________ employees;

-- Task 5: ALTER TABLE
-- Add a new column 'date_of_hire' to the 'employees' table
ALTER TABLE employees
_________ date_of_hire DATE;

-- Task 6: Show the updated structure of the 'employees' table
_________ employees;

-- Task 7: Modify the 'position' column to have a larger maximum length
ALTER TABLE employees
_________ position VARCHAR(100) NOT NULL;

-- Task 8: Show the updated structure of the 'employees' table
_________ employees;

-- Task 9: DROP TABLE
-- Drop the 'employees' table
_________ employees;

