-- Listar las 5 últimas facturas del cliente cuyo email es “emma_jones@hotmail.com”.
USE Chinook;
SELECT * FROM Invoice
	WHERE CustomerId = (SELECT CustomerId FROM Customer WHERE Email = "emma_jones@hotmail.com")
    ORDER BY InvoiceId DESC
    LIMIT 5;