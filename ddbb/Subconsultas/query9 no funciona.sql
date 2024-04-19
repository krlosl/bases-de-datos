USE Chinook;
SELECT CustomerId, COUNT(*) as NúmeroCanciones
FROM InvoiceLine
GROUP BY InvoiceId
HAVING NúmeroCanciones > 20;