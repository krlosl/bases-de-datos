-- Facturas cuyo importe sea mayor de 5 y menor de 10
USE videoclub;
SELECT * FROM FACTURA
WHERE IMPORT < 5
AND IMPORT > 10;
