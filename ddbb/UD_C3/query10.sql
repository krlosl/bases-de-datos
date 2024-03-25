-- Muestra las listas de reproducción cuyo nombre comienza por C, junto a todas
-- sus canciones, ordenadas por álbum y por duración.
USE Chinook;
SELECT Lista.Name as Playlist, track.Name as Cancion, alb.Title as album, track.Milliseconds as Tiempo
FROM Playlist as Lista
JOIN PlaylistTrack as PLT JOIN Track AS track JOIN Album AS alb
ON Lista.PlaylistId = PLT.PlaylistId
AND PLT.TrackId = track.TrackId AND track.AlbumId = alb.AlbumId
WHERE Lista.Name LIKE "C%"
ORDER BY track.AlbumId, track.Milliseconds Desc;