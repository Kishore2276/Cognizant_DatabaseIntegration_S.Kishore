CREATE VIEW vw_student_enrollment_summary AS
SELECT
    s.student_id,
    s.student_name,
    d.dept_name,
    COUNT(e.course_id) AS total_courses,
    ROUND(
        AVG(
            CASE
                WHEN e.grade = 'A' THEN 4
                WHEN e.grade = 'B' THEN 3
                WHEN e.grade = 'C' THEN 2
                WHEN e.grade = 'D' THEN 1
                WHEN e.grade = 'F' THEN 0
                ELSE NULL
            END
        ),2
    ) AS GPA
FROM students s
JOIN departments d
ON s.dept_id = d.dept_id
LEFT JOIN enrollments e
ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name, d.dept_name;

SELECT * FROM vw_student_enrollment_summary;

CREATE VIEW vw_course_stats AS
SELECT
    c.course_id,
    c.course_name,
    COUNT(e.student_id) AS total_enrollments,
    ROUND(
        AVG(
            CASE
                WHEN e.grade = 'A' THEN 4
                WHEN e.grade = 'B' THEN 3
                WHEN e.grade = 'C' THEN 2
                WHEN e.grade = 'D' THEN 1
                WHEN e.grade = 'F' THEN 0
                ELSE NULL
            END
        ),2
    ) AS avg_gpa
FROM courses c
LEFT JOIN enrollments e
ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

SELECT * FROM vw_course_stats;

SELECT *
FROM vw_student_enrollment_summary
WHERE GPA > 3.0;

UPDATE vw_student_enrollment_summary
SET student_name = 'Kishore S'
WHERE student_id = 1;

DROP VIEW vw_student_enrollment_summary;
DROP VIEW vw_course_stats;

CREATE VIEW vw_student_enrollment_summary AS
SELECT student_id,
       student_name,
       email,
       dept_id
FROM students
WHERE dept_id = 1
WITH CHECK OPTION;

SELECT * FROM vw_student_enrollment_summary;