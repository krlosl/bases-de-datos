-- Obtener los álbumes con un número de canciones superiores a la media
USE Chinook;
SELECT Title FROM Album
WHERe AlbumId IN 
(
	SELECT AlbumId
	FROM Track
	group by AlbumId
	Having COUNT(*) > (
		SELECT AVG(N_Canciones) FROM
        (
			SELECT AlbumId, COUNT(*) AS N_Canciones
            FROM Track
            GROUP BY AlbumId
            )
AS Album_NCanciones));