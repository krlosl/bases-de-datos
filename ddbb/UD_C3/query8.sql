SELECT E1.FirstName, E1.LastName, E2.FirstName, E2.LastName
FROM Employee E1, Employee E2
WHERE E1.Employeeld IN (SELECT Employeeld FROM Employee WHERE FK_Employee_ReportsTo IS NULL)
AND E1.Employeeld = E2.FK_Employee_ReportsTo
ORDER BY E1.LastName, E1.FirstName, E2.LastName, E2.FirstName LIMIT 15;