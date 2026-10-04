/* DDL Commands :
1. Table Creation (CREATE): Write the SQL statements to create a database named “employee” and the following tables based on the provided schema:
⦿ Departments
⦿ Location
⦿ Employees*/

CREATE DATABASE employee;
USE employee;
CREATE TABLE departments(
department_id INT,
department_name VARCHAR(100)
);
CREATE TABLE location(
location_id INT,
location VARCHAR(30)
);
CREATE TABLE employees(
employee_id INT,
employee_name VARCHAR(50),
gender ENUM('M','F'),
age INT,
hire_date DATE,
designation VARCHAR(100),
department_id INT,
location_id INT,
salary DECIMAL(10,2)
);
/* 2. Table Alteration (ALTER): Consider the following scenarios and write the SQL statements to alter the structure of the tables accordingly:
⦿ Add a new column named "email" to the Employees table to store employee email addresses.
⦿ Modify the data type of the "designation" column in the Employees table to support a wider range of values.
⦿ Drop the “age” column from the Employees table.
⦿ Rename the “hire_date” column to “date_of_joining”. */

ALTER TABLE employees ADD COLUMN email VARCHAR(100);
ALTER TABLE employees MODIFY COLUMN designation VARCHAR(200);
ALTER TABLE employees DROP COLUMN age;
ALTER TABLE employees RENAME COLUMN hire_date TO date_of_joining;

/* 3. Table Renaming (RENAME): Rewrite the SQL statements to rename the following tables:
⦿ Rename the "Departments" table to "Departments_Info".
⦿ Rename the "Location" table to "Locations". */

RENAME TABLE departments TO departments_info;
RENAME TABLE location TO locations;

/* 4. Table Truncation (TRUNCATE): Write an SQL statement to truncate the Employees table. */

TRUNCATE TABLE employees;

/* 5. Database & Table Dropping (DROP): Write the SQL statements to drop the Employees table and then the “employee” database.*/

DROP TABLE employees;
DROP DATABASE employee;

/* Constraints :
1. Database Recreation:
⦿ Drop the 'employee' database if it exists and recreate it using the provided schema, ensuring that all tables are created with the appropriate constraints as instructed. */

DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;

/* 2. Departments Table:
⦿ Ensure that the "department_id" uniquely identifies each department.
⦿ Set up constraints on the "department_name" to avoid duplicate and null entries.*/

CREATE TABLE departments(
department_id int auto_increment PRIMARY KEY,
department_name VARCHAR(100) NOT NULL UNIQUE
);

/* 3. Location Table:
⦿ Establish a mechanism to automatically generate unique identifiers for each location, ensuring that they are incremented sequentially.
⦿ Implement constraints to prevent the insertion of null and duplicate locations.*/

CREATE TABLE location (
  location_id INT AUTO_INCREMENT PRIMARY KEY,
  location VARCHAR(30) NOT NULL UNIQUE
);

/* 4. Employees Table:
⦿ Guarantee that each employee has a distinct identifier.
⦿ Create a restriction to ensure that the employee's name is always provided.
⦿ Limit the acceptable values for the "gender" field to only 'M' or 'F'.
⦿ Enforce a condition to ensure that the employee's age is 18 or above.
⦿ Automatically assign the current date to the "hire_date" field if not specified.
⦿ Establish links between the "department_id" and "location_id" fields in the "employees" table and their respective tables. */

CREATE TABLE employees (
  employee_id   INT PRIMARY KEY,
  employee_name VARCHAR(50) NOT NULL,
  gender        ENUM('M','F'),
  age           INT,
  hire_date     DATE DEFAULT (CURRENT_DATE),
  designation   VARCHAR(100),
  department_id INT,
  location_id   INT,
  salary        DECIMAL(10,2),
  CONSTRAINT chk_gender CHECK (gender IN ('M','F')),
  CONSTRAINT chk_age    CHECK (age >= 18),
  CONSTRAINT fk_emp_dept FOREIGN KEY (department_id)
    REFERENCES departments(department_id),
  CONSTRAINT fk_emp_loc  FOREIGN KEY (location_id)
    REFERENCES location(location_id)
);

-- 1. Departments (4 rows)
INSERT INTO departments (department_name) VALUES
  ('HR'),
  ('IT'),
  ('Finance'),
  ('Marketing');

-- 2. Location (4 rows)
INSERT INTO location (location) VALUES
  ('Kochi'),
  ('Kollam'),
  ('Trivandrum'),
  ('Kozhikode');

-- 3. Employees (4 rows)
INSERT INTO employees
  (employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id, salary)
VALUES
  (1, 'Anu',    'F', 25, '2023-06-15', 'Developer',      2, 1, 50000.00),
  (2, 'Ravi',   'M', 30, '2022-01-10', 'HR Manager',     1, 2, 45000.00),
  (3, 'Meera',  'F', 28, '2024-03-20', 'Accountant',     3, 3, 40000.00),
  (4, 'Sanjay', 'M', 35, '2021-09-05', 'Marketing Lead', 4, 4, 55000.00);

SELECT * FROM departments;
SELECT * FROM location;
SELECT * FROM employees;

