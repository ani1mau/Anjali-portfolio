-- Rock Music Listeners

SELECT c.first_name, c.last_name, c.email, g.name AS genre
FROM customer c
JOIN invoices i
	USING (customer_id)
JOIN invoice_line
	USING (invoice_id)
JOIN track t
	USING (track_id)
JOIN genre g
	USING (genre_id)
WHERE g.name = "Rock"
ORDER BY c.email ;

-- Other Method

-- SELECT c.first_name, c.last_name, c.email
-- FROM customer c
-- JOIN invoices i
-- 	USING (customer_id)
-- JOIN invoice_line
-- 	USING (invoice_id)
-- WHERE track_id IN(
-- 	SELECT track_id FROM track
--     JOIN genre USING(genre_id)
--     WHERE genre.name LIKE "Rock"
-- )
-- ORDER BY c.email ;


