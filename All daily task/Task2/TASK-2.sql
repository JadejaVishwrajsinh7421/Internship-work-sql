use TASK_1

--here day_2 task implementing DML operations like insert,update,delete,select and more.
--i used that old table schema of task1 adding the data related  is added up..

INSERT INTO COLLEGE VALUES
(1, 'Darshan University', 'Rajkot, Gujarat'),
(2, 'LD Engineering College', 'Ahmedabad, Gujarat'),
(3, 'Nirma University', 'Ahmedabad, Gujarat'),
(4, 'MS University', 'Vadodara, Gujarat'),
(5, 'IIT Bombay', 'Mumbai, Maharashtra'),
(6, 'IIT Delhi', 'New Delhi'),
(7, 'BITS Pilani', 'Pilani, Rajasthan'),
(8, 'VIT University', 'Vellore, Tamil Nadu');

INSERT INTO DEPARTMENT VALUES
('CSE', 'Computer Science and Engineering'),
('IT', 'Information Technology'),
('ME', 'Mechanical Engineering'),
('CE', 'Civil Engineering'),
('EE', 'Electrical Engineering'),
('EC', 'Electronics and Communication'),
('AIML', 'Artificial Intelligence & ML'),
('DS', 'Data Science');

INSERT INTO TEACHER VALUES
(101, 'Ravi Patel', 55000, 'CSE'),
(102, 'Anita Shah', 62000, 'IT'),
(103, 'Karan Joshi', 58000, 'ME'),
(104, 'Mehul Trivedi', 60000, 'CSE'),
(105, 'Nisha Panchal', 64000, 'EC'),
(106, 'Jaydeep Rana', 57000, 'CE'),
(107, 'Pooja Desai', 59000, 'EE'),
(108, 'Harshil Dave', 61000, 'AIML'),
(109, 'Sneha Solanki', 63000, 'DS'),
(110, 'Dharmesh Parmar', 56500, 'IT');

INSERT INTO COURSE VALUES
('C101', 'Database Systems', 4, 'DBMS'),
('C102', 'Operating Systems', 3, 'OS'),
('C103', 'Data Structures', 4, 'CSE'),
('C104', 'Machine Learning', 4, 'AI'),
('C105', 'Fluid Mechanics', 4, 'MECH'),
('C106', 'Strength of Materials', 3, 'CIVIL'),
('C107', 'Power Electronics', 4, 'EEE'),
('C108', 'Digital Circuits', 3, 'ECE'),
('C109', 'Data Mining', 4, 'DS'),
('C110', 'Cloud Computing', 3, 'CSE');

INSERT INTO STUDENT VALUES
(201, 'Aarav Mehta', 'M', '2005-03-14', 'aarav.mehta@example.com', 'CSE'),
(202, 'Diya Patel', 'F', '2004-11-20', 'diya.patel@example.com', 'IT'),
(203, 'Harsh Shah', 'M', '2005-06-18', 'harsh.shah@example.com', 'ME'),
(204, 'Ishika Rana', 'F', '2005-02-10', 'ishika.rana@example.com', 'CSE'),
(205, 'Vivaan Joshi', 'M', '2005-01-05', 'vivaan.joshi@example.com', 'EC'),
(206, 'Riya Desai', 'F', '2004-12-25', 'riya.desai@example.com', 'AIML'),
(207, 'Krish Parmar', 'M', '2005-03-01', 'krish.parmar@example.com', 'DS'),
(208, 'Saanvi Trivedi', 'F', '2005-04-12', 'saanvi.trivedi@example.com', 'CE'),
(209, 'Yashvi Gohil', 'F', '2005-07-30', 'yashvi.gohil@example.com', 'EE'),
(210, 'Parth Solanki', 'M', '2005-05-22', 'parth.solanki@example.com', 'CSE');

INSERT INTO TEACHES VALUES
(101, 'C101'),
(101, 'C103'),
(102, 'C102'),
(104, 'C101'),
(105, 'C108'),
(108, 'C104'),
(109, 'C109'),
(103, 'C105'),
(106, 'C106'),
(107, 'C107');

INSERT INTO ENROLLS VALUES
(201, 'C101', '2024-07-01'),
(201, 'C103', '2024-07-01'),
(202, 'C102', '2024-07-02'),
(204, 'C101', '2024-07-03'),
(205, 'C108', '2024-07-05'),
(206, 'C104', '2024-07-06'),
(207, 'C109', '2024-07-08'),
(208, 'C106', '2024-07-09'),
(209, 'C107', '2024-07-10'),
(210, 'C103', '2024-07-11');

--now its time for some update and delete in your Existing data
UPDATE STUDENT
SET Email = 'aarav.new@example.com'
WHERE Student_ID = 201;

UPDATE TEACHER
SET Salary = Salary + 5000
WHERE Teacher_ID = 101;

UPDATE STUDENT
SET Dpt_ID = 'IT'
WHERE Student_ID = 203;

UPDATE COURSE
SET Credits = 5
WHERE Course_ID = 'C101';

DELETE FROM ENROLLS
WHERE Student_ID = 201 AND Course_ID = 'C103';

--Delete a student (only if no enrollments)
DELETE FROM STUDENT
WHERE Student_ID = 203;


--select query examples
--1 Display all students
SELECT * FROM STUDENT;

--2 All teachers of CSE department
SELECT Name, Salary
FROM TEACHER
WHERE Dpt_ID = 'CSE';

--3 Courses taught by teacher 101
SELECT C.Course_Name
FROM TEACHES T
JOIN COURSE C ON T.Course_ID = C.Course_ID
WHERE T.Teacher_ID = 101;

--4 Student with department name
SELECT S.Name, D.Dpt_Name
FROM STUDENT S
JOIN DEPARTMENT D ON S.Dpt_ID = D.Dpt_ID;