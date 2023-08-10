-- delete all databases
DROP TABLE IF EXISTS teaches;

DROP TABLE IF EXISTS advisor;

DROP TABLE IF EXISTS instructor;

DROP TABLE IF EXISTS takes;

DROP TABLE IF EXISTS student;

DROP TABLE IF EXISTS section;

DROP TABLE IF EXISTS time_slot;

DROP TABLE IF EXISTS prereq;

DROP TABLE IF EXISTS course;

DROP TABLE IF EXISTS classroom;

DROP TABLE IF EXISTS department;

-- Create the "department" table
CREATE TABLE
    department (
        dept_name varchar(50),
        building varchar(50),
        budget numeric(12, 2),
        primary key (dept_name)
    );

-- Create the "classroom" table
CREATE TABLE
    classroom (
        room_no numeric(10),
        capacity numeric(10),
        building varchar(50),
        primary key (room_no, building)
    );

-- Create the "course" table
CREATE TABLE
    course (
        course_id numeric(10),
        dept_name varchar(50),
        title varchar(50),
        credit numeric(10),
        primary key (course_id),
        foreign key (dept_name) references department
    );

-- Create the "prereq" table
CREATE TABLE
    prereq (
        course_id numeric(10),
        prereq_id numeric(10),
        primary key (course_id, prereq_id),
        foreign key (prereq_id) references course (course_id),
        foreign key (course_id) references course (course_id)
    );

-- Create the "time_slot" table
CREATE TABLE
    time_slot (
        time_slot_id numeric(10),
        day varchar(50),
        start_time timestamp,
        end_time timestamp,
        primary key (time_slot_id, start_time, day)
    );

-- Create the "section" table
CREATE TABLE
    section (
        course_id numeric(10),
        sec_id numeric(10),
        semester numeric(10),
        year numeric(10),
        room_no numeric(10),
        building varchar(50),
        time_slot_id timestamp,
        primary key (course_id, sec_id, semester, year),
        foreign key (room_no) references classroom (room_no),
        foreign key (building) references classroom (building),
        foreign key (course_id) references course (course_id),
        foreign key (time_slot_id) references time_slot (time_slot_id)
    );

-- Create the "student" table
CREATE TABLE
    student (
        ID numeric(10),
        name varchar(50),
        dept_name varchar(50),
        tot_cred numeric(3),
        primary key (ID),
        foreign key (dept_name) references department
    );

-- Create the "takes" table
CREATE TABLE
    takes (
        ID numeric(10),
        course_id numeric(10),
        sec_id numeric(10),
        semester numeric(10),
        year numeric(10),
        grade varchar(5),
        primary key (ID, course_id, sec_id, semester, year),
        foreign key (course_id) references section (course_id),
        foreign key (sec_id) references section (sec_id),
        foreign key (semester) references section (semester),
        foreign key (year) references section (year),
        foreign key (ID) references student (ID)
    );

-- Create the "instructor" table
CREATE TABLE
    instructor (
        ID numeric(10),
        name varchar(50),
        dept_name varchar(50),
        salary numeric(12, 2),
        primary key (ID),
        foreign key (dept_name) references department
    );

-- Create the "advisor" table
CREATE TABLE
    advisor (
        s_id numeric(10),
        i_id numeric(10),
        primary key (s_id),
        foreign key (s_id) references student (ID),
        foreign key (i_id) references instructor (ID)
    );

-- Create the "teaches" table
CREATE TABLE
    teaches (
        ID numeric(10),
        course_id numeric(10),
        sec_id numeric(10),
        semester numeric(10),
        year numeric(10),
        primary key (ID, course_id, sec_id, semester),
        foreign key (course_id) references section (course_id),
        foreign key (sec_id) references section (sec_id),
        foreign key (semester) references section (semester),
        foreign key (ID) references instructor (ID)
    );

-- department
-- classroom
-- course
-- prereq
-- time_slot
-- section
-- student
-- takes
-- instructor
-- advisor
-- teaches