USE Chinook;
SELECT Track.Name, AVG(InvoiceLine.Quantity) as AverageSales
FROM Track
JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
GROUP BY Track.TrackId
HAVING Track.Milliseconds > AverageSales;