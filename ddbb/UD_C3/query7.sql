USE Chinook;
SELECT Artist.Name, Album.Title 
FROM Artist, Album 
WHERE Artist.Artistid = Album.ArtistId;