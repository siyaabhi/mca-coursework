Part D — Logical Operators, BETWEEN, IN, and LIKE

Display female students whose CGPA is greater than 8.
SELECT * FROM STUDENT
WHERE GENDER = 'F' AND CGPA > 8;

Display students whose CGPA is between 7 and 9.
SELECT * FROM STUDENT 
WHERE CGPA  BETWEEN 7 AND 9;

Display faculty members who are Assistant Professor and earn more than ₹45,000.
SELECT * FROM FACULTY
WHERE SALARY >45000 AND DESIGNATION = ‘Assistant Professor’;

Display faculty members whose qualification is either PhD or MPhil.
SELECT * FROM FACULTY
WHERE QUALIFICATION IN ('PhD', 'MPhil');

Display faculty members whose salary is between ₹40,000 and ₹70,000.
SELECT * FROM FACULTY
WHERE SALARY BETWEEN 40000 AND 70000;

Display courses offered in Semesters 1, 3, or 5 using the IN operator.
SELECT * FROM COURSE
WHERE SEMESTER  IN (1,3,5);

Display courses not offered in Semesters 7 and 8.
SELECT * FROM COURSE
WHERE SEMESTER NOT IN (7, 8);

Display results having grades A, B, or C.
SELECT * FROM RESULT WHERE GRADE IN ('A','B','C');
Display events with registration fees between ₹100 and ₹1,000.
SELECT * FROM EVENT 
WHERE REGISTRATION_FEE BETWEEN 100 AND 1000;

Display students whose names begin with the letter A.
SELECT * FROM STUDENT
WHERE STUDENT_NAME LIKE 'A%';

Display students whose names contain the text Raj.
SELECT * FROM STUDENT
WHERE STUDENT_NAME LIKE '%Raj%';

Display faculty members whose email addresses belong to the rajagiri.edu domain.
SELECT * FROM FACULTY
WHERE EMAIL_ID LIKE '%rajagiri.edu';

Display courses whose course names contain the word Database.
SELECT * FROM COURSE
WHERE COURSE_TITLE LIKE '%Database%';

Display departments whose department names contain the word Science.
 SELECT * FROM DEPARTMENT
 WHERE DEPT_NAME LIKE '%science%';
