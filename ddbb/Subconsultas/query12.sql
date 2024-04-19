USE Chinook;
SELECT COUNT(DISTINCT Customer.Country) as NumberOfCountries, COUNT(DISTINCT Genre.Name) as NumberOfGenres, COUNT(DISTINCT Track.TrackId) as NumberOfTracks
FROM Customer
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
JOIN InvoiceLine ON Invoice.InvoiceId = InvoiceLine.InvoiceId
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
JOIN Album ON Track.AlbumId = Album.AlbumId
JOIN Artist ON Album.ArtistId = Artist.ArtistId
JOIN Genre ON Track.GenreId = Genre.GenreId;