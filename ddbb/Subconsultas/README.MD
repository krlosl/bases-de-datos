## Reto 1: Consultas básicas

Carlos L. Garcia

En este reto trabajamos nuevamente sobre la base de datos `Chinook`. A continuación realizamos una serie de consultas con subconsultas para extraer la información pedida en cada uno de los enunciados.

El código fuente correspondiente a este reto puede consultarse en: https://gitlab.com/krlosl/ddbb/-/tree/main/UD_C1/reto2_instagram?ref_type=heads

## Query 1
En esta consulta, primero establecemos que estamos utilizando la base de datos `Chinook`. Luego, seleccionamos el nombre de la lista de reproducción, el nombre de la pista, el título del álbum, el tipo de medio de la pista y el precio unitario de las pistas. Utilizamos `JOIN` para combinar las tablas `Playlist`, `PlaylistTrack`, `Track` y `Album` según sus claves correspondientes. Luego, usamos `WHERE` para filtrar las listas de reproducción que comienzan con la letra '`M`'. Por último, usamos `LIMIT` para limitar el resultado a __3__ filas.

```sql
USE Chinook;
SELECT Playlist.Name, Track.Name, Album.Title, Track.MediaTypeId, Track.UnitPrice
FROM Playlist
JOIN PlaylistTrack ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
JOIN Track ON PlaylistTrack.TrackId = Track.TrackId
JOIN Album ON Track.AlbumId = Album.AlbumId
WHERE Playlist.Name LIKE 'M%'
LIMIT 3;
```

## Query 2
Aquí también comenzamos seleccionando la base de datos `Chinook`. Luego, seleccionamos el nombre del artista de la tabla `Artist`. Utilizamos `JOIN` para unir las tablas `Artist`, `Track`, `InvoiceLine` e `Invoice` según sus claves correspondientes. Luego, usamos `WHERE` para filtrar las pistas que tienen una duración superior a `300000` `milisegundos`.

```sql
USE Chinook;
SELECT A.Name
FROM Artist A
JOIN Track as T ON A.ArtistId = T.TrackId
JOIN InvoiceLine as IL ON T.TrackId = IL.TrackId
JOIN Invoice as I ON IL.InvoiceId = I.InvoiceId
WHERE T.Milliseconds > 300000;
```
## Query 3
Comenzamos seleccionando la base de datos `Chinook`. Luego, seleccionamos el `nombre` y `apellido` de los empleados de la tabla `Employee`. Utilizamos `EXISTS` para verificar si hay al menos una fila en la tabla `Customer` donde el `EmployeeId` del empleado coincide con el `SupportRepId` del `cliente`.

```sql
USE Chinook;
SELECT Employee.FirstName, Employee.LastName
FROM Employee
WHERE EXISTS (
    SELECT * FROM Customer WHERE Employee.EmployeeId = Customer.SupportRepId
);
```

## Query 4
 Nuevamente, seleccionamos la base de datos `Chinook`. Luego, seleccionamos el nombre de la pista, el título del álbum y el nombre del artista de las pistas que nunca se han comprado. Utilizamos `LEFT JOIN` y `RIGHT JOIN` para asegurarnos de que incluyamos todas las `pistas, álbumes y artistas`, incluso si no hay coincidencias en la tabla `InvoiceLine`. Finalmente, utilizamos `WHERE` para filtrar las filas donde `InvoiceLine.InvoiceLineId` es `NULL`, lo que significa que esas pistas nunca se han comprado.

```sql
USE Chinook;
SELECT Track.Name, Album.Title, Artist.Name
FROM Track
LEFT JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
LEFT JOIN Invoice ON InvoiceLine.InvoiceId = Invoice.InvoiceId
RIGHT JOIN Album ON Track.AlbumId = Album.AlbumId
RIGHT JOIN Artist ON Album.ArtistId = Artist.ArtistId
WHERE InvoiceLine.InvoiceLineId IS NULL;
```

## Query 5
Después de seleccionar `Chinook` como base de datos, seleccionamos el `nombre` y `apellido` de cada empleado junto con el `nombre` y `apellido` de su `supervisor` (si tienen uno). Utilizamos `LEFT JOIN` para unir la tabla `Employee` consigo misma, relacionando el campo `ReportsTo` del empleado con el `EmployeeId` del supervisor. Utilizamos `WHERE` para incluir solo las filas donde el empleado tenga un supervisor `(ReportsTo no es NULL)` o donde el empleado sea el número 1.

```sql
USE Chinook;
SELECT E1.FirstName, E1.LastName, E2.FirstName, E2.LastName
FROM Employee E1
LEFT JOIN Employee E2 ON E1.ReportsTo = E2.EmployeeId
WHERE E1.ReportsTo IS NOT NULL OR E1.EmployeeId = 1;
```

## Query 6
Seleccionamos la base de datos `Chinook` y luego seleccionamos el nombre de las pistas compradas por un cliente específico, en este caso, Luis Rojas. Utilizamos `JOIN` para unir las tablas `Track`, `InvoiceLine`, `Invoice` y `Customer` según las claves correspondientes. Luego, usamos `WHERE` para filtrar las filas donde el nombre del cliente sea '`Luis`' y el apellido '`Rojas`'.

```sql
USE Chinook;
SELECT Track.Name
FROM Track
JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
JOIN Invoice ON InvoiceLine.InvoiceId = Invoice.InvoiceId
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
WHERE Customer.FirstName = 'Luis' AND Customer.LastName = 'Rojas';
```

## Query 7
Después de seleccionar `Chinook` como base de datos, seleccionamos el `identificador de la pista`, el `nombre de la pista`, el `identificador del álbum`, el `título del álbum` y el `precio unitario` de las pistas que tienen el precio más alto en su respectivo álbum. Utilizamos `LEFT JOIN` para comparar cada pista con otras pistas en el mismo álbum y `WHERE` para filtrar las filas donde no haya pistas con un precio más alto en el mismo álbum.

```sql
USE Chinook;
SELECT T1.TrackId, T1.Name, T1.AlbumId, A.Title, T1.UnitPrice
FROM Track T1
JOIN Album A ON T1.AlbumId = A.AlbumId
LEFT JOIN Track T2 ON A.AlbumId = T2.AlbumId AND T2.UnitPrice > T1.UnitPrice
WHERE T2.TrackId IS NULL;
```
## Query 8
Seleccionamos `Chinook` como base de datos y luego seleccionamos el `identificador`, `nombre` y `apellido` de los `clientes` que han comprado todos los álbumes de un artista específico. Utilizamos `JOIN` para unir las tablas `Customer`, `Invoice`, `InvoiceLine`, `Track`, `Album` y `Artist` según las claves correspondientes. Luego, usamos `WHERE` para filtrar las filas donde el nombre del artista sea el que queremos. Utilizamos `GROUP BY` para agrupar las filas por cliente y `HAVING` para asegurarnos de que el cliente haya comprado todos los álbumes del artista específico.

```sql
USE Chinook;
SELECT C.CustomerId, C.FirstName, C.LastName
FROM Customer as C
JOIN Invoice as I ON C.CustomerId = I.CustomerId
JOIN InvoiceLine as IL ON I.InvoiceId = IL.InvoiceId
JOIN Track as T ON IL.TrackId = T.TrackId
JOIN Album as A ON T.AlbumId = A.AlbumId
JOIN Artist as AR ON A.ArtistId = AR.ArtistId
WHERE AR.Name = 'Artist Name'
GROUP BY C.CustomerId, C.FirstName, C.LastName
HAVING COUNT(DISTINCT A.AlbumId) = (
    SELECT COUNT(DISTINCT AlbumId)
    FROM Album
    WHERE ArtistId = (
        SELECT ArtistId FROM Artist WHERE Name = 'Artist Name'
    )
);
```

## Query 9
 Seleccionamos `Chinook` como base de datos y luego contamos el número de canciones en cada factura. Utilizamos `GROUP BY` para agrupar las filas por factura y `HAVING` para filtrar las facturas que tienen más de 20 canciones.

```sql
USE Chinook;
SELECT CustomerId, COUNT(*) as NúmeroCanciones
FROM InvoiceLine
GROUP BY InvoiceId
HAVING NúmeroCanciones > 20;
```

## Query 10
Después de seleccionar `Chinook` como base de datos, seleccionamos el nombre de la pista junto con el número de veces que se ha comprado, ordenado de mayor a menor número de compras. Utilizamos `JOIN` para unir las tablas `Track` e `InvoiceLine` según las claves correspondientes. Luego, utilizamos `GROUP BY` para agrupar las filas por pista, `COUNT` para contar el número de compras por pista y `ORDER BY` para ordenar los resultados. Por último, usamos `LIMIT` para mostrar solo las diez pistas más populares.

```sql
USE Chinook;
SELECT Track.Name, COUNT(InvoiceLine.TrackId) as PurchaseCount
FROM Track
JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
GROUP BY Track.TrackId
ORDER BY PurchaseCount DESC
LIMIT 10;
```

## Query 11
Seleccionamos `Chinook` como base de datos y luego seleccionamos el nombre de la pista y la duración de las pistas que tienen una duración superior al promedio de duración de todas las pistas en la base de datos. Utilizamos una subconsulta para calcular el promedio de duración de todas las pistas y luego comparamos la duración de cada pista con este promedio.

```sql
USE Chinook;
SELECT Track.Name, Track.Milliseconds
FROM Track
WHERE Track.Milliseconds > (
    SELECT AVG(Track.Milliseconds)
    FROM Track
);
```


## Query 12
Para esta consulta, primero seleccionamos `Chinook` como base de datos. Luego, contamos el `número de países únicos` de los clientes, el` número de géneros de música únicos` y el `número de pistas únicas` en la base de datos. Utilizamos `JOIN` para unir las tablas `Customer`, `Invoice`, `InvoiceLine`, `Track` y `Album` según las claves correspondientes. Luego, utilizamos `COUNT(DISTINCT)` para contar las distintas ocurrencias de países, géneros y pistas en las tablas relacionadas.

```sql
USE Chinook;
SELECT COUNT(DISTINCT Customer.Country) as NumberOfCountries, COUNT(DISTINCT Genre.Name) as NumberOfGenres, COUNT(DISTINCT Track.TrackId) as NumberOfTracks
FROM Customer
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
JOIN InvoiceLine ON Invoice.InvoiceId = InvoiceLine.InvoiceId
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
JOIN Album ON Track.AlbumId = Album.AlbumId
JOIN Artist ON Album.ArtistId = Artist.ArtistId
JOIN Genre ON Track.GenreId = Genre.GenreId;
```
## Query 13
Seleccionamos `Chinook` como base de datos y luego seleccionamos el nombre de la pista y el promedio de ventas para cada pista. Utilizamos `JOIN` para unir las tablas `Track` e `InvoiceLine` según las claves correspondientes. Luego, utilizamos `GROUP BY` para agrupar las filas por pista y calculamos el promedio de las cantidades vendidas. Utilizamos `HAVING` para filtrar las pistas cuya duración sea mayor que el promedio de ventas.

```sql
USE Chinook;
SELECT Track.Name, AVG(InvoiceLine.Quantity) as AverageSales
FROM Track
JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
GROUP BY Track.TrackId
HAVING Track.Milliseconds > AverageSales;
```

## Query 14
Después de seleccionar `Chinook` como base de datos, seleccionamos el `identificador`, `nombre` y `apellido` de los clientes de la tabla `Customer`. Utilizamos `CASE` para
clasificar el país del cliente como "`Desconocido`" si el valor es `NULL`, `"Local"` si es `"USA"` y `"Internacional"` en cualquier otro caso.

```sql
USE Chinook;
SELECT Customer.CustomerId, Customer.FirstName, Customer.LastName,
CASE
    WHEN Customer.Country IS NULL THEN 'Desconocido'
    WHEN Customer.Country = 'USA' THEN 'Local'
    ELSE 'Internacional'
END as CountryCategory
FROM Customer;
```

## Query 15
Seleccionamos `Chinook` como base de datos y luego seleccionamos el identificador de la factura y el total de la factura. Utilizamos `CASE` para aplicar un descuento del `10%` si el total de la factura es superior a `100` y dejamos el total sin cambios en caso contrario.

```sql
USE Chinook;
SELECT Invoice.InvoiceId, Invoice.Total,
CASE
    WHEN Invoice.Total > 100 THEN Invoice.Total * 0.9
    ELSE Invoice.Total
END as DiscountedTotal
FROM Invoice;
```

## Query 16
Después de seleccionar `Chinook` como base de datos, seleccionamos el `identificador`, `nombre` y `apellido` de los empleados de la tabla `Employee`. Utilizamos `CASE` para clasificar el nivel del empleado en función de su título. Si el título es "`Manager`", asignamos "`Manager`"; si es "`Assistant`", asignamos "`Asistente`"; de lo contrario, asignamos "`Empleado`".

```sql
USE Chinook;
SELECT Employee.EmployeeId, Employee.FirstName, Employee.LastName,
CASE
    WHEN Employee.Title = 'Manager' THEN 'Manager'
    WHEN Employee.Title = 'Assistant' THEN 'Asistente'
    ELSE 'Empleado'
END as EmployeeLevel
FROM Employee;
```

## Query 17
Seleccionamos `Chinook` como base de datos y luego seleccionamos el `identificador`, `nombre` y `apellido` de los clientes de la tabla `Customer`. Utilizamos `JOIN` para unir las tablas `Customer` e `Invoice` según las claves correspondientes. Utilizamos `GROUP BY` para agrupar las filas por cliente y `SUM` para calcular el total gastado por cada cliente. Luego, utilizamos `CASE` para clasificar al cliente como "`VIP`" si su gasto total es superior a `500`; de lo contrario, lo clasificamos como "`No VIP`".

```sql
USE Chinook;
SELECT Customer.CustomerId, Customer.FirstName, Customer.LastName,
CASE
    WHEN SUM(Invoice.Total) > 500 THEN 'VIP'
    ELSE 'No VIP'
END as CustomerType
FROM Customer
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.CustomerId, Customer.FirstName, Customer.LastName;
```