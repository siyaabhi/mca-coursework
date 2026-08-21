Part F — Aggregate Functions, GROUP BY, and HAVING

Write queries to find the total number of students.
SELECT COUNT(*) AS TOTAL_STUDENT
FROM STUDENT;

Find the highest, lowest, and average CGPA of all students.
SELECT MIN(CGPA) AS LOWEST,
MAX(CGPA) AS HIGHEST,
AVG(CGPA)  AS AVERAGE
FROM STUDENT; 

