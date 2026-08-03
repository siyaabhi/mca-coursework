Part E — Combined and Challenging Operations

Insert a new student and then update the student’s CGPA after the first semester.
    INSERT INTO student
    VALUES
    ('S104','Rahul Nair','12-JAN-2006','M',
    '9876541230','rahul@gmail.com','D01',
    SYSDATE,NULL,'Kochi','Kerala');
    UPDATE student
    SET cgpa = 8.5
    WHERE student_id = 'S104';

Insert a new faculty member and assign that faculty member to an existing course.
    INSERT INTO faculty
    (faculty_id, faculty_name, designation, joining_date, salary, email_id, dept_id)
    VALUES
    ('F104',
    'Priya Menon',
    'Assistant Professor',
    '10-JUN-2026',
    65000,
    'priya@rajagiri.edu',
    'D01');
    UPDATE course
    SET faculty_id = 'F104'
    WHERE course_id = 'c101';

Insert a new event and register three students for the event.
    INSERT INTO event
    (event_id, event_name, event_date, venue, faculty_id, max_participants, registration_fee)
    VALUES
    ('E104',
    'Coding Competition',
    '20-AUG-2026',
    'Computer Lab',
    'F104',
    100,
    50);
    INSERT INTO event_registration
    (registration_id, event_id, student_id, participation_status)
    VALUES
    ('ER104', 'E104', 'S102', 'REGISTERED');
    INSERT INTO event_registration
    (registration_id, event_id, student_id, participation_status)
    VALUES
    ('ER105', 'E104', 'S103', 'REGISTERED');
    INSERT INTO event_registration
    (registration_id, event_id, student_id, participation_status)
    VALUES ('ER106', 'E104', 'S104', 'REGISTERED');

Delete all event-registration records associated with a specific event before deleting that event.
    DELETE FROM event_registration
    WHERE event_id = 'E104';
    DELETE FROM event
    WHERE event_id = 'E104';

Delete all result records related to a particular student by using a subquery involving ENROLLMENT.
    DELETE FROM result
    WHERE enrollment_id IN
    (
    SELECT enrollment_id
    FROM enrollment
    WHERE student_id = 'S101'
    );

Update the CGPA of students in the Computer Science department by adding 0.2, ensuring that the CGPA does not exceed 10.
    UPDATE student
    SET cgpa = LEAST(cgpa + 0.2, 10)
    WHERE dept_id = 
    (
    SELECT dept_id
    FROM department
    WHERE dept_name = 'computer science'
    );

Update the designation of faculty members with more than ten years of experience to Associate Professor.
    UPDATE faculty
    SET designation = 'Associate Professor'
    WHERE experience_years > 10;

Create a new table named OLD_EVENTS with the same structure as EVENT, and insert all events conducted before 2025 into it.
    CREATE TABLE OLD_EVENTS AS
    SELECT * FROM EVENT
    WHERE event_date < TO_DATE('01-01-2025','DD-MM-YYYY');

Delete the archived events from the original EVENT table after inserting them into OLD_EVENTS.
    DELETE FROM event
    WHERE event_id IN
    (
    SELECT event_id
    FROM old_events
    );

Remove all records from EVENT_REGISTRATION without deleting the structure of the table.
    TRUNCATE TABLE event_registration;

Explain the difference between:
    DELETE FROM EVENT_REGISTRATION
    TRUNCATE TABLE EVENT_REGISTRATION
    DROP TABLE EVENT_REGISTRATION
    Use DELETE when you want to remove specific records and may need rollback.
    Use TRUNCATE when you want to quickly empty a table but keep it.
    Use DROP when you want to permanently remove the entire table.

Attempt to delete a department that has students and faculty members linked to it. Record the error received and explain why it occurs.
    DELETE FROM department
    WHERE dept_id = 'D01';
    DELETE FROM department
    *
    ERROR at line 1:
    ORA-02292: integrity constraint (MCA.FK_COURSE_DEPT) violated - child record
    found
    Help: https://docs.oracle.com/error-help/db/ora-02292/
    The error occurs because DEPARTMENT is a parent table, and STUDENT and FACULTY are child tables 

Write the necessary statements to delete a department safely by first removing or updating all related child-table records.
    -- Delete event registrations related to events conducted by D01 faculty
    DELETE FROM event_registration
    WHERE event_id IN
    (
    SELECT event_id
    FROM event
    WHERE faculty_id IN
    (
        SELECT faculty_id
        FROM faculty
        WHERE dept_id = 'D01'
    )
    );

    -- Delete events conducted by D01 faculty
    DELETE FROM event
    WHERE faculty_id IN
    (
    SELECT faculty_id
    FROM faculty
    WHERE dept_id = 'D01'
    );

    -- Delete courses assigned to D01 faculty
    DELETE FROM course
    WHERE faculty_id IN
    (
    SELECT faculty_id
    FROM faculty
    WHERE dept_id = 'D01'
    );

    -- Delete faculty members belonging to D01 department
    DELETE FROM faculty
    WHERE dept_id = 'D01';

    -- Delete students belonging to D01 department
    DELETE FROM student
    WHERE dept_id = 'D01';

    -- Delete the department
    DELETE FROM department
    WHERE dept_id = 'D01';

Use a subquery to increase the CGPA by 0.1 for students enrolled in the course Database Management Systems.
    UPDATE student
    SET cgpa = cgpa + 0.1
    WHERE student_id IN
    (
    SELECT student_id
    FROM enrollment
    WHERE course_id IN
    (
        SELECT course_id
        FROM course
        WHERE course_title = 'database management system'
    )
    );

Use a subquery to delete students who have not enrolled in any course.
    DELETE FROM student
    WHERE student_id NOT IN
    (
    SELECT student_id
    FROM enrollment
     );
