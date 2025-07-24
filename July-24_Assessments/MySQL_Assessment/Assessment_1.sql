-- SQL Assignment – Personal Fitness Tracker
create database FitnessTrackerDB;
use FitnessTrackerDB;

-- Table 1: Exercises
create table exercises(
	exercise_id int primary key,
    exercise_name varchar(60),
	category varchar(50),
	calories_burn_per_min int
);

-- Table 2: WorkoutLog
create table WorkoutLog(
	log_id int primary key,
	exercise_id int references exercises(exercise_id),
	date date,
	duration_min int,
	mood varchar(40)
);

-- Insert Sample Data
insert into Exercises values
(1, 'Running', 'Cardio', 10),
(2, 'Cycling', 'Cardio', 9),
(3, 'Yoga', 'Flexibility', 4),
(4, 'Weight Lifting', 'Strength', 7),
(5, 'Pilates', 'Flexibility', 5),
(6, 'Swimming', 'Cardio', 11),
(7, 'HIIT', 'Cardio', 13),
(8, 'Stretching', 'Flexibility', 3),
(9, 'CrossFit', 'Strength', 12),
(10, 'Zumba', 'Cardio', 8);

insert into WorkoutLog values
(301, 1, '2025-03-01', 30, 'Energized'),     
(302, 1, '2025-03-05', 45, 'Tired'),
(303, 2, '2025-03-03', 25, 'Normal'),      
(304, 2, '2025-03-10', 35, 'Motivated'),
(305, 3, '2025-03-04', 40, 'Relaxed'),      
(306, 3, '2025-03-11', 30, 'Fresh'),
(307, 4, '2025-03-06', 50, 'Sore'),           
(308, 4, '2025-03-14', 45, 'Energized'),
(309, 5, '2025-03-08', 30, 'Normal'),      
(310, 5, '2025-03-16', 25, 'Relaxed'),
(311, 6, '2025-03-09', 40, 'Tired'),          
(312, 6, '2025-03-17', 30, 'Refreshed'),
(313, 7, '2025-03-12', 20, 'Exhausted'),   
(314, 7, '2025-03-20', 25, 'Energized'),
(315, 8, '2025-03-13', 15, 'Calm'),   
(316, 8, '2025-03-22', 20, 'Normal'),
(317, 9, '2025-03-15', 40, 'Motivated'),      
(318, 9, '2025-03-23', 35, 'Sore'),
(319, 10, '2025-03-18', 30, 'Happy'),     
(320, 10, '2025-03-25', 45, 'Energized');

-- Queries to Practice
-- Basic Queries
-- 1. Show all exercises under the “Cardio” category.
select * from exercises where category="Cardio";

-- 2. Show workouts done in the month of March 2025.
select * from WorkoutLog where month(date)=3 and year(date)=2025;

-- Calculations
-- 3. Calculate total calories burned per workout (duration × calories_burn_per_min).
select w.log_id,w.duration_min*e.calories_burn_per_min as TotalCaloriesBurnt
from WorkoutLog w join exercises e using(exercise_id);

-- 4. Calculate average workout duration per category.
select e.category,AVG(w.duration_min) as AVG_Duration_PerCategory 
from WorkoutLog w join exercises e using(exercise_id) group by e.category;

-- JOIN + Aggregation
-- 5. List exercise name, date, duration, and calories burned using a join.
select e.exercise_name,w.date,w.duration_min,w.duration_min*e.calories_burn_per_min as Calories_Burned 
from exercises e join WorkoutLog w using(exercise_id);

-- 6. Show total calories burned per day.
select w.date,SUM(w.duration_min*e.calories_burn_per_min) as TotalCaloriesBurnt
from WorkoutLog w join exercises e using(exercise_id) group by w.date;

-- Subqueries
-- 7. Find the exercise that burned the most calories in total.
select e.exercise_name,SUM(w.duration_min*e.calories_burn_per_min) as MostCaloriesBurnt
from WorkoutLog w join exercises e using(exercise_id) group by e.exercise_name
order by MostCaloriesBurnt desc limit 1; 

-- 8. List exercises never logged in the workout log.
select e.exercise_name from exercises e left join WorkoutLog w using(exercise_id)
where w.exercise_id is null;

-- Conditional + Text Filters
-- 9. Show workouts where mood was “Tired” and duration > 30 mins.
select * from WorkoutLog where mood="Tired" and duration_min >30;

-- 10. Update a workout log to correct a wrongly entered mood.
update WorkoutLog set mood="Normal" where log_id=302;

-- Update & Delete
-- 11. Update the calories per minute for “Running”.
set sql_safe_updates= 0;
update exercises set calories_burn_per_min=15 where exercise_name="Running";

-- 12. Delete all logs from February 2024.
delete from WorkoutLog where month(date)=2 and year(date)=2024;



