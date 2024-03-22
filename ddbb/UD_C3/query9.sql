SELECT I.InvoiceDate, C.FirstName || ' ' || C.LastName AS CustomerName, C.Address, C.PostalCode, C.Country, (SUM(IL.UnitPrice * IL.Quantity)) AS Total
FROM Invoice I, Customer C, InvoiceLine IL, Track T
WHERE I.Customerd = C.Customerld AND I.Invoiceld = IL.InvoiceLineld AND IL.Trackld = T.Trackld
AND C.City = 'Berlin'
GROUP BY I.InvoiceDate, C.FirstName, C.LastName, C.Address, C.PostalCode, C.Country
ORDER BY I.InvoiceDate, C.LastName, C.FirstName, C.Address, C.PostalCode, C.Country;