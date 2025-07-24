create database MovieRentalsSystemDB;
use MovieRentalsSystemDB;

-- Context:
-- You are building a database for a small movie rental store that tracks customers, movies, and rentals.
-- Your Task:
-- Design, populate, and query a relational SQL database based on the following requirements.

-- SECTION 1: Database Design
-- Task: Write SQL commands to create these tables using appropriate data types and constraints.
-- (Create tables with proper datatypes & keys) Design the schema with these 3 tables:
-- 1. movies
Create table movies(
	movie_id int primary key,
    title varchar(100),
    genre varchar(100),
    release_year int,
    rental_rate decimal(10,2)
);

-- 2. customers
Create table customers(
	customer_id int Primary Key,
	name varchar(100) not null,
	email  varchar(100),
	city varchar(50)
);

-- 3. rentals
Create table rentals(
	rental_id int Primary Key,
	customer_id int references customers(customer_id),
	movie_id int references movies(movie_id),
	rental_date date,
	return_date date
);


-- SECTION 2: Data Insertion
-- Insert sample records into each table:
-- At least 5 movies from different genres and years
-- At least 5 customers from different cities
-- At least 8 rental records — make sure at least one movie is rented more than once
-- Task: Write SQL INSERT statements for all the data.
insert into movies (movie_id,title,genre,release_year,rental_rate) values
(1,'Inception','sci-Fi',2010,100.00),
(2,'The Social Dilemma','Documentary',2020,80.00),
(3,'RRR','Action',2022,120.00),
(4,'La La Land','Musical',2016,90.00),
(5,'Kantara','Drama',2022,110.00),
(6,'Interstellar','sci-Fi',2014,95.00);

insert into customers (customer_id,name,email,city) values
(1,'Amit Sharma','amit@gmail.com','Delhi'),
(2,'Ravi Kumar','ravi09@gmail.com','Bangalore'),
(3,'Sneha Reddy','snehareddy@gamil.com','Hyderabad'),
(4,'Meera Nair','meeranair@gmail.com','palakkad'),
(5,'Rajpriya Vondillin','rajpriyavondillin@gmail.com','Bangalore'),
(6,'Divya Iyer','divya@gmail.com','Mumbai');

insert into rentals (rental_id,customer_id,movie_id,rental_date,return_date) values
(1,1,1,'2025-07-01','2025-07-05'),
(2,2,2,'2025-07-02','2025-07-06'),
(3,3,3,'2025-07-03',NULL),
(4,1,2,'2025-07-04','2025-07-08'),
(5,4,4,'2025-07-05',NULL),
(6,2,5,'2025-07-06','2025-07-09'),
(7,1,3,'2025-07-06',NULL),
(8,2,3,'2025-07-07','2025-07-10'),
(9,5,4,'2025-07-08','2025-07-11'),
(10,3,2,'2025-07-09','2025-05-11');


-- SECTION 3: Query Execution
-- Execute the following queries:
-- Basic Queries
-- 1. Retrieve all movies rented by a customer named 'Amit Sharma'.
select m.title from movies m join rentals r using(movie_id) 
join customers c using(customer_id) where c.name="Amit Sharma";

-- 2. Show the details of customers from 'Bangalore'.
select * from customers where city='Bangalore';

-- 3. List all movies released after the year 2020.
select * from movies where release_year > 2020;


-- Aggregate Queries
-- 4. Count how many movies each customer has rented.
select c.name,count(r.rental_id) as MoviesCount from customers c left join rentals r 
using(customer_id) group by c.name;

-- 5. Find the most rented movie title.
select m.title,count(r.rental_id) as RentedCount from movies m join rentals r 
using(movie_id) group by m.title order by RentedCount desc limit 1;

-- 6. Calculate total revenue earned from all rentals.
select sum(m.rental_rate) as TotalRevenue from movies m left join rentals r 
using(movie_id);

-- Advanced Queries
-- 7. List all customers who have never rented a movie.
select c.name from customers c left join rentals r using(customer_id) 
where r.customer_id is null;

-- 8. Show each genre and the total revenue from that genre.
select m.genre,sum(m.rental_rate) as TotalRevenue from movies m join rentals r
using(movie_id) group by m.genre;

-- 9. Find the customer who spent the most money on rentals.
select c.name,sum(m.rental_rate) as MoneySpentOnRentals from customers c join
rentals r using(customer_id) join movies m using(movie_id) 
group by customer_id order by MoneySpentOnRentals desc limit 1;

-- 10. Display movie titles that were rented and not yet returned ( return_date IS NULL ).
select distinct m.title as Rented_But_Not_Returned from movies m join rentals r using(movie_id) 
where return_date is null;

