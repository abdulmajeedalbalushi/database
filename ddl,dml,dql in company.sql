ALTER table employee add department_number number;
update employee set department_number = 1 where ssn = 1;
update employee set department_number = 3 where ssn = 2;
ALTER table department add location VARCHAR2(225);

INSERT ALL
    INTO department VALUES (1, 'Human Resources', 'Muscat')
    INTO department VALUES (2, 'Finance', 'Muscat')
    INTO department VALUES (3, 'Information Technology', 'Sohar')
    INTO department VALUES (4, 'Operations', 'Salalah')
    INTO department VALUES (5, 'Marketing', 'Nizwa')
SELECT * FROM dual;

alter table employee add CONSTRAINT fk_employee_department FOREIGN key (department_number) REFERENCES department(department_number);

INSERT INTO employee
VALUES (3, 'Fatma', 'Alharthia', DATE '1998-07-22', 'Female', 2);
INSERT INTO employee
VALUES (4, 'Maryam', 'Alriyami', DATE '1997-01-05', 'Female', 4);
INSERT INTO employee
VALUES (5, 'Khalid', 'Alshukaili', DATE '1994-09-18', 'Male', 5);

select * from employee;

INSERT INTO project VALUES (1001, 'Hospital System Upgrade', 'Building A', 'Muscat', 1);

INSERT INTO project VALUES (1002, 'Finance Automation', 'Building B', 'Muscat', 2);

INSERT INTO project VALUES (1003, 'Network Infrastructure', 'IT Center', 'Sohar', 3);

INSERT INTO project VALUES (1004, 'Operations Optimization', 'Main Office', 'Salalah', 4);

INSERT INTO project VALUES (1005, 'Marketing Campaign 2026', 'Branch Office', 'Nizwa', 5);

SELECT * FROM project;

select firstname,lastname,gender,birthdate from employee;

SELECT firstname || ' ' || lastname AS full_name,
       gender,
       birthdate
FROM employee;

select ssn,firstname,lastname,department_number from employee group by department_number;

SELECT firstname, lastname
FROM employee
WHERE department_number = 1;

select project_number,project_name,location,city from project;

SELECT * from dependent;

INSERT INTO dependent VALUES ('Ali', DATE '2015-06-10', 'Male', 1);

INSERT INTO dependent VALUES ('Sara', DATE '2018-09-21', 'Female', 1);

INSERT INTO dependent VALUES ('Omar', DATE '2012-03-15', 'Male', 2);

INSERT INTO dependent VALUES ('Laila', DATE '2016-12-01', 'Female', 3);

INSERT INTO dependent VALUES ('Hassan', DATE '2010-07-07', 'Male', 4);

select * from dependent where ssn = 1;

select * from department where location = 'Muscat';

select * from project where department_number = 1;

select * from dependent where gender = 'Male';

alter table department add manger_ssn number;
alter table department add manger_hire_date date;

alter table department add CONSTRAINT fk_dept_manger foreign key (manger_ssn) REFERENCES employee(ssn);

ALTER TABLE department DROP CONSTRAINT fk_dept_manger;

ALTER TABLE department DROP COLUMN manger_hire_date;

ALTER TABLE department DROP COLUMN manger_ssn;

CREATE TABLE manages (
    ssn NUMBER,
    department_number NUMBER,
    hire_date DATE,

    CONSTRAINT pk_manages
        PRIMARY KEY (ssn, department_number),

    CONSTRAINT fk_manages_emp
        FOREIGN KEY (ssn)
        REFERENCES employee(ssn),

    CONSTRAINT fk_manages_dept
        FOREIGN KEY (department_number)
        REFERENCES department(department_number)
);

INSERT INTO manages VALUES (1, 1, DATE '2024-01-15');
INSERT INTO manages VALUES (2, 2, DATE '2021-06-10');

INSERT INTO manages VALUES (3, 3, DATE '2023-03-20');

INSERT INTO manages VALUES (4, 4, DATE '2020-09-05');

INSERT INTO manages VALUES (5, 5, DATE '2024-02-12');

select * from manages where ssn = 1;