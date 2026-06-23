use college_db;

SELECT student_id,
       COUNT(course_id) AS total_courses
FROM enrollments
GROUP BY student_id
HAVING COUNT(course_id) >
(
    SELECT AVG(course_count)
    FROM
    (
        SELECT COUNT(course_id) AS course_count
        FROM enrollments
        GROUP BY student_id
    ) AS avg_table
);

SELECT c.course_id,
       c.course_name
FROM courses c
WHERE NOT EXISTS
(
    SELECT *
    FROM enrollments e
    WHERE e.course_id = c.course_id
    AND e.grade <> 'A'
);

SELECT *
FROM professors p
WHERE salary =
(
    SELECT MAX(salary)
    FROM professors
    WHERE dept_id = p.dept_id
);

SELECT *
FROM
(
    SELECT dept_id,
           AVG(salary) AS avg_salary
    FROM professors
    GROUP BY dept_id
) AS dept_avg
WHERE avg_salary > 85000;

