CREATE DATABASE practiceJOINS;
use practiceJOINS;

CREATE TABLE student(
 id INT PRIMARY KEY,
 name VARCHAR(50)
 );
 
 INSERT INTO student
 VALUES
 (101, "Adam"),
 (102, "Bob"),
 (103, "Chasey");
 
 CREATE TABLE course(
  id INT PRIMARY KEY,
  course VARCHAR(50)
 );
 
 INSERT INTO course
 VALUES
 (102, "english"),
 (105, "math"),
 (103, "science"),
 (106, "computer science");
 
SELECT * from student;
SELECT * from course;

-- inner JOIN
SELECT * 
FROM student
INNER JOIN course
ON student.id = course.id;  
 
 -- we can use alias
 SELECT * 
FROM student as s
INNER JOIN course as c
ON s.id = c.id; 
 
 -- LEFT JOIN
 SELECT *
 FROM student as s
 LEFT JOIN course as c
 ON s.id = c.id;
 
 -- RIGHT JOIN
 SELECT *
 FROM student as s
 RIGHT JOIN course as c
 ON s.id = c.id;
 
 -- FULL JOIN
SELECT *
FROM student as s
LEFT JOIN course as c
ON s.id = c.id
UNION
SELECT * 
FROM student as s
RIGHT JOIN course as c
ON s.id = c.id; 
 
 -- LEFT EXclusive JOIN
 SELECT *
 FROM student as s
 LEFT JOIN course as c
 ON s.id = c.id
 WHERE c.id  IS NULL;
 
 -- RIGHT Exclusive JOIN
  SELECT *
 FROM student as s
 RIGHT JOIN course as c
 ON s.id = c.id
 WHERE s.id  IS NULL;
 
 -- self join  create another table
 CREATE TABLE employee(
 id INT PRIMARY KEY,
 name VARCHAR(50),
 manager_id INT
);

INSERT INTO employee
VALUES
(101, "adam",103),
(102, "bob",104),
(103, "casey",NULL),
(104, "farah",103);

SELECT * from employee;

-- self join
SELECT * 
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;

-- specifically manager name and employee name 
SELECT a.name, b.name
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;

-- UNION
SELECT name from employee
UNION
SELECT name from employee;

-- UNION ALL
SELECT name from employee
UNION ALL
SELECT name from employee;

-- both names are same so chnage the name of a table to manager name 
SELECT a.name as manager_name, b.name 
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;

-- SUB Queries
-- we can take the table from college database that is student1 
use college;
select * from student1;

-- Question : names of all students who scored more than class avg
-- first find avg marks 
-- second get the names
SELECT avg(marks)
FROM student1; 

SELECT name, marks
FROM student1
WHERE marks > 74.3333;  -- this is fixed if any changes happened in table then it will chnage so we need 
                        -- write in dynamic way

SELECT name, marks 
FROM student1
WHERE marks > (SELECT avg(marks)  FROM student1);

-- Question 2: names of students with even roll numbers
SELECT rollno 
FROM student1
WHERE rollno % 2 =0;

-- names
SELECT name, rollno
FROM student1
WHERE rollno IN (102,104,106);

-- dynamic way

SELECT name, rollno
FROM student1
WHERE rollno IN
  (SELECT rollno 
   from student1
    WHERE rollno %2 =0);

-- Question 3: max marks from students of delhi
-- first city as delhi 
-- max marks

SELECT max(marks)
from (SELECT * from student1 WHERE city = "Delhi") AS temp;

-- or
SELECT max(marks)
FROM student1
WHERE city ="Delhi";
 
 
 -- inside SELECT
 SELECT (SELECT max(marks) from student1), name
 FROM student1;
 
 -- VIEWS
 CREATE VIEW view1 AS
 SELECT rollno, name, marks FROM student1;
 
 SELECT * FROM view1;
 