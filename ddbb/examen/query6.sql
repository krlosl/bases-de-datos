USE videoclub;
SELECT CodiFactura FROM FACTURA
WHERE month(DATA) = 3
order by Import DESC;
