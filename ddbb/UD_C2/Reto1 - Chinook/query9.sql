-- Muestra todas las facturas de los clientes berlineses. Deberán mostrarse las columnas:
-- fecha de la factura, nombre completo del cliente, dirección de facturación,
-- código postal, país, importe (en este orden)
SELECT I.InvoiceDate as FechaFactura,
C.FirstName as Nombre, 
C.LastName as Apellido, 
C.Address as Direccion, 
C.PostalCode as CodigoPostal, 
C.Country as Pais, 
I.Total as Importe
FROM Customer as C
JOIN Invoice as I
ON I.CustomerId = C.CustomerId
Where C.City = 'Berlin'
GROUP BY I.InvoiceDate, C.FirstName, C.LastName, C.Address, C.PostalCode, C.Country, I.Total;