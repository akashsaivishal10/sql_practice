CREATE TABLE sales (
    sale_id INT,
    employee VARCHAR(50),
    region VARCHAR(50),
    sale_date DATE,
    amount INT
);

INSERT INTO sales VALUES
(1, 'Akash', 'South', '2026-01-01', 500),
(2, 'Ravi',  'South', '2026-01-02', 700),
(3, 'Akash', 'South', '2026-01-03', 300),
(4, 'John',  'North', '2026-01-01', 900),
(5, 'John',  'North', '2026-01-02', 400),
(6, 'Ravi',  'South', '2026-01-04', 1000),
(7, 'Akash', 'South', '2026-01-05', 800);
--1. ROW_NUMBER vs RANK vs DENSE_RANK
select * from sales ;
--ROW_NUMBER() Unique sequence.
select amount,employee ,
row_number() over(order by amount desc) as rn
from sales;
--RANK()Skips numbers on ties.
select amount,employee,
rank() over(order by amount desc) as rank
from sales ;
--DENSE_RANK() No gaps.
select amount,employee,
dense_rank() over(order by amount desc)as drnk
from sales ;