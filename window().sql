--Create table swiggy order
CREATE TABLE swiggy_orders (
	Sno serial primary key,
    order_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    restaurant_name VARCHAR(50),
    delivery_partner VARCHAR(50),
    order_amount INT,
    order_date DATE
);
--insert data 

INSERT INTO swiggy_orders (
    order_id,
    customer_name,
    city,
    restaurant_name,
    delivery_partner,
    order_amount,
    order_date
)
VALUES
(1001, 'Akash', 'Hyderabad', 'Pizza Hut', 'Ravi', 450, '2026-05-01'),
(1002, 'Sai', 'Hyderabad', 'KFC', 'Ravi', 700, '2026-05-01'),
(1003, 'Rahul', 'Hyderabad', 'Dominos', 'Kiran', 300, '2026-05-02'),
(1004, 'Vamsi', 'Bangalore', 'Burger King', 'Arjun', 800, '2026-05-01'),
(1005, 'Karthik', 'Bangalore', 'Pizza Hut', 'Arjun', 650, '2026-05-02'),
(1006, 'Manoj', 'Bangalore', 'KFC', 'Sai', 500, '2026-05-02'),
(1007, 'Ajay', 'Chennai', 'Dominos', 'Kiran', 400, '2026-05-01'),
(1008, 'Rakesh', 'Chennai', 'Pizza Hut', 'Ravi', 900, '2026-05-03'),
(1009, 'Suresh', 'Chennai', 'KFC', 'Kiran', 350, '2026-05-03'),
(1010, 'Teja', 'Hyderabad', 'Burger King', 'Ravi', 1000, '2026-05-03');

--fetch the data
select * from swiggy_orders;

--Problem 1 — Rank Highest Orders City-wise
--over() On which set of rows should this window function work? ఈ function ఏ rows మీద పని చేయాలి?”
--ORDER BY order_amount DESC Sort amounts from highest to lowest.
--RANK()After sorting:SQL gives ranking numbers.
select
	customer_name,
	city,
	order_amount,
	order_date,
	rank() over(partition by city order by order_amount desc ) as rank
from swiggy_orders;

--Problem 2 — Row Number
--Divides data city-wise
--Sorts each city by highest order amount
--Assigns a unique number (1,2,3...) to each row
--ROW_NUMBER() Gives a unique sequential number to each row.No duplicates No skipping logic Just 1,2,3,4...
select
	customer_name ,
	city,
	order_amount ,
	order_date,
row_number() over(partition by city order by order_amount desc) as rn
from
	swiggy_orders;
--Problem 3 — Running Revenue
--“Show cumulative revenue day by day.”
--It calculates running total revenue based on date.
--
--Day 1 total
--Day 1 + Day 2 total
--Day 1 + Day 2 + Day 3 total
--SUM(order_amount) OVER(...) Instead of giving one final sum, it gives sum step-by-step.
select
	order_date,
	order_amount ,
	sum(order_amount) over(order by order_date) as running_revenue
from
	swiggy_orders ;

--Problem 4 — Compare With Previous Order
--It shows the previous row’s order_amount based on order_date.
--LAG() = gets value from previous row. It looks backward.
--ORDER BY order_date Without ORDER BY, LAG has no meaning.
--in the result Why first row is NULL?
--Show previous order amount for each row based on date
select
	customer_name ,
	city,
	order_amount ,
	order_date,
	lag(order_amount) over(order by order_date) as previous_order_amount
	from swiggy_orders;

--Problem 5 — Find Top Delivery Partner
--It ranks orders within each city based on highest order_amount first.
--Same amounts get same rank
--No gaps in ranking
--DENSE_RANK() concept Gives ranking without skipping numbers Equal values share same rank
--| Function     | Meaning         |
--| ------------ | --------------- |
--| RANK         | gaps in numbers |
--| DENSE_RANK   | no gaps         |
--| ROW_NUMBER   | always unique   |
--| PARTITION BY | grouping        |

select
	delivery_partner,
	order_amount,
	order_date ,
	city,
	dense_rank() over(partition by city order by order_amount desc) as ranking
from
	swiggy_orders;

--CTE + DENSE_RANK filtering pattern
--What is CTE? (WITH clause) CTE = Common Table Expression
--👉 Temporary result table
--	ranking = 1; Keep only top-ranked rows per city
with latest_orders as(
select * , delivery_partner,
	order_amount,
	order_date ,
	city,
	dense_rank() over(partition by city order by order_amount desc) as ranking
	from swiggy_orders)
	
	select
	*
from
	latest_orders
where
	ranking = 1;