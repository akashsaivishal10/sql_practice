Instead of writing the same SQL queries again and again in Node.js, you store them inside DB itself.
A stored procedure is like: A function inside the database.
create or replace function getAllEmployees()
returns table(emp_id int,emp_name varchar,salary int)
language plpgsql
as $function$
begin
	return query
select * from employees3;
end;
$function$;
 select * from getAllEmployees();

 create or replace function getAllEmployees()
returns table(emp_id int,emp_name varchar,salary int)
language plpgsql
as $function$
begin
	return query
select * from employees3;
end;
$function$;
 select * from getAllEmployees();

create or replace function updateEmployee(p_emp_id int ,p_emp_salary int)
returns void 
language plpgsql
as $function$
begin
update employees3 
set salary =p_emp_salary
where emp_id =p_emp_id;
end;
$function$;



CREATE TABLE employees3 (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(100),
    salary INT
);
SELECT updateEmployee(1, 500010);
INSERT INTO employees3(emp_name, salary)
VALUES
('Akash', 30000),
('Rahul', 40000),
('Sai', 50000);
select * from employees3 e 