-- Muestra los nombres de los 15 empleados más jóvenes junto a los nombres de
-- sus supervisores, si los tienen
USE Chinook;
SELECT empleado.FirstName as Empleado, empleado.BirthDate as FechaNacimiento, supervisor.FirstName as Nombre
FROM Employee as empleado
JOIN Employee as supervisor
ON empleado.ReportsTo = supervisor.EmployeeId
ORDER BY empleado.BirthDate DESC
LIMIT 5;