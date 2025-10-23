-- top genre of each country. Most popular genre are genre with highest number of purchases.

WITH RankedSales AS (
	SELECT i.billing_country AS Country, 
    g.name AS Genre, 
    COUNT(il.track_id) AS Number_of_sales,
	RANK() OVER (PARTITION BY i.billing_country ORDER BY COUNT(il.track_id) DESC) AS rank_num
	FROM invoices i                                             
	JOIN invoice_line il USING (invoice_id)
	JOIN track t USING (track_id)
	JOIN genre g USING (genre_id)
	GROUP BY i.billing_country, g.name 
)

SELECT Country, Genre AS Top_genre, Number_of_sales
FROM RankedSales
WHERE rank_num = 1
