--Mod 9 homework  Data Table Schema

DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS titles CASCADE;

--NOTE upon changes made, pgAdmin informed me I needed to add "CASCADE"
--to my DROP so key constraints would also be dropped before recreation.

CREATE TABLE titles(
	title_id VARCHAR(5) NOT NULL PRIMARY KEY,
	title VARCHAR(50) NOT NULL
);

CREATE TABLE employees(
	emp_no VARCHAR(10) NOT null PRIMARY KEY, 
	emp_title_id VARCHAR(5) NOT NULL, 
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL, 
	last_name VARCHAR(50) NOT NULL,
	sex CHAR(1) NOT NULL, 
	hire_date DATE NOT NULL, 
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE departments(
	dept_no VARCHAR(5) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(255) NOT NULL
);

CREATE TABLE dept_emp (
	emp_no VARCHAR(10) NOT NULL, 
	dept_no VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(5) NOT NULL PRIMARY KEY, 
	emp_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no), 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);



CREATE TABLE salaries(
	emp_no INT PRIMARY KEY,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

