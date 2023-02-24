DROP TABLE IF EXISTS title;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS departments;

CREATE TABLE titles (
	title_id VARCHAR(10),
	title VARCHAR(50),
	PRIMARY KEY (title_id)
)
;

CREATE TABLE employees (
	emp_no int,
	emp_title VARCHAR(10),
	birth_date Date,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	sex VARCHAR(1),
	hire_date Date,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title)
	REFERENCES title(title_id)
)
;

CREATE TABLE salaries(
	ID SERIAL,
	emp_no int,
	salary int,
	PRIMARY KEY (ID),
	FOREIGN KEY (emp_no)
	REFERENCES employees(emp_no)
)
;

CREATE TABLE departments(
	dept_no VARCHAR(10),
	dept_name VARCHAR(30),
	PRIMARY KEY(dept_no)
)
;

CREATE TABLE dept_emp(
	ID SERIAL,
	emp_no int,
	dept_no VARCHAR(10),
	PRIMARY KEY(ID),
	FOREIGN KEY(emp_no)
	REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no)
	REFERENCES departments(dept_no)
)
;

CREATE TABLE dept_manager(
	ID SERIAL,
	dept_no VARCHAR(10),
	emp_no int,
	PRIMARY KEY(ID),
	FOREIGN KEY(dept_no)
	REFERENCES departments(dept_no),
	FOREIGN KEY(emp_no)
	REFERENCES employees(emp_no)
)
;

COPY departments(dept_no,dept_name)
FROM 'C:\Users\Alex\Desktop\DSBC\sql-challenge\m9-starter-code\data\departments.csv'
DELIMITER ','
CSV HEADER;
COPY title(title_id,title)
FROM 'C:\Users\Alex\Desktop\DSBC\sql-challenge\m9-starter-code\data\titles.csv'
DELIMITER ','
CSV HEADER;
COPY employees(emp_no, emp_title, birth_date,first_name,last_name,sex,hire_date)
FROM 'C:\Users\Alex\Desktop\DSBC\sql-challenge\m9-starter-code\data\employees.csv'
DELIMITER ','
CSV HEADER;
COPY salaries(emp_no,salary)
FROM 'C:\Users\Alex\Desktop\DSBC\sql-challenge\m9-starter-code\data\salaries.csv'
DELIMITER ','
CSV HEADER;
COPY dept_emp(emp_no,dept_no)
FROM 'C:\Users\Alex\Desktop\DSBC\sql-challenge\m9-starter-code\data\dept_emp.csv'
DELIMITER ','
CSV HEADER;
COPY dept_manager(dept_no,emp_no)
FROM 'C:\Users\Alex\Desktop\DSBC\sql-challenge\m9-starter-code\data\dept_manager.csv'
DELIMITER ','
CSV HEADER;