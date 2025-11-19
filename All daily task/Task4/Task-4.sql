create database task_4

use task_4

--for detail understanding the concept of grouping with having and without having ,I do more examples on this 2 diffrent category

--this all are aggreation without having
CREATE TABLE EMP( 
EID  INT, 
EName VARCHAR(25), 
Department VARCHAR(25) ,
Salary INT ,
JOININGDATE DATE,
City VARCHAR(25) ,
GENDER VARCHAR(20));

INSERT INTO EMP VALUES
(101 ,'Rahul', 'Admin' ,56000 ,'1990-01-01', 'Rajkot' ,'MALE'),
(102 ,'Hardik', 'IT' ,18000 ,'1990-09-25', 'Ahmedabad' ,'MALE'),
(103 ,'Bhavin', 'HR' ,25000 ,'1991-05-14', 'Baroda' ,'MALE'),
(104 ,'Bhoomi', 'Admin' ,39000 ,'1991-02-08', 'Rajkot' ,'FEMALE'),
(105 ,'Rohit', 'IT' ,17000 ,'1990-07-23', 'Jamnagar' ,'MALE'),
(106 ,'Priya', 'IT' ,9000 ,'1990-10-18', 'Ahmedabad' ,'FEMALE'),
(107 ,'Bhoomi', 'HR' ,34000 ,'1991-12-25', 'Rajkot' ,'FEMALE')

SELECT *
FROM EMP

--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively. 
SELECT MAX(SALARY) AS 'Maximum',MIN(SALARY) AS 'Minimum'
FROM EMP
--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, respectively. 
SELECT SUM(SALARY) AS 'Total_Sal',AVG(SALARY) AS 'Average_Sal'
FROM EMP

--3. Find total number of employees of EMPLOYEE table.
SELECT COUNT(EName) AS 'Total_employees'
FROM EMP

--4. Find highest salary from Rajkot city. 
SELECT MAX(SALARY) AS 'Maximum'
FROM EMP
WHERE CITY = 'Rajkot'
 
--5. Give maximum salary from IT department. 
SELECT MAX(SALARY) AS 'Maximum'
FROM EMP
WHERE Department = 'IT'

--6. Count employee whose joining date is after 8-feb-91.
SELECT COUNT(ENAME) AS 'JOINING_DATE'
FROM EMP
WHERE JOININGDATE >='1991-02-08'

--7. Display average salary of Admin department.
SELECT AVG(SALARY) AS 'Average_ADMIN'
FROM EMP
WHERE Department = 'Admin'

--8. Display total salary of HR department. 
SELECT SUM(SALARY) AS 'SUM_SALARY_HR'
FROM EMP
WHERE Department = 'HR'

--9. Count total number of cities of employee without duplication. 
SELECT COUNT( DISTINCT CITY) AS 'CITY'
FROM EMP
--10. Count unique departments. 
SELECT COUNT( DISTINCT Department) AS 'DEPT'
FROM EMP
--11. Give minimum salary of employee who belongs to Ahmedabad. 
SELECT MIN(SALARY) AS 'Minimum'
FROM EMP
WHERE CITY ='Ahmedabad'

--12. Find city wise highest salary. 
SELECT MAX(SALARY) AS 'MAX_SAL',Department
FROM EMP
GROUP BY Department
--13. Find department wise lowest salary. 
SELECT MIN(SALARY) AS 'MIN_SAL',Department
FROM EMP
GROUP BY Department

--14. Display city with the total number of employees belonging to each city. 
SELECT COUNT(ENAME) AS 'Total_employees',CITY
FROM EMP
GROUP BY CITY
--15. Give total salary of each department of EMP table. 
SELECT SUM(Salary) AS 'Total_SALARY',Department
FROM EMP
GROUP BY Department

--16. Give average salary of each department of EMP table without displaying the respective department name
SELECT AVG(Salary) AS 'Total_SALARY'
FROM EMP
GROUP BY Department
 
--17. Count the number of employees for each department in every city.
SELECT COUNT(CITY) AS 'NO_OF_EMP1_DEPT_CITY',Department
FROM EMP
GROUP BY Department

--18. Calculate the total salary distributed to male and FEMALE employees. 
SELECT SUM(Salary) AS 'GENDER_SALARY',GENDER
FROM EMP
GROUP BY GENDER

--19. Give city wise maximum and minimum salary of FEMALE employees. 
SELECT MAX(Salary) AS 'FEMALE_MAX_SALARY',MIN(Salary) AS 'FEMALE_MIN_SALARY'
FROM EMP
WHERE GENDER = 'FEMALE'

--20. Calculate department, city, and gender wise average salary. 
SELECT AVG(Salary) AS 'AVG_SAL_GEN_CITY',Department,CITY,GENDER
FROM EMP
GROUP BY Department,CITY,GENDER

--1. Count the number of employees living in Rajkot.
SELECT COUNT(EName) AS 'EMP_RAJKOT'
FROM EMP
WHERE CITY = 'Rajkot'

--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE. 
SELECT MAX(SALARY) - MIN(SALARY) AS 'DIFFERENCE'
FROM EMP

--3. Display the total number of employees hired before 1st January, 1991. 
SELECT COUNT(ENAME) AS 'JOINING_DATE'
FROM EMP
WHERE JOININGDATE <'1991-01-01'

--1. Count the number of employees living in Rajkot or Baroda.
SELECT COUNT(EName) AS 'EMP_'
FROM EMP
WHERE CITY  IN ('Rajkot','Baroda')

--2. Display the total number of employees hired before 1st January, 1991 in IT department. 
SELECT COUNT(ENAME) AS 'JOINING_DATE'
FROM EMP
WHERE JOININGDATE < '1991-01-01' AND Department = 'IT'

--3. Find the Joining Date wise Total Salaries.
SELECT SUM(SALARY) AS 'SUM_SAL' , JOININGDATE
FROM EMP
GROUP BY JOININGDATE 

--4. Find the Maximum salary department & city wise in which city name starts with ‘R’.
SELECT MAX(SALARY),department,CITY
FROM EMP
WHERE CITY LIKE 'R%'
GROUP BY department,CITY



-- this all are aggreation with having

CREATE TABLE SALES_DATA (
REGION VARCHAR(30),
PRODUCT VARCHAR(20),
SALES_AMOUNT INT,
YEAR INT );

INSERT INTO SALES_DATA VALUES
('North America','Watch',1500,'2023'),
('Europe','Moblie',1200,'2023'),
('Asia','Watch',1800,'2023'),
('North America','TV',900,'2024'),
('Europe','Watch',2000,'2024'),
('Asia','Moblie',1000,'2024'),
('North America','Moblie',1600,'2023'),
('Europe','TV',1500,'2023'),
('Asia','TV',1100,'2024'),
('North America','Watch',1700,'2024')

SELECT *
FROM SALES_DATA

--1. Display Total Sales Amount by Region. 
SELECT SUM(SALES_AMOUNT) AS 'SUM_SAL_REG',Region
FROM SALES_DATA
GROUP BY REGION

--2. Display Average Sales Amount by Product 
SELECT AVG(SALES_AMOUNT) AS 'SUM_SAL_PRO',PRODUCT
FROM SALES_DATA
GROUP BY PRODUCT

--3. Display Maximum Sales Amount by Year 
SELECT MAX(SALES_AMOUNT) AS 'SUM_SAL_YY',YEAR
FROM SALES_DATA
GROUP BY YEAR

--4. Display Minimum Sales Amount by Region and Year 
SELECT MIN(SALES_AMOUNT) AS 'SUM_SAL_YY',YEAR,REGION
FROM SALES_DATA
GROUP BY YEAR,REGION

--5. Count of Products Sold by Region 
SELECT COUNT(SALES_AMOUNT) AS 'COUNT_SAL_PRO',REGION
FROM SALES_DATA

GROUP BY REGION

--6. Display Sales Amount by Year and Product 
SELECT COUNT(SALES_AMOUNT) AS 'COUNT_SAL_PRO',YEAR,PRODUCT
FROM SALES_DATA
GROUP BY YEAR,PRODUCT

--7. Display Regions with Total Sales Greater Than 5000
SELECT SUM(SALES_AMOUNT) AS SALES_SUM,REGION
FROM SALES_DATA
GROUP BY REGION
HAVING SUM(SALES_AMOUNT) > 5000

--8. Display Products with Average Sales Less Than 10000 
SELECT AVG(SALES_AMOUNT) AS AVG_SALES, PRODUCT
FROM SALES_DATA
GROUP BY PRODUCT
HAVING AVG(SALES_AMOUNT) <10000

--9. Display Years with Maximum Sales Exceeding 500 
SELECT MAX(SALES_AMOUNT) AS MAX_SALES, YEAR
FROM SALES_DATA
GROUP BY YEAR
HAVING MAX(SALES_AMOUNT) >500

--10. Display Regions with at Least 3 Distinct Products Sold. 
SELECT COUNT (DISTINCT PRODUCT) AS PRODUCT_SOLD,REGION
FROM SALES_DATA
GROUP BY REGION
HAVING COUNT (DISTINCT PRODUCT) > 3 OR COUNT (DISTINCT PRODUCT)=3

--11. Display Years with Minimum Sales Less Than 1000 
SELECT MIN(SALES_AMOUNT) AS MIN_SALES,YEAR
FROM SALES_DATA
GROUP BY YEAR
HAVING MIN(SALES_AMOUNT) <1000

--12. Display Total Sales Amount by Region for Year 2023, Sorted by Total Amount 
SELECT SUM(SALES_AMOUNT) AS SUM_DISPLAY,YEAR,REGION
FROM SALES_DATA
WHERE YEAR = 2023
GROUP BY REGION,YEAR

--13. Find the Region Where 'Mobile' Had the Lowest Total Sales Across All Years.
SELECT MIN(SALES_AMOUNT) AS MIN_DIS,REGION,YEAR,PRODUCT
FROM SALES_DATA
GROUP BY REGION,YEAR,PRODUCT
HAVING PRODUCT='Moblie'

--14. Find the Product with the Highest Sales Across All Regions in 2023. 
SELECT MAX(SALES_AMOUNT) AS MAX_COUNT,PRODUCT,REGION
FROM SALES_DATA
WHERE YEAR = 2023
GROUP BY REGION,PRODUCT
--15. Find Regions Where 'TV' Sales in 2023 Were Greater Than 1000. 
SELECT SUM(SALES_AMOUNT) AS COUNT_CONDITION,PRODUCT,REGION
FROM SALES_DATA
WHERE YEAR = 2023
GROUP BY PRODUCT, REGION
HAVING PRODUCT = 'TV' AND SUM(SALES_AMOUNT)>1000

--16. Display Count of Orders by Year and Region, Sorted by Year and Region 
SELECT COUNT(SALES_AMOUNT) AS COUNT_ORDERS,YEAR,REGION
FROM SALES_DATA
GROUP BY YEAR, REGION

--17. Display Regions with Maximum Sales Amount Exceeding 1000 in Any Year, Sorted by Region 
SELECT MAX(SALES_AMOUNT) AS MAX_ORDERS,REGION
FROM SALES_DATA
GROUP BY REGION
HAVING  MAX(SALES_AMOUNT)>1000

--18. Display Years with Total Sales Amount Less Than 10000, Sorted by Year Descending 
SELECT SUM(SALES_AMOUNT) AS SUM_LESS,YEAR
FROM SALES_DATA
GROUP BY YEAR
HAVING SUM(SALES_AMOUNT)<10000
ORDER BY  SUM(SALES_AMOUNT) DESC

--19. Display Top 3 Regions by Total Sales Amount in Year 2024 
SELECT  TOP 3 SUM(SALES_AMOUNT) AS SUM_LESS,REGION
FROM SALES_DATA
WHERE YEAR = 2024
GROUP BY REGION

--20. Find the Year with the Lowest Total Sales Across All Regions.
SELECT MIN(SALES_AMOUNT) AS LOWEST_SALES,REGION,YEAR
FROM SALES_DATA
GROUP BY YEAR,REGION 

--21. Display Products with Average Sales Amount Between 1000 and 2000, Ordered by Product Name 
SELECT AVG(SALES_AMOUNT) AS AVG_IN_RANGE,PRODUCT
FROM SALES_DATA
GROUP BY PRODUCT
HAVING AVG(SALES_AMOUNT) BETWEEN 1000 AND 2000

--22. Display Years with More Than 1 Orders from Each Region 
SELECT COUNT(PRODUCT) AS MORE_1_ORDER,REGION,YEAR
FROM SALES_DATA
GROUP BY YEAR,REGION
HAVING COUNT(PRODUCT)>1

--23. Display Regions with Average Sales Amount Above 1500 in Year 2023 sort by amount in descending. 
SELECT AVG(SALES_AMOUNT) AS AVG_ABOVE1500,REGION
FROM SALES_DATA
WHERE YEAR = 2023
GROUP BY REGION
HAVING AVG(SALES_AMOUNT)>1500
ORDER BY AVG(SALES_AMOUNT) DESC

--24. Find out region wise duplicate product. 
SELECT COUNT(PRODUCT) AS MORE_1_ORDER,REGION,PRODUCT
FROM SALES_DATA
GROUP BY REGION,PRODUCT
HAVING COUNT(PRODUCT)>1
--25. Find out year wise duplicate product. 
SELECT COUNT(PRODUCT) AS MORE_1_ORDER,YEAR,PRODUCT
FROM SALES_DATA
GROUP BY YEAR,PRODUCT
HAVING COUNT(PRODUCT)>1