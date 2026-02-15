-- step 1
DO $$
DECLARE
	i INTEGER;
BEGIN
	FOR i IN 1..5 LOOP
		RAISE NOTICE 'Number is:- %',i;
	END LOOP;
END $$;

-- step 2
CREATE TABLE employee (
    emp_id INT,
    emp_name VARCHAR(50),
    salary INT
);

INSERT INTO employee VALUES
(1, 'Amit', 30000),
(2, 'Neha', 40000),
(3, 'Rahul', 35000);

DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT * FROM employee LOOP
        RAISE NOTICE 'ID: %, Name: %, Salary: %',
        rec.emp_id, rec.emp_name, rec.salary;
    END LOOP;
END $$;

-- step 3
DO $$
DECLARE
	sum INTEGER := 1;
BEGIN
	WHILE sum <= 5 LOOP
		RAISE NOTICE 'Sum is : %',sum;
		sum := sum + 1;
	END LOOP;
END $$;

-- step 4
DO $$
DECLARE
    num INTEGER := 1;
BEGIN
    LOOP
        RAISE NOTICE 'Number: %', num;
        num := num + 1;

        EXIT WHEN num > 5;
    END LOOP;
END $$;

-- step 5
DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT * FROM employee LOOP
        UPDATE employee
        SET salary = salary + 2000
        WHERE emp_id = rec.emp_id;
    END LOOP;
END $$;

SELECT * FROM employee; 

-- step 6
DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT * FROM employee LOOP
        IF rec.salary >= 40000 THEN
            RAISE NOTICE '% is High Salary Employee', rec.emp_name;
        ELSE
            RAISE NOTICE '% is Normal Salary Employee', rec.emp_name;
        END IF;
    END LOOP;
END $$;




