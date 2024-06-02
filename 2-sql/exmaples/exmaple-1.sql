-- You need to create a database before you can create tables.
-- This script creates a database named 'hyf'.

CREATE DATABASE hyf;

-- Now we need to use the database
USE hyf;

-- Create a table named 'users'

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);


-- Insert users to users table

INSERT INTO users (name, email) VALUES ('John Doe', 'john@gmail.com');
INSERT INTO users (name, email) VALUES ('Jane Doe', 'jane@gmail.com');
INSERT INTO users (name, email) VALUES ('Alice', 'alice@gmail.com');
INSERT INTO users (name, email) VALUES ('Bob', 'bob@gmail.com');

-- Select all users from users table

SELECT * FROM users;

-- Select user with id 2 

SELECT * FROM users WHERE id = 2;

-- Update user with id 2

UPDATE users SET name = 'Jake', email = 'jack@gmail.com' WHERE id = 3;


-- Delete user with id 4

DELETE FROM users WHERE id = 4;