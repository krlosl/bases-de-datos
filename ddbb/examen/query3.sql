USE empresa;
SELECT COGNOM, OFICI, SALARI, COMISSIO
FROM EMP
WHERE COMISSIO IS NULL
AND SALARI > 300000;