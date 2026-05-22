--2. PARTITION BY (Very Important) “GROUP BY without collapsing rows”
select * from sales;
select 
amount,
employee,
SUM(amount) over(partition by employee) as total_sales
from sales;


SELECT employee, SUM(amount)
FROM sales
GROUP BY employee;

--3. Running Total / Cumulative Sum
select employee,
sale_date,
amount,
sum(amount) over(partition by employee order by sale_date )as total_running
from sales ;
--4. Window Frames (Advanced & VERY Important)
SELECT employee,
       sale_date,
       amount,
       SUM(amount) OVER (
           PARTITION BY employee
           ORDER BY sale_date
           ROWS BETWEEN UNBOUNDED PRECEDING
           AND CURRENT ROW
       ) AS running_total
FROM sales;

SELECT employee,
       sale_date,
       amount,
       AVG(amount) OVER (
           PARTITION BY employee
           ORDER BY sale_date
           ROWS BETWEEN 2 PRECEDING
           AND CURRENT ROW
       ) AS moving_avg
FROM sales;

SELECT employee,
       sale_date,
       amount,
       LAG(amount) OVER (
           PARTITION BY employee
           ORDER BY sale_date
       ) AS previous_sale
FROM sales;

SELECT employee,
       sale_date,
       amount,
       amount -
       LAG(amount) OVER (
           PARTITION BY employee
           ORDER BY sale_date
       ) AS difference
FROM sales;

SELECT employee,
       amount,
       LEAD(amount) OVER (
           PARTITION BY employee
           ORDER BY sale_date
       ) AS next_amount
FROM sales;

SELECT employee,
       amount,
       FIRST_VALUE(amount) OVER (
           PARTITION BY employee
           ORDER BY sale_date
       ) AS first_sale
FROM sales;

SELECT employee,
       amount,
       LAST_VALUE(amount) OVER (
           PARTITION BY employee
           ORDER BY sale_date
           ROWS BETWEEN UNBOUNDED PRECEDING
           AND UNBOUNDED FOLLOWING
       ) AS last_sale
FROM sales;

SELECT employee,
       amount,
       NTILE(4) OVER (ORDER BY amount DESC) AS bucket
FROM sales;

SELECT employee,
       amount,
       PERCENT_RANK() OVER (ORDER BY amount)
FROM sales;

SELECT employee,
       amount,
       CUME_DIST() OVER (ORDER BY amount)
FROM sales;

SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY employee, amount
               ORDER BY sale_id
           ) AS rn
    FROM sales
) t
WHERE rn > 1;


SELECT *
FROM (
    SELECT employee,
           amount,
           ROW_NUMBER() OVER (
               PARTITION BY employee
               ORDER BY amount DESC
           ) AS rn
    FROM sales
) t
WHERE rn <= 2;