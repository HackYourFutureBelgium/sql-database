
-- SQL Data Definition Language (DDL) 

-- Create a new database for this exercise
CREATE DATABASE IF NOT EXISTS example;

-- Select the 'example' database for use
USE example;

-- CREATE TABLE

-- Create a table named 'employees' with columns for employee id, name, position, and salary
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(100) NOT NULL,                
    position VARCHAR(50) NOT NULL,             
    salary DECIMAL(10, 2) NOT NULL              -- Decimal(10, 2) example: 2000.89
);

-- Show the structure of the 'employees' table
DESCRIBE employees;

-- ALTER TABLE
-- Add a new column 'date_of_hire' to the 'employees' table
ALTER TABLE employees
ADD date_of_hire DATE;

-- Show the updated structure of the 'employees' table
DESCRIBE employees;

-- Modify the 'position' column to have a larger maximum length
ALTER TABLE employees
MODIFY position VARCHAR(100) NOT NULL;

-- Show the updated structure of the 'employees' table
DESCRIBE employees;

-- DROP TABLE
-- Drop the 'employees' table
DROP TABLE employees;






