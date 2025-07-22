create database customer_order_db;
use customer_order_db;

-- Design MySQL tables for customers, orders, and delivery_status
create table customers(
	customer_id int primary key auto_increment,
    name varchar(100),
    contact_info varchar(100),
    address varchar(100)
);

create table orders(
	order_id int primary key auto_increment,
    customer_id int references customers(customer_id),
    product_id int,
    order_date date,
    delivery_date date,
    status varchar(50)
);

create table delivery_status(
	status_id int primary key auto_increment,
    order_id int references orders(order_id),
    current_status varchar(100),
    updated_at datetime
);

INSERT INTO customers (name, contact_info, address) VALUES
('Anjali Mehta', 'anjali@example.com', 'Mumbai, India'),
('Rohit Sharma', 'rohit@example.com', 'Delhi, India'),
('Priya Reddy', 'priya@example.com', 'Hyderabad, India'),
('Karan Patel', 'karan@example.com', 'Ahmedabad, India'),
('Neha Singh', 'neha@example.com', 'Pune, India'),
('Amit Verma', 'amit@example.com', 'Chennai, India'),
('Sneha Iyer', 'sneha@example.com', 'Bangalore, India'),
('Rajiv Kapoor', 'rajiv@example.com', 'Kolkata, India'),
('Divya Nair', 'divya@example.com', 'Kochi, India'),
('Manish Jain', 'manish@example.com', 'Jaipur, India');

INSERT INTO orders (customer_id, product_id, order_date, delivery_date, status) VALUES
(1, 101, '2025-07-01', '2025-07-04', 'Delivered'),
(2, 102, '2025-07-02', '2025-07-05', 'Delivered'),
(3, 103, '2025-07-03', '2025-07-06', 'Shipped'),
(4, 104, '2025-07-04', '2025-07-07', 'Processing'),
(5, 105, '2025-07-05', '2025-07-09', 'Cancelled'),
(6, 106, '2025-07-06', '2025-07-10', 'Delivered'),
(7, 107, '2025-07-07', '2025-07-11', 'Shipped'),
(8, 108, '2025-07-08', '2025-07-12', 'Delivered'),
(9, 109, '2025-07-09', '2025-07-13', 'Processing'),
(10, 110, '2025-07-10', '2025-07-14', 'Delivered');

INSERT INTO delivery_status (order_id, current_status, updated_at) VALUES
(1, 'Delivered', '2025-07-04 18:00:00'),
(2, 'Delivered', '2025-07-05 17:30:00'),
(3, 'Shipped', '2025-07-06 12:45:00'),
(4, 'Processing', '2025-07-07 10:15:00'),
(5, 'Cancelled', '2025-07-08 09:00:00'),
(6, 'Delivered', '2025-07-10 19:10:00'),
(7, 'Shipped', '2025-07-11 13:20:00'),
(8, 'Delivered', '2025-07-12 20:30:00'),
(9, 'Processing', '2025-07-13 11:50:00'),
(10, 'Delivered', '2025-07-14 16:40:00');


-- Perform basic CRUD operations
-- C-CREATE (Insert a new record)
insert into customers (name, contact_info, address)
values ('Deepika Rao', 'deepika@example.com', 'Nagpur, India');
insert into orders (customer_id, product_id, order_date, delivery_date, status)
values (11, 111, '2025-07-18', '2025-07-21', 'Processing');
insert into delivery_status (order_id, current_status, updated_at)
values (11, 'Processing', NOW());

-- R-READ (Select/Fetch data)
select * from customers;
select * from delivery_status;
select * from orders;
select o.order_id,c.name,o.product_id,o.status from orders o join customers c 
using(customer_id); 

-- U-UPDATE (Changing Existing Record)
update orders set status = 'Shipped' where order_id = 11;
update customers set contact_info="deepikarao@gmail.com" where customer_id=11;

-- D-DELETE (Remove a record)
delete from customers where customer_id=11;
delete from orders where order_id = 11;
delete from delivery_status where status_id=11;

-- Write a stored procedure to fetch all delayed deliveries for a customer
DELIMITER //

CREATE PROCEDURE get_delayed_deliveries(IN cust_id INT)
BEGIN
  SELECT 
    o.order_id,
    c.name AS customer_name,
    o.product_id,
    o.delivery_date AS expected_delivery_date,
    d.updated_at AS actual_delivery_datetime,
    d.current_status
  FROM 
    orders o
  JOIN 
    delivery_status d ON o.order_id = d.order_id
  JOIN 
    customers c ON o.customer_id = c.customer_id
  WHERE 
    o.customer_id = cust_id
    AND d.updated_at > o.delivery_date;
END;
//

DELIMITER ;


CALL get_delayed_deliveries(1);

