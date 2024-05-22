-- clientes cuya ciudad tiene una R en tercera posición
USE empresa;
SELECT * FROM CLIENT
WHERE CIUTAT LIKE "__R%";
-- WHERE SUBSTR(CIUTAT, 3, 1) = 'R';