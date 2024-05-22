# Reto 1: Consultas de Chinook

Carlos L. Garcia

En este reto voy a realizar unas consultas en la base de datos Chinook, realizaré en total 20 consultas.
## BASE DE DATOS: Chinook

![Imagen de la base de datos](/home/daw/Imágenes/databse.png)

## Query 1
En la primera consulta seleccionamos todo con el * y con `WHERE` y el país los mostramos.

```sql
/*Muestra todos los clientes de Francia*/
USE Chinook;
SELECT * FROM Customer WHERE Country = 'France';
```

## Query 2
En esta selecionamos Invoice y `WHERE` InvoiceDate, (que es la fecha de la factura), luego `BETWEEN` el primer día del año y con `AND` el último día de marzo, el último del trimestre.

```sql
/*Muestra todas las facturas del primer trimestre*/
USE Chinook;
SELECT * FROM Invoice WHERE InvoiceDate
BETWEEN '2023-01-01' AND '2023-03-31';
```

## Query 3
En esta selecciono las filas `Name` y `Composer` de la columna `Track` y uso `WHERE` para localizar a AC/DC.

```sql
/*Muestra todas las canciones compuestas por AC/DC*/
use Chinook;
SELECT Name as "Nombre", Composer as "Compositor" FROM Track 
WHERE Composer = 'AC/DC';
```

## Query 4
Selecciono el nombre de la canción con `Track.Name` y el tamaño en bytes con `Track.Bytes`, lo ordeno de mayor a menor y pongo el límite en 10.

```sql
/*Muestra las 10 canciones que más tamaño ocupan*/
USE Chinook;
SELECT Track.Name, Track.Bytes FROM Track 
ORDER BY Track.Bytes DESC 
LIMIT 10;
```

## Query 5
Selecciono `Country` de `Costumer` para mostrar los países donde hay clientes.

```sql
/*Muestra los países donde hay clientes*/
USE Chinook;
SELECT Country FROM Customer;
```

## Query 6
Selecciono `Name` de la columna `Genre` para mostrar el nombre de todos los generos que se incluyen en esa columna.

```sql
/*Muestra el nombre de todos los generos musicales*/
USE Chinook;
SELECT Name FROM Genre;
```

## Query 7
Cojo la tabla `Artist` y `Album` y selecciono el Nombre y el título, nombrados como `Name` y `TItle` y muestro el id del artista de la tabla `Artist` con el id del artista de la tabla `Album` para que los empareje y muestre cada artista con su album correspondiente

```sql
/*Muestra todos los artistas junto a sus álbumes*/
USE Chinook;
SELECT Artist.Name, Album.Title 
FROM Artist, Album 
WHERE Artist.Artistid = Album.ArtistId;
```

## Query 8
Seleccionamos el nombre del empleado (`FirstName`), la fecha de cumpleaños (`BirthDate`) y el nombre del supervisor (`FirstName`), todo sacado de la columna `Employee`, con `JOIN` unimos otra columna igual pero designada como __supervisor__ y asociamos `ReportsTo` de la tabla empleado con el `EmployeeId` de la tabla supervisor para sacar los que estén asociados, los ordenamos por la fecha de nacimiento(`BIRTH DATE`) con `ORDER BY` del empleado en forma ordenada, con `DESC`, y ajustamos el límite(`LIMIT`) en 5.

```sql
/* Muestra los nombres de los 5 empleados más jóvenes junto a los nombres de sus supervisores, si los tienen */ 
USE Chinook;
SELECT empleado.FirstName as Empleado, empleado.BirthDate as FechaNacimiento, supervisor.FirstName as Nombre
FROM Employee as empleado
JOIN Employee as supervisor
ON empleado.ReportsTo = supervisor.EmployeeId
ORDER BY empleado.BirthDate DESC
LIMIT 5;
```

## Query 9
A partir de las columnas `Customer` e `Invoice`, asignamos un Alias `C` e `I` correspondientemente, y ahora de la tabla `Invoice` seleccionamos la fecha de la factura(`InvoiceDate`), el nombre del cliente(`FirstName`), la dirección del cliente(`Address`), el código postal(`PostalCode`), el país(`Country`) y nuevamente de la tabla `Invoice` seleccionamos el `Importe`(`Total`), les asociamos un `ALIAS` a cada uno, (según preferencias), y cogemos el id de cliente de la tabla invoice(`I.CustomerId`) que esté asociado al id del cliente de la tabla customer(`C.CustomerId`), designamos __Berlin__ como la ciudad del cliente que queremos que salga y lo ordenamos(`ORDER BY`) según nos pidan o según nuestras preferencias.

```sql
/*Muestra todas las facturas de los clientes berlineses. Deberán mostrarse las columnas: fecha de la factura, nombre completo del cliente, dirección de facturación, código postal, país, importe (en este orden)*/
SELECT I.InvoiceDate as FechaFactura,
C.FirstName as Nombre, 
C.LastName as Apellido, 
C.Address as Direccion, 
C.PostalCode as CodigoPostal, 
C.Country as Pais, 
I.Total as Importe
FROM Customer as C
JOIN Invoice as I
ON I.CustomerId = C.CustomerId
Where C.City = 'Berlin'
GROUP BY I.InvoiceDate, C.FirstName, C.LastName, C.Address, C.PostalCode, C.Country, I.Total;
```

## Query 10
A partir de las tablas con su propio alias: (`Playlist` como `Lista`), (`PlayListTrack` como `PLT`), (`Track` como `track`) y `Album` como `alb` la cuales unimos con `JOIN`, seleccionamos el nombre de la lista `Lista` (`Lista.Name`) y la designamos como `Playlist`, el titulo y los milisegundos y seleccionamos el `Playlist`Id de Lista que esté asociado con el `Playlist`Id de PLT, y con AND seleccionamos otras dos listas, TrackId de la tabla PLT y de la tabla track y AlbumId de la tabla track y de la tabla alb.
Donde el nombre comience por C y lo ordenamos por el Id del album y por la duración, de forma decreciente 


```sql
/* Muestra las listas de reproducción cuyo nombre comienza por C, junto a todas sus canciones, ordenadas por álbum y por duración.*/
USE Chinook;
SELECT Lista.Name as Playlist, track.Name as Cancion, alb.Title as album, track.Milliseconds as Tiempo
FROM Playlist as Lista
JOIN PlaylistTrack as PLT JOIN Track AS track JOIN Album AS alb
ON Lista.PlaylistId = PLT.PlaylistId
AND PLT.TrackId = track.TrackId AND track.AlbumId = alb.AlbumId
WHERE Lista.Name LIKE "C%"
ORDER BY track.AlbumId, track.Milliseconds Desc;
```

## Query 11

```sql
/*Muestra qué clientes han realizado compras por valores superiores a 10€, ordenados por apellido.*/
USE Chinook;
SELECT C.FirstName as Nombre, C.LastName as Apellido, C.CustomerId as Id, I.Total as Precio
FROM Customer as C
JOIN Invoice as I
WHERE C.CustomerId = I.CustomerId
ORDER BY C.LastName DESC;
```
## Query 12

```sql
/*Muestra el importe medio, mínimo y máximo de cada factura.*/
SELECT 	AVG(Total) as Media,
		MIN(TOTAL) as Minimo,
		MAX(TOTAL) as Maximo
FROM Invoice;
```
## Query 13

```sql
/*Muestra el número total de artistas*/
SELECT COUNT(DISTINCT A.Artistid) as Artistas
FROM Artist AS A;
```
## Query 14

```sql
/*Muestra el número de canciones del álbum “Out Of Time”.*/
SELECT COUNT(T.TrackId) as Canciones
FROM Track as T
JOIN Album as A
ON T.AlbumId = A.AlbumId
WHERE A.Title = "Out Of TIme";
```
## Query 15

```sql
/*Muestra el número de paises donde hay clientes*/
SELECT COUNT(DISTINCT C.Country) as Países
FROM Customer C;
```
## Query 16

```sql

```
## Query 17

```sql

```
## Query 18

```sql

```
## Query 19

```sql

```
## Query 20

```sql
USE Chinook;
SELECT COUNT(CustomerId), Country
FROM Customer
GROUP BY Country
HAVING COUNT(CustomerId) > 5;
```