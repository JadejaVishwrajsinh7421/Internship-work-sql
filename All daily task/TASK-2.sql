create database task_2
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
use TASK_2

--here day_2 task implementing DML operations like insert,update,delete,select and more.
--i used that old table schema of task1 adding the data related  is added up..

INSERT INTO COLLEGE (College_ID, College_Name, Address) VALUES
(1, 'Sardar Patel College', 'Ahmedabad, Gujarat'),
(2, 'Nalanda Institute of Technology', 'Patna, Bihar'),
(3, 'Vivekananda College', 'Bengaluru, Karnataka'),
(4, 'St. Xavier College', 'Mumbai, Maharashtra'),
(5, 'Birla Institute of Science', 'Hyderabad, Telangana'),
(6, 'Gujarat Arts & Science College', NULL), -- Missing address
(7, 'Mahatma Gandhi Degree College', 'Jaipur, Rajasthan'),
(8, 'Sunrise Engineering College', 'Surat, Gujarat'),
(9, 'Greenfield Institute of Management', 'Pune, Maharashtra'),
(10,'Royal Institute of Computer Science', NULL); -- Missing address

INSERT INTO DEPARTMENT (Dpt_ID, Dpt_Name) VALUES
('CSE', 'Computer Science & Engineering'),
('ECE', 'Electronics & Communication'),
('ME', 'Mechanical Engineering'),
('CE', 'Civil Engineering'),
('EE', 'Electrical Engineering'),
('IT', 'Information Technology'),
('MBA', 'Master of Business Administration'),
('BBA', 'Bachelor of Business Administration'),
('PHY', 'Physics'),
('CHEM', 'Chemistry');

INSERT INTO TEACHER (Teacher_ID, Name, Salary, Dpt_ID) VALUES
(101, 'Rahul Mehta', 55000, 'CSE'),
(102, 'Asha Sharma', 60000, 'ECE'),
(103, 'Pratap Singh', NULL, 'ME'),       -- Missing salary
(104, 'Nita Desai', 52000, 'CSE'),
(105, 'Harish Patel', 48000, 'CE'),
(106, 'Komal Jain', NULL, 'IT'),         -- NULL salary
(107, 'Sunil Reddy', 65000, 'MBA'),
(108, 'Meera Nair', 59000, 'PHY'),
(109, 'Amit Trivedi', 50000, 'CHEM'),
(110, 'Rohit Verma', NULL, NULL);        -- Missing salary & department

INSERT INTO COURSE (Course_ID, Course_Name, Credits, Subject) VALUES
('C101', 'Data Structures', 4, 'Computer Science'),
('C102', 'Operating Systems', 3, 'Computer Science'),
('E201', 'Digital Electronics', 4, 'Electronics'),
('E202', 'VLSI Design', 3, NULL),         -- Missing subject
('M301', 'Thermodynamics', 4, 'Mechanical'),
('C103', 'Database Management', 4, 'Computer Science'),
('B101', 'Business Communication', 3, 'Management'),
('P201', 'Quantum Physics', 4, 'Physics'),
('CH101', 'Organic Chemistry', 4, NULL),  -- Missing subject
('IT501', 'Cloud Computing', 3, 'Computer Science');


INSERT INTO ENROLLS (Student_ID, Course_ID, Enrollment_Date) VALUES
(201, 'C101', '2024-07-10'),
(201, 'C103', '2024-07-12'),
(202, 'E201', '2024-07-08'),
(205, 'IT501', '2024-07-15'),
(203, 'M301', NULL),        -- Missing enrollment date
(209, 'P201', '2024-07-20'),
(210, 'C102', '2024-07-18'),
(204, 'B101', '2024-07-05'),
(207, 'CH101', NULL),       -- NULL
(208, 'B101', '2024-07-10');


-- Update salary where NULL
UPDATE TEACHER
SET Salary = 45000
WHERE Salary IS NULL;

-- Update missing subject
UPDATE COURSE
SET Subject = 'Engineering'
WHERE Subject IS NULL;

-- Update student department if missing
UPDATE STUDENT
SET Dpt_ID = 'CSE'
WHERE Dpt_ID IS NULL;

-- Delete teacher with no department & no salary
DELETE FROM TEACHER
WHERE Dpt_ID IS NULL AND Salary IS NULL;

--DELETE Students Not Enrolled in Any Course
DELETE FROM STUDENT
WHERE Student_ID NOT IN (SELECT Student_ID FROM ENROLLS);

--DELETE Teachers Not Belonging to Any Department
DELETE FROM TEACHER
WHERE Dpt_ID IS NULL;
