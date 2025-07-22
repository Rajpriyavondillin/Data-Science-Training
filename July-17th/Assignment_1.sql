-- Database Creation
create database assignmentDB;
use assignmentDB;

-- Task 1: Create a Table
create table products(
  products_id int primary key,
  product_name varchar(50),
  category varchar(50),
  price decimal(10,2),
  stock_quantity int,
  added_Date date
);


-- Task 2: Insert Records
insert into products(products_id, product_name, category, price, stock_quantity, added_Date)
values
(1,'Headphones','Electronics',300.00,80,'2023-01-01'),
(2,'Mouse','Electronics',500.50,15,'2023-02-01'),
(3,'Laptop','Electronics',45500.00,8,'2023-03-01'),
(4,'Sofas','Furniture',85599.00,52,'2023-04-01'),
(5,'Chairs','Furniture',599.50,66,'2023-05-01');


-- Task 3: Write Queries
-- 1. List all products.
select * from products;

-- 2. Display only product_name and price.
select product_name,price from products;

-- 3. Find products with stock_quantity less than 10.
select * from products where stock_quantity < 10;

-- 4. Find products with price between 500 and 2000.
select * from products where price between 500 and 2000;

-- 5. Show products added after 2023-01-01 .
select * from products where added_Date > '2023-01-01';

-- 6. List all products whose names start with ‘S’.
select * from products where product_name like 'S%';

-- 7. Show all products that belong to either Electronics or Furniture.
select * from products where category in ('Electronics','Furniture');



-- Task 4: Update & Delete
-- 1. Update the price of one product.
update products
set price = 399.50 where products_id=1;

-- 2. Increase stock of all products in a specific category by 5.
update products
set stock_quantity=stock_quantity+5 where category='Electronics';

-- 3. Delete one product based on its product_id .
delete from products where products_id=5;

-- 4. Delete all products with stock_quantity = 0.
delete from products where stock_quantity=0;
select * from products;
