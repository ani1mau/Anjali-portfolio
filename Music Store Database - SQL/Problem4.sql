-- city with heighest total invoice

SELECT billing_city, SUM(total) AS Total
FROM invoices
group by billing_city
ORDER BY Total DESC
LIMIT 1
