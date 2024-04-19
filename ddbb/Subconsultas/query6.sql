USE Chinook;
SELECT Track.Name
FROM Track
JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
JOIN Invoice ON InvoiceLine.InvoiceId = Invoice.InvoiceId
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
WHERE Customer.FirstName = 'Luis' AND Customer.LastName = 'Rojas';