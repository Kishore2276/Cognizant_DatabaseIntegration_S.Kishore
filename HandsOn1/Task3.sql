USE hospital_db;

ALTER TABLE patients
ADD emergency_contact VARCHAR(15);

ALTER TABLE doctors
ADD consultation_fee DECIMAL(10,2) DEFAULT 500.00;

ALTER TABLE appointments
ADD CONSTRAINT chk_status
CHECK (status IN ('Scheduled','Completed','Cancelled'));

ALTER TABLE departments
ADD hod_name VARCHAR(100);

ALTER TABLE departments
CHANGE hod_name head_of_department VARCHAR(100);

ALTER TABLE patients
DROP COLUMN emergency_contact;

DESC departments;
DESC doctors;
DESC patients;
DESC appointments;
