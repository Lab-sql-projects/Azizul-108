--- 10-04-2025 18:05:43 SQLite
-- Insert Students
INSERT INTO Students (name, email, major, enrollment_year) VALUES
('Amrun Nakib', 'amrun.nakib@uni.edu', 'Computer Science', 2021),
('Arman H Hossain', 'arman.hossain@uni.edu', 'Electrical Engineering', 2020),
('Anzam Shahriar Kabir', 'anzam.kabir@uni.edu', 'Mechanical Engineering', 2022);

-- Insert Professors
INSERT INTO Professors (name, department, email) VALUES
('Dr. Yin Hao', 'Computer Science', 'yhao@uni.edu'),
('Dr. Cheng', 'Engineering', 'cheng@uni.edu'),
('Dr. Yuli', 'Mathematics', 'yuli@uni.edu');

-- Insert Courses
INSERT INTO Courses (title, credits, professor_id) VALUES
('Database Systems', 3, 1),
('Circuits 101', 4, 2),
('Linear Algebra', 3, 3);

-- Insert Enrollments
INSERT INTO Enrollments (student_id, course_id, semester, grade) VALUES
(1, 1, 'Fall 2023', 'A'),
(2, 2, 'Fall 2023', 'B+'),
(3, 3, 'Fall 2023', 'A-');



