-- 1. BASIC SORTING (ASCENDING – DEFAULT)
SELECT customer_id, first_name, last_name
FROM customers
ORDER BY first_name;

-- 2. BASIC SORTING (DESCENDING)
SELECT customer_id, first_name, last_name
FROM customers
ORDER BY last_name DESC;

-- 3. SORTING ON MULTIPLE COLUMNS
SELECT invoice_id, customer_id, invoice_date, total
FROM invoices
ORDER BY customer_id ASC, invoice_date DESC;

-- 4. LIMIT RESULTS
SELECT invoice_id, customer_id, total
FROM invoices
ORDER BY total DESC
LIMIT 5;

-- 5. ORDER BY WITH WHERE
SELECT invoice_id, customer_id, total
FROM invoices
WHERE total > 10
ORDER BY total DESC
LIMIT 3;

-- 6. PAGINATION – PAGE 1
SELECT invoice_id, customer_id, total
FROM invoices
ORDER BY invoice_id
LIMIT 5 OFFSET 0;

-- 7. PAGINATION – PAGE 2
SELECT invoice_id, customer_id, total
FROM invoices
ORDER BY invoice_id
LIMIT 5 OFFSET 5;

-- 8. LEADERBOARD – TOP 5 CUSTOMERS BY TOTAL SPENDING
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       SUM(i.total) AS total_spent
FROM customers c
JOIN invoices i
     ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 5;

-- 9. SORT USING COLUMN ALIAS
SELECT customer_id,
       SUM(total) AS total_spent
FROM invoices
GROUP BY customer_id
ORDER BY total_spent DESC;

-- 10. EDGE CASE – LARGE OFFSET (RETURNS EMPTY RESULT)
SELECT *
FROM invoices
ORDER BY invoice_id
LIMIT 5 OFFSET 10000;

-- 11. PERFORMANCE OPTIMIZATION – INDEX FOR ORDER BY
CREATE INDEX idx_invoice_total ON invoices(total);


