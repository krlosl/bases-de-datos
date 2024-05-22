USE Chinook;
SELECT C.CustomerId, C.FirstName, C.LastName
FROM Customer as C
JOIN Invoice as I ON C.CustomerId = I.CustomerId
JOIN InvoiceLine as IL ON I.InvoiceId = IL.InvoiceId
JOIN Track as T ON IL.TrackId = T.TrackId
JOIN Album as A ON T.AlbumId = A.AlbumId
JOIN Artist as AR ON A.ArtistId = AR.ArtistId
WHERE AR.Name = 'Artist Name'
GROUP BY C.CustomerId, C.FirstName, C.LastName
HAVING COUNT(DISTINCT A.AlbumId) = (
    SELECT COUNT(DISTINCT AlbumId)
    FROM Album
    WHERE ArtistId = (
        SELECT ArtistId FROM Artist WHERE Name = 'Artist Name'
    )
);