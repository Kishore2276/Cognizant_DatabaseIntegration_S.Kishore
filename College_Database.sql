CREATE database college_db;
USE college_db;

CREATE TABLE departments (
	dept_id INT auto_increment PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL UNIQUE
    );
    
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    dept_id INT NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE courses (
	course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    dept_id INT NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
    );
    
CREATE TABLE professors (
    professor_id INT AUTO_INCREMENT PRIMARY KEY,
    professor_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    dept_id INT NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

ALTER TABLE students
ADD phone_number VARCHAR(15);

ALTER TABLE courses
ADD max_seats INT DEFAULT 60;

ALTER TABLE enrollments
ADD grade CHAR(1);

ALTER TABLE enrollments
ADD CONSTRAINT check_grade 
CHECK (grade IN ('A', 'B', 'C', 'D', 'E') OR grade IS NULL);

ALTER TABLE departments 
ADD hod_name VARCHAR(100);

ALTER TABLE departments
CHANGE hod_name head_of_dept VARCHAR(100);

SHOW TABLES;

DESC departments;
DESC students;
DESC courses;
DESC professors;

DESC enrollments;

