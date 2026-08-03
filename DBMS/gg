Part A — INSERT Operations
Insert a new department with the following details:
Department ID: D01
Department Name: Computer Science
HOD Name: Dr. Anil Kumar
Office Location: Carmel Block
Contact Number: 9876543210
          insert into department values('D01','computer science','dr.anil kumar', 'carmel     
          block','9876543210');

Insert a new department by specifying only the department ID, department name, and office location.
            insert into department values('D02','social work',null,'old block',null);

Insert three department records into the DEPARTMENT table using separate INSERT statements.
insert into department values('D03','business administration','dr ann' ,'old block','5678230918');
insert into department values('D04','commerce',’dr john K' ,'assumption block','8976123301');
insert into department values('D05','psychology ','dr anand ambani','carmel block','9815672965');

Insert the following student record into the STUDENT table:
Student ID: S101
Student Name: Akhil Raj
Date of Birth: 15-08-2005
Gender: M
Mobile Number: 9876501234
Email ID: akhil@gmail.com
Department ID: D01
Admission Date: Current date
CGPA: 8.2
      insert into student values('S101','Akhil Raj ','15-aug-2005' ,'M','9876501234','akhil@gmail.com','D01',SYSDATE,8.2);
           
Insert a student record without providing the CGPA value.
insert into student values('S102','Amal saju ','23-sep-2004','M','6782349810','amal@gmail.com','D03',SYSDATE,null);

Insert a female student belonging to the Computer Science department with a CGPA greater than 9.
insert into student values('S103','susan mary ','10-jul-2005' ,'F','8762345091','susan@gmail.com','D01',SYSDATE,'9.3');

Insert two faculty records into the FACULTY table using a single INSERT ALL statement.
 INSERT ALL
  INTO faculty
  (faculty_id, faculty_name, qualification, designation, joining_date, salary, email_id, dept_id)
  VALUES
  ('F102','Anand Kumar','PhD','Assistant Professor',
  '03-JUN-2014',
  75000,
   'anand@rajagiri.edu',
 'D01')
 INTO faculty
(faculty_id, faculty_name, qualification, designation, joining_date, salary, email_id, dept_id)
 VALUES
 ('F103','Alan Berly','PhD','Assistant Professor',
 '01-JUN-2014',
 70000,
 'alan@rajagiri.edu',
 'D01')
 SELECT * FROM dual;

  

Insert a faculty member with the following details:
Faculty ID: F101
Faculty Name: Meera Joseph
Qualification: PhD
Designation: Assistant Professor
Joining Date: 01-06-2022
Salary: 55000
Email ID: meera@rajagiri.edu
Department ID: D01
                   insert into faculty values ('f101','meera joseph','phD','assistant    professor','01-jun-2022','55000','meera@rajagiri.edu','D01');          


Insert a course titled Database Management Systems with four credits for Semester 3.
insert into course (course_id, course_name, credits, semester) values
  2  ('c101','database management system','4','3');

Insert a course without mentioning the column names. Ensure that the values are entered in the correct table-column order.
insert into course values('c102','operating system','4', '2','D01','F103');

Insert an enrollment record and allow the enrollment_date column to take its default value.
 insert into enrollment(enrollment_id,student_id,course_id,academic_year) values('e101', 'S101', 'c101', '2025-2026');

Insert a result record where the total marks are calculated by adding the internal and external marks.
 insert into result values('r101', 'e101', '40', '45',40+45,'A','PASS');

Insert three events into the EVENT table using an Oracle INSERT ALL statement.
insert all
  2  into event values('e101','Annual Day','10-aug-2026','College Ground','f101',150,20)
  3  into event values('e102','Cultural Fest','13-sep-2026','Main Hall','F102',200,50)
  4  into event values('e103','Tech Fest','07-oct-2026','Auditorium','F103',150,100)
  5  select * from dual;

Insert an event-registration record and allow the registration date to take the current date automatically.
 INSERT INTO EVENT_REGISTRATION(REGISTRATION_ID, EVENT_ID, STUDENT_ID, PARTICIPATION_STATUS) VALUES('ER101', 'e101', 'S101', 'REGISTERED');

Create a backup table named HIGH_CGPA_STUDENTS and insert into it all students whose CGPA is 8 or above using INSERT INTO ... SELECT.
create table high_cgpa_student as
  2  select * from student where cgpa >= 8;
