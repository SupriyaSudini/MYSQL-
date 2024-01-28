create database college;

use college;

CREATE TABLE student(
 id INT PRIMARY KEY,
 name VARCHAR(50),
 age INT NOT NULL
);

INSERT INTO student VALUES(1, "SWEETY", 25);
INSERT INTO student VALUES(2, "SUNNY", 23);

SELECT * from student;

SHOW databases;
SHOW Tables;    -- it will show tables in databases

DROP table student;
SELECT * from student;

CREATE table student(
  rollno INT PRIMARY KEY,
  name VARCHAR(50)
);

SELECT * from student;        -- DQL command

INSERT INTO student
(rollno, name) 
VALUES
(101, "Sweety"), 
(102, "Sunny"),
(103, "Lucki");

SELECT * from student;   

INSERT INTO student VALUES(104,"Pavan");

use college;

CREATE TABLE emp(
 id INT,
 salary INT DEFAULT 50000
);

INSERT INTO emp(id) VALUES (101), (102);

SELECT * from emp;


USE college;
CREATE TABLE student1(
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);

INSERT INTO student1 
VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanual", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

SELECT * from student1;
SELECT name, marks from student1;
SELECT city from student1;
SELECT DISTINCT city from student1;    -- only gives the names of distinct cities

SELECT * from student1 WHERE marks > 80;
SELECT * from student1 WHERE city = "Mumbai";
SELECT * from student1 WHERE marks > 80 AND city = "Mumbai";


-- using operators with WHERE Clause
SELECT * from student1 WHERE marks +10 > 100;
SELECT * from student1 WHERE marks =93;
SELECT * from student1 WHERE marks > 90;


-- logical Operators
SELECT * from student1 WHERE marks > 90 AND city ="Mumbai";
SELECT * from student1 WHERE marks > 90 OR city = "Mumbai";
SELECT * from student1 WHERE marks BETWEEN 80 AND 90;
SELECT * from student1 WHERE city IN ("Delhi", "Mumbai");
SELECT * from student1 WHERE city NOT IN ("Delhi", "Mumbai");

-- LIMIT Clause
SELECT * from student1 LIMIT 3;
SELECT * from student1 WHERE marks > 75 LIMIT 3;

-- ORDER BY Clause
SELECT * from student1 ORDER BY city ASC;
--  marks in desc order students 
SELECT * from student1 ORDER BY marks DESC; 
-- top 3 students
SELECT * from student1 ORDER BY marks DESC LIMIT 3; 

-- Aggregate Functions
SELECT max(marks) from student1;
SELECT min(marks) from student1;
SELECT avg(marks) from student1;
SELECT count(name) from student1;
SELECT sum(marks) from student1;

-- GROUP BY Clause
SELECT city, count(name) 
from student1
GROUP BY city;

SELECT city, avg(marks)
from student1
GROUP BY city;

-- avg marks in each city in ascending order
SELECT city, avg(marks)
from student1
GROUP BY city
ORDER BY city;

-- avg marks ascending in each city
SELECT city, avg(marks)
from student1
GROUP BY city
ORDER BY avg(marks);


-- avg marks descending in each city
SELECT city, avg(marks)
from student1
GROUP BY city
ORDER BY avg(marks) DESC;

-- count how many students got the grades
SELECT grade, count(rollno)
from student1
GROUP BY grade
ORDER BY grade;

-- city with max marks > 90
SELECT city, count(rollno)
from student1
GROUP BY city
HAVING max(marks) > 90;

SELECT city
from student1
WHERE grade = "A"
GROUP BY city
HAVING max(marks) >= 93
ORDER BY city DESC;


-- UPDATE
UPDATE student1
SET grade = "O"
WHERE grade = "A";     -- error because safe mode is ON

-- OFF the SAFE MODE
SET SQL_SAFE_UPDATES =0;       -- safe mode is OFF

UPDATE student1
SET grade = "O"
WHERE grade = "A";

SELECT * from student1;

UPDATE student1
SET marks = 82
WHERE rollno=105;
-- change the grade also
UPDATE student1
SET grade = "B"
WHERE marks BETWEEN 80 AND 90;

SELECT * from student1;


-- update marks by adding 1 mark for every student
UPDATE student1
SET marks = marks +1;

UPDATE student1
SET marks = 12
WHERE rollno=105;

-- DELETE used to delete rows
DELETE  from student1
WHERE marks <33;

-- Foreign KEYs Examples
CREATE table dept(
id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO dept
VALUES 
(101, "English"),
(102, "IT");

SELECT * from dept;

CREATE table teacher(
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY(dept_id) REFERENCES dept(id)
);

-- onupdate cascade and on delete cascade

CREATE table teacher(
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY(dept_id) REFERENCES dept(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);

INSERT INTO teacher
VALUES
(101, "Adam", 101),
(102, "BOB", 102);

SELECT * from teacher;

-- change the id of  IT in dept and see in tecaher

UPDATE dept
SET id = 103
WHERE id=102;
SELECT * from dept;
SELECT * from teacher;


-- doing ALTER on student1 table
ALTER table student1
ADD column age INT;

SELECT * from student1;

-- drop the column
ALTER table student1
DROP column age;


-- everything with alter - add, drop, change, modify, rename
ALTER TABLE student1
ADD column age INT NOT NULL DEFAULT 20;

ALTER table student1
MODIFY column age VARCHAR(2);

ALTER table student1
CHANGE age stu_age INT;

INSERT INTO student1
(rollno, name, marks, stu_age)
VALUES
(107, "gargi", 68, 100);

ALTER table student1
DROP column stu_age;

ALTER table student1
RENAME TO stu; 

ALTER table stu
RENAME TO student1; 
-- delete only data from the table

TRUNCATE table student1; 

-- practice question
-- a. change name to full_name

ALTER table student1
CHANGE column name full_name VARCHAR(50); 

select * from student1;

-- b. delete students who scored less than 80
DELETE from student1
WHERE marks < 80;

-- c. Delete the column for grades
ALTER table student1
DROP column grade;