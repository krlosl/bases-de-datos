USE Chinook;
SELECT E1.FirstName, E1.LastName, E2.FirstName, E2.LastName
FROM Employee E1
LEFT JOIN Employee E2 ON E1.ReportsTo = E2.EmployeeId
WHERE E1.ReportsTo IS NOT NULL OR E1.EmployeeId = 1;