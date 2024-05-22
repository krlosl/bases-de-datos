USE Chinook;
SELECT Track.Name, COUNT(InvoiceLine.TrackId) as PurchaseCount
FROM Track
JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
GROUP BY Track.TrackId
ORDER BY PurchaseCount DESC
LIMIT 10;