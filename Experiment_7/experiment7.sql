CREATE TABLE Students (
    student_id INT,
    student_name VARCHAR(50),
    department_id INT
);

INSERT INTO Students VALUES
(1, 'Amit', 101),
(2, 'Priya', 102),
(3, 'Rahul', 101),
(4, 'Sneha', 103),
(5, 'Karan', NULL);

CREATE TABLE Courses (
    course_id INT,
    course_name VARCHAR(50)
);

INSERT INTO Courses VALUES
(201, 'Math'),
(202, 'Science'),
(203, 'Computer'),
(204, 'History');

CREATE TABLE Enrollments (
    student_id INT,
    course_id INT
);

INSERT INTO Enrollments VALUES
(1, 201),
(1, 203),
(2, 202),
(3, 201),
(4, 204);

CREATE TABLE Departments (
    department_id INT,
    department_name VARCHAR(50)
);

INSERT INTO Departments VALUES
(101, 'Engineering'),
(102, 'Science'),
(103, 'Arts');

--Write queries to list students with their enrolled courses (INNER JOIN).
SELECT s.student_name, c.course_name
FROM Students s
INNER JOIN Enrollments e ON s.student_id = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id;

--Find students not enrolled in any course (LEFT JOIN).
SELECT s.student_id, s.student_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.course_id IS NULL;

--Display all courses with or without enrolled students (RIGHT JOIN)
SELECT s.student_id, s.student_name, c.course_id, c.course_name
FROM Students s
RIGHT JOIN Enrollments e ON s.student_id = e.student_id
RIGHT JOIN Courses c ON e.course_id = c.course_id;

--Display all courses with or without enrolled students (RIGHT JOIN)
SELECT s.student_id, s.student_name, d.department_name
FROM Students s
INNER JOIN Departments d ON s.department_id = d.department_id;

--Display all possible student-course combinations (CROSS JOIN).
SELECT s.student_name, c.course_name
FROM Students s
CROSS JOIN Courses c;
