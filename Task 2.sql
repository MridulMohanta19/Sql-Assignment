use SISDB
go

--point 1
INSERT into Students(first_name, last_name, date_of_birth, email, phone_number)
VALUES
('John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');

--point 2
INSERT into Enrollments(student_id, course_id, enrollment_date)
VALUES
(2, 7, '2024-09-29');

--point 3
UPDATE Teachers
SET email = 'clintim@yahoo.com'
where teacher_id = 5;

--point 4
Delete from Enrollments
where student_id = 3 and course_id = 5; 

--point 5
UPDATE Courses
SET teacher_id = 5
where course_id = 2;

--point 6
DELETE from Payments
where student_id = 3;
DELETE from Enrollments
where student_id = 3;
DELETE from Students
where student_id = 3;

--point 7
UPDATE Payments
SET amount = 1500
where student_id = 10;

