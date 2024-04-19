USE Chinook;
SELECT T1.TrackId, T1.Name, T1.AlbumId, A.Title, T1.UnitPrice
FROM Track T1
JOIN Album A ON T1.AlbumId = A.AlbumId
LEFT JOIN Track T2 ON A.AlbumId = T2.AlbumId AND T2.UnitPrice > T1.UnitPrice
WHERE T2.TrackId IS NULL;