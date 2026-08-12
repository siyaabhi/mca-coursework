Part B — DISTINCT, Aliases, and Calculated Columns

Display the different faculty designations without duplicates.
SELECT DISTINCT designation FROM faculty;

Display the different qualifications available in the FACULTY table.
SELECT DISTINCT QUALIFICATION FROM FACULTY;

Display the different semesters in which courses are offered.
 SELECT DISTINCT SEMESTER FROM COURSE;

Display the student name and CGPA using the aliases Student_Name and Grade_Point_Average.
SELECT student_name AS Student_Name,
       cgpa AS Grade_Point_Average
FROM student;

Display the faculty name, monthly salary, and annual salary. Calculate annual salary as monthly salary multiplied by 12.
SELECT FACULTY_NAME , 
SALARY AS MONTHLY_SALARY,
SALARY * 12 AS ANNUAL_SALARY 
FROM FACULTY;

Display the faculty name, current salary, and salary after a 10% increase without modifying the table.
SELECT FACULTY_NAME,
SALARY AS CURRENT_SALARY,
SALARY * 1.10 AS SALARY_AFTER_10
FROM FACULTY;

Display the result ID, internal marks, external marks, and a calculated total obtained by adding the two marks.
SELECT RESULT_ID, INTERNAL_MARKS, EXTERNAL_MARKS,
INTERNAL_MARKS +  EXTERNAL_MARKS AS TOTAL
FROM RESULT;

Display the event name, registration fee, and registration fee after adding 18% tax.
SELECT EVENT_NAME, REGISTRATION_FEE,
REGISTRATION_FEE * 1.18  AS REG_FEE_AFTER18
FROM EVENT;
