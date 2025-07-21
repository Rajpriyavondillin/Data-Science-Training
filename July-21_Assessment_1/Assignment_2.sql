create database studentDB;
use studentDB;

-- Schema Setup: 3 Tables
-- 1. students
CREATE TABLE students (
student_id INT PRIMARY KEY,
name VARCHAR(100),
age INT,
gender VARCHAR(10),
department_id INT
);

-- 2. departments
CREATE TABLE departments (
department_id INT PRIMARY KEY,
department_name VARCHAR(100),
head_of_department VARCHAR(100)
);

-- 3. courses
CREATE TABLE courses (
course_id INT PRIMARY KEY,
course_name VARCHAR(100),
department_id INT,
credit_hours INT
);

-- Data for Insertion
-- students
INSERT INTO students VALUES
(1, 'Amit Sharma', 20, 'Male', 1),
(2, 'Neha Reddy', 22, 'Female', 2),
(3, 'Faizan Ali', 21, 'Male', 1),
(4, 'Divya Mehta', 23, 'Female', 3),
(5, 'Ravi Verma', 22, 'Male', 2);
-- departments
INSERT INTO departments VALUES
(1, 'Computer Science', 'Dr. Rao'),
(2, 'Electronics', 'Dr. Iyer'),
(3, 'Mechanical', 'Dr. Khan');
-- courses
INSERT INTO courses VALUES
(101, 'Data Structures', 1, 4),
(102, 'Circuits', 2, 3),
(103, 'Thermodynamics', 3, 4),
(104, 'Algorithms', 1, 3),
(105, 'Microcontrollers', 2, 2);


-- Section A: Basic Queries
-- 1. List all students with name, age, and gender.
select name,age,gender from students;

-- 2. Show names of female students only.
select name as Female_Students from students where gender ="Female";

-- 3. Display all courses offered by the Electronics department.
select c.course_id,c.course_name from courses c join departments d 
using(department_id) where d.department_name="Electronics";

-- 4. Show the department name and head for department_id = 1.
select department_name,head_of_department from departments where department_id=1;

-- 5. Display students older than 21 years.
select * from students where age > 21;


-- Section B: Intermediate Joins & Aggregations
-- 6. Show student names along with their department names.
select s.name,d.department_name from students s join departments d 
using(department_id); 

-- 7. List all departments with number of students in each.
select d.department_name,count(s.student_id) as Students_Count from students s right join departments d 
using(department_id) group by d.department_name;

-- 8. Find the average age of students per department.
select d.department_name,avg(s.age) as AVG_Age from students s inner join departments d 
using(department_id) group by d.department_name;

-- 9. Show all courses with their respective department names.
select c.course_name,d.department_name from courses c join departments d 
using(department_id);

-- 10. List departments that have no students enrolled.
select d.department_name from departments d left join students s 
using(department_id) where s.student_id is null;

-- 11. Show the department that has the highest number of courses.
select d.department_name,count(c.course_id) as Highest_Course_Count_Dept from courses c join departments d 
using(department_id) group by d.department_name 
order by Highest_Course_Count_Dept desc limit 1;


-- Section C: Subqueries & Advanced Filters
-- 12. Find names of students whose age is above the average age of all students.
select name from students where age > (select avg(age) from students);

-- 13. Show all departments that offer courses with more than 3 credit hours.
select distinct d.department_name, c.course_name from departments d join courses c 
using(department_id) where c.credit_hours > 3;

-- 14. Display names of students who are enrolled in the department with the fewest courses.
select name from students where department_id=(
    select department_id from courses group by department_id
    order by COUNT(course_id) limit 1
);

-- 15. List the names of students in departments where the HOD's name contains 'Dr.'.
select s.name,d.department_name,d.head_of_department from departments d join students s 
using(department_id) where LOWER(head_of_department) like 'dr.%';

-- 16. Find the second oldest student (use subquery or LIMIT/OFFSET method).
select * from students order by age desc limit 1 OFFSET 1;

-- 17. Show all courses that belong to departments with more than 2 students.
select c.course_name,d.department_name,count(s.student_id) as StudentsCount from students s join departments d 
using(department_id) join courses c using(department_id) group by c.course_name,d.department_name having StudentsCount > 2;




