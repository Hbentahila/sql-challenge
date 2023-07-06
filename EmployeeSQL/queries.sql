-- List the employee number, last name, first name, sex, and salary of each employee
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary 
FROM employees as emp
JOIN salaries as sal
ON emp.emp_no = sal.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE TO_DATE(hire_date, 'MM/DD/YYYY')
BETWEEN '1986/01/01' AND '1986/12/31';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dm.dept_no, d.dept_name, dm.emp_no AS manager_emp_no, e.last_name AS manager_last_name, e.first_name AS manager_first_name
FROM dept_manager AS dm
JOIN departments AS d
ON d.dept_no = dm.dept_no
JOIN employees AS e
ON e.emp_no = dm.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT de.emp_no, e.last_name, e.first_name, d.dept_no, d.dept_name
FROM dept_emp AS de
JOIN employees AS e
ON e.emp_no = de.emp_no
JOIN departments AS d
ON d.dept_no = de.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules'
AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT de.emp_no, e.last_name, e.first_name
FROM dept_emp AS de
JOIN departments AS d
ON d.dept_no = de.dept_no
JOIN employees AS e
ON e.emp_no = de.emp_no
WHERE dept_name='Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
JOIN departments AS d
ON d.dept_no = de.dept_no
JOIN employees AS e
ON e.emp_no = de.emp_no
WHERE d.dept_name='Sales'
OR d.dept_name='Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(last_name) AS count_last_name
FROM employees
GROUP BY last_name
ORDER BY count_last_name DESC;





