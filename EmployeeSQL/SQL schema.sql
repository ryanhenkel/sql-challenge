-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/eT1bA0
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE Titles (
    title_id varchar(5)   NOT NULL,
    title varchar(30)   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_id
     )
);

CREATE TABLE Salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Employees (
    emp_no int   NOT NULL,
    emp_title_id varchar(5)   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(30)   NOT NULL,
    last_name varchar(30)   NOT NULL,
    sex varchar(1)   NOT NULL,
    hire_date date   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE DeptManager (
    dept_no varchar(4)   NOT NULL,
    emp_no int   NOT NULL,
    CONSTRAINT pk_DeptManager PRIMARY KEY (
        dept_no,emp_no
     )
);

CREATE TABLE DeptEmp (
    emp_no int   NOT NULL,
    dept_no varchar(4)   NOT NULL,
    CONSTRAINT pk_DeptEmp PRIMARY KEY (
        emp_no,dept_no
     )
);

CREATE TABLE Departments (
    dept_no varchar(4)   NOT NULL,
    dept_name varchar(30)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES Titles (title_id);

ALTER TABLE DeptManager ADD CONSTRAINT fk_DeptManager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE DeptManager ADD CONSTRAINT fk_DeptManager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE DeptEmp ADD CONSTRAINT fk_DeptEmp_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE DeptEmp ADD CONSTRAINT fk_DeptEmp_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

