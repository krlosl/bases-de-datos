/*Muestra qué clientes han realizado compras por valores superiores a 10€, ordenados por apellido.*/
USE Chinook;
SELECT C.FirstName as Nombre, C.LastName as Apellido, C.CustomerId as Id, I.Total as Precio
FROM Customer as C
JOIN Invoice as I
WHERE C.CustomerId = I.CustomerId
ORDER BY C.LastName DESC;