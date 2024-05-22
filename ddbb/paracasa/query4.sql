-- Obtener la información de los clientes que han realizado compras superiores a 20€.
USE Chinook;
SELECT CustomerId,FirstName,LastName FROM Customer
WHERE CustomerId IN (SELECT CustomerId FROM Invoice
		WHERE Total > 20);