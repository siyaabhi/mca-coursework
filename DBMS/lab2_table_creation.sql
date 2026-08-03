Section A: Rajagiri Academic System
Create a database schema for a college academic management system. The system should manage students, departments, faculty, courses, enrollments, results, and events.

Table 1: DEPARTMENT
Store the following details:
Department ID
Department Name
Head of Department
Office Location
Contact Number
Constraints:
Department ID should be the primary key.
Department Name should be unique and not null.

Column Name         Description
dept_id             Department ID
dept_name           Department Name
hod_name            Head of Department
office_location     Office Location
contact_number      Department Contact Number

CREATE TABLE DEPARTMENT 
(
dept_id varchar2(10),
dept_name VARCHAR2(50) NOT NULL,
hod_name VARCHAR2(50),
office_location VARCHAR2(50),
contact_number VARCHAR2(10),

constraint pk_dept primary key (dept_id),
constraint uq_dname unique (dept_name)
);


Table 2: STUDENT
Store the following details:
Student ID
Student Name
Date of Birth
Gender
Mobile Number
Email ID
Department ID
Admission Date
CGPA
Constraints:
Student ID should be the primary key.
Email ID should be unique.
Gender should allow only M or F.
CGPA should be between 0 and 10.
Department ID should refer to the DEPARTMENT table.

Column Name     Description
student_id      Student ID
student_name    Student Name
dob             Date of Birth
gender          Gender
mobile_number   Mobile Number
email_id        Email ID
dept_id         Department ID
admission_date  Admission Date
cgpa            CGPA

CREATE TABLE STUDENT 
(
student_id varchar2(10),
student_name VARCHAR2(50) NOT NULL,
dob DATE,
gender CHAR(1) ,
mobile_number VARCHAR2(10),
email_id VARCHAR2(50),
dept_id varchar2(10),
admission_date DATE,
cgpa number(4,2),

constraint pk_student primary key(student_id),
constraint uq_email unique (email_id),
constraint chk_cgpa CHECK (cgpa BETWEEN 0 AND 10),
constraint chk_gender CHECK (gender IN ('M', 'F')),
constraint fk_student_dpt FOREIGN KEY (dept_id) REFERENCES DEPARTMENT(dept_id)
);


Table 3: FACULTY
Store the following details:
Faculty ID
Faculty Name
Qualification
Designation
Date of Joining
Salary
Email ID
Department ID
Constraints:
Faculty ID should be the primary key.
Email ID should be unique.
Salary should be greater than zero.
Department ID should refer to the DEPARTMENT table.

Column Name      Description
faculty_id       Faculty ID
faculty_name     Faculty Name
qualification    Qualification
designation      Designation
joining_date     Date of Joining
salary           Salary
email_id         Email ID
dept_id          Department ID

CREATE TABLE FACULTY (
faculty_id varchar2(10),
faculty_name VARCHAR2(50) NOT NULL,
qualification VARCHAR2(50),
designation VARCHAR2(50),
joining_date DATE,
salary DECIMAL(10,2),
email_id VARCHAR2(50),
dept_id varchar2(10),
constraint pk_faculty primary key(faculty_id),
constraint uq_emailid unique (email_id),
constraint chk_salary check (salary > 0),
constraint fk_faculty_dept FOREIGN KEY (dept_id) REFERENCES DEPARTMENT(dept_id)
);


Table 4: COURSE
Store the following details:
Course Code
Course Name
Credits
Semester
Department ID
Faculty ID
Constraints:
Course Code should be the primary key.
Course Name should not be null.
Credits should be between 1 and 6.
Semester should be between 1 and 8.
Department ID should refer to the DEPARTMENT table.
Faculty ID should refer to the FACULTY table.

Column Name        Description
course_id          Course ID
course_name        Course Name
credits            Number of Credits
semester           Semester
dept_id            Department ID
faculty_id         Faculty ID

CREATE TABLE COURSE 
(
course_id VARCHAR2(10),
course_name VARCHAR2(50) NOT NULL,
credits INT,
semester INT,
dept_id varchar2(10),
faculty_id varchar2(10),

constraint pk_course primary key (course_id),
constraint chk_credits check (credits between 1 and 6),
constraint chk_semester check (semester between 1 and 8),
constraint fk_course_dept FOREIGN KEY (dept_id) REFERENCES DEPARTMENT(dept_id),
constraint fk_course_faculty FOREIGN KEY (faculty_id) REFERENCES FACULTY(faculty_id)
);


Table 5: ENROLLMENT
Store the following details:
Enrollment ID
Student ID
Course Code
Enrollment Date
Academic Year
Constraints:
Enrollment ID should be the primary key.
Student ID should refer to the STUDENT table.
Course Code should refer to the COURSE table.
Enrollment Date should default to the current date.
A student should not enroll in the same course more than once.

Column Name       Description
enrollment_id     Enrollment ID
student_id        Student ID
course_id         Course ID
enrollment_date   Enrollment Date
academic_year     Academic Year

create table enrollment 
(
enrollment_id varchar2(10),
student_id varchar2(10),
course_id varchar2(10),
enrollment_date date default current_date,
academic_year varchar2(15),
constraint pk_enrollment primary key(enrollment_id),
constraint fk_enrollment_stud foreign key (student_id) references student(student_id),
constraint fk_enrollment_course foreign key (course_id) references course(course_id),
constraint uq_enrollment unique (student_id, course_id)
);


Table 6: RESULT
Store the following details:
Result ID
Enrollment ID
Internal Marks
External Marks
Total Marks
Grade
Result Status
Constraints:
Result ID should be the primary key.
Enrollment ID should refer to the ENROLLMENT table.
Internal Marks should be between 0 and 50.
External Marks should be between 0 and 50.
Grade should allow values such as A, B, C, D, F.
Result Status should allow only PASS or FAIL.
 
Column Name      Description
result_id        Result ID
enrollment_id    Enrollment ID
internal_marks   Internal Marks
external_marks   External Marks
total_marks      Total Marks
grade            Grade
result_status    PASS/FAIL

create table result
(
result_id varchar2(10),
enrollment_id varchar2(10),
internal_marks number(5,2),
external_marks number(5,2),
total_marks number(5),
grade char(1),
result_status varchar2(4),
constraint pk_result primary key(result_id),
constraint chk_internal check (internal_marks between 0 and 50),
constraint chk_external check (external_marks between 0 and 50),
constraint chk_grade check (grade in ('A','B','C','D','F')),
constraint chk_result_stat check (result_status in('PASS','FAIL')),
constraint fk_result_enrollment foreign key (enrollment_id) references enrollment(enrollment_id)
);


Table 7: EVENT
Store the following details:
Event ID
Event Name
Event Date
Venue
Coordinator Faculty ID
Maximum Participants
Registration Fee
Constraints:
Event ID should be the primary key.
Coordinator Faculty ID should refer to the FACULTY table.
Maximum Participants should be greater than zero.
Registration Fee should not be negative.

Column Name       Description
event_id          Event ID
event_name        Event Name
event_date        Event Date
venue             Venue
faculty_id        Coordinator Faculty ID
max_participants  Maximum Participants
registration_fee  Registration Fee

create table event
(
event_id varchar2(10),
event_name varchar2(50),
event_date date,
venue varchar2(50),
faculty_id varchar2(10),
max_participants number(10),
registration_fee number(6,2),
constraint pk_event primary key(event_id),
constraint chk_maxpartici check (max_participants > 0),
constraint chk_regfee check (registration_fee > 0),
constraint fk_event_faculty foreign key (faculty_id) references faculty (faculty_id)
);


Table 8: EVENT_REGISTRATION
Store the following details:
Registration ID
Event ID
Student ID
Registration Date
Participation Status
Constraints:
Registration ID should be the primary key.
Event ID should refer to the EVENT table.
Student ID should refer to the STUDENT table.
Registration Date should default to the current date.
Participation Status should allow values REGISTERED, ATTENDED, ABSENT.

Column Name          Description
registration_id      Registration ID
event_id             Event ID
student_id           Student ID
registration_date    Registration Date
participation_status REGISTERED/ATTENDED/ABSENT

create table event_registration
(
registration_id varchar2(10),
event_id varchar2(10),
student_id varchar2(10),
registration_date date default current_date,
participation_status varchar2(30),
constraint pk_evntreg primary key( registration_id),
constraint chk_particistat check (participation_status in('REGISTERED','ATTENDED','ABSENT')),
constraint fk_evnreg_eventid foreign key (event_id) references event(event_id),
constraint fk_evnreg_studentid foreign key (student_id) references student(student_id)
);





