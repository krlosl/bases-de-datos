/*Muestra el número de canciones del álbum “Out Of Time”.*/
SELECT COUNT(T.TrackId) as Canciones
FROM Track as T
JOIN Album as A
ON T.AlbumId = A.AlbumId
WHERE A.Title = "Out Of TIme";