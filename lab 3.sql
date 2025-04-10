--task one 
DROP VIEW IF EXISTS StudentPublicInfo;

CREATE VIEW StudentPublicInfo AS
SELECT student_id, name, major, enrollment_year
FROM Students;

-- task two
-- Recreate Courses with CHECK constraint on credits
CREATE TABLE Courses_new (
    course_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    credits INTEGER CHECK (credits BETWEEN 1 AND 5),
    professor_id INTEGER,
    FOREIGN KEY (professor_id) REFERENCES Professors(professor_id)
);

-- Copy existing data into Courses_new
INSERT INTO Courses_new (course_id, title, credits, professor_id)
SELECT * FROM Courses;

-- Replace old Courses table
DROP TABLE Courses;
ALTER TABLE Courses_new RENAME TO Courses;


-- Recreate Enrollments with NOT NULL on semester
CREATE TABLE Enrollments_new (
    enrollment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER,
    course_id INTEGER,
    semester TEXT NOT NULL,
    grade TEXT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Copy existing data into Enrollments_new
INSERT INTO Enrollments_new (enrollment_id, student_id, course_id, semester, grade)
SELECT * FROM Enrollments;

-- Replace old Enrollments table
DROP TABLE Enrollments;
ALTER TABLE Enrollments_new RENAME TO Enrollments;
-- task three

CREATE INDEX idx_enrollments_student_id ON Enrollments(student_id);

-- task four

BEGIN TRANSACTION;

INSERT INTO Students (name, email, major, enrollment_year)
VALUES ('Test Transaction', 'test@uni.edu', 'Test Major', 2024);

UPDATE Students
SET major = 'Updated Major'
WHERE name = 'Test Transaction';

ROLLBACK;

SELECT * FROM Students WHERE name = 'Test Transaction';

-- task five

SELECT s.name AS student_name, c.title AS course_title, e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.credits > 3 AND
  CASE e.grade
    WHEN 'A+' THEN 4.3
    WHEN 'A' THEN 4.0
    WHEN 'A-' THEN 3.7
    WHEN 'B+' THEN 3.3
    WHEN 'B' THEN 3.0
    WHEN 'B-' THEN 2.7
    ELSE 0
  END >
  (
    SELECT AVG(
      CASE grade
        WHEN 'A+' THEN 4.3
        WHEN 'A' THEN 4.0
        WHEN 'A-' THEN 3.7
        WHEN 'B+' THEN 3.3
        WHEN 'B' THEN 3.0
        WHEN 'B-' THEN 2.7
        ELSE 0
      END
    )
    FROM Enrollments
  );

-- task six

-- Simulating a 'viewer role' by creating a limited-access table
-- This will act like a restricted read-only access layer

DROP TABLE IF EXISTS StudentViewerAccess;

CREATE TABLE StudentViewerAccess AS
SELECT student_id, name, major, enrollment_year
FROM Students;

-- Example usage of this 'role-based' access layer
SELECT * FROM StudentViewerAccess;

