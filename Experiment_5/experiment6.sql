CREATE TABLE Employee (     
  emp_id SERIAL PRIMARY KEY,     
  emp_name VARCHAR(100),     
  department VARCHAR(50),     
  salary NUMERIC(10,2),     
  is_active BOOLEAN 
); 
 
-- Data Insertion 
 
INSERT INTO Employee (emp_name, department, salary, is_active) VALUES 
('Rahul', 'IT', 50000, TRUE), 
('Sneha', 'HR', 40000, FALSE), 
('Amit', 'Finance', 55000, TRUE), 
('Priya', 'IT', 60000, TRUE);-- Cursor Commands 
 
Query : -  
 
CREATE OR REPLACE VIEW active_employees AS 
SELECT emp_id, emp_name, department, salary 
FROM Employee 
WHERE is_active = TRUE; 
 
SELECT * FROM active_employees; 

CREATE TABLE Departments (     
  dept_id SERIAL PRIMARY KEY,     
  dept_name VARCHAR(100) 
); 
  
INSERT INTO Departments (dept_name) VALUES 
('IT'), 
('HR'), 
('Finance'); 
 
CREATE TABLE Employees (     
  emp_id SERIAL PRIMARY KEY,     
  emp_name VARCHAR(100),     
  salary NUMERIC(10,2),     
  dept_id INT, 
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id) 
); 
 
INSERT INTO Employees (emp_name, salary, dept_id) VALUES 
('Rahul', 50000, 1), 
('Sneha', 40000, 2), 
('Amit', 55000, 3), 
('Priya', 60000, 1); 



Query:-  
 
CREATE OR REPLACE VIEW employee_department_view AS 
SELECT  
    e.emp_id, 
    e.emp_name, 
    e.salary, 
    d.dept_name 
FROM Employees e 
JOIN Departments d 
ON e.dept_id = d.dept_id; 
 
SELECT * FROM employee_department_view; 



Query:-  
 
CREATE OR REPLACE VIEW department_statistics AS 
SELECT  
    d.dept_name, 
    COUNT(e.emp_id) AS total_employees, 
    SUM(e.salary) AS total_salary, 
    AVG(e.salary) AS average_salary, 
    MAX(e.salary) AS highest_salary, 
    MIN(e.salary) AS lowest_salary 
FROM Departments d 
LEFT JOIN Employees e 
ON d.dept_id = e.dept_id 
GROUP BY d.dept_name;
