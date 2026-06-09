//1
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d
ON e.employee_id = d.department_id;
//the query is correct and it joins between the department and employee table and displayes the the name of the employee and his department.  

//2
SELECT e.first_name, e.last_name, j.job_title
FROM employees e
JOIN jobs j
ON e.employee_id = j.job_id;
//this query is incorrect becauce it return number of employee id and it has to conect to job id in the employee and jobs. 
//it should be this joins each employee to the corresponding job and returns the employee's first name, last name, and job title.
SELECT e.first_name,
       e.last_name,
       j.job_title
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id;

//3
SELECT e.first_name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'Sales';
//this query is correct because joins between the department and employee table and displayes the the name of the employee with the condetion of working in sales department.

//4
SELECT e.first_name, m.first_name AS manager_name
FROM employees e
JOIN employees m
ON e.employee_id = m.manager_id;
//it is correct query and it return all employees and their manager. it is a self join where the join happens in its tables. 