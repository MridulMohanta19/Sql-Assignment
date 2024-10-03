create database SISDB
go
use SISDB
go

create TABLE Students(
student_id INT PRIMARY KEY Identity(1,1),
first_name varchar(100),
last_name varchar(100),
date_of_birth DATE,
email varchar(100),
phone_number varchar(15),);

CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);	

create TABLE Courses(
	course_id INT PRIMARY KEY identity(1,1),
	course_name varchar(100),
	credits INT,
	teacher_id INT,
	FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id));


CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id));

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES 
('Mridul', 'Mohanta', '2002-09-19', 'mridulmohanta@gmail.com', '9971892577'),
('Raghav', 'Gaur', '2000-09-20', 'rg@gmail.com', '8844556897'),
('George', 'Johnson', '1993-05-12', 'michael.johnson@yahoo.com', '345-678-901'),
('Monty', 'Singh', '2000-07-30', 'montysong@yahoo.com', '7749562358'),
('Daksha', 'Sharma', '1998-02-16', 'ds4556@gmail.com', '9013554463'),
('Mitali', 'Mohanta', '1980-12-14', 'mm2860@gmail.com', '8964235789'),
('Saroj','Mohanta', '1975-10-24', 'sm2020@gmail.com', '9879874567'),
('Saksham', 'Arora', '2004-08-25', 'sa8564@gmail.com', '7589645458'),
('Aahan', 'Singh', '2003-03-01', 'avc@yahoo.com','9898454523'),
('Vidt', 'Mittal', '2001-02-09', 'vm@gmail.com', '9999944420');

INSERT INTO Teachers(first_name, last_name, email)
VALUES
('Kuhu', 'Guha', 'KG1980@gmail.com'),
('Ramesher', 'Sharma', 'RS2140@yahoo.com'),
('Roshan', 'Singh', 'Rsrsrs@@yahoo.com'),
('Ryan', 'Romero', 'rr104@gmail.com'),
('Clinton', 'Mora', 'clinm@@yahoo.com'),
('Kathleen', 'Chambless', 'heloise.connel@hotmail.com'),
('Elizabeth', 'Hammonds', 'lawson_gleas@hotmail.com'),
('Kennith', 'Larkin', 'ollie1989@yahoo.com'),
('Claude','Wise','darron_ham7@hotmail.com'),
('Bianca', 'Dickerson', 'roma19831971@hotmail.com');

INSERT INTO Courses(course_name, credits, teacher_id)
VALUES
('Cloud', 4, 2),
('Cybersecurity', 4, 3),
('Core', 3, 5),
('IoT', 3, 1),
('DBMS', 3, 10),
('Artificial Intelligence', 3, 6),
('Data Structures', 5, 4),
('Automata', 5, 8),
('Compiler Design', 4, 7),
('Logical Reasoning', 3, 9);

INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES 
(10, 1, '2024-09-15'),  
(2, 2, '2024-09-16'),  
(5, 3, '2024-09-17'), 
(4, 4, '2024-09-18'), 
(3, 5, '2024-09-19'),  
(6, 6, '2024-09-20'), 
(9, 7, '2024-09-21'), 
(8, 8, '2024-09-22'),
(7, 9, '2024-09-23'), 
(1, 10, '2024-09-24');

INSERT INTO Payments (student_id, amount, payment_date)
VALUES 
(10, 1000.00, '2024-09-25'),  
(2, 1500.00, '2024-09-26'),   
(5, 1200.00, '2024-09-27'),  
(4, 1300.00, '2024-09-28'),  
(3, 900.00, '2024-09-29'),   
(6, 1800.00, '2024-09-30'),   
(9, 1600.00, '2024-10-01'),   
(8, 1400.00, '2024-10-02'),   
(7, 1100.00, '2024-10-03'),  
(1, 1000.00, '2024-10-04');   


