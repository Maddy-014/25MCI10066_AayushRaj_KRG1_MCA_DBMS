-- Department table
CREATE TABLE Department (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE NOT NULL,
    location VARCHAR(50) NOT NULL
);

-- Employee table
CREATE TABLE Employee (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    salary NUMERIC(10,2) CHECK (salary > 0),
    dept_id INT NOT NULL,
    CONSTRAINT fk_department
        FOREIGN KEY (dept_id)
        REFERENCES Department(dept_id)
        ON DELETE RESTRICT
);

-- Project table
CREATE TABLE Project (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    budget NUMERIC(12,2) CHECK (budget >= 1000),
    dept_id INT,
    CONSTRAINT fk_project_department
        FOREIGN KEY (dept_id)
        REFERENCES Department(dept_id)
        ON DELETE SET NULL
);
INSERT INTO Department (dept_name, location)
VALUES
('HR', 'New York'),
('IT', 'Bangalore'),
('Finance', 'London');

INSERT INTO Employee (emp_name, email, salary, dept_id)
VALUES
('Aayush Raj', 'aayush@org.com', 60000, 2),
('Rahul Verma', 'rahul@org.com', 50000, 1),
('Sneha Sharma', 'sneha@org.com', 55000, 3);

INSERT INTO Project (project_name, budget, dept_id)
VALUES
('HR Management System', 50000, 1),
('Complaint Management System', 120000, 2),
('Accounting Automation', 80000, 3);

UPDATE Employee
SET salary = salary + 5000
WHERE emp_name = 'Rahul Verma';

DELETE FROM Project
WHERE project_name = 'Accounting Automation';

CREATE ROLE report_user LOGIN PASSWORD 'report123';

GRANT CONNECT ON DATABASE org_db TO report_user;

GRANT SELECT ON Department TO report_user;
GRANT SELECT ON Employee TO report_user;
GRANT SELECT ON Project TO report_user;

REVOKE CREATE ON SCHEMA public FROM report_user;

ALTER TABLE Employee
ADD COLUMN phone_number VARCHAR(15);

DROP TABLE Project;
