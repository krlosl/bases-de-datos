USE Chinook;
SELECT Customer.CustomerId, Customer.FirstName, Customer.LastName,
CASE
    WHEN SUM(Invoice.Total) > 500 THEN 'VIP'
    ELSE 'No VIP'
END as CustomerType
FROM Customer
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.CustomerId, Customer.FirstName, Customer.LastName;