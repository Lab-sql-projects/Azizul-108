--- 10-04-2025 18:06:22 SQLite
-- 1. View all students
SELECT * FROM Students;

-- 2. View students enrolled after 2020
SELECT * FROM Students WHERE enrollment_year > 2020;

-- 3. List all courses with professor names
SELECT c.title, c.credits, p.name AS professor_name
FROM Courses c
JOIN Professors p ON c.professor_id = p.professor_id;

-- 4. List all enrollments with student and course info
SELECT e.enrollment_id, s.name AS student_name, c.title AS course_title, e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id;

-- 5. Count students per course
SELECT c.title, COUNT(*) AS total_students
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
GROUP BY c.title;

-- 6. Update grade for a student
UPDATE Enrollments
SET grade = 'A+'
WHERE student_id = 1 AND course_id = 1;

-- 7. Delete a student
DELETE FROM Students WHERE name = 'Bob Martin';



