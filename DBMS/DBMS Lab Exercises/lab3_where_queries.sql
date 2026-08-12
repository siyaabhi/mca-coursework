Part C — WHERE Clause and Relational Operators

Display the details of all female students.
SELECT * FROM STUDENT
WHERE GENDER = 'F';

Display the details of students whose CGPA is greater than 8.
SELECT * FROM STUDENT
WHERE CGPA > 8;

Display students whose CGPA is less than or equal to 6.
SELECT * FROM STUDENT 
WHERE CGPA <=6;

Display students belonging to department D01.
SELECT * FROM STUDENT
 WHERE DEPT_ID = 'D01';

Display faculty members whose salary is greater than ₹50,000.
SELECT * FROM FACULTY
WHERE SALARY > 50000;

Display faculty members whose designation is Assistant Professor.
SELECT * FROM FACULTY
WHERE DESIGNATION = 'Assistant Professor';

Display faculty members whose qualification is PhD.
SELECT * FROM FACULTY
WHERE QUALIFICATION = 'PHD';

Display courses offered in Semester 3.
SELECT * FROM COURSE
WHERE SEMESTER = 3;

Display courses having more than four credits.
SELECT * FROM COURSE
WHERE CREDITS > 4;

Display all results with result status PASS.
 SELECT * FROM RESULT
 WHERE RESULT_STATUS = 'PASS';

Display results in which total marks are greater than or equal to 80.
 SELECT * FROM RESULT
 WHERE TOTAL_MARKS >= 80;

Display results in which internal marks are greater than external marks.
SELECT * FROM RESULT
 WHERE INTERNAL_MARKS > EXTERNAL_MARKS;
Display events for which the registration fee is greater than ₹500.
SELECT * FROM EVENT
WHERE REGISTRATION_FEE > 500;
 
Display events that can accommodate more than 100 participants.
SELECT * FROM EVENT
WHERE MAX_PARTICIPANTS > 100;

Display event registrations with participation status ATTENDED.
SELECT * FROM EVENT_REGISTRATION
WHERE PARTICIPATION_STATUS = 'ATTENDED';
