//1.inner join
select e.firstname || ' ' || e.lastname as full_name,d.department_name,p.project_name
from employee e inner join department d
on e.department_number = d.department_number
inner join project p
on p.department_number = d.department_number;


//2.left join
select e.firstname || ' ' || e.lastname as full_name,d.department_name,m.dependent_name
from employee e left join department d
on e.department_number = d.department_number
left join dependent m
on e.ssn = m.ssn;

//3.right join
select p.project_name,e.firstname || ' ' || e.lastname as full_name,d.department_name
from department d right join project p
on d.department_number = p.department_number
right join employee e
on e.department_number = d.department_number;

//4.self join
SELECT e.firstname  || ' ' || e.lastname  AS employee_name,
  s.firstname  || ' ' || s.lastname  AS supervisor_name,
  d.department_name
FROM employee e
LEFT JOIN employee s
  ON e.super_ssn = s.ssn
INNER JOIN department d
  ON e.department_number = d.department_number;