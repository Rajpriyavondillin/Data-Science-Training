create database supply_chain_db;
use supply_chain_db;

-- Create MySQL tables for orders, suppliers, inventory
create table suppliers(
	supplier_id int primary key auto_increment,
    name varchar(100),
    contact_info varchar(100),
    location varchar(100)
);

create table inventory(
	product_id int primary key auto_increment,
    product_name varchar(100),
    quantity_in_stock int,
    reorder_level int
);

create table orders (
	order_id int primary key auto_increment,
    product_id int references inventory(product_id),
	supplier_id int references suppliers(supplier_id),
    quantity int,
    order_Date date,
    delivery_date date,
    status varchar(50)
);

INSERT INTO suppliers (name, contact_info, location) VALUES
('ABC Traders', 'abc@gmail.com', 'Mumbai'),
('Global Supplies', 'global@supplies.com', 'Delhi'),
('Metro Distributors', 'metro@distributors.com', 'Chennai'),
('FastMart', 'contact@fastmart.com', 'Hyderabad'),
('QuickSupply', 'support@quicksupply.com', 'Bangalore'),
('LogiTrade', 'info@logitrade.com', 'Pune'),
('CityMart', 'hello@citymart.com', 'Kolkata'),
('Everest Goods', 'reach@everest.com', 'Ahmedabad'),
('NextGen Supply', 'nextgen@supply.com', 'Jaipur'),
('Elite Wholesalers', 'elite@wholesale.com', 'Lucknow');

INSERT INTO inventory (product_name, quantity_in_stock, reorder_level) VALUES
('Laptop', 50, 10),
('Mouse', 200, 30),
('Keyboard', 150, 25),
('Monitor', 80, 15),
('Printer', 60, 10),
('USB Cable', 300, 50),
('External HDD', 40, 5),
('Webcam', 70, 20),
('Desk Chair', 30, 10),
('Router', 90, 20);

INSERT INTO orders (product_id, supplier_id, quantity, order_date, delivery_date, status) VALUES
(3, 1, 40, '2025-07-03', '2025-07-07', 'Shipped'),
(7, 4, 15, '2025-07-06', '2025-07-11', 'Delivered'),
(2, 2, 25, '2025-07-01', '2025-07-06', 'Pending'),
(10, 5, 10, '2025-07-10', '2025-07-14', 'Cancelled'),
(1, 3, 50, '2025-07-02', '2025-07-07', 'Delivered'),
(8, 8, 20, '2025-07-07', '2025-07-12', 'Pending'),
(5, 6, 35, '2025-07-05', '2025-07-09', 'Delivered'),
(9, 10, 60, '2025-07-08', '2025-07-13', 'Shipped'),
(6, 7, 100, '2025-07-04', '2025-07-08', 'Delivered'),
(4, 9, 12, '2025-07-09', '2025-07-15', 'Delivered');


-- Perform basic CRUD operations
-- C-CREATE (Insert a new record)
insert into orders (product_id, supplier_id, quantity, order_date, delivery_date, status)
values (11, 3, 45, '2025-07-15', '2025-07-20', 'Pending');

-- R-READ (Select/Fetch data)
select * from suppliers;
select * from inventory;
select * from orders;
select * from orders where order_date > '2025-07-05';
select * from suppliers where location = "Chennai"; 

-- U-UPDATE (Changing Existing Record)
update orders set status ="Delivered" where order_id =5;
update inventory set quantity_in_stock=315 where product_id =6;

-- D-DELETE (Remove a record)
delete from orders where order_id=11;

-- Stored Procedure: Auto reorder if quantity_in_stock < reorder_level
DELIMITER //

CREATE PROCEDURE reorder_if_low(IN prod_id INT)
BEGIN
  DECLARE stock INT;
  DECLARE limit_level INT;

  SELECT quantity_in_stock, reorder_level
    INTO stock, limit_level
    FROM inventory
   WHERE product_id = prod_id;

  IF stock < limit_level THEN
    INSERT INTO orders 
      (product_id, supplier_id, quantity, order_date, delivery_date, status)
    VALUES 
      (prod_id, 1, limit_level * 2, CURDATE(), CURDATE() + INTERVAL 5 DAY, 'Pending');
  END IF;
END;
//

DELIMITER ;


-- call to test
CALL reorder_if_low(3);

DELIMITER //
CREATE TRIGGER check_stock_after_update
  AFTER UPDATE ON inventory
  FOR EACH ROW
BEGIN
  IF NEW.quantity_in_stock < NEW.reorder_level THEN
    CALL reorder_if_low(NEW.product_id);
  END IF;
END//
DELIMITER ;






    