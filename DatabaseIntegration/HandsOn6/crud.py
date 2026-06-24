from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from models import Base, Department, Student, Course, Enrollment


engine = create_engine(
    "mysql+mysqlconnector://root:220706@localhost/college_db_orm",
    echo=True
)

Session = sessionmaker(bind=engine)
session = Session()



dept1 = Department(dept_name="Computer Science")
dept2 = Department(dept_name="Information Technology")
dept3 = Department(dept_name="Electronics")

session.add_all([dept1, dept2, dept3])
session.commit()

print("Departments inserted successfully")



student1 = Student(
    student_name="Kishore",
    email="kishore@gmail.com",
    dept_id=1
)

student2 = Student(
    student_name="Rahul",
    email="rahul@gmail.com",
    dept_id=1
)

student3 = Student(
    student_name="Priya",
    email="priya@gmail.com",
    dept_id=2
)

student4 = Student(
    student_name="Arun",
    email="arun@gmail.com",
    dept_id=3
)

student5 = Student(
    student_name="Divya",
    email="divya@gmail.com",
    dept_id=1
)

session.add_all([
    student1,
    student2,
    student3,
    student4,
    student5
])

session.commit()

print("Students inserted successfully")



course1 = Course(
    course_name="DBMS",
    credits=4,
    dept_id=1
)

course2 = Course(
    course_name="Python",
    credits=3,
    dept_id=1
)

course3 = Course(
    course_name="Digital Electronics",
    credits=4,
    dept_id=3
)

session.add_all([course1, course2, course3])
session.commit()

print("Courses inserted successfully")



enroll1 = Enrollment(
    student_id=1,
    course_id=1
)

enroll2 = Enrollment(
    student_id=2,
    course_id=1
)

enroll3 = Enrollment(
    student_id=3,
    course_id=2
)

enroll4 = Enrollment(
    student_id=4,
    course_id=3
)

session.add_all([
    enroll1,
    enroll2,
    enroll3,
    enroll4
])

session.commit()

print("Enrollments inserted successfully")



print("\nStudents in Computer Science Department:")

students = session.query(Student)\
    .join(Department)\
    .filter(
        Department.dept_name == "Computer Science"
    ).all()

for student in students:
    print(student.student_name)



print("\nEnrollment Details:")

enrollments = session.query(Enrollment).all()

for e in enrollments:
    student = session.query(Student).filter_by(
        student_id=e.student_id
    ).first()

    course = session.query(Course).filter_by(
        course_id=e.course_id
    ).first()

    print(
        f"{student.student_name} -> {course.course_name}"
    )



student = session.query(Student).filter_by(
    email="kishore@gmail.com"
).first()

if student:
    student.student_name = "Kishore Kumar"
    session.commit()

print("\nStudent updated successfully")



enrollment = session.query(Enrollment).first()

if enrollment:
    session.delete(enrollment)
    session.commit()

print("One enrollment deleted successfully")



print("\nRemaining Enrollments:")

for e in session.query(Enrollment).all():
    print(
        f"Enrollment ID : {e.enrollment_id}"
    )

session.close()