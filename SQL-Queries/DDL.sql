--#1-SQL - Data Definition Language - DDL:

-----------
--SQL CREATE DATABASE Statement

--Before we can work with database tables, we must create a database first.

--The CREATE DATABASE statement is used to create database tables. For example,

--Script :
CREATE DATABASE Koko;

--Here, the SQL command creates a database named Koko.



-----------------------------------------------------

--CREATE DATABASE IF NOT EXISTS


--If there is already a database with the same name, SQL will throw an error while creating a database.

-- In such situations, we can use the the following code to create a database only if there is no existing database with the same name. For example,

--Script:
 IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'koko')
  BEGIN
    CREATE DATABASE koko;
  END

  -----------------------------------------------------------------------------------
 
 --Switch Databases


--We have to work across multiple databases from time to time. To switch between available databases, we can run the following statement.


--Script:
USE koko;

--This code selects the koko database and all SQL operations will be performed inside this database.

---------------------------------------------------------------------------

--SQL DROP DATABASE Statement


--In SQL, DROP DATABASE is used to delete the database in our Database Management System. For example,

--Script:
DROP DATABASE koko;


--Here, the SQL command will delete a database named koko.

--Also make sure you have admin or DROP permission to run this command.

--Note: When we delete a database, all tables and records within a database are also deleted.

------------------------------------------------
--Drop DATABASE IF EXISTS


--If there is no database with the same name, SQL will throw an error while dropping a database.

-- In such situations, we can use the the following code to drop a database only if there is existing database with the same name. For example,

--Script:
 IF EXISTS(SELECT * FROM sys.databases WHERE name = 'koko')
  BEGIN
    Drop DATABASE koko;
  END

--  Here, the code drops a database named koko only if there is an existing database with the same name.

--------------------------------------------

--SQL CREATE TABLE Statement


--A database table is used to store records (data). To create a database table, we use the SQL CREATE TABLE statement. Syntax:

--Script:
CREATE TABLE Employees (
    ID int NOT NULL,
   Name nvarchar(50) NOT NULL,
	Phone nvarchar(10) NULL,
	Salary smallmoney NULL,
    PRIMARY KEY (ID)
);

--Run Code

--The column parameters specify the names of the columns of the table.

--The datatype parameter specifies the type of data the column can hold (e.g. varchar, integer, date, etc.).

--Note: We must provide data types for each column while creating a table. Learn more about SQL Data Types in the next lesson.

------------------------------------------------


--SQL DROP TABLE Statement


--In SQL, DROP TABLE is used to delete the tables in our database. For example,

--Script:
DROP TABLE Employees;

--Here, the SQL command will delete a table named Employees.

--Also make sure you have admin or DROP permission to run this command.

--Note: When we delete a database table, all records within a table are also deleted.


----------------------------


--#2-DDL - Alter Table Statement


----------------------------

--Add Column in a Table


--We can add columns in a table using the ALTER TABLE command with the ADD clause. For example,

--Script:
ALTER TABLE Employees
ADD Gendor char(1);

--Run Code
--Here, the SQL command adds a column named Gendor in the Employees table.

--------------------------

--Rename Column in a Table (Most Databases)



--We can rename columns in a table using the ALTER TABLE command with the RENAME COLUMN clause. For example,

--Script:
ALTER TABLE Employees
RENAME COLUMN Gendor TO Gender;


--Run Code

--Here, the SQL command changes the column name of Gendor to Gender in the Employees table.



--Rename column in table ( in SQL Server)
--You can not use the ALTER TABLE statement in SQL Server to rename a column in a table. However, you can use sp_rename, though Microsoft recommends that you drop and recreate the table so that scripts and stored procedures are not broken.

--Syntax
--The syntax to rename a column in an existing table in SQL Server (Transact-SQL) is:


--Script:
exec sp_rename 'table_name.old_column_name', 'new_column_name', 'COLUMN';

--------------------------

-- Rename a Table (Most Databases)


--We can change the name of a table using the ALTER TABLE command with the RENAME clause. For example,

--Script:
ALTER TABLE OldTableName
RENAME TO NewTableName;


--Run Code


--Rename table (In SQL Server)
--You can not use the ALTER TABLE statement in SQL Server to rename a table. However, you can use sp_rename, though Microsoft recommends that you drop and recreate the table so that scripts and stored procedures are not broken.

--Syntax
--The syntax to rename a table in SQL Server (Transact-SQL) is:

exec sp_rename 'old_table_name', 'new_table_name';

--------------------------------------

--Modify Column in a Table

--We can also change the column's data type using the ALTER TABLE command with MODIFY or ALTER COLUMN clause. For example,


--SQL Server :

ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);

--MySQL

ALTER TABLE Employees
MODIFY COLUMN Name VARCHAR(100);

--Oracle
ALTER TABLE Employees
MODIFY Name VARCHAR(100);

--PostgreSQL

ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);



--Here, the SQL command changes the data type of the Name column to VARCHAR in the Employees table.

-----------------------------------------------------------------------------

--Delete Column in a Table

--We can also drop (remove) columns in a table using the ALTER TABLE command with the DROP clause. For example,

--Script:
ALTER TABLE Employees
DROP COLUMN Gender;

--Run Code
--Here, the SQL command removes the Gender column from the Employees table.

-------------------------------------


--Backup & Restore Database


----------------------------------

--SQL BACKUP DATABASE Statement


--It is important to create database backups regularly so that our data won't get lost if the database gets corrupted.

--In SQL, we can create database backups using the BACKUP DATABASE statement. For example,

--Script:
BACKUP DATABASE MyDatabase1
TO DISK = 'C:\MyDatabase1_backup.bak';


--Here, the SQL command creates a backup file of the MyDatabase1 database inside C drive, named MyDatabase1_backup.bak.

--Note: It's a common convention to use the .bak file extension for database backup files, however, it's not mandatory.

--Tip: Always back up the database to a different drive than the actual database. Then, if you get a disk crash, you will not lose your backup file along with the database.


------------------------------------


--  Differential Backup

--SQL DIFFERENTIAL BACKUP DATABASE Statement

--A differential back up only backs up the parts of the database that have changed since the last full database backup.

--In SQL, we can create differential database backups using the BACKUP DATABASE With Differential  statement. For example,

--Script:
BACKUP DATABASE MyDatabase1
TO DISK = 'C:\MyDatabase1_backup.bak'
WITH DIFFERENTIAL;


--Here, the SQL command appends only new changes to the previous backup file. Hence, this command may work faster.
--Tip: A differential back up reduces the back up time (since only the changes are backed up).


------------------------

--Restore Database From Backup

--To restore a backup file to the database management system, we can use the RESTORE DATABASE statement. For example,

--Script:
RESTORE DATABASE MyDatabase1
FROM DISK = 'C:\MyDatabase1.bak';

--Here, the SQL command restores the MyDatabase1.bak file in the database named MyDatabase1.




---------------------------------------------------


---SQL FOREIGN KEY



--In this tutorial, we'll learn about the FOREIGN KEY in SQL and how to use them with the help of examples.

--In SQL, we can create a relationship between two tables using the FOREIGN KEY constraint.


--Here, the customer_id field in the Orders table is FOREIGN KEY which references the id field in the Customers table.

--This means that the value of the customer_id (of the Orders table) must be a value from the id column (of the Customers table).

--Note: The Foreign key can be referenced to any column in the parent table. However, it is general practice to reference the foreign key to the primary key of the parent table.



--Creating FOREIGN Key
--Now, let's see how we can create foreign key constraints in a database.


-- script 1 :
-- This table doesn't have a foreign key
CREATE TABLE Customers (
  id INT ,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  age INT,
  country VARCHAR(10),
  PRIMARY KEY (id)
);


-- Adding foreign key to the customer_id field
-- The foreign key references to the id field of the Customers table
CREATE TABLE Orders (
  order_id INT,
  item VARCHAR(40),
  amount INT,
  customer_id INT REFERENCES Customers(id),
  PRIMARY KEY (order_id)
);


--Run Code

--Here, the value of the customer_id column in the Orders table references the row in another table named Customers with its id column.

--Note: The above code works in all major database systems. However, there may be the alternate syntax to create foreign keys depending on the database. Refer to their respective database documentation for more information.

--Foreign Key with Alter Table
--It is possible to add the FOREIGN KEY constraint to an existing table using the ALTER TABLE command. For example,


--script 2 :
-- This table doesn't have a foreign key
CREATE TABLE Customers (
  id INT ,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  age INT,
  country VARCHAR(10),
  PRIMARY KEY (id)
);

CREATE TABLE Orders (
  order_id INT,
  item VARCHAR(40),
  amount INT,
  customer_id INT ,
  PRIMARY KEY (order_id)
);

-- Adding foreign key to the customer_id field using alter

ALTER TABLE Orders
ADD FOREIGN KEY (customer_id) REFERENCES Customers(id);


----------------------------------------

--  Solution To: "Saving changes is not permitted" error


--Solution To: "Saving changes is not permitted" error:
--If you encounter the "Saving changes is not permitted" error in SQL Server when attempting to modify a table that requires re-creation,
--you can change a setting in SQL Server Management Studio (SSMS) to allow saving changes that require table re-creation. Here's how you can do it:

--Open SQL Server Management Studio.
--Go to the "Tools" menu and select "Options."
--In the Options window, navigate to "Designers" > "Table and Database Designers."
--Uncheck the option "Prevent saving changes that require table re-creation."
--Click "OK" to save the changes.
--After making this configuration change, you should be able to modify and save changes to 
--your tables without encountering the "Saving changes is not permitted" error. However,
--keep in mind that making significant changes to a table's structure can have implications on existing data and may require careful consideration and backup procedures to avoid data loss or inconsistencies.
--Exercise caution when making structural changes to production databases.

----------------------------------------------------------------------------------------

--SQL CREATE VIEW Statement


--In SQL, a view is a virtual table based on the result-set of an SQL statement.

--A view contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database.

--You can add SQL statements and functions to a view and present the data as if the data were coming from one single table.

--A view is created with the CREATE VIEW statement. 

--CREATE VIEW Syntax
--CREATE VIEW view_name AS
--SELECT column1, column2, ...
--FROM table_name
--WHERE condition;

--Note: A view always shows up-to-date data! The database engine recreates the view, every time a user queries it.

--script :
Create view ActiveEmployees as
Select from Employees
Where ExitDate is Null
---
Create view ResignedEmployees as
Select * from Employees
Where ExitDate is not Null ;
----
Create view Shortdetails as
Select id , FirstName,LastName , Gendor from Employees

----------------------------
--SQL PRIMARY KEY Constraint


--The PRIMARY KEY constraint uniquely identifies each record in a table.

--Primary keys must contain UNIQUE values, and cannot contain NULL values.

--A table can have only ONE primary key; and in the table, this primary key can consist of single or multiple columns (fields).

--SQL PRIMARY KEY on CREATE TABLE
--The following SQL creates a PRIMARY KEY on the "ID" column when the "Persons" table is created:

CREATE TABLE Persons (
   ID int NOT NULL PRIMARY KEY,
   LastName varchar(255) NOT NULL,
   FirstName varchar(255),
   Age int
);

--To allow naming of a PRIMARY KEY constraint, and for defining a PRIMARY KEY constraint on multiple columns, use the following SQL syntax:

CREATE TABLE Persons (
   ID int NOT NULL,
   LastName varchar(255) NOT NULL,
   FirstName varchar(255),
   Age int,
    CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
);

--Note: In the example above there is only ONE PRIMARY KEY (PK_Person). However, the VALUE of the primary key is made up of TWO COLUMNS (ID + LastName).



--SQL PRIMARY KEY on ALTER TABLE
--To create a PRIMARY KEY constraint on the "ID" column when the table is already created, use the following SQL:

ALTER TABLE Persons
ADD PRIMARY KEY (ID);

--To allow naming of a PRIMARY KEY constraint, and for defining a PRIMARY KEY constraint on multiple columns, use the following SQL syntax:

ALTER TABLE Persons
ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);

--Note: If you use ALTER TABLE to add a primary key, the primary key column(s) must have been declared to not contain NULL values (when the table was first created).

--DROP a PRIMARY KEY Constraint
--To drop a PRIMARY KEY constraint, use the following SQL:

ALTER TABLE Persons
DROP CONSTRAINT PK_Person;

-------------------------------------------------------------
--SQL FOREIGN KEY Constraint





--The FOREIGN KEY constraint is used to prevent actions that would destroy links between tables.

--A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table.

--SQL FOREIGN KEY on CREATE TABLE
--The following SQL creates a FOREIGN KEY on the "PersonID" column when the "Orders" table is created:

CREATE TABLE Orders (
   OrderID int NOT NULL PRIMARY KEY,
   OrderNumber int NOT NULL,
   PersonID int FOREIGN KEY REFERENCES Persons(PersonID)
);

--To allow naming of a FOREIGN KEY constraint, and for defining a FOREIGN KEY constraint on multiple columns, use the following SQL syntax:

CREATE TABLE Orders (
   OrderID int NOT NULL,
   OrderNumber int NOT NULL,
   PersonID int,
    PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
    REFERENCES Persons(PersonID)
);

--SQL FOREIGN KEY on ALTER TABLE
--To create a FOREIGN KEY constraint on the "PersonID" column when the "Orders" table is already created, use the following SQL:

ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

--To allow naming of a FOREIGN KEY constraint, and for defining a FOREIGN KEY constraint on multiple columns, use the following SQL syntax:

ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

--DROP a FOREIGN KEY Constraint
--To drop a FOREIGN KEY constraint, use the following SQL:

ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrder;

----------------------------------------------
---SQL NOT NULL on CREATE TABLE

--The following SQL ensures that the "ID", "LastName", and "FirstName" columns will NOT accept NULL values when the "Persons" table is created:

--Example


CREATE TABLE Persons (
   ID int NOT NULL,
    LastName varchar(255) NOT NULL,
   FirstName varchar(255) NOT NULL,
   Age int
);



--SQL NOT NULL on ALTER TABLE
--To create a NOT NULL constraint on the "Age" column when the "Persons" table is already created, use the following SQL:

ALTER TABLE Persons
ALTER COLUMN Age int NOT NULL;

--------------------------------------

--SQL DEFAULT Constraint



--The DEFAULT constraint is used to set a default value for a column.

--The default value will be added to all new records, if no other value is specified.

--SQL DEFAULT on CREATE TABLE
--The following SQL sets a DEFAULT value for the "City" column when the "Persons" table is created:

CREATE TABLE Persons (
   ID int NOT NULL,
   LastName varchar(255) NOT NULL,
   FirstName varchar(255),
   Age int,
   City varchar(255) DEFAULT 'Amman'
);

--The DEFAULT constraint can also be used to insert system values, by using functions like GETDATE():

CREATE TABLE Orders (
   ID int NOT NULL,
   OrderNumber int NOT NULL,
   OrderDate date DEFAULT GETDATE()
);

--SQL DEFAULT on ALTER TABLE
--To create a DEFAULT constraint on the "City" column when the table is already created, use the following SQL:

ALTER TABLE Persons
ADD CONSTRAINT df_City
DEFAULT 'Amman' FOR City;



--DROP a DEFAULT Constraint
--To drop a DEFAULT constraint, use the following SQL:

ALTER TABLE Persons
DROP Constraint  df_City;

----------------------------------------------------
--SQL CHECK Constraint


--The CHECK constraint is used to limit the value range that can be placed in a column.

--If you define a CHECK constraint on a column it will allow only certain values for this column.

--If you define a CHECK constraint on a table it can limit the values in certain columns based on values in other columns in the row.

--SQL CHECK on CREATE TABLE
--The following SQL creates a CHECK constraint on the "Age" column when the "Persons" table is created. The CHECK constraint ensures that the age of a person must be 18, or older:

CREATE TABLE Persons (
   ID int NOT NULL,
   LastName varchar(255) NOT NULL,
   FirstName varchar(255),
   Age int CHECK (Age>=18)
);

--To allow naming of a CHECK constraint, and for defining a CHECK constraint on multiple columns, use the following SQL syntax:

CREATE TABLE Persons (
   ID int NOT NULL,
   LastName varchar(255) NOT NULL,
   FirstName varchar(255),
   Age int,
   City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Amman')
);

--DROP a CHECK Constraint
--To drop a CHECK constraint, use the following SQL:

ALTER TABLE Persons
DROP CONSTRAINT CHK_Person;


------------------------------------------

--SQL UNIQUE Constraint


--The UNIQUE constraint ensures that all values in a column are different.

--Both the UNIQUE and PRIMARY KEY constraints provide a guarantee for uniqueness for a column or set of columns.

--A PRIMARY KEY constraint automatically has a UNIQUE constraint.

--However, you can have many UNIQUE constraints per table, but only one PRIMARY KEY constraint per table.

--SQL UNIQUE Constraint on CREATE TABLE
--The following SQL creates a UNIQUE constraint on the "ID" column when the "Persons" table is created:

--SQL Server:

CREATE TABLE Persons (
   ID int NOT NULL UNIQUE,
   LastName varchar(255) NOT NULL,
   FirstName varchar(255),
   Age int
);

--To name a UNIQUE constraint, and to define a UNIQUE constraint on multiple columns, use the following SQL syntax:

CREATE TABLE Persons (
   ID int NOT NULL,
   LastName varchar(255) NOT NULL,
   FirstName varchar(255),
   Age int,
    CONSTRAINT UC_Person UNIQUE (ID,LastName)
);



--SQL UNIQUE Constraint on ALTER TABLE
--To create a UNIQUE constraint on the "ID" column when the table is already created, use the following SQL:

ALTER TABLE Persons
ADD UNIQUE (ID);

--To name a UNIQUE constraint, and to define a UNIQUE constraint on multiple columns, use the following SQL syntax:

ALTER TABLE Persons
ADD CONSTRAINT UC_Person UNIQUE (ID,LastName);

--DROP a UNIQUE Constraint
--To drop a UNIQUE constraint, use the following SQL:

--SQL Server :

ALTER TABLE Persons
DROP CONSTRAINT UC_Person;

----------------------------------------------
--SQL CREATE INDEX Statement




--The CREATE INDEX statement is used to create indexes in tables.

--Indexes are used to retrieve data from the database more quickly than otherwise. The users cannot see the indexes, they are just used to speed up searches/queries.

--Note: Updating a table with indexes takes more time than updating a table without (because the indexes also need an update). So, only create indexes on columns that will be frequently searched against.

--CREATE INDEX Syntax
--Creates an index on a table. Duplicate values are allowed:

CREATE INDEX index_name
ON table_name (column1, column2, ...);

CREATE UNIQUE INDEX Syntax
Creates a unique index on a table. Duplicate values are not allowed:

CREATE UNIQUE INDEX index_name
ON table_name (column1, column2, ...);

--CREATE INDEX Example
--The SQL statement below creates an index named "idx_lastname" on the "LastName" column in the "Persons" table:

CREATE INDEX idx_lastname
ON Persons (LastName);

--If you want to create an index on a combination of columns, you can list the column names within the parentheses, separated by commas:

CREATE INDEX idx_pname
ON Persons (LastName, FirstName);

--DROP INDEX Statement
--The DROP INDEX statement is used to delete an index in a table.

DROP INDEX table_name.index_name;



--SQL Server Clustered Index and Primary key constraint
--When you create a table with a primary key, SQL Server automatically creates a corresponding clustered index that includes primary key columns.

--Clustered Index is much faster than normal Index.