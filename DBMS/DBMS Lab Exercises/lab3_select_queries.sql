SQL Lab Exercises #3
SELECT Queries ( Based on Rajagiri Academic System)
Part A — Basic SELECT Queries
Display all records from the DEPARTMENT table.
SELECT * FROM DEPARTMENT;

Display all records from the STUDENT table.
SELECT * FROM STUDENT;

Display all records from the FACULTY table.
SELECT * FROM FACULTY;

Display all records from the COURSE table.
SELECT * FROM COURSE;

Display all records from the ENROLLMENT table.
SELECT * FROM ENROLLMENT;

Display the student ID, student name, gender, and CGPA of all students.
SELECT student_id, student_name, gender, cgpa
FROM student;

Display the faculty ID, faculty name, designation, and salary of all faculty members.
SELECT FACULTY_ID, FACULTY_NAME, DESIGNATION, SALARY
FROM FACULTY;

Display the course ID, course name, credits, and semester of all courses.
 SELECT COURSE_ID, COURSE_TITLE, CREDITS, SEMESTER
 FROM COURSE;

Display the event name, event date, venue, and registration fee of all events.
SELECT EVENT_NAME, EVENT_DATE, VENUE, REGISTRATION_FEE
 FROM EVENT;

Display the result ID, internal marks, external marks, total marks, grade, and result status from the RESULT table.
 SELECT RESULT_ID, INTERNAL_MARKS, EXTERNAL_MARKS, TOTAL_MARKS, GRADE, RESULT_STATUS 
FROM RESULT;
