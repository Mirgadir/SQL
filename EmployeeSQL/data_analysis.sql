-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary
FROM employees AS emp
JOIN salaries AS sal 
ON emp.emp_no=sal.emp_no;


-- 2. List employees who were hired in 1986.
SELECT *
FROM employees
WHERE hire_date >= '1986-01-01'
AND hire_date < '1987-01-01';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dep.dept_no, dep.dept_name, 
	emp.emp_no, emp.last_name, 
	emp.first_name, mng.from_date, mng.to_date
FROM employees AS emp
	JOIN dept_manager AS mng 
	ON emp.emp_no=mng.emp_no
		JOIN departments AS dep
		ON dep.dept_no=mng.dept_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name 
FROM employees AS emp
	JOIN dept_emp AS d_e
	ON (emp.emp_no = d_e.emp_no)
		JOIN departments AS dep
		ON (dep.dept_no = d_e.dept_no);

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT 
	* 
FROM 
	employees
WHERE 
	first_name = 'Hercules' 
	AND last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name 
FROM employees AS emp
	JOIN dept_emp AS d_e
	ON (emp.emp_no = d_e.emp_no)
		JOIN departments AS dep
		ON (dep.dept_no = d_e.dept_no)
		WHERE dep.dept_name='Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name 
FROM employees AS emp
	JOIN dept_emp AS d_e
	ON (emp.emp_no = d_e.emp_no)
		JOIN departments AS dep
		ON (dep.dept_no = d_e.dept_no)
		WHERE dep.dept_name='Sales' OR dep.dept_name='Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "last_name_count"
FROM employees
GROUP BY last_name
ORDER BY "last_name_count" DESC;