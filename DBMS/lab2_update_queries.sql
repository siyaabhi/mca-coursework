Part B — UPDATE Operations

Update the CGPA of student S101 to 8.7.
    update student set cgpa =8.7 where student_id ='S101';

Change the mobile number and email address of a particular student using one UPDATE statement.
    update student set mobile_number ='1234567891' ,email_id ='amalsaju@gmail.com' where student_id ='S102';

Increase the salary of faculty member F101 by ₹5,000.
    update faculty
    set salary = salary + 5000
    where faculty_id = 'f101';

Increase the salary of all faculty members by 10%.
    update faculty
    set salary = salary * 1.10;

Increase the salary of only those faculty members whose designation is Assistant Professor by 8%.
    update faculty
    set salary = salary * 1.08
    where designation = 'assistant professor';

Change the office location of the Computer Science department to Golden Aureole Block.
    update department
    set office_location = 'Golden Aureole Block'
    where dept_name = 'computer science';

Update the credits of the course Database Management Systems from 4 to 5.
    update course
    set credits = 5
    where course_name = 'database management system';

Change all courses currently assigned to faculty member F101 to faculty member F102.
    update course
    set faculty_id = 'f102'
    where faculty_id = 'f101';

Update the total marks in the RESULT table as the sum of internal marks and external marks.
    update result
    set total_marks = internal_marks + external_marks;

Set the grade to A for students whose total marks are 80 or above.
    update result
    set grade = 'A' where total_marks>=80;

Set the result status to PASS for results with total marks greater than or equal to 50, and FAIL for the remaining records.
    update result
    set result_status = 'PASS' where total_marks>=50;
    update result
    set result_status = 'FAIL' where total_marks<50;

Change the participation status to ATTENDED for a student who has attended a particular event.
    update event_registration
    set participation_status = 'ATTENDED' where student_id = 'S101' and event_id = 'e101';

Update the registration fee of all free events from NULL to 0.
    update event
    set registration_fee = 0
    where registration_fee IS NULL;

Increase the registration fee of events with more than 100 maximum participants by 15%.
    update event
    set registration_fee = registration_fee * 1.15
    where max_participants>100;

Update the academic year of all enrollments from 2025-2026 to 2026-2027.
    update enrollment
    set academic_year = '2026-2027'
    where academic_year = '2025-2026';

