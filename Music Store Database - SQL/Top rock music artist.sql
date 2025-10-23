-- top 10 Artist who have written most Rock music.

SELECT ar.name AS Artist, COUNT(*) AS "total_track"
FROM artists ar 
JOIN album al USING (artist_id)
JOIN track t USING (album_id)
JOIN genre g USING (genre_id)
WHERE g.name LIKE "ROCK"
GROUP BY ar.name
ORDER BY total_track DESC
LIMIT 10;






	
