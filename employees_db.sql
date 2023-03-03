-- Creating tables

CREATE TABLE departments (
dept_no VARCHAR(20) PRIMARY KEY NOT NULL,
dept_name VARCHAR(20) NOT NULL
);


CREATE TABLE titles (
title_id VARCHAR(20) PRIMARY KEY NOT NULL,
title VARCHAR(20) NOT NULL
);


CREATE TABLE employees (
emp_no INT PRIMARY KEY NOT NULL,
emp_title_id VARCHAR(20) NOT NULL,
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
birth_date DATE NOT NULL,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
sex VARCHAR(5) NOT NULL,
hire_date DATE NOT NULL
);


CREATE TABLE dept_emp (
emp_no INT NOT NULL,
FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
dept_no VARCHAR(20) NOT NULL,
FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
PRIMARY KEY (emp_no, dept_no)
);


CREATE TABLE dept_manager (
dept_no VARCHAR(20) NOT NULL,
FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
emp_no INT NOT NULL,
FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
PRIMARY KEY (emp_no)
);


CREATE TABLE salaries (
emp_no INT PRIMARY KEY NOT NULL,
FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
salary INT NOT NULL
);


-- Data Analysis - Running queries
-- 1.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON (e.emp_no = s.emp_no);

-- 2.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3.
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees AS e
INNER JOIN dept_manager ON (e.emp_no = dept_manager.emp_no)
INNER JOIN departments AS d ON (dept_manager.dept_no = d.dept_no);

-- 4. 
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp ON (e.emp_no = dept_emp.emp_no)
INNER JOIN departments AS d ON (dept_emp.dept_no = d.dept_no);

-- 5.
SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6.
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees AS e
INNER JOIN dept_emp ON (e.emp_no = dept_emp.emp_no)
INNER JOIN departments AS d ON (dept_emp.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales';

-- 7. 
SELECT d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees AS e
INNER JOIN dept_emp ON (e.emp_no = dept_emp.emp_no)
INNER JOIN departments AS d ON (dept_emp.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales' AND d.dept_name = 'Development';

-- 8.
select last_name, count(last_name) as last_name_count
from employees
group by last_name
order by "last_name_count" desc;

