create database task_5

use  task_5

-- taking two tables realted to each other is customer and order and doing worked on diffrent types of join clauses in sql

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    JoinDate DATE
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(50),
    Category VARCHAR(30),
    Amount INT,
    OrderDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

--data entries in both table

INSERT INTO Customers VALUES
(1, 'Aarav Patel',  'aarav@gmail.com',     '9876543210', 'Delhi',       '2022-01-10'),
(2, 'Isha Shah',     'isha@outlook.com',   '9988776655', 'Mumbai',      '2021-09-21'),
(3, 'Rohit Verma',   'rohit@gmail.com',    '9123456780', 'Pune',        '2023-04-05'),
(4, 'Meera Joshi',   'meera@yahoo.com',    '8855667788', 'Ahmedabad',   '2022-12-01'),
(5, 'Krishna Singh', 'krishna@gmail.com',  '9090909090', 'Jaipur',      '2020-08-15'),
(6, 'Pooja Kumari',  'pooja@live.com',     '9801234567', 'Surat',       '2023-01-11'),
(7, 'Vikas Yadav',   'vikas@yahoo.com',    '9900112233', 'Indore',      '2021-11-20'),
(8, 'Neha Gupta',    'neha@gmail.com',     '9990001112', 'Lucknow',     '2022-05-19'),
(9, 'Ahmad Khan',    'ahmad@rediff.com',   '9955668833', 'Hyderabad',   '2020-04-13'),
(10,'Simran Kaur',   'simran@gmail.com',   '9877001234', 'Chandigarh',  '2023-03-08');

INSERT INTO Orders VALUES
(101, 1,  'Laptop',       'Electronics', 55000, '2023-01-12', 'Delivered'),
(102, 1,  'Mouse',        'Electronics',   700, '2023-02-20', 'Delivered'),
(103, 2,  'Keyboard',     'Electronics',  1200, '2023-03-15', 'Delivered'),
(104, 3,  'Office Chair', 'Furniture',    6000, '2023-04-10', 'Pending'),
(105, 5,  'Bookshelf',    'Furniture',    3500, '2023-05-04', 'Delivered'),
(106, 6,  'Shoes',        'Fashion',      2500, '2023-05-20', 'Cancelled'),
(107, 7,  'Smartphone',   'Electronics', 15000, '2023-06-18', 'Delivered'),
(108, 8,  'T-shirt',      'Fashion',       600, '2023-07-22', 'Delivered'),
(109, 1,  'Power Bank',   'Electronics',  1800, '2023-08-03', 'Delivered'),
(110, 3,  'Table Lamp',   'Home Decor',    800, '2023-08-22', 'Delivered'),

-- Invalid CustomerID to test RIGHT/FULL join
(111, 15, 'Bed Sheet',    'Home Decor',   1200, '2023-09-10', 'Pending'),
(112, 20, 'Headphones',   'Electronics',  2000, '2023-10-02', 'Delivered');

-- ->CARTESIAN JOIN
SELECT 
    C.CustomerID,
    C.CustomerName,
    O.OrderID,
    O.Product,
    O.Amount
FROM Customers C
CROSS JOIN Orders O;
    -- diffrent syntax 
    SELECT 
    C.CustomerName,
    O.Product
    FROM Customers C, Orders O;

-- ->INNER JOIN {Only Matching Records}
SELECT C.CustomerName, C.City, O.Product, O.Amount, O.OrderDate
FROM Customers C
INNER JOIN Orders O
ON C.CustomerID = O.CustomerID;

-- ->LEFT JOIN {All Customers + Matching Orders}
SELECT C.CustomerName, C.City, O.Product, O.Status
FROM Customers C
LEFT JOIN Orders O
ON C.CustomerID = O.CustomerID;

-- ->RIGHT JOIN {All Orders + Matching Customers}
SELECT C.CustomerName, C.City, O.Product, O.OrderDate
FROM Customers C
RIGHT JOIN Orders O
ON C.CustomerID = O.CustomerID;

-- ->FULL OUTER JOIN
SELECT C.CustomerName, C.City, O.Product, O.Status
FROM Customers C
FULL OUTER JOIN Orders O
ON C.CustomerID = O.CustomerID;


    -- ->Orders without valid customers
    SELECT *
    FROM Orders O
    LEFT JOIN Customers C ON O.CustomerID = C.CustomerID
    WHERE C.CustomerID IS NULL;

    -- ->Customers who never order anything
    SELECT C.CustomerName, C.City
    FROM Customers C
    LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
    WHERE O.OrderID IS NULL;

    -- ->Total amount spent by each customer
    SELECT C.CustomerName, SUM(O.Amount) AS TotalSpent
    FROM Customers C
    LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
    GROUP BY C.CustomerName;

-- to explain self join  we have another table to understand it better
create table EMPLOYEE_MANAGER(
EmployeeNo VARCHAR(5),
NAME VARCHAR(10),
MANAGERNO VARCHAR(5))

INSERT INTO EMPLOYEE_MASTER VALUES
('E01','Tarun',NULL),
('E02','Rohan','E02'),
('E03','Priya','E01'),
('E04','Milan','E03'),
('E05','Jay','E01'),
('E06','Anjana','E04');

-- -> Retrieve the names of employee along with their manager’s name from the Employee table.
SELECT E.NAME AS EmployeeNAME,M.NAME AS MANAGERNAME
FROM EMPLOYEE_MASTER E
INNER JOIN EMPLOYEE_MASTER M
ON E.MANAGERNO =  M.EmployeeNo



