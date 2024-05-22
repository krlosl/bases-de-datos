-- Muestra el número de paises donde hay clientes
SELECT COUNT(DISTINCT C.Country) as Países
FROM Customer C;