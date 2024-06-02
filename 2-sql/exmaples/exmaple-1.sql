
-- Basic SQL Commands
-- Create a database named 'hyf' if it does not exist
CREATE DATABASE IF NOT EXISTS hyf;

-- Select the 'hyf' database for use
USE hyf;

-- Drop the 'users' table if it already exists to avoid conflicts
DROP TABLE IF EXISTS users;

-- Create a table named 'users' with detailed structure and constraints
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
    name VARCHAR(100) NOT NULL,        
    email VARCHAR(100) NOT NULL UNIQUE, 
) 

-- Show the structure of the 'users' table
DESCRIBE users;

-- Insert users into the 'users' table with detailed values
INSERT INTO users (name, email) VALUES ('John Doe', 'john@gmail.com');
INSERT INTO users (name, email) VALUES ('Jane Doe', 'jane@gmail.com');
INSERT INTO users (name, email) VALUES ('Alice Johnson', 'alice@gmail.com');
INSERT INTO users (name, email) VALUES ('Bob Smith', 'bob@gmail.com');

-- Select all users from the 'users' table 
SELECT * FROM users;

-- Select a user with id 2
SELECT * FROM users WHERE id = 2;

-- Update user with id 3 to change the name and email
UPDATE users SET name = 'Jake Smith', email = 'jake@gmail.com' WHERE id = 3;

-- Delete user with id 4
DELETE FROM users WHERE id = 4;

-- Select all users 
SELECT * FROM users;





