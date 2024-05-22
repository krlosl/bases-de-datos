USE Chinook;
SELECT Employee.EmployeeId, Employee.FirstName, Employee.LastName,
CASE
    WHEN Employee.Title = 'Manager' THEN 'Manager'
    WHEN Employee.Title = 'Assistant' THEN 'Asistente'
    ELSE 'Empleado'
END as EmployeeLevel
FROM Employee;