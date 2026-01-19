

-- 1. Create database
CREATE DATABASE  intern_training_db;
USE intern_training_db;

-- 2. Drop table if already exists
DROP TABLE IF EXISTS students;

-- 3. Create students table
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(100) UNIQUE,
    gender CHAR(1),
    enrollment_date DATE
);

-- 4. Insert sample data
INSERT INTO students (name, age, email, gender, enrollment_date) VALUES
('Ananya', 20, 'ananya@gmail.com', 'F', '2024-02-15'),
('Rahul', 22, 'rahul@yahoo.com', 'M', '2023-11-20'),
('Aman', 18, 'aman@gmail.com', 'M', '2024-01-10'),
('Sneha', 25, 'sneha@gmail.com', 'F', '2022-07-05'),
('Ravi', 30, NULL, 'M', '2021-05-12'),
('Neha', 17, 'neha@gmail.com', 'F', '2024-06-01'),
('Kiran', 28, 'kiran@outlook.com', 'M', '2023-09-18'),
('Arjun', 21, 'arjun@gmail.com', 'M', '2024-03-22');



-- 5. WHERE clause (age filter)
SELECT * FROM students WHERE age > 20;

-- 6. AND condition
SELECT * FROM students
WHERE age BETWEEN 18 AND 25
AND gender = 'F';

-- 7. OR condition
SELECT * FROM students
WHERE age < 18 OR age > 30;

-- 8. LIKE with % (name starts with A)
SELECT * FROM students
WHERE name LIKE 'A%';

-- 9. LIKE with % (email contains gmail)
SELECT * FROM students
WHERE email LIKE '%gmail.com%';

-- 10. LIKE with _ (exactly 5-letter names)
SELECT * FROM students
WHERE name LIKE '_____';

-- 11. IN operator
SELECT * FROM students
WHERE age IN (18, 20, 22, 25);

-- 12. BETWEEN operator (date range)
SELECT * FROM students
WHERE enrollment_date BETWEEN '2024-01-01' AND '2024-12-31';

-- 13. IS NULL check
SELECT * FROM students
WHERE email IS NULL;

-- 14. IS NOT NULL check
SELECT * FROM students
WHERE age IS NOT NULL;

-- 15. Real-life email domain search
SELECT student_id, name, email
FROM students
WHERE email LIKE '%@gmail.com';

-- 16. Aliases for readability
SELECT s.student_id AS id,
       s.name AS student_name,
       s.age
FROM students AS s
WHERE s.age >= 21;

-- 17. Combined advanced filtering
SELECT *
FROM students
WHERE age BETWEEN 18 AND 25
AND email LIKE '%@gmail.com'
AND gender = 'M';

