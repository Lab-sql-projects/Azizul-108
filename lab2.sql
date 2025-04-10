-- INNER JOIN: Show student names, course titles, and semester
SELECT s.name AS student_name, c.title AS course_title, e.semester
FROM Enrollments e
INNER JOIN Students s ON e.student_id = s.student_id
INNER JOIN Courses c ON e.course_id = c.course_id;

-- LEFT JOIN: Show all courses and enrolled students (if any)
SELECT c.title AS course_title, s.name AS student_name
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
LEFT JOIN Students s ON e.student_id = s.student_id;


-- UPDATE: Update grade for Amrun Nakib in Database Systems
UPDATE Enrollments
SET grade = 'A+'
WHERE student_id = 1 AND course_id = 1;

-- DELETE: Remove students who enrolled before 2021
DELETE FROM Students
WHERE enrollment_year < 2021;

-- GROUP BY: Count enrolled students per course, show if at least 1
SELECT c.title AS course_title, COUNT(e.student_id) AS student_count
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
GROUP BY c.title
HAVING COUNT(e.student_id) >= 1;
-- SUBQUERY: Students who got a grade above the average grade
SELECT s.name, e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
WHERE
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
    ) FROM Enrollments
  );
