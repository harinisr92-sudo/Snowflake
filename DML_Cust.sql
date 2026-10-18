-- Insert sample customers
INSERT INTO customers (
    customer_id,
    first_name,
    last_name,
    email,
    phone,
    address,
    city,
    country,
    postal_code
)
VALUES
    (1, 'Anna', 'Example', 'anna@example.com',
     '+358401234001', 'Sample Street 1', 'Helsinki', 'Finland', '00100'),

    (2, 'Mark', 'Sample', 'mark@example.com',
     '+358401234002', 'Sample Street 2', 'Espoo', 'Finland', '02100'),

    (3, 'Sara', 'Demo', 'sara@example.com',
     '+358401234003', 'Sample Street 3', 'Tampere', 'Finland', '33100');

-- Update a customer's email
UPDATE customers
SET email = 'anna.updated@example.com'
WHERE customer_id = 1;

-- Mark a customer as inactive
UPDATE customers
SET is_active = FALSE
WHERE customer_id = 2;

-- Delete a sample customer
DELETE FROM customers
WHERE customer_id = 3;

-- Check the final results
SELECT *
FROM customers
ORDER BY customer_id;