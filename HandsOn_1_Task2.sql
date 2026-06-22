-- =====================================
-- TASK 2: NORMALIZATION ANALYSIS
-- =====================================

-- 1NF: All attributes contain atomic values.
-- No column stores multiple values in a single field.

-- 2NF: All non-key attributes are fully dependent
-- on the primary key. No partial dependency exists.

-- 3NF: No transitive dependencies exist.
-- Department details are stored in departments table
-- and referenced using dept_id.

-- Enrollments Table 3NF Analysis:
-- enrollment_date depends on the enrollment record.
-- student_id and course_id are foreign keys.
-- No non-key attribute depends on another non-key attribute.
-- Therefore, enrollments satisfies 3NF.