--task 1 Display all employees.
select * from public.employees;
--Task 2 Display only:first_name,salary
select emp.first_name ,emp.salary  from public.employees emp;
--Task 3 Find employees from Hyderabad.
select * from public.employees emp where emp.city='Hyderabad';
--Task 4 Find employees whose salary is greater than 50000.
select * from public.employees emp where emp.salary>50000;
--Task 5 Find employees between age 25 and 30.
select * from public.employees emp where emp.age between 25 and 30 ;
--Task 6 Find employees from Hyderabad ,Chennai,Pune
select * from public.employees emp where emp.city in('Hyderabad','Chennai','Pune');
--Task 7 Find employees whose first name starts with A.
select * from public.employees emp where emp.first_name ilike 'A%';
--Task 8 Find employees whose last name ends with a.
select * from public.employees emp where emp.last_name ilike '%A';
--Task 9 Display top 3 highest-paid employees.
select * from public.employees emp order by emp.salary desc limit 3;
--Task 10 Display lowest salary employee.
select * from public.employees emp order by emp.salary asc limit 1;
--Task 11 Sort employees by age ascending.
select * from public.employees emp order by emp.age asc;
--Task 12Sort employees by salary descending.
select * from public.employees emp order by emp.salary desc;
--Task 13 Increase Akash’s salary to 70000.
update employees e 
set salary =70000
where e.employee_id=1;

--Task 14 Update department of Rahul to Admin.
update employees e 
set department ='Admin'
where e.employee_id=2;

--Task 15 Increase salary by 5000 for all HR employees.
update employees e 
set salary=salary+5000
where e.department='HR';

--Task 16 Delete employee whose employee_id is 5.
delete from public.employees e 
where e.employee_id=5;

--Task 17 Delete all employees from Sales department.
delete from public.employees e 
where e.department='Sales';

--Task 18 Delete employees with salary less than 40000.
delete from public.employees e 
where e.salary<40000;

--Task 19 Add a new column:
alter table public.employees
add  email  varchar(100);

--task 20 Modify city column size to 100 characters.

ALTER TABLE public.employees
ALTER COLUMN city TYPE VARCHAR(100);
--task 21 Rename column:department → dept_name
ALTER TABLE public.employees
rename column department to dept_name
--task 22 drop column age
ALTER TABLE public.employees
drop column age ;
--Task 23 Add UNIQUE constraint on email.
ALTER TABLE public.employees
add constraint u_email unique(email);

--task 24 Find total  in each department.
select dept_name ,count(*) as total_employees
from  public.employees
group by dept_name;

--Task 25 Find average salary department-wise.
select dept_name ,avg(salary) as employeesalary
from public.employees
group by dept_name ;
--task 26 Find highest salary in each department.
select dept_name,max(salary) as highest_salary from public.employees
group by dept_name;

--Task 27 Find total salary paid department-wise.
select dept_name,sum(salary) from public.employees
group by dept_name;

--task 28 Show departments where average salary is greater than 50000.

select dept_name,
avg(salary) as average_salary 
from public.employees
group by dept_name
having avg(salary)>50000;

select * from public.employees;
--task 29 Find second highest salary.

select max(salary) as seconds_highest_salary 
from employees 
where salary<(select max(salary) from employees);

--task 30 Find duplicates city

select city ,count(*) as city_count
from employees 
group by city 
having count(*)>1
--task 31 Count employees city-wise.
select city ,count(*) as employee_count 
from employees e 
group by city;
--Task 32 Find employees who joined after 2021.
select * from employees
where joining_date>'2021-01-01';

--Task 33 Display employees from IT department sorted by highest salary.
select * from employees
where dept_name='IT'
order by salary desc ;

--Task 34 Find oldest employee.
select * from employees
where joining_date=(select min(joining_date) from employees);

--Task 35 Find employees whose salary is: greater than 40000 less than 80000
select * from employees where salary >40000 and salary <80000;