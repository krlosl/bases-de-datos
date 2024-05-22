USE Chinook;
SELECT EmployeeId, FirstName, LastName, (
	SELECT COUNT(*) AS N_Customers
    FROM Customer
    WHERE Customer.SupportRepId = Employee.EmployeeId
) AS N_Customers
FROM Employee;