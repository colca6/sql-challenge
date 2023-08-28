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
	emp_title_id VARCHAR(5) NOT NULL REFERENCES titles(title_id), 
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL, 
	last_name VARCHAR(50) NOT NULL,
	sex CHAR(1) NOT NULL, 
	hire_date DATE NOT NULL
);

CREATE TABLE departments(
	dept_no VARCHAR(5) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(255) NOT NULL
);

CREATE TABLE dept_emp (
	emp_no VARCHAR(10) NOT NULL REFERENCES employees(emp_no), 
	dept_no VARCHAR(5) NOT NULL REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(5) NOT NULL PRIMARY KEY, 
	emp_no VARCHAR(10) NOT NULL REFERENCES employees(emp_no)
);



CREATE TABLE salaries(
	emp_no VARCHAR(10) PRIMARY KEY,
	salary INT NOT NULL
);

