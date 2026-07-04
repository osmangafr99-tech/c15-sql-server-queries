---DQl


------------------------------------
----The SQL SELECT Statement


--The SELECT statement is used to select data from a database.
--The data returned is stored in a result table, called the result-set.
--SELECT Syntax
--SELECT column1, column2, ...
--FROM table_name;

--Here, column1, column2, ... are the field names of the table you want to select data from. If you want to select all the fields available in the table, use the following syntax:

--SELECT * FROM table_name;

--script :

Select * from Employees;

Select Employees.* from Employees;

Select ID, FirstName, LastName,MonthlySalary From Employees;

Select ID, FirstName, DateOfBirth From Employees;

Select * from Departments;

Select * from Countries;

--------------------------------------------------------

--The SQL SELECT DISTINCT Statement



--The SELECT DISTINCT statement is used to return only distinct (different) values.

--Inside a table, a column often contains many duplicate values; and sometimes you only want to list the different (distinct) values.

--SELECT DISTINCT Syntax
--SELECT DISTINCT column1, column2, ...
--FROM table_name;

--script :

Select DepartmentID from Employees;

Select Distinct  DepartmentID from Employees;



Select FirstName from Employees;

Select Distinct  FirstName from Employees;


Select FirstName, DepartmentID from Employees;

Select distinct FirstName, DepartmentID from Employees;


-----------------------------------------

--The SQL WHERE Clause




--The WHERE clause is used to filter records.

--It is used to extract only those records that fulfill a specified condition.

--WHERE Syntax
--SELECT column1, column2, ...
--FROM table_name
--WHERE condition;

--Note: The WHERE clause is not only used in SELECT statements, it is also used in UPDATE, DELETE, etc.!

--The SQL AND, OR and NOT Operators
--The WHERE clause can be combined with AND, OR, and NOT operators.

--The AND and OR operators are used to filter records based on more than one condition:

--The AND operator displays a record if all the conditions separated by AND are TRUE.
--The OR operator displays a record if any of the conditions separated by OR is TRUE.
--The NOT operator displays a record if the condition(s) is NOT TRUE.

--AND Syntax
--SELECT column1, column2, ...
--FROM table_name
--WHERE condition1 AND condition2 AND condition3 ...;

--OR Syntax
--SELECT column1, column2, ...
--FROM table_name
--WHERE condition1 OR condition2 OR condition3 ...;

--NOT Syntax
--SELECT column1, column2, ...
--FROM table_name
--WHERE NOT condition;




--script :

Select * from Employees
where Gendor='F';

Select * from Employees
where  MonthlySalary<=500;


Select * from Employees
where  MonthlySalary>500;

Select * from Employees
where Not MonthlySalary<=500;


Select * from Employees
where MonthlySalary<500 and Gendor='F';

select * from Employees
where CountryID=1;


select * from Employees
where Not CountryID=1;


select * from Employees
where  CountryID <> 1;


select * from Employees
where DepartmentID=1;

select * from Employees
where DepartmentID=1 and Gendor='M';


select * from Employees
where DepartmentID=1 Or DepartmentID=2;

select * from Employees
where DepartmentID=1 AND DepartmentID=2;


Select * from Employees
where ExitDate is Null;


Select * from Employees
where ExitDate  is Not Null;

-----------------------------------------

--The SQL IN Operator




--The IN operator allows you to specify multiple values in a WHERE clause.

--The IN operator is a shorthand for multiple OR conditions.

--IN Syntax
--SELECT column_name(s)
--FROM table_name
--WHERE column_name IN (value1, value2, ...);

--or:

--SELECT column_name(s)
--FROM table_name
--WHERE column_name IN (SELECT STATEMENT);

--script :

select * from Employees
where DepartmentID=1 Or DepartmentID=2;


select * from Employees
where DepartmentID=1 Or DepartmentID=2 or DepartmentID=7;


select * from Employees
where DepartmentID=1 Or DepartmentID=2 or DepartmentID=5 or DepartmentID=7;


select * from Employees
where DepartmentID in (1,2,5,7);


select * from Employees
where FirstName in ('Jacob','Brooks','Harper');


select Departments.Name from Departments 
where 
ID in ( select DepartmentID from Employees where MonthlySalary <=210 );


select Departments.Name from Departments 
where 
ID not in ( select DepartmentID from Employees where MonthlySalary <=210 );



----------------------------------------------------------------------

--The SQL ORDER BY Keyword




--The ORDER BY keyword is used to sort the result-set in ascending or descending order.

--The ORDER BY keyword sorts the records in ascending order by default. To sort the records in descending order, use the DESC keyword.

--ORDER BY Syntax
--SELECT column1, column2, ...
--FROM table_name
--ORDER BY column1, column2, ... ASC|DESC;


--script :


select ID, FirstName,MonthlySalary from Employees
where DepartmentID=1


select ID, FirstName,MonthlySalary from Employees
where DepartmentID=1
Order By FirstName ;

select ID, FirstName,MonthlySalary from Employees
where DepartmentID=1
Order By FirstName ASC;

select ID, FirstName,MonthlySalary from Employees
where DepartmentID=1
Order By FirstName desc;

select ID, FirstName,MonthlySalary from Employees
where DepartmentID=1
Order By MonthlySalary ;


select ID, FirstName,MonthlySalary from Employees
where DepartmentID=1
Order By MonthlySalary Asc;


select ID, FirstName,MonthlySalary from Employees
where DepartmentID=1
Order By MonthlySalary Desc;



select ID, FirstName,MonthlySalary from Employees
where DepartmentID=1
Order By FirstName , MonthlySalary ;


select ID, FirstName,MonthlySalary from Employees
where DepartmentID=1
Order By FirstName ASC, MonthlySalary Desc;

----------------------------------------------------


--The SQL SELECT TOP Clause



--The SELECT TOP clause is used to specify the number of records to return.

--The SELECT TOP clause is useful on large tables with thousands of records. Returning a large number of records can impact performance.

--Note: Not all database systems support the SELECT TOP clause. MySQL supports the LIMIT clause to select a limited number of records, while Oracle uses FETCH FIRST n ROWS ONLY and ROWNUM.

--SQL Server / MS Access Syntax:

--SELECT TOP number|percent column_name(s)
--FROM table_name
--WHERE condition;




--script :

Select * from Employees;


-- This will show top 5 employees.
Select top 5 * from Employees;


-- This will show top 10% of the data.
select top 10 percent * from Employees;

-- this will show the all salaries ordered from the heighest to lowest.
select  MonthlySalary from employees
order by MonthlySalary Desc;



-- this will show the all salaries ordered from the heighest to lowest without redundancy.
select distinct MonthlySalary from employees
order by MonthlySalary Desc;

-- this will show the heighest 3 salaries.
select  distinct  top 3 MonthlySalary from employees
order by MonthlySalary Desc;


--This will show all employees who takes one of the heighest 3 salaries.

select ID , FirstName, MonthlySalary from Employees where MonthlySalary In
(
	select  distinct  top 3 MonthlySalary from employees
	order by MonthlySalary Desc
)

Order By MonthlySalary Desc



--This will show all employees who takes one of the Lowest 3 salaries.
select ID , FirstName, MonthlySalary from Employees where MonthlySalary In
(
	select  distinct  top 3 MonthlySalary from employees
	order by MonthlySalary ASC
)

Order By MonthlySalary ASC


-------------------------------------------------------

--The SQL BETWEEN Operator



--The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.

--The BETWEEN operator is inclusive: begin and end values are included. 

--BETWEEN Syntax
--SELECT column_name(s)
--FROM table_name
--WHERE column_name BETWEEN value1 AND value2;




--script :


Select * from Employees where
(MonthlySalary >=500 and MonthlySalary <=1000)


Select * from Employees where
MonthlySalary Between 500 and 1000;

-----------------------------------------------------


--The SQL COUNT(), AVG() and SUM() Functions





--The COUNT() function returns the number of rows that matches a specified criterion.

--COUNT() Syntax
--SELECT COUNT(column_name)
--FROM table_name
--WHERE condition;

--The AVG() function returns the average value of a numeric column. 

--AVG() Syntax
--SELECT AVG(column_name)
--FROM table_name
--WHERE condition;

--The SUM() function returns the total sum of a numeric column. 

--SUM() Syntax
--SELECT SUM(column_name)
--FROM table_name
--WHERE condition;

--The SQL MIN() and MAX() Functions
--The MIN() function returns the smallest value of the selected column.

--The MAX() function returns the largest value of the selected column.

--MIN() Syntax
--SELECT MIN(column_name)
--FROM table_name
--WHERE condition;

--MAX() Syntax
--SELECT MAX(column_name)
--FROM table_name
--WHERE condition;

--script :


select TotalCount=Count(MonthlySalary), 
	   TotalSum=Sum(MonthlySalary),
	   Average=Avg(MonthlySalary),
	   MinSalary=Min(MonthlySalary),
	   MaxSalary=Max(MonthlySalary) 
	   
	   from Employees;



select  TotalCount=Count(MonthlySalary), 
	   TotalSum=Sum(MonthlySalary),
	   Average=Avg(MonthlySalary),
	   MinSalary=Min(MonthlySalary),
	   MaxSalary=Max(MonthlySalary) 
	   
	   from Employees where DepartmentID=1
	   
	   
select * from employees;

select TotalEmployees = count (ID) from Employees;

--count function only counts the not null values.
select ResignedEmployees= count(ExitDate)  from employees;


----------------------------------------------


--The SQL GROUP BY Statement



--The GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".

--The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.

--GROUP BY Syntax
--SELECT column_name(s)
--FROM table_name
--WHERE condition
--GROUP BY column_name(s)
--ORDER BY column_name(s);

--script :


select TotalCount=Count(MonthlySalary), 
	   TotalSum=Sum(MonthlySalary),
	   Average=Avg(MonthlySalary),
	   MinSalary=Min(MonthlySalary),
	   MaxSalary=Max(MonthlySalary) 
	   
	   from Employees;


select  TotalCount=Count(MonthlySalary), 
	   TotalSum=Sum(MonthlySalary),
	   Average=Avg(MonthlySalary),
	   MinSalary=Min(MonthlySalary),
	   MaxSalary=Max(MonthlySalary) 
	   
	   from Employees where DepartmentID=3
	   

select DepartmentID, TotalCount=Count(MonthlySalary), 
	   TotalSum=Sum(MonthlySalary),
	   Average=Avg(MonthlySalary),
	   MinSalary=Min(MonthlySalary),
	   MaxSalary=Max(MonthlySalary) 
	   
	   from Employees
       Group By DepartmentID
	   order by DepartmentID

	   ---------------------------------------------------

--	   The SQL HAVING Clause





--The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions in a direct way.

--HAVING Syntax
--SELECT column_name(s)
--FROM table_name
--WHERE condition
--GROUP BY column_name(s)
--HAVING condition
--ORDER BY column_name(s);

--script :



select DepartmentID, TotalCount=Count(MonthlySalary), 
	   TotalSum=Sum(MonthlySalary),
	   Average=Avg(MonthlySalary),
	   MinSalary=Min(MonthlySalary),
	   MaxSalary=Max(MonthlySalary) 
	   
	   from Employees
	
       Group By DepartmentID
	  
	   order by DepartmentID


--Having is the where satement for group by
select DepartmentID, TotalCount=Count(MonthlySalary), 
	   TotalSum=Sum(MonthlySalary),
	   Average=Avg(MonthlySalary),
	   MinSalary=Min(MonthlySalary),
	   MaxSalary=Max(MonthlySalary) 
	   
	   from Employees
       Group By DepartmentID
	  having Count(MonthlySalary) > 100



-- Same solution without having :-)
select * from 
(

   select DepartmentID, TotalCount=Count(MonthlySalary), 
	   TotalSum=Sum(MonthlySalary),
	   Average=Avg(MonthlySalary),
	   MinSalary=Min(MonthlySalary),
	   MaxSalary=Max(MonthlySalary) 
	   
	   from Employees
	
       Group By DepartmentID
	  
) R1

where R1.TotalCount> 100;

-----------------------------------------------------------

--SQL Wildcard Characters




--A wildcard character is used to substitute one or more characters in a string.

--Wildcard characters are used with the LIKE operator. The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.


--script :


--Execute these satatements to update data
Update Employees 
set FirstName ='Mohammed' , LastName='Abu-Hadhoud'
where ID= 285;


Update Employees 
set FirstName ='Mohammad' , LastName='Maher'
where ID= 286;

--------------------------------

select ID, FirstName, LastName from Employees
Where firstName = 'Mohammed' or FirstName ='Mohammad'; 


-- will search form Mohammed or Mohammad
select ID, FirstName, LastName from Employees
Where firstName like 'Mohamm[ae]d';

-------------------------------------

--You can use Not 
select ID, FirstName, LastName from Employees
Where firstName Not like 'Mohamm[ae]d';

--------------------

select ID, FirstName, LastName from Employees
Where firstName like 'a%' or firstName like 'b%' or firstName like 'c%';


-- search for all employees that their first name start with a or b or c
select ID, FirstName, LastName from Employees
Where firstName like '[abc]%';


---------------------------------
-- search for all employees that their first name start with any letter from a to l
select ID, FirstName, LastName from Employees
Where firstName like '[a-l]%';
---------------------------------



--------------------------------------------------------------------

--SQL JOIN


--A JOIN clause is used to combine rows from two or more tables, based on a related column between them.

--Different Types of SQL JOINs
--Here are the different types of the JOINs in SQL:

--(INNER) JOIN: Returns records that have matching values in both tables
--LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
--RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
--FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table

--SQL INNER JOIN
--The SQL INNER JOIN joins two tables based on a common column, and selects records that have matching values in these columns.

--Example
SELECT Customers.customer_id, Customers.first_name, Orders.amount
FROM Customers
INNER JOIN Orders
ON Customers.customer_id = Orders.customer;


--Here, the SQL command selects customer_id and first_name columns (from the Customers table) and the amount column (from the Orders table).

--And, the result set will contain those rows where there is a match between customer_id (of the Customers table) and customer (of the Orders table).

--Syntax of INNER JOIN
--The syntax of INNER JOIN is:

SELECT columns
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;


--INNER JOIN With WHERE Clause
--Here's an example of the INNER JOIN with the WHERE clause:'

SELECT Customers.customer_id, Customers.first_name, Orders.amount
FROM Customers
INNER JOIN Orders
ON Customers.customer_id = Orders.customer
WHERE Orders.amount >= 500;


--Here, the SQL command joins two tables and selects rows where the amount is greater than or equal to 500.


--script :

-- Join and Inner Join are the same

select * from Customers;

select * from Orders;


SELECT Customers.CustomerID, Customers.Name, Orders.Amount
FROM Customers 
JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID;



SELECT Customers.CustomerID, Customers.Name, Orders.Amount
FROM Customers 
Inner JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID;




--script :


--This code for HR_Database

--Inner Join two Tables
SELECT        Employees.ID, Employees.FirstName, Employees.LastName, Departments.Name as DeptName
FROM            Employees INNER JOIN
                         Departments ON Employees.DepartmentID = Departments.ID


--Inner joind with where
SELECT        Employees.ID, Employees.FirstName, Employees.LastName, Departments.Name as DeptName
FROM            Employees INNER JOIN
                         Departments ON Employees.DepartmentID = Departments.ID
where Departments.Name = 'IT';


--Inner Join Three Tables
SELECT        Employees.ID, Employees.FirstName, Employees.LastName, Departments.Name as DeptName, Countries.Name AS CountryName
FROM            Employees INNER JOIN
                         Departments ON Employees.DepartmentID = Departments.ID INNER JOIN
                         Countries ON Employees.CountryID = Countries.ID


						 
--Inner Join Three Tables with where
SELECT        Employees.ID, Employees.FirstName, Employees.LastName, Departments.Name as DeptName, Countries.Name AS CountryName
FROM            Employees INNER JOIN
                         Departments ON Employees.DepartmentID = Departments.ID INNER JOIN
                         Countries ON Employees.CountryID = Countries.ID
	where Countries.Name = 'USA';



	-----------------------------------------------------------------

--	SQL LEFT JOIN Keyword



--The LEFT JOIN keyword returns all records from the left table (table1), and the matching records from the right table (table2). The result is 0 records from the right side, if there is no match.

--LEFT JOIN Syntax
--SELECT column_name(s)
--FROM table1
--LEFT JOIN table2
--ON table1.column_name = table2.column_name;

--Note: In some databases LEFT JOIN is called LEFT OUTER JOIN.


--The SQL LEFT JOIN joins two tables based on a common column, and selects records that have matching values in these columns and remaining rows from the left table.


--Example
SELECT Customers.customer_id, Customers.first_name, Orders.amount
FROM Customers
LEFT JOIN Orders
ON Customers.customer_id = Orders.customer;


--Here, the SQL command selects customer_id and first_name columns (from the Customers table) and the amount column (from the Orders table).

--And, the result set will contain those rows where there is a match between customer_id (of the Customers table) and customer (of the Orders table) along with all the remaining rows from the Customers table.



--script :


--Left Join and Left Outer Join are the same.

--Left Join: gets all data from table customers and only matched data from table orders
SELECT Customers.CustomerID, Customers.Name, Orders.Amount
FROM Customers 
Left JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID;


SELECT Customers.CustomerID, Customers.Name, Orders.Amount
FROM Customers 
Left Outer JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID;

---------------------------------------------------------

---SQL RIGHT JOIN Keyword



--The RIGHT JOIN keyword returns all records from the right table (table2), and the matching records from the left table (table1). The result is 0 records from the left side, if there is no match.
--RIGHT JOIN Syntax
--SELECT column_name(s)
--FROM table1
--RIGHT JOIN table2
--ON table1.column_name = table2.column_name;

--Note: In some databases RIGHT JOIN is called RIGHT OUTER JOIN.

--SQL FULL OUTER JOIN Keyword
--The FULL OUTER JOIN keyword returns all records when there is a match in left (table1) or right (table2) table records.

--Tip: FULL OUTER JOIN and FULL JOIN are the same.

--FULL OUTER JOIN Syntax
--SELECT column_name(s)
--FROM table1
--FULL OUTER JOIN table2
--ON table1.column_name = table2.column_name
--WHERE condition;


--script :

--Inner Join
SELECT        Customers.CustomerID, Customers.Name, Orders.Amount
FROM            Customers INNER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID
--Left Join
SELECT        Customers.CustomerID, Customers.Name, Orders.Amount
FROM            Customers LEFT OUTER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID
--Right Join
SELECT        Customers.CustomerID, Customers.Name, Orders.Amount
FROM            Customers RIGHT OUTER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID
--Full Join
SELECT        Customers.CustomerID, Customers.Name, Orders.Amount
FROM            Customers FULL OUTER JOIN
                         Orders ON Customers.CustomerID = Orders.CustomerID


---------------------------------------------------------------------------

--The SQL EXISTS Operator



--The EXISTS operator is used to test for the existence of any record in a subquery.

--The EXISTS operator returns TRUE if the subquery returns one or more records.

--EXISTS Syntax
--SELECT column_name(s)
--FROM table_name
--WHERE EXISTS
--(SELECT column_name FROM table_name WHERE condition);

--The SQL EXISTS operator executes the outer SQL query if the subquery is not NULL (empty result-set).

--script:



select X='yes'
where  exists 
   ( 
	select * from Orders
	where customerID= 3 and Amount < 600
	)


select * from Customers T1
where 
  exists 
   ( 
	select * from Orders
	where customerID= T1.CustomerID and Amount < 600
	)

--More optimized and faster
select * from Customers T1
where 
  exists 
   ( 
	select top 1 * from Orders
	where customerID= T1.CustomerID and Amount < 600
	)


--More optimized and faster
select * from Customers T1
where 
  exists 
   ( 
	select top 1 R='Y'  from Orders
	where customerID= T1.CustomerID and Amount < 600
	)

--------------------------------------------------------------------

--The SQL UNION Operator




--The UNION operator is used to combine the result-set of two or more SELECT statements.

--Every SELECT statement within UNION must have the same number of columns
--The columns must also have similar data types
--The columns in every SELECT statement must also be in the same order
--UNION Syntax
--SELECT column_name(s) FROM table1
--UNION
--SELECT column_name(s) FROM table2;

--UNION ALL Syntax
--The UNION operator selects only distinct values by default. To allow duplicate values, use UNION ALL:

--SELECT column_name(s) FROM table1
--UNION ALL
--SELECT column_name(s) FROM table2;

--Note: The column names in the result-set are usually equal to the column names in the first SELECT statement.

--script:

select * from ActiveEmployees

select * from ResignedEmployees


select * from ActiveEmployees
Union
select * from ResignedEmployees

--this will remove the redundancy from the resultset (distinct results only)
select * from Departments
union 
select * from Departments;

--this will append data regardeless of any redundancy
select * from Departments
union ALL
select * from Departments;

--------------------------------------------------------------
--The SQL CASE Expression




--The CASE expression goes through conditions and returns a value when the first condition is met (like an if-then-else statement). So, once a condition is true, it will stop reading and return the result. If no conditions are true, it returns the value in the ELSE clause.

--If there is no ELSE part and no conditions are true, it returns NULL.

--CASE Syntax
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;

--script:



select ID, FirstName, LastName, GendorTitle =
CASE
    WHEN Gendor='M' THEN 'Male'
    WHEN Gendor='F' THEN 'Female'
    ELSE 'Unknown'
END

from Employees

-----------------------------------------

select ID, FirstName, LastName,  GendorTitle =
CASE
    WHEN Gendor='M' THEN 'Male'
    WHEN Gendor='F' THEN 'Female'
    ELSE 'Unknown'
END,

Status =
CASE
    WHEN ExitDate is null THEN 'Active'
    WHEN Gendor is Not null THEN 'Resigned'
END
from Employees

-------------------------------------------------------

select ID, FirstName, LastName,MonthlySalary,

NewSalaryToBe =
CASE
    WHEN Gendor='M' THEN MonthlySalary * 1.1
    WHEN Gendor='F' THEN MonthlySalary * 1.15
   
END
from Employees
--------------------------------------
