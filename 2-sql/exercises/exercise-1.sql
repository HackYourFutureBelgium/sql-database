
-- Basic SQL Commands

-- Task 1: Create a database named 'hyf' if it does not exist
CREATE DATABASE hyf;

-- Task 2: Select the 'hyf' database for use
______ hyf;

-- Task 3: Drop the 'users' table if it already exists to avoid conflicts
DROP TABLE ______ users;

-- Task 4: Create a table named 'users' with detailed structure and constraints
CREATE TABLE users (
    id INT , -- Primary Key with auto-increment
    name VARCHAR(100) NOT NULL,                -- User name, cannot be null
    email VARCHAR(100) NOT NULL          -- User email, cannot be null and must be unique
);

-- Task 5: Show the structure of the 'users' table
_______ users;

-- Task 6: Insert users into the 'users' table with detailed values
_________________ (name, email) _______ ('John Doe', 'john@gmail.com');
_________________ (name, email) _______ ('Jane Doe', 'jane@gmail.com');
_________________ (name, email) _______ ('Alice Johnson', 'alice@gmail.com');
_________________ (name, email) _______ ('Bob Smith', 'bob@gmail.com');

-- Task 7: Select all users from the 'users' table 
SELECT _____ FROM users;

-- Task 8: Select a user with id 2
SELECT * FROM users ___________ ;

-- Task 9: Update user with id 3 to change the name and email
UPDATE users SET ______________________________ WHERE id = 3;

-- Task 10: Delete user with id 4
DELETE FROM users _____________;

-- Task 11: Select all users
SELECT * FROM ______;