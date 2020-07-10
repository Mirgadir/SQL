-- DBD can be found here: https://app.quickdatabasediagrams.com/#/d/EflBz4


CREATE TABLE departments (
	dept_no VARCHAR(30) PRIMARY KEY,  
	dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE employees (
	emp_no INTEGER PRIMARY KEY, 
	birth_date DATE,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	gender VARCHAR,
	hire_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE dept_emp (
	emp_no INTEGER,
	dept_no VARCHAR(30),  
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(30), 
	emp_no INTEGER,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE salaries (
	emp_no INTEGER, 
	salary INT NOT NULL,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)

);

CREATE TABLE titles (
	emp_no INTEGER, 
	title VARCHAR(30) NOT NULL,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);



