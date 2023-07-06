-- Create departments table
CREATE TABLE departments (
    dept_no VARCHAR(10),
    dept_name VARCHAR(30),
    PRIMARY KEY (dept_no)
);

-- Create titles table
CREATE TABLE titles (
    title_id VARCHAR(10),
    title VARCHAR(30),
    PRIMARY KEY (title_id)
);

-- Create employees table
CREATE TABLE employees (
    emp_no INT,
    emp_title_id VARCHAR(10) NOT NULL,
    birth_date VARCHAR(10),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    sex CHAR(1),
    hire_date VARCHAR(10),
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Create salaries table
CREATE TABLE salaries (
    emp_no INT,
    salary INT,
    PRIMARY KEY (emp_no, salary),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create dept_emp table
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(10),
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create dept_manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR(10),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);