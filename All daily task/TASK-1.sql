CREATE DATABASE TASK_1

USE TASK_1

-- 1. COLLEGE Table
CREATE TABLE COLLEGE (
    College_ID INT PRIMARY KEY,
    College_Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255)
);

-- 2. DEPARTMENT Table
CREATE TABLE DEPARTMENT (
    Dpt_ID VARCHAR(10) PRIMARY KEY,
    Dpt_Name VARCHAR(100) NOT NULL
);

-- 3. TEACHER Table
CREATE TABLE TEACHER (
    Teacher_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Salary DECIMAL(10, 2),
    Dpt_ID VARCHAR(10),
    FOREIGN KEY (Dpt_ID) REFERENCES DEPARTMENT(Dpt_ID)
);

-- 4. COURSE Table
CREATE TABLE COURSE (
    Course_ID VARCHAR(10) PRIMARY KEY,
    Course_Name VARCHAR(100) NOT NULL,
    Credits INT CHECK (Credits > 0), 
    -- Constraint to ensure credits are positive
    Subject VARCHAR(50)
);

-- 5. STUDENT Table
CREATE TABLE STUDENT (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Gender CHAR(1), -- 'M', 'F', 'O'
    DOB DATE,
    Email VARCHAR(100) UNIQUE, -- Constraint to ensure unique email
    Dpt_ID VARCHAR(10),
    FOREIGN KEY (Dpt_ID) REFERENCES DEPARTMENT(Dpt_ID)
);


-- 6.  Entity for M:N Relationship: TEACHER to COURSE
-- A teacher TEAChes multiple courses, and a course is taught by multiple teachers.
CREATE TABLE TEACHES (
    Teacher_ID INT,
    Course_ID VARCHAR(10),
    PRIMARY KEY (Teacher_ID, Course_ID), -- Composite Primary Key
    FOREIGN KEY (Teacher_ID) REFERENCES TEACHER(Teacher_ID),
    FOREIGN KEY (Course_ID) REFERENCES COURSE(Course_ID)
);


-- 7.  Entity for M:N Relationship: STUDENT to COURSE
-- A student ENROLLS in multiple courses, and a course has multiple students.
CREATE TABLE ENROLLS (
    Student_ID INT,
    Course_ID VARCHAR(10),
    Enrollment_Date DATE, -- Optional attribute for the relationship
    PRIMARY KEY (Student_ID, Course_ID), -- Composite Primary Key
    FOREIGN KEY (Student_ID) REFERENCES STUDENT(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES COURSE(Course_ID)
);