Part E — NULL Values, Sorting, and Built-in Functions

Display students whose CGPA has not been entered.
SELECT * FROM STUDENT
WHERE CGPA IS NULL;

Display courses for which no faculty member has been assigned.
SELECT * FROM COURSE
WHERE FACULTY_ID IS NULL;

Display all students in alphabetical order of student name.
SELECT * FROM STUDENT
ORDER BY STUDENT_NAME ASC;

Display all students in descending order of CGPA.
SELECT * FROM STUDENT
ORDER BY CGPA DESC;



Display faculty members in descending order of salary.
SELECT * FROM FACULTY
ORDER BY SALARY DESC;

Display courses first by semester and then by credits in descending order.
SELECT * FROM COURSE
ORDER BY SEMESTER ASC, CREDITS DESC;

Display all student names in uppercase.
SELECT UPPER (STUDENT_NAME)
FROM STUDENT;

Display faculty names with the first letter of each word capitalised using INITCAP.
SELECT INITCAP(FACULTY_NAME)
FROM FACULTY;

Display student names along with the number of characters in each name.
SELECT STUDENT_NAME, LENGTH(STUDENT_NAME) AS NAME_LENGTH
FROM STUDENT;

Display student names and CGPA values rounded to one decimal place.
SELECT STUDENT_NAME, ROUND(CGPA, 1) AS CGPA
FROM STUDENT;

Display faculty members and the year in which they joined.
SELECT FACULTY_NAME, EXTRACT(YEAR FROM JOINING_DATE) AS JOINING_YEAR
FROM FACULTY;
