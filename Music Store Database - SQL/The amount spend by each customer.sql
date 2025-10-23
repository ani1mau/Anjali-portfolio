--The amount spend by each customer on artists. Return customer name, artist name and total spend

SELECT c.first_name AS Customer, SUM(il.unit_price*il.quantity) AS Total_Spend, at.name
FROM customer c 
JOIN invoices i USING (customer_id) 
JOIN invoice_line il USING (invoice_id)
JOIN track t USING (track_id)
JOIN album a USING (album_id)
JOIN artists at USING (artist_id)

GROUP BY 1,3;

-- another method

-- WITH best_selling_artist AS(
-- 	SELECT at.artist_id , at.name AS artist, SUM(il.unit_price*il.quantity) AS total_sales
--     FROM invoice_line il
--     JOIN track t USING (track_id)
--     JOIN album ab USING (album_id)
--     JOIN artists at USING (artist_id)
--     GROUP BY 1
--     ORDER BY 3 DESC
--     LIMIT 1
-- )
-- SELECT c.customer_id, c.first_name, c.last_name, bsa.artist, 
-- SUM(il.unit_price*il.quantity) AS Amount_spend
-- FROM invoices i
-- JOIN customer c USING (customer_id)
-- JOIN invoice_line il USING (invoice_id)
-- JOIN track t USING (track_id)
-- JOIN album ab USING (album_id)
-- JOIN best_selling_artist bsa USING (artist_id)

-- GROUP BY 1,2,3,4
-- ORDER BY 5

