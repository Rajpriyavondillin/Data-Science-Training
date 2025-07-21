create database bookstoreDB;
use bookstoreDB;

-- PART 1: Design the Database
-- Create the following three tables with appropriate datatypes and constraints:
-- 1. books
create table books (
    book_id int primary key,
    title varchar(100),
    author varchar(100),
    genre varchar(50),
    price decimal(10,2)
);

-- 2. customers
create table customers (
    customer_id int primary key,
    name varchar(100),
    email varchar(100),
    city varchar(50)
);

-- 3. orders
create table orders (
    order_id int primary key,
    customer_id int references customers(customer_id),
    book_id int references books(book_id),
    order_date date,
    quantity int
);


-- PART 2: Insert Sample Data
-- Insert at least:
-- 5 books (with varied genres and prices)
-- 5 customers (from different cities)
-- 7 orders (mix of books, customers, and dates)
-- Books
insert into books (book_id,title,author,genre,price) values
(1,'The Alchemist','Paulo Coelho','Fiction',550.00),
(2,'Atomic Habits','James Clear','Self-Help',620.00),
(3,'Wings of Fire','A.P.J. Abdul Kalam','Biography',480.00),
(4,'Ikigai','Héctor García','Self-Help',500.00),
(5,'Rich Dad Poor Dad','Robert Kiyosaki','Finance',450.00);

-- Customers
insert into customers (customer_id,name,email,city) values
(1,'Rajesh Kumar','rajesh@example.com','Hyderabad'),
(2,'Priya Sharma','priya@example.com','Delhi'),
(3,'John Doe','john@example.com','Mumbai'),
(4,'Sneha Reddy','sneha@example.com','Hyderabad'),
(5,'Amit Patel','amit@example.com','Ahmedabad');

-- Orders
insert into orders (order_id,customer_id,book_id,order_date,quantity) values
(1,1,1,'2023-03-10',1),
(2,2,2,'2023-02-15',2),
(3,3,5,'2023-05-20',1),
(4,1,4,'2023-06-01',1),
(5,4,2,'2023-07-10',1),
(6,5,1,'2022-12-25',1),
(7,4,3,'2023-01-10',2);

-- PART 3: Write and Execute Queries
-- Basic Queries
-- 1. List all books with price above 500.
select * from books where price >500;

-- 2. Show all customers from the city of ‘Hyderabad’.
select * from customers where city = "Hyderabad";

-- 3. Find all orders placed after ‘2023-01-01’.
select * from orders where order_date > "2023-01-01";


-- Joins & Aggregations
-- 4. Show customer names along with book titles they purchased.
select c.name,b.title from books b join orders o using(book_id) 
join customers c using(customer_id);

-- 5. List each genre and total number of books sold in that genre.
select b.genre,sum(o.quantity) as Total_NoOf_Books_Sold from books b 
join orders o using(book_id) group by b.genre;

-- 6. Find the total sales amount (price × quantity) for each book.
select b.title,sum(b.price * o.quantity) as Total_Sales from orders o join books b using(book_id)
group by b.title;

-- 7. Show the customer who placed the highest number of orders.
select c.name,count(o.order_id) as NoOf_Orders from customers c join orders o using(customer_id) 
group by c.name order by NoOf_Orders desc limit 1;

-- 8. Display average price of books by genre.
select genre,AVG(price) as AVG_Price from books group by genre;

-- 9. List all books that have not been ordered.
INSERT INTO books VALUES (6, 'Zero to One', 'Peter Thiel', 'Business', 600.00);
select b.title from books b left join orders o using(book_id) where o.order_id is null;

-- 10. Show the name of the customer who has spent the most in total.
select c.name,sum(b.price * o.quantity) as Total_Spent from customers c join orders o using(customer_id)
join books b using(book_id) group by c.name order by Total_Spent desc limit 1;




