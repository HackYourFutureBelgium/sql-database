

-- Represent students taking the course
CREATE TABLE students (
    id INT AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    github_username VARCHAR(64) NOT NULL UNIQUE,
    started DATE NOT NULL DEFAULT (CURRENT_DATE),
    PRIMARY KEY(id)
);

-- Represent coaches in the course
CREATE TABLE coaches (
    id INT AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

-- Represent problems in the course
CREATE TABLE problems (
    id INT AUTO_INCREMENT,
    problem_set INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

-- Represent submissions of problems by students
CREATE TABLE submissions (
    id INT AUTO_INCREMENT,
    student_id INT,
    problem_id INT,
    submission_path TEXT NOT NULL,
    correctness INTEGER NOT NULL CHECK (correctness BETWEEN 0 AND 20),
    timestamp DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY(student_id) REFERENCES students(id),
    FOREIGN KEY(problem_id) REFERENCES problems(id)
);

-- Represent individual comments left by coaches
CREATE TABLE comments (
    id INT AUTO_INCREMENT,
    coach_id INT,
    submission_id INT,
    contents TEXT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(submission_id) REFERENCES submissions(id),
    FOREIGN KEY(coach_id) REFERENCES coaches(id)
);

-- Create indexes to speed common searches
CREATE INDEX student_name_search ON students (first_name, last_name);
CREATE INDEX student_github_search ON students (github_username);
CREATE INDEX problem_name_search ON problems (name);