-- ==========================================
-- TASK 2 : VERIFY NORMALISATION
-- College Database Management System
-- ==========================================

-- 1NF (First Normal Form)
-- All attributes contain atomic values.
-- Each column stores a single value only.
-- For example, email stores one email address per student.
-- No repeating groups or multi-valued attributes exist.
-- Therefore, the schema satisfies 1NF.

-- 2NF (Second Normal Form)
-- All non-key attributes are fully dependent on the primary key.
-- In the enrollments table, enrollment_date depends entirely
-- on enrollment_id.
-- No partial dependencies exist.
-- Therefore, the schema satisfies 2NF.

-- 3NF (Third Normal Form)
-- No transitive dependencies exist.
-- Department information is stored in the departments table
-- and referenced through dept_id in students, courses,
-- and professors tables.
-- Department details are not duplicated in other tables.
-- Therefore, the schema satisfies 3NF.

-- 3NF Analysis for Enrollments Table
-- enrollment_date depends directly on enrollment_id.
-- student_id and course_id are foreign keys.
-- No non-key attribute depends on another non-key attribute.
-- Therefore, the enrollments table satisfies 3NF.
