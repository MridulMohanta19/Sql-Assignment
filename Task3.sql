use SISDB
go

--point 1
SELECT S.first_name, S.last_name, SUM(P.amount) AS total_payment
From Students S
Join Payments P on S.student_id = P.student_id
Where S.student_id = 2
Group By S.first_name, S.last_name;

--point 2
SELECT C.course_name, COUNT(E.student_id) AS student_count
From Courses C
Join Enrollments E on C.course_id = E.course_id
Group By C.course_name;

--point 3
SELECT S.first_name, S.last_name
From Students S
Left Join Enrollments E on S.student_id = E.student_id
Where E.enrollment_id is Null;

--point 4
SELECT S.first_name, S.last_name, C.course_name
From Students S
Join Enrollments E on S.student_id = E.student_id
Join Courses C on E.course_id = C.course_id;

--point 5
SELECT T.first_name, T.last_name, C.course_name
FROM Teachers T
JOIN Courses C ON T.teacher_id = C.teacher_id;

--point 6
SELECT S.first_name, S.last_name, E.enrollment_date
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id
WHERE C.course_id = 4;

--point 7
SELECT S.first_name, S.last_name
FROM Students S
LEFT JOIN Payments P ON S.student_id = P.student_id
WHERE P.payment_id IS NULL;

--point 8
SELECT C.course_name
FROM Courses C
LEFT JOIN Enrollments E ON C.course_id = E.course_id
WHERE E.enrollment_id IS NULL;

--point 9
SELECT S.first_name, S.last_name, COUNT(E.course_id) AS course_count
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
GROUP BY S.first_name, S.last_name
HAVING COUNT(E.course_id) > 1;

--point 10
SELECT T.first_name, T.last_name
FROM Teachers T
LEFT JOIN Courses C ON T.teacher_id = C.teacher_id
WHERE C.course_id IS NULL;