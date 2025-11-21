use task_5

--for task of subqueries i take three objects that are realated to each other the demonstrate of all type of sub query

-- STUDENT_DATA TABLE
CREATE TABLE STUDENT_DATA (
    Rno INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50),
    DID INT
);

-- DEPARTMENT TABLE
CREATE TABLE DEPARTMENT (
    DID INT PRIMARY KEY,
    DName VARCHAR(50)
);

-- ACADEMIC TABLE
CREATE TABLE ACADEMIC (
    RNO INT PRIMARY KEY,
    SPI DECIMAL(3,1),
    BKLOG INT
);
 -- data entries in the table

INSERT INTO STUDENT_DATA (Rno, Name, City, DID) VALUES
(101, 'Raju',   'Rajkot',    10),
(102, 'Amit',   'Ahmedabad', 20),
(103, 'Sanjay', 'Baroda',    40),
(104, 'Neha',   'Rajkot',    20),
(105, 'Meera',  'Ahmedabad', 30),
(106, 'Mahesh', 'Baroda',    10);

INSERT INTO DEPARTMENT (DID, DName) VALUES
(10, 'Computer'),
(20, 'Electrical'),
(30, 'Mechanical'),
(40, 'Civil');

INSERT INTO ACADEMIC (RNO, SPI, BKLOG) VALUES
(101, 8.8, 0),
(102, 9.2, 2),
(103, 7.6, 1),
(104, 8.2, 4),
(105, 7.0, 2),
(106, 8.9, 3);

-- 1. Students from Computer department
SELECT *
FROM STUDENT_DATA
WHERE DID = (
    SELECT DID FROM DEPARTMENT WHERE DName = 'Computer'
);

-- 2. Students whose SPI > 8
SELECT Name
FROM STUDENT_DATA
WHERE Rno IN (
    SELECT RNO FROM ACADEMIC WHERE SPI > 8
);

-- 3. Computer department students who belong to Rajkot
SELECT *
FROM STUDENT_DATA
WHERE City = 'Rajkot'
AND DID = (
    SELECT DID FROM DEPARTMENT WHERE DName = 'Computer'
);

-- 4. Total students of Electrical department
SELECT COUNT(*)
FROM STUDENT_DATA
WHERE DID = (
    SELECT DID FROM DEPARTMENT WHERE DName = 'Electrical'
);

-- 5. Student having maximum SPI
SELECT Name
FROM STUDENT_DATA
WHERE Rno = (
    SELECT RNO FROM ACADEMIC 
    WHERE SPI = (SELECT MAX(SPI) FROM ACADEMIC)
);

--6. Students having more than 1 backlog
SELECT *
FROM STUDENT_DATA
WHERE Rno IN (
    SELECT RNO FROM ACADEMIC WHERE BKLOG > 1
);

-- 7. Students from Computer OR Mechanical department
SELECT Name
FROM STUDENT_DATA
WHERE DID IN (
    SELECT DID FROM DEPARTMENT WHERE DName IN ('Computer', 'Mechanical')
);

-- 8. Students in same department as student 102
SELECT Name
FROM STUDENT_DATA
WHERE DID = (
    SELECT DID FROM STUDENT_DATA WHERE Rno = 102
);

-- 9. Students whose SPI > 9 AND from Electrical department
SELECT Name
FROM STUDENT_DATA
WHERE DID = (
    SELECT DID FROM DEPARTMENT WHERE DName = 'Electrical'
)
AND Rno IN (
    SELECT RNO FROM ACADEMIC WHERE SPI > 9
);

-- 10. Student having second highest SPI
SELECT Name
FROM STUDENT_DATA
WHERE Rno = (
    SELECT RNO FROM ACADEMIC
    WHERE SPI = (
        SELECT MAX(SPI)
        FROM ACADEMIC
        WHERE SPI < (SELECT MAX(SPI) FROM ACADEMIC)
    )
);

-- 11. City whose student has SPI = 9.2
SELECT City
FROM STUDENT_DATA
WHERE Rno = (
    SELECT RNO FROM ACADEMIC WHERE SPI = 9.2
);

-- 12. Students whose backlogs > average backlog
SELECT Name
FROM STUDENT_DATA
WHERE Rno IN (
    SELECT RNO FROM ACADEMIC
    WHERE BKLOG > (SELECT AVG(BKLOG) FROM ACADEMIC)
);

-- 13. Students in same department as student with highest SPI
SELECT Name
FROM STUDENT_DATA
WHERE DID = (
    SELECT DID
    FROM STUDENT_DATA
    WHERE Rno = (
        SELECT RNO FROM ACADEMIC
        WHERE SPI = (SELECT MAX(SPI) FROM ACADEMIC)
    )
);