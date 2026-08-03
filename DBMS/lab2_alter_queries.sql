Part C — ALTER TABLE Operations

Add a column named address with datatype VARCHAR2(200) to the STUDENT table.
    alter table student
    add address varchar2(50);

Add two columns, city and state, to the STUDENT table.
    alter table student
    add ( city varchar2(30),
    state varchar2(30));

Add a column named experience_years to the FACULTY table.
    alter table faculty
    add experience_years number;

Modify the size of the student_name column to VARCHAR2(100).
    alter table student
    modify student_name varchar2(100);

Modify the datatype of mobile_number so that it can store 15 characters.
    alter table student
    modify mobile_number varchar2(15);

Rename the column mobile_number in the STUDENT table to contact_number.
    alter table student
    rename column mobile_number to contact_number;

Rename the column course_name in the COURSE table to course_title.
     table course
    rename column course_name to course_title;

Delete the newly added address column from the STUDENT table.
    alter table student
    drop column address;

Drop the qualification column from the FACULTY table.
    alter table faculty
    drop column qualification;

Add a CHECK constraint to ensure that faculty salary is greater than zero.
    alter table faculty
    add constraint ck_salary_positive
    check ( salary>0);

Add a CHECK constraint to ensure that student CGPA remains between 0 and 10.
    alter table student
    add constraint ck_cgpa_btwn_0_10
    check (cgpa between 0 and 10);

Add a NOT NULL constraint to the event_name column.
    alter table event
    modify event_name varchar2(30) not null;


Add a unique constraint to the contact_number column of the STUDENT table.
    alter table student
    add constraint uq_contact_number
    unique (contact_number);

Rename the EVENT table to COLLEGE_EVENT.
    rename event to college_event;

Rename the COLLEGE_EVENT table back to EVENT.
    rename college_event to event;

Add a column named hod_faculty_id to the DEPARTMENT table.
    alter table department
    add hod_faculty_id varchar2(30);

Create a foreign-key constraint linking hod_faculty_id in DEPARTMENT with faculty_id in FACULTY.
    alter table department
    add constraint fk_hod_faculty_id
    foreign key ( hod_faculty_id)
    references faculty(faculty_id);

Remove the existing hod_name column from the DEPARTMENT table, as required in the database redesign.
    alter table department
    drop column hod_name;

Disable the foreign-key constraint connecting COURSE and FACULTY.
    alter table course
    DISABLE CONSTRAINT FK_COURSE_FACULTY;

Enable the previously disabled foreign-key constraint.
    ALTER TABLE COURSE
    ENABLE CONSTRAINT FK_COURSE_FACULTY;

