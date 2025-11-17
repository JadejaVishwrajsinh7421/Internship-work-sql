create database task_3

use task_3

-- in this i created new  table  of employess and have related fileds in it.
--general table schema i used is 
--ColumnName  Description 
--EmployeeID  Primary Key
--FirstName   Employee's first name
--LastName    Employee's last name
--Department  Department name
--Salary      Annual salary
--HireDate    Date the employee was hired

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY, -- Primary Key constraint
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    HireDate DATE
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate) VALUES
(101, 'Alice', 'Smith', 'Sales', 65000.00, '2020-05-15'),
(102, 'Robert', 'Jones', 'IT', 72000.00, '2019-11-20'),
(103, 'Maria', 'Garcia', 'Marketing', 68000.00, '2021-03-01'),
(104, 'David', 'Miller', 'Finance', 85000.00, '2018-09-10'),
(105, 'Emily', 'Chen', 'Sales', 58000.00, '2022-01-25'),
(106, 'Frank', 'Moore', 'IT', 91000.00, '2017-07-07'),
(107, 'Grace', 'Lee', 'Marketing', 61000.00, '2023-02-14'),
(108, 'Henry', 'Wilson', 'Finance', 78000.00, '2020-10-30'),
(109, 'Ivy', 'Martinez', 'IT', 52000.00, '2023-06-05'),
(110, 'Jack', 'Taylor', 'Sales', 70000.00, '2021-12-01');

-- to retrive all data of employess working in company
SELECT * FROM Employees;

--for specififc columns
SELECT FirstName, LastName, Salary
FROM Employees;

--for specific rows and data filteration
SELECT *
FROM Employees
WHERE Department = 'Sales';

--we use "AND" for combining both condition, 
--it must be both true for execution

SELECT FirstName, LastName, Department, Salary
FROM Employees
WHERE Department = 'Marketing' AND Salary > 60000.00;

-- we use "OR" for Combining condtion, 
--it excueted not only both conditions is true but also 
--only 1 is true then query is executed

SELECT *
FROM Employees
WHERE Department = 'IT' OR Salary < 50000.00;

-- like keyword general used for pattern matching it is of two types "% (Matches any sequence of zero or more characters.)" and "_(Matches any single character.)"

    --Finds employees whose first name begins with 'A'
    SELECT *
    FROM Employees
    WHERE FirstName LIKE 'A%'

    --Finds employees in a department that has the sequence 'ark' anywhere in the name
    SELECT *
    FROM Employees
    WHERE Department LIKE '%ark%'

    --Finds employees whose last name ends with 'r'
    SELECT *
    FROM Employees
    WHERE LastName LIKE '%r'

    --Finds employees whose first name has 'a' as the second lette
    SELECT *
    FROM Employees
    WHERE FirstName LIKE '_a%'

    --Finds employees whose first name is exactly 5 letters long
    SELECT *
    FROM Employees
    WHERE FirstName LIKE '_____'

    --Finds last names that start with 'S', end with 'h', and have 'i' as the third letter
    SELECT *
    FROM Employees
    WHERE LastName LIKE 'S_i_h'

    --Finds employees whose first name has 'v' as the third letter
    SELECT *
    FROM Employees
    WHERE FirstName LIKE '__v%'

    -- Find employees whose last name starts with a single character, followed by 'i', 
    -- and ends with any number of characters 
    SELECT FirstName, LastName
    FROM Employees
    WHERE LastName LIKE '_i%';

--range Filtering for this we use "between" with "and"(inclusive )

SELECT FirstName, LastName, Salary
FROM Employees
WHERE Salary BETWEEN 50000.00 AND 70000.00;

--for ordering in table output we used "ORDER BY"

    --Sorts the results by LastName alphabetically
    SELECT *
    FROM Employees
    ORDER BY LastName;

    --Sorts the results by Salary from highest to lowest.
    SELECT FirstName, LastName, Salary
    FROM Employees
    ORDER BY Salary DESC;

    --Sorting by Multiple Columns
    SELECT *
    FROM Employees
    ORDER BY Department ASC, LastName ASC;

--for limiting the rows we use "TOP" in MSSOL

    --To retrieve a specific, fixed number of rows
    -- Retrieve only the first 5 employees found in the table.
    SELECT TOP 5 *
    FROM Employees;

    --To retrieve a certain percentage of the total rows
    -- Retrieve the top 30% of the total number of employees.
    SELECT TOP 30 PERCENT FirstName, LastName, Department
    FROM Employees;


--some harder level in finding the Highest/Lowest values (TOP with ORDER BY) general used

    -- ->To find the 3 employees with the highest salaries, you must first sort the data in descending
    SELECT TOP 3 FirstName, LastName, Salary
    FROM Employees
    ORDER BY Salary DESC;

    -- ->To find the 2 employees who were most recently hired
    SELECT TOP 2 FirstName, LastName, HireDate
    FROM Employees
    ORDER BY HireDate DESC;

    -->You can combine filtering, sorting, and limiting. This query finds the highest salary among employees in the 'IT' department.
    SELECT TOP 1 FirstName, LastName, Salary
    FROM Employees
    WHERE Department = 'IT'
    ORDER BY Salary DESC;

-- ALL used keywords in one example

    -- ->This query retrieves the names and salaries of employees in the 'IT' or 'Finance' departments, whose last names start with 'M', and have a salary between 55000 and 80000. The final result is ordered by Department, then by Salary
    SELECT FirstName, LastName, Department, Salary
    FROM Employees
    WHERE (Department = 'IT' OR Department = 'Finance')
      AND LastName LIKE 'M%'
      AND Salary BETWEEN 55000.00 AND 80000.00
    ORDER BY Department ASC, Salary DESC;