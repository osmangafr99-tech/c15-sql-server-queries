
CREATE TABLE Person (
  id INT ,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  age INT,
  Birthday INT,
  country VARCHAR(10),
  PRIMARY KEY (id)
);

-----------------------------------

CREATE TABLE Employee (
  Employee_id INT,
  salary smallint,
  -- Person_id INT REFERENCES Person(id),
  Person_id INT REFERENCES Person(id),
  PRIMARY KEY (Employee_id)
);

-----------------------------------------

CREATE TABLE phone (
  Phone_id INT,
  phone_number int,
  Person_id INT REFERENCES Person(id),
  PRIMARY KEY (Phone_id)
);

------------------------------------

CREATE TABLE Student (
  student_id INT,
  Leval tinyint,
  Person_id INT REFERENCES Person(id),
  PRIMARY KEY (student_id)
);


-------------------------

CREATE TABLE course (
 course_id int,
 course_name VARCHAR(40),
 creadit_houurs tinyint,
-- Person_id INT REFERENCES Person(id),
  PRIMARY KEY (course_id)
);

-------------------------------

CREATE TABLE Professor (
 Teacher_ID int,
 Employee_ID int,
 -- Person_id INT REFERENCES Person(id),
  PRIMARY KEY (Teacher_ID)
);
ALTER TABLE Professor
ADD FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_id);





------------------
CREATE TABLE Enrollment (
  ID INT,
  student_id int,
  course_ID int,
  Enroll_date smalldatetime,
  grad tinyint,
  Professor_id int,
  PRIMARY KEY (ID)
);
ALTER TABLE Enrollment
ADD FOREIGN KEY (Professor_id) REFERENCES Professor(Teacher_ID);
ALTER TABLE Enrollment
ADD FOREIGN KEY (course_id) REFERENCES course(course_id);

-------------------------------------------------------
