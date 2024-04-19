USE Chinook;
SELECT A.Name
FROM Artist A
JOIN Track as T ON A.ArtistId = T.TrackId
JOIN InvoiceLine as IL ON T.TrackId = IL.TrackId
JOIN Invoice as I ON IL.InvoiceId = I.InvoiceId
WHERE T.Milliseconds > 300000;