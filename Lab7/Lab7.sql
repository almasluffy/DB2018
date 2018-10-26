create database  lab7;

CREATE TABLE locations(
  location_id SERIAL PRIMARY KEY,
  street_address VARCHAR(25),
  postal_code VARCHAR(12),
  city VARCHAR(30),
  state_province VARCHAR(12)
);
CREATE TABLE departments(
  department_id SERIAL PRIMARY KEY,
  department_name VARCHAR(50) UNIQUE,
  budget INTEGER,
  location_id INTEGER REFERENCES locations
);
CREATE TABLE employees(
  employee_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  phone_number VARCHAR(20),
  salary INTEGER,
  manager_id int references  employees,
  department_id INTEGER REFERENCES departments

);

create  table  job_grades(
  grade char(1),
  lowest_salary int,
  highest_int int
);


select  first_name,last_name, departments.department_id, departments.department_name, locations.city, locations.state_province from employees
   inner join  departments on employees.department_id = departments.department_id inner join  locations  on departments.location_id = locations.location_id;

select e.first_name, e.last_name, d.department_id, l.city, l.state_province
from employees e join departments d on e.department_id = d.department_id join locations l on d.location_id = l.location_id;

select  e.first_name , e.last_name, e.salary, j.grade from employees e inner join job_grades j on e.salary between j.lowest_salary and j.highest_int;

select  e.first_name, e.last_name, e.salary from employees e inner join  employees e2 on e.salary < e2.salary and e2.employee_id = 120;

select  e.first_name from employees e inner join  employees e2  on e.employee_id = e2.manager_id;

select  e.first_name, e.last_name, d.department_id,d.department_name from employees left join  departments d2 on employees.department_id = d2.department_id;




