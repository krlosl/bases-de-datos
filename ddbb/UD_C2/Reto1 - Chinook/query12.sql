/*Muestra el importe medio, mínimo y máximo de cada factura.*/
SELECT 	AVG(Total) as Media,
		MIN(TOTAL) as Minimo,
		MAX(TOTAL) as Maximo
FROM Invoice;