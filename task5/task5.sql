/* ---------- 1. CREATE TABLE ---------- */
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    marks INT
);

/* ---------- 2. INSERT SAMPLE DATA ---------- */
INSERT INTO students VALUES
(1, 'Ravi', 20, 'CSE', 85),
(2, 'Anita', 21, 'ECE', 78),
(3, 'Rahul', 20, 'CSE', 90),
(4, 'Sneha', 22, 'ME', 70),
(5, 'Amit', 21, 'ECE', NULL),
(6, 'Neha', 22, 'CSE', 88),
(7, 'Kiran', 20, 'ME', 65);

/* ---------- 3. BASIC AGGREGATE FUNCTIONS ---------- */

-- Total number of students
SELECT COUNT(*) AS total_students FROM students;

-- Average marks (NULL ignored)
SELECT AVG(marks) AS average_marks FROM students;

-- Minimum and Maximum marks
SELECT MIN(marks) AS min_marks,
       MAX(marks) AS max_marks
FROM students;

/* ---------- 4. GROUP BY AGE ---------- */

-- Number of students in each age group
SELECT age, COUNT(*) AS student_count
FROM students
GROUP BY age;

/* ---------- 5. GROUP BY WITH MULTIPLE AGGREGATES ---------- */

-- Department-wise analysis
SELECT department,
       COUNT(*) AS total_students,
       AVG(marks) AS average_marks,
       MAX(marks) AS highest_marks,
       MIN(marks) AS lowest_marks
FROM students
GROUP BY department;

/* ---------- 6. HAVING CLAUSE ---------- */

-- Departments having more than 2 students
SELECT department, COUNT(*) AS student_count
FROM students
GROUP BY department
HAVING COUNT(*) > 2;

/* ---------- 7. WHERE vs HAVING ---------- */

-- WHERE filters rows before grouping
SELECT department, COUNT(*) AS student_count
FROM students
WHERE age >= 21
GROUP BY department;

-- HAVING filters aggregated results
SELECT department, AVG(marks) AS avg_marks
FROM students
GROUP BY department
HAVING AVG(marks) > 80;

/* ---------- 8. REAL-WORLD EXAMPLE ---------- */

-- Department-wise total marks
SELECT department, SUM(marks) AS total_marks
FROM students
GROUP BY department;

/* ---------- 9. NULL HANDLING IN AGGREGATES ---------- */

-- COUNT(column) ignores NULL
SELECT COUNT(marks) AS marks_available FROM students;

-- COUNT(*) includes all rows
SELECT COUNT(*) AS total_rows FROM students;

/* ---------- 10. AGGREGATE WITHOUT GROUP BY ---------- */

-- Single-row aggregate result
SELECT AVG(marks) AS overall_average FROM students;
