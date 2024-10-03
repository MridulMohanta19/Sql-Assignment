use SISDB
go

--point 1
SELECT AVG(student_count) AS average_students_per_course
FROM (
    SELECT COUNT(E.student_id) AS student_count
    FROM Enrollments E
    GROUP BY E.course_id
) AS subquery;

--point 2
SELECT S.first_name, S.last_name, P.amount
FROM Students S
JOIN Payments P ON S.student_id = P.student_id
WHERE P.amount = (SELECT MAX(amount) FROM Payments);

--point 3
SELECT C.course_name
FROM Courses C
JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_name
HAVING COUNT(E.student_id) = (
    SELECT MAX(enrollment_count)
    FROM (
        SELECT COUNT(student_id) AS enrollment_count
        FROM Enrollments
        GROUP BY course_id
    ) AS subquery
);

--point 4
SELECT T.first_name, T.last_name, SUM(P.amount) AS total_payments
FROM Teachers T
JOIN Courses C ON T.teacher_id = C.teacher_id
JOIN Enrollments E ON C.course_id = E.course_id
JOIN Payments P ON E.student_id = P.student_id
GROUP BY T.first_name, T.last_name;

--point 5
SELECT S.first_name, S.last_name
FROM Students S
WHERE (SELECT COUNT(E.course_id)
       FROM Enrollments E
       WHERE E.student_id = S.student_id) = (SELECT COUNT(*) FROM Courses);

--point 6
SELECT T.first_name, T.last_name
FROM Teachers T
WHERE T.teacher_id NOT IN (SELECT C.teacher_id FROM Courses C);

--point 7
SELECT AVG(DATEDIFF(YEAR, S.date_of_birth, '2024-09-28')) AS average_age
FROM Students S;

--point 8
SELECT C.course_name
FROM Courses C
WHERE C.course_id NOT IN (SELECT E.course_id FROM Enrollments E);

--point 9
SELECT S.first_name, S.last_name, C.course_name, SUM(P.amount) AS total_payments
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id
JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.first_name, S.last_name, C.course_name;

--point 10
SELECT S.first_name, S.last_name, COUNT(P.payment_id) AS payment_count
FROM Students S
JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.first_name, S.last_name
HAVING COUNT(P.payment_id) > 1;

--point 11
SELECT S.first_name, S.last_name, SUM(P.amount) AS total_payments
FROM Students S
JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.first_name, S.last_name;

--point 12
SELECT C.course_name, COUNT(E.student_id) AS student_count
FROM Courses C
JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_name;

--point 13
SELECT S.first_name, S.last_name, AVG(P.amount) AS average_payment
FROM Students S
JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.first_name, S.last_name;