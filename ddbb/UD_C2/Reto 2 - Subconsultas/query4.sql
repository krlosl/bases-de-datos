USE Chinook;
SELECT Track.Name, Album.Title, Artist.Name
FROM Track
LEFT JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
LEFT JOIN Invoice ON InvoiceLine.InvoiceId = Invoice.InvoiceId
RIGHT JOIN Album ON Track.AlbumId = Album.AlbumId
RIGHT JOIN Artist ON Album.ArtistId = Artist.ArtistId
WHERE InvoiceLine.InvoiceLineId IS NULL;