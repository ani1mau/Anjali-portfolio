-- customer who send most money

SELECT i.customer_id, c.first_name, c.last_name, SUM(i.total) AS Total_Spend
FROM invoices i
JOIN customer c
	ON i.customer_id = c.customer_id
GROUP BY i.customer_id
ORDER BY Total_Spend DESC
LIMIT 1
