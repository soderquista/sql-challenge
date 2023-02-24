-- List employee #, last name, first name, sex, and salary of each employee
SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no
;

-- List first name, last name, and hire date for employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date < '1/1/1987' and hire_date > '12/31/1985'
;

-- List manager of each department along with their dept. #, dept. name,
-- employee #, last name, and first name

SELECT employees.emp_no, dept_manager.dept_no, dept_name, last_name, first_name
FROM dept_manager
	INNER JOIN employees
	ON employees.emp_no = dept_manager.emp_no
	INNER JOIN departments
	ON departments.dept_no = dept_manager.dept_no
;

-- List dept. number for each employee along with that employee's
-- employee number, last name, first name, and dept. name.
SELECT dept_emp.dept_no, employees.emp_no, last_name, first_name, dept_name
FROM dept_emp
	INNER JOIN employees
	ON employees.emp_no = dept_emp.emp_no
	INNER JOIN departments
	ON departments.dept_no = dept_emp.dept_no
;
-- List first name, last name, and sex of each employee whose first name is
-- Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%'
;
-- List each employee in the Sales department, including their emp #,
-- last name, and first name.
SELECT employees.emp_no, last_name, first_name
FROM employees
WHERE emp_no in
(
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no in
	(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
	)
)
;
-- List each employee in the Sales and Development departments, including their
-- employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name
FROM dept_emp
	INNER JOIN employees
	ON dept_emp.emp_no = employees.emp_no
	INNER JOIN departments
	ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales' or dept_name = 'Development'
;
-- List frequency counts, in descending order, of all the employee last names
-- That is, how many employees share each last name
SELECT last_name, count(last_name)
FROM employees
GROUP BY last_name
ORDER BY count(last_name) DESC
;