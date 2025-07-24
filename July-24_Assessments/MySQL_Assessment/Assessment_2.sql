-- SQL Assignment – Travel Planner
create database Travel_PlannerDB;
use Travel_PlannerDB;

-- Table 1: Destinations
create table Destinations(
	destination_id int primary key,
	city varchar(50),
	country varchar(60),
	category varchar(50),
	avg_cost_per_day int
);

-- Table 2: Trips
create table Trips(
	trip_id int primary key,
	destination_id int references Destinations(destination_id),
	traveler_name varchar(50),
	start_date date,
	end_date date,
	budget int
);

-- Insert Sample Data
insert into Destinations values
(1, 'Goa', 'India', 'Beach', 2500),
(2, 'Jaipur', 'India', 'Historical', 2000),
(3, 'Manali', 'India', 'Adventure', 3000),
(4, 'Paris', 'France', 'Historical', 6000),
(5, 'Nice', 'France', 'Beach', 5000),
(6, 'Cairo', 'Egypt', 'Historical', 4000),
(7, 'Siwa', 'Egypt', 'Nature', 3500),
(8, 'Zurich', 'Switzerland', 'Nature', 7000),
(9, 'Interlaken', 'Switzerland', 'Adventure', 8000),
(10, 'Phuket', 'Thailand', 'Beach', 4500),
(11, 'Bangkok', 'Thailand', 'Historical', 3000);

insert into Trips values
(101, 1, 'Rajesh Kumar', '2025-01-10', '2025-01-15', 15000),
(102, 2, 'Anita Sharma', '2024-12-01', '2024-12-10', 20000),
(103, 3, 'Vikram Patel', '2025-02-05', '2025-02-09', 14000),
(104, 4, 'Emily Watson', '2025-03-10', '2025-03-20', 60000),
(105, 5, 'Lucas Martin', '2025-04-01', '2025-04-07', 35000),
(106, 6, 'Ahmed Salah', '2023-06-15', '2023-06-22', 28000),
(107, 7, 'Noor Fathy', '2024-07-01', '2024-07-05', 18000),
(108, 8, 'Sofia Meier', '2025-08-10', '2025-08-15', 40000),
(109, 9, 'Daniel Weber', '2025-09-01', '2025-09-10', 75000),
(110, 10, 'Meena Joshi', '2025-05-12', '2025-05-17', 22000),
(111, 11, 'Arun Reddy', '2025-06-01', '2025-06-06', 18000),
(112, 1, 'Priya Iyer', '2024-11-20', '2024-11-25', 12000);

-- Query Tasks
-- Basic Queries
-- 1. Show all trips to destinations in “India”.
select * from trips t join destinations d using(destination_id)
where d.country="India";

-- 2. List all destinations with an average cost below 3000.
select * from destinations where avg_cost_per_day<3000;

-- Date & Duration
-- 3. Calculate the number of days for each trip.
select trip_id,DATEDIFF(end_date,start_date)+1 as NoOfDays from trips;

-- 4. List all trips that last more than 7 days.
select * from trips where DATEDIFF(end_date,start_date)+1 >7;

select trip_id,DATEDIFF(end_date,start_date)+1 as NoOfDays from trips
where DATEDIFF(end_date,start_date)+1 >7;

-- JOIN + Aggregation
-- 5. List traveler name, destination city, and total trip cost (duration × avg_cost_per_day).
select t.traveler_name ,d.city as Destination_City,
SUM(DATEDIFF(t.end_date,t.start_date)+1 * d.avg_cost_per_day) as TotalTripCost 
from trips t join destinations d using(destination_id) group by t.traveler_name ,d.city;

-- 6. Find the total number of trips per country.
select d.country,count(t.trip_id) as Total_Trips 
from trips t join destinations d using(destination_id) group by d.country;

-- Grouping & Filtering
-- 7. Show average budget per country.
select d.country,AVG(t.budget) as AVG_Budget
from trips t join destinations d using(destination_id) group by d.country;

-- 8. Find which traveler has taken the most trips.
select traveler_name,count(trip_id) as TotalTrips from trips group by traveler_name
order by TotalTrips desc limit 1;  -- since all have taken only 1 trip, 1st value alone is displayed

-- Subqueries
-- 9. Show destinations that haven’t been visited yet.
select * from Destinations
where destination_id not in (select distinct destination_id from Trips);

-- 10. Find the trip with the highest cost per day.
select trip_id, traveler_name,budget / (DATEDIFF(end_date, start_date) + 1) 
as cost_per_day from Trips order by cost_per_day desc limit 1;

-- Update & Delete
-- 11. Update the budget for a trip that was extended by 3 days.
update Trips set budget= 
9*(select avg_cost_per_day from Destinations where destination_id = 1)
where trip_id = 101;

-- 12. Delete all trips that were completed before Jan 1, 2023.
delete from trips where end_date<"2023-01-01";
