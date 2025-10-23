-- top customer from each country. Customer who had spend the largest amount 

WITH Ranked_Customer AS (
	SELECT i.billing_country AS country, c.first_name , c.last_name, SUM(i.total) AS Amount_spend,
	RANK () OVER (PARTITION BY i.billing_country ORDER BY SUM(i.total) DESC ) AS rank_num
	FROM invoices i
	JOIN customer c USING (customer_id)
	GROUP BY 1, 2, 3
)

SELECT country, CONCAT(first_name,' ', last_name) AS top_customer , Amount_spend
FROM Ranked_Customer 
WHERE rank_num = 1

-- Another Method

-- WITH RECURSIVE 
-- 	Customer_with_country AS (
-- 	SELECT i.billing_country AS country, c.first_name , c.last_name, SUM(i.total) AS Amount_spend
-- 	FROM invoices i
-- 	JOIN customer c USING (customer_id)
-- 	GROUP BY 1, 2, 3
-- ),
-- 	Max_Amount AS (
-- 	SELECT country, MAX(Amount_spend) AS Amount
--     FROM Customer_with_country
--     GROUP BY 1
-- )

-- SELECT cc.country, CONCAT(cc.first_name,' ',cc.last_name) AS top_customer, ma.Amount 
-- FROM Customer_with_country cc
-- JOIN Max_Amount ma ON cc.country = ma.country
-- WHERE cc.Amount_spend = ma.Amount
    




