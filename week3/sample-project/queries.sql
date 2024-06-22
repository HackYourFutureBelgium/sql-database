-- Find all submissions given student first and last name
SELECT *
FROM "submissions"
WHERE "student_id" IN (
    SELECT "id"
    FROM "students"
    WHERE "first_name" = 'Yuliia'
    AND "last_name" = 'Zhukovets'
);

-- Find all submissions given student GitHub username
SELECT *
FROM "submissions"
WHERE "student_id" = (
    SELECT "id"
    FROM "students"
    WHERE "github_username" = 'CarterZenke'
);

-- Find all submissions for a given problem
SELECT * 
FROM "submissions"
WHERE "problem_id" = (
    SELECT "id"
    FROM "problems"
    WHERE "name" = 'Packages'
);

-- Add a new student
INSERT INTO "students" ("first_name", "last_name", "github_username")
VALUES ('Carter', 'Zenke', 'CarterZenke');

-- Add a new instructor
INSERT INTO "instructors" ("first_name", "last_name")
VALUES ('Carter', 'Zenke');

-- Add a new submission
INSERT INTO "submissions" ("student_id", "problem_id", "submission_path", "correctness")
VALUES (1, 1, '/submissions/cyberchase/1/', 1.0);
