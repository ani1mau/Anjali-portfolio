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

-- what is wrong with the following method ?? -- In Where clause you are looking for the album_id from album table which are there atleast once in the list given by IN function 

SELECT ar.name AS Artist -- , COUNT(*) AS "total_track"
FROM artists ar 
JOIN album al USING (artist_id)

WHERE al.album_id IN(                    
	SELECT album_id
    FROM track
    JOIN genre USING(genre_id)
    WHERE genre.name LIKE "Rock"
)
GROUP BY ar.name
ORDER BY total_track DESC
LIMIT 10





	
