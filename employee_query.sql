DROP TABLE employees;

CREATE TABLE employees (
    emp_n INT NOT NULL,
    birth_date  DATE NOT NULL,
    first_name  VARCHAR(50) NOT NULL,
    last_name   VARCHAR(50) NOT NULL,
    gender      VARCHAR(2) NOT NULL,    
    hire_date   DATE NOT NULL,
    PRIMARY KEY (emp_n)
);

SELECT * FROM employees

DROP TABLE departments;

CREATE TABLE departments (
    dept_n     VARCHAR(4) NOT NULL,
    dept_name   VARCHAR(50) NOT NULL,
    PRIMARY KEY (dept_n)
);

SELECT * FROM departments;

DROP TABLE dept_manager;

CREATE TABLE dept_manager (
   dept_n VARCHAR(4) NOT NULL,
   emp_n INT NOT NULL,
   from_date DATE NOT NULL,
   to_date DATE NOT NULL,
   FOREIGN KEY (emp_n)  REFERENCES employees (emp_n),
   FOREIGN KEY (dept_n) REFERENCES departments (dept_n),
   PRIMARY KEY (emp_n)
); 

select * from dept_manager

DROP TABLE dept_emp

CREATE TABLE dept_emp (
    emp_n INT NOT NULL,
    dept_n VARCHAR(4) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_n)  REFERENCES employees   (emp_n) ,
    FOREIGN KEY (dept_n) REFERENCES departments (dept_n)
);

SELECT * FROM dept_emp;

DROP TABLE titles;

CREATE TABLE titles (
    emp_n      INT NOT NULL,
    title       VARCHAR(50) NOT NULL,
    from_date   DATE NOT NULL,
    to_date     DATE NOT NULL,
    FOREIGN KEY (emp_n) REFERENCES employees (emp_n)
); 

SELECT * FROM titles;

DROP TABLE salaries;

CREATE TABLE salaries (
    emp_n      INT  NOT NULL,
    salary      INT  NOT NULL,
    from_date   DATE NOT NULL,
    to_date     DATE NOT NULL,
    FOREIGN KEY (emp_n) REFERENCES employees (emp_n),
    PRIMARY KEY (emp_n)
);


select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select* from titles;


-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.emp_n, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
JOIN salaries s ON e.emp_n = s.emp_n;

-- 2. List employees who were hired in 1986. 

SELECT emp_n, first_name, last_name, hire_date
FROM employees
WHERE extract(year from hire_date) = '1986'; 


-- 3. List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name, and start and 
-- end employment dates.

SELECT dm.dept_n, dept_name, dm.emp_n, first_name, last_name, dm.from_date, dm.to_date
FROM dept_manager dm
LEFT JOIN departments on dm.dept_n = departments.dept_n
LEFT JOIN employees on dm.emp_n = employees.emp_n;


-- 4. List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.

SELECT e.emp_n, first_name, last_name, dept_name
FROM employees e
LEFT JOIN dept_emp d
ON e.emp_n = d.emp_n
LEFT JOIN departments ON d.dept_n = departments.dept_n;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM employees
WHERE(first_name LIKE 'Hercules' AND last_name LIKE '%B%');

-- 6. List all employees in the Sales department, including their employee number, last name, 
-- first name, and department name.

Select e.emp_n, last_name, first_name, dept_name
FROM employees e
LEFT JOIN dept_emp d ON e.emp_n = d.emp_n
LEFT JOIN departments ON d.dept_n = departments.dept_n 
WHERE departments.dept_name lIKE 'Sales';


-- 7. List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.

Select e.emp_n, first_name, last_name, dept_name
FROM employees e
LEFT JOIN dept_emp d ON e.emp_n = d.emp_n
LEFT JOIN departments ON d.dept_n = departments.dept_n 
WHERE departments.dept_name lIKE 'Sales'
OR departments.dept_name LIKE  'Development';


-- 8. In descending order, list the frequency count of employee last names, i.e., how many 
-- employees share each last name.

SELECT last_name,
COUNT(last_name) AS "count_name"
from employees
GROUP BY last_name
ORDER BY count_name DESC;