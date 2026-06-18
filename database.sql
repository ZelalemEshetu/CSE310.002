-- Create database
CREATE DATABASE IF NOT EXISTS student_db;

-- Select database
USE student_db;

-- Create students table
CREATE TABLE IF NOT EXISTS students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    gender VARCHAR(10),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample data (optional)
INSERT INTO students (first_name, last_name, age, gender, email)
VALUES 
('John', 'Doe', 20, 'Male', 'john.doe@email.com'),
('Mary', 'Smith', 22, 'Female', 'mary.smith@email.com'),
('Abel', 'Kassa', 19, 'Male', 'abel.kassa@email.com');