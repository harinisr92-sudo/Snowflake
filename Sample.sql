-- 1. DDL: Create a sample table
CREATE TABLE IF NOT EXISTS git_test_employees (
    employee_id INTEGER,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary NUMBER(10, 2)
);

-- 2. DML: Insert sample records
INSERT INTO git_test_employees
    (employee_id, employee_name, department, salary)
VALUES
    (1, 'Alice', 'Engineering', 5000.00),
    (2, 'Bob', 'Finance', 4500.00),
    (3, 'Charlie', 'Engineering', 5500.00);

-- 3. Query the data
SELECT *
FROM git_test_employees
ORDER BY employee_id;

-- 4. DML: Update one record
UPDATE git_test_employees
SET salary = 4800.00
WHERE employee_id = 2;

-- 5. Query: Summarise by department
SELECT
    department,
    COUNT(*) AS employee_count,
    AVG(salary) AS average_salary
FROM git_test_employees
GROUP BY department;

-- 6. DML: Delete one record
DELETE FROM git_test_employees
WHERE employee_id = 3;

-- 7. Check the final results
SELECT *
FROM git_test_employees
ORDER BY employee_id;

-- Optional cleanup: uncomment when finished
-- DROP TABLE git_test_employees;