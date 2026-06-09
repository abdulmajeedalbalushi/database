//JOIN Practice Task
SELECT constraint_name,
       table_name,
       r_constraint_name
FROM user_constraints
WHERE constraint_type = 'R';

SELECT constraint_name, column_name
FROM user_cons_columns
WHERE constraint_name IN (
    SELECT constraint_name
    FROM user_constraints
    WHERE table_name = 'EMPLOYEES'
    AND constraint_type = 'P'
);

SELECT a.table_name,
       a.column_name,
       c_pk.table_name AS referenced_table
FROM user_cons_columns a
JOIN user_constraints c
    ON a.constraint_name = c.constraint_name
JOIN user_constraints c_pk
    ON c.r_constraint_name = c_pk.constraint_name
WHERE c.constraint_type = 'R';

select employee_id,
        first_name || ' ' || last_name as full_name,department_name 
        from employees e inner join departments d
        on e.department_id = d.department_id;
        
select first_name || ' ' || last_name as full_name,
job_title, salary
from employees e inner join jobs j
on e.job_id = j.job_id;

SELECT first_name || ' ' || last_name as full_name,
department_name,city
from employees e inner join departments d
on e.department_id = d.department_id
inner join locations l
on d.location_id = l.location_id;

SELECT e.first_name || ' ' || e.last_name AS full_name,
       d.department_name,
       c.country_name,
       r.region_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id
INNER JOIN locations l
    ON d.location_id = l.location_id
INNER JOIN countries c
    ON l.country_id = c.country_id
INNER JOIN regions r
    ON c.region_id = r.region_id;
    
select first_name || ' ' || last_name as full_name,department_name
from employees e left join departments d
on e.department_id = d.department_id;

select first_name || ' ' || last_name as full_name,department_name
from employees e right join departments d
on e.department_id = d.department_id;

SELECT d.department_id,
       d.department_name,
       e.employee_id,
       e.first_name || ' ' || e.last_name AS full_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
where e.employee_id is null;

select d.first_name || ' ' || d.last_name AS manager_name,
e.first_name || ' ' || e.last_name AS full_name
from employees e left JOIN employees d
on e.manager_id = d.employee_id;

select d.first_name || ' ' || d.last_name AS manager_name,
e.first_name || ' ' || e.last_name AS full_name
from employees e left JOIN employees d
on d.employee_id = e.manager_id;

SELECT employee_id,
       first_name || ' ' || last_name AS employee_name
FROM employees
WHERE manager_id IS NULL;

SELECT e.employee_id,
       e.first_name || ' ' || e.last_name AS employee_name,
       e.salary AS employee_salary,
       m.first_name || ' ' || m.last_name AS manager_name,
       m.salary AS manager_salary
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;

SELECT d.department_id,
       d.department_name,
       e.employee_id AS manager_id,
       e.first_name || ' ' || e.last_name AS manager_name
FROM departments d
inner JOIN employees e
    ON d.manager_id = e.employee_id
WHERE e.department_id = d.department_id;

SELECT e.first_name || ' ' || e.last_name AS employee_name,
       j.job_title,
       d.department_name,
       l.city,
       c.country_name
FROM employees e
INNER JOIN jobs j
    ON e.job_id = j.job_id
INNER JOIN departments d
    ON e.department_id = d.department_id
INNER JOIN locations l
    ON d.location_id = l.location_id
INNER JOIN countries c
    ON l.country_id = c.country_id;
    
SELECT e.first_name || ' ' || e.last_name AS manager_name,
       d.department_name,
       l.city,
       c.country_name
FROM departments d
left JOIN employees e
    ON d.manager_id = e.employee_id
INNER JOIN locations l
    ON d.location_id = l.location_id
INNER JOIN countries c
    ON l.country_id = c.country_id;
    
SELECT e.first_name || ' ' || e.last_name AS employee_name,
       m.first_name || ' ' || m.last_name AS manager_name,
       e.department_id
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id
WHERE e.department_id = m.department_id;

SELECT e.first_name || ' ' || e.last_name AS employee_name,
       m.first_name || ' ' || m.last_name AS manager_name,
       e.department_id
FROM employees e
JOIN employees m
    ON e.manager_id = m.employee_id
    where e.department_id <> m.department_id;
    
SELECT DISTINCT c.country_name
FROM departments d
JOIN locations l
    ON d.location_id = l.location_id
JOIN countries c
    ON l.country_id = c.country_id;
    
//Aggregation Functions in Oracle SQL
select count(employee_id) from employees;

select count(department_id) from departments;

select SUM(salary) from employees;

select sum(commission_pct) from employees;

select avg(salary) from employees;

select avg(min_salary),avg(max_salary) from jobs;

select max(salary), min(salary) from employees;

select max(max_salary),min(max_salary) from jobs;

select count(employee_id),department_id from employees group by department_id;

select job_title,avg(min_salary),avg(max_salary) from jobs group by job_title;

select count(employee_id),department_id from employees group by department_id having count(employee_id)>5;

select job_title,avg(max_salary) from jobs group by job_title having avg(max_salary)>5000;

select * from jobs;