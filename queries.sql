-- List the employee number, last name, first name, sex, and salary of each employee (2 points)

CREATE TABLE details_with_salaries AS
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
FROM employees as e
JOIN salaries as s
	ON e.emp_no = s.emp_no;

select * from details_with_salaries;

-- List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
CREATE TABLE details_with_hiredates AS
SELECT e.first_name, e.last_name,  e.hire_date 
FROM employees as e
where extract(year from hire_date)=1986;

select * from details_with_hiredates;

-- List the manager of each department along with their department number, 
--department name, employee number, last name, and first name (2 points)
CREATE TABLE details_managers AS
SELECT m.dept_no, d.dept_name,m.emp_no, e.last_name, e.first_name
FROM dept_manager as m
JOIN departments as d
	ON m.dept_no = d.dept_no
JOIN employees as e
	ON m.emp_no=e.emp_no;

select * from details_managers;

-- Reason why there are more than one manager is that they were changing with time
CREATE TABLE details_managers_with_dates AS
SELECT m.dept_no, d.dept_name,m.emp_no, e.last_name, e.first_name,e.hire_date
FROM dept_manager as m
JOIN departments as d
	ON m.dept_no = d.dept_no
JOIN employees as e
	ON m.emp_no=e.emp_no;

select * from details_managers_with_dates;

-- List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name (2 points)
CREATE TABLE details_employees AS
SELECT de.dept_no, d.dept_name,de.emp_no, e.last_name, e.first_name
FROM dept_emp as de
JOIN departments as d
	ON de.dept_no = d.dept_no
JOIN employees as e
	ON de.emp_no=e.emp_no;

select * from details_employees;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose 
--last name begins with the letter B (2 points)
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, 
--last name, and first name (2 points)
SELECT e.emp_no,e.last_name,e.first_name
FROM employees as e
join dept_emp as de
	on e.emp_no = de.emp_no
join departments as d
	on de.dept_no = d.dept_no
where dept_name='Sales';
	

-- List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name (4 points)
SELECT e.emp_no,e.last_name,e.first_name, d.dept_name
FROM employees as e
join dept_emp as de
	on e.emp_no = de.emp_no
join departments as d
	on de.dept_no = d.dept_no
where d.dept_name in ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name) (4 points)
select last_name, count(last_name) 
from employees
group by last_name
order by 2 desc;