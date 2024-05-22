USE Chinook;
SELECT Employee.FirstName, Employee.LastName
FROM Employee
WHERE EXISTS (
    SELECT * FROM Customer WHERE Employee.EmployeeId = Customer.SupportRepId
);