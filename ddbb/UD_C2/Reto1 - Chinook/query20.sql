USE Chinook;
SELECT COUNT(CustomerId), Country
FROM Customer
GROUP BY Country
HAVING COUNT(CustomerId) > 5;