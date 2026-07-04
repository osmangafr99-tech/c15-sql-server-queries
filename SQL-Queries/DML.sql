--Data Manipulation Language - DML


------------------------------------

--INSERT INTO Statement



--The INSERT INTO statement is used to insert new records in a table.

--INSERT INTO Syntax
--It is possible to write the INSERT INTO statement in two ways:

--1. Specify both the column names and the values to be inserted:

--INSERT INTO table_name (column1, column2, column3, ...)
--VALUES (value1, value2, value3, ...);

--2. If you are adding values for all the columns of the table, you do not need to specify the column names in the SQL query. However, make sure the order of the values is in the same order as the columns in the table. Here, the INSERT INTO syntax would be as follows:

--INSERT INTO table_name
--VALUES (value1, value2, value3, ...);

--script :
--this will show all data in the table
select * from Employees;


--Insert one record at a time
Insert Into Employees 
values
(10,'Emp10','079939',1000);

--Insert one record at a time with some null values
Insert Into Employees 
values
(11,'Emp11',null,null);


--insert multiple records at a time.
Insert Into Employees 
values
(2,'Emp2','552221',700),
(3,'Emp3','55554',300),
(4,'Emp4','322344',400);


--insert only selected fields
Insert Into Employees (ID, Name)
values
(5,'Emp5');


--if you forget to insert not null filed an error will occure.
Insert Into Employees (ID)
values (5);


select * from Employees;

--this will delete all records in table.
--delete from Employees;



-----------------



--UPDATE Statement



--The UPDATE statement is used to modify the existing records in a table.

--UPDATE Syntax
--UPDATE table_name
--SET column1 = value1, column2 = value2, ...
--WHERE condition;

--Note: Be careful when updating records in a table! Notice the WHERE clause in
--the UPDATE statement. The WHERE clause specifies which record(s) that should be updated.
--If you omit the WHERE clause, all records in the table will be updated!


--script :


--this will show all data in the table
select * from Employees;

-- this will update one filed at a time
Update Employees 
set Name ='Mohammed Abu-Hadhoud' 
where ID=2;

-- this will update multiple fields at a time.
Update Employees 
set Name ='Mohammed Abu-Hadhoud' ,  Salary=5000
where ID=2;

-- this will increase the salary by 200 for all employees that their salaries are less than 500
update Employees 
set Salary = Salary+ 200
where  Salary < 500 ;

-- this will increase the salary by 10% for all employees that their salaries are less than or equal 1000
update Employees 
set Salary = Salary *1.1 
where  Salary <= 1000;

-------------------------------------------

--  Delete Statement

--The DELETE statement is used to delete existing records in a table.

--DELETE Syntax
--DELETE FROM table_name WHERE condition;

--Note: Be careful when deleting records in a table! Notice the WHERE clause in
--the DELETE statement. The WHERE clause specifies which record(s) should be deleted. If you omit the WHERE clause, all records in the table will be deleted!

--script:
--this will show all data in the table
select * from Employees;

-- this will delete all employees which their salary is null
delete from Employees 
where salary is null;

-- this will delete all employees that have their id=4 , which is one record in our case
delete from Employees 
where ID=4;

-----------------------------------

--SELECT INTO Statement


--In SQL, we can copy data from one database table to a new table using the SELECT INTO command. For example,


--scrept:

--this will show all data in the table
select * from Employees;

-- this will create a new table named EmployeesCopy1 based on the selected coumns then it will copy the data from Employees table based on the condition provided
SELECT *
INTO EmpoyeesCopy1
FROM Employees;

select * from EmpoyeesCopy1;




-- this will create a new table named EmployeesCopy1 based on the selected coumns then it will copy the data from Employees table based on the condition provided
SELECT ID, Name
INTO EmpoyeesCopy2
FROM Employees;

select * from EmpoyeesCopy2;



-- this will create a new table named EmployeesCopy1 based on the selected coumns then it will 
--  copy the data from Employees table based on the condition provided which is false means no data will be copied
SELECT *
INTO EmpoyeesCopy3
FROM Employees 
where 5=6;

select * from EmpoyeesCopy3;



--Here, the SQL command copies all data from the Employees table to the new EmployeesCopy table.

--Note: The SELECT INTO statement creates a new table. If the database already has a table with the same name, SELECT INTO gives an error.

--If we want to copy data to an existing table (rather than creating a new table), we should use the INSERT INTO SELECT statement.


--------------------------------------------

--SELECT INTO Statement



--In SQL, we can copy data from one database table to a new table using the SELECT INTO command. For example,

--script:

--this will show all data in the table
select * from Employees;

-- this will create a new table named EmployeesCopy1 based on the selected coumns then it will copy the data from Employees table based on the condition provided
SELECT *
INTO EmpoyeesCopy1
FROM Employees;

select * from EmpoyeesCopy1;

-- this will create a new table named EmployeesCopy1 based on the selected coumns then it will copy the data from Employees table based on the condition provided
SELECT ID, Name
INTO EmpoyeesCopy2
FROM Employees;

select * from EmpoyeesCopy2;



-- this will create a new table named EmployeesCopy1 based on the selected coumns then it will 
--  copy the data from Employees table based on the condition provided which is false means no data will be copied
SELECT *
INTO EmpoyeesCopy3
FROM Employees 
where 5=6;

select * from EmpoyeesCopy3;





--Here, the SQL command copies all data from the Employees table to the new EmployeesCopy table.

--Note: The SELECT INTO statement creates a new table. If the database already has a table with the same name, SELECT INTO gives an error.

--If we want to copy data to an existing table (rather than creating a new table), we should use the INSERT INTO SELECT statement.


-----------------------------------


--INSERT INTO SELECT Statement


--We'll learn to copy records from one table to another with the help of examples.

--The INSERT INTO SELECT statement is used to copy records from one table to another existing table. For example,

--script:

insert into OldPersons
select  * from Persons 
where age >=30;




Run Code

Here, the SQL command copies all records from the Persons table to the OldPersons table.

Note: To run this command,

the database must already have a table named OldPersons
the column names of the OldPersons table and the Persons table must match
If we want to copy data to a new table (rather than copying in an existing table), we should use the SELECT INTO statement.

Copy all columns from one table to another table:

INSERT INTO table2
SELECT * FROM table1
WHERE condition;

Copy only some columns from one table into another table:

INSERT INTO table2 (column1, column2, column3, ...)
SELECT column1, column2, column3, ...
FROM table1
WHERE condition;

--------------------------------------------
--Misc 1


--------------------

--AUTO INCREMENT Field

--Auto-increment allows a unique number to be generated automatically when a new record is inserted into a table.

--Often this is the primary key field that we would like to be created automatically every time a new record is inserted.

--Syntax for SQL Server
--The following SQL statement defines the "Personid" column to be an auto-increment primary key field in the "Persons" table:

--CREATE TABLE Persons (
--    Personid int IDENTITY(1,1) PRIMARY KEY,
--   LastName varchar(255) NOT NULL,
--   FirstName varchar(255),
--   Age int
--);

--The MS SQL Server uses the IDENTITY keyword to perform an auto-increment feature.

--In the example above, the starting value for IDENTITY is 1, and it will increment by 1 for each new record.

--Tip: To specify that the "Personid" column should start at value 10 and increment by 5, change it to IDENTITY(10,5).

--To insert a new record into the "Persons" table, we will NOT have to specify a value for the "Personid" column (a unique value will be added automatically):

--INSERT INTO Persons (FirstName,LastName)
--VALUES ('Mohammed','Abu-Hadhoud');

--The SQL statement above would insert a new record into the "Persons" table. The "Personid" column would be assigned a unique value. The "FirstName" column would be set to "Mohammed" and the "LastName" column would be set to "Abu-Hadhoud".


--script:

CREATE TABLE Departments (
    ID int identity(1,1)  NOT NULL,
    Name nvarchar(50) NOT NULL,
    PRIMARY KEY (ID)
);

-----------------------

insert into Departments 
values ('HR');

print @@identity;


-----------------------------------------

--Delete Vs Truncate


--The main difference between both statements is that DELETE FROM statement supports WHERE clause whereas TRUNCATE does not.

--Also the DELETE FROM statement does not reset the auto number (identity field) while the TRUNCATE does reset the identity fields.

--That means, we can delete single or multiple rows using the DELETE FROM statement while the TRUNCATE statement deletes all records from the table at once.

--We can mimic the TRUNCATE statement with DELETE FROM statement by omitting the WHERE clause. For example,


--script 1 :

DELETE FROM Customers;

Run Code

is similar to,

--script 2 :
TRUNCATE TABLE Customers;


select * from Departments;

--this will delete all rows but will not reset the identity counter.
delete from Departments;


--this will delete all rows and reset the identity counter.
truncate table departments;

insert into Departments 
values ('HR');

print @@identity;


script 3 :

select * from Departments;

--this will delete all rows but will not reset the identity counter.
delete from Departments;


--this will delete all rows and reset the identity counter.
truncate table departments;

insert into Departments 
values ('HR');

print @@identity;

-----------------------------
