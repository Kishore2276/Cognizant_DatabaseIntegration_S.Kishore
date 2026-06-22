-- ==========================================
-- TASK 2 : VERIFY NORMALISATION
-- Hospital Management System
-- ==========================================

-- 1NF (First Normal Form)
-- All attributes contain atomic values.
-- Each column stores a single value only.
-- For example, phone_number stores one phone number per patient.
-- No repeating groups or multi-valued attributes exist.
-- Therefore, the schema satisfies 1NF.

-- 2NF (Second Normal Form)
-- All non-key attributes are fully dependent on the primary key.
-- In the appointments table, appointment_date,
-- appointment_time and status depend entirely on appointment_id.
-- No partial dependencies exist.
-- Therefore, the schema satisfies 2NF.

-- 3NF (Third Normal Form)
-- No transitive dependencies exist.
-- Department details are stored in the departments table
-- and referenced using department_id in the doctors table.
-- Department information is not duplicated in doctors.
-- Therefore, the schema satisfies 3NF.

-- 3NF Analysis for Appointments Table
-- appointment_date, appointment_time and status
-- depend directly on appointment_id.
-- No non-key attribute depends on another non-key attribute.
-- Therefore, the appointments table satisfies 3NF.
