Part D — DELETE Operations

Delete the student record whose student ID is S101.
    DELETE FROM result
    WHERE enrollment_id IN (
    SELECT enrollment_id
    FROM enrollment
    WHERE student_id = 'S101'
);
DELETE FROM enrollment
WHERE student_id = 'S101';
DELETE FROM event_registration
WHERE student_id = 'S101';
DELETE FROM student
WHERE student_id = 'S101';

Delete all students whose CGPA is below 5.
    delete from student
    where cgpa < 5;

Delete all faculty members whose salary is below ₹30,000.
    delete from faculty
    where salary < 30000;

Delete courses offered in Semester 8.
    delete from course where semester = 8;

Delete an enrollment record using its enrollment ID.
    DELETE FROM enrollment
    WHERE enrollment_id = 'E101';

Delete all enrollment records belonging to a particular student.
    DELETE FROM enrollment
    WHERE student_id = 'S101';

Delete all results with the result status FAIL.
    delete from result where result_status = 'FAIL';

Delete event registrations where the participation status is ABSENT.
    delete from event_registration where participation_status = 'ABSENT';

Delete all events that occurred before 01-01-2025.
    DELETE FROM event
    WHERE event_date < TO_DATE('01-01-2025', 'DD-MM-YYYY');

Delete all events for which no registration fee is charged.
    DELETE FROM event
    WHERE registration_fee = 0;
