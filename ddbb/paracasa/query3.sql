-- Mostrar las listas de reproducción en las que hay canciones de reggae
USE Chinook;
SELECT * FROM Playlist
WHERE PlaylistId IN (SELECT PlaylistId FROM PlaylistTrack
	WHERE TrackId In (SELECT TrackId FROM Track
		WHERE GenreId = (SELECT GenreId FROM Genre 
			WHERE NAME = "Reggae")))