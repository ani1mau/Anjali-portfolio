-- track which songs have duration greater than average duartion

SELECT name, milliseconds/60000 AS Duration_in_sec
FROM track
WHERE milliseconds > ( SELECT avg(milliseconds) FROM track)

