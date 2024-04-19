USE Chinook;
SELECT Customer.CustomerId, Customer.FirstName, Customer.LastName,
CASE
    WHEN Customer.Country IS NULL THEN 'Desconocido'
    WHEN Customer.Country = 'USA' THEN 'Local'
    ELSE 'Internacional'
END as CountryCategory
FROM Customer;