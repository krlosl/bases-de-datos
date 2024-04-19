USE Chinook;
SELECT Playlist.Name, Track.Name, Album.Title, Track.MediaTypeId, Track.UnitPrice
FROM Playlist
JOIN PlaylistTrack ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
JOIN Track ON PlaylistTrack.TrackId = Track.TrackId
JOIN Album ON Track.AlbumId = Album.AlbumId
WHERE Playlist.Name LIKE 'M%'
LIMIT 3;