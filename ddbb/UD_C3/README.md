# Reto 1: Consultas de Chinook

Carlos L. Garcia

En este reto voy a realizar unas consultas en la base de datos Chinook, realizaré en total 20 consultas.
## BASE DE DATOS: Chinook

![Imagen de la base de datos](/home/daw/Imágenes/databse.png)

## Query 1
En la primera consulta seleccionamos todo con el * y con `WHERE` y el país los mostramos.

```sql
/*Muestra todos los clientes de Francia*/
SELECT * FROM Customer WHERE Country = 'France';
```

## Query 2
En esta selecionamos Invoice y `WHERE` InvoiceDate, (que es la fecha de la factura), luego `BETWEEN` el primer día del año y con `AND` el último día de marzo, el último del trimestre.

```sql
/*Muestra todas las facturas del primer trimestre*/
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
SELECT Track.Name, Track.Bytes FROM Track 
ORDER BY Track.Bytes DESC 
LIMIT 10;
```

## Query 5
Selecciono `Country` de `Costumer` para mostrar los países donde hay clientes.

```sql
/*Muestra los países donde hay clientes*/
SELECT Country FROM Customer;
```

## Query 6
Selecciono `Name` de la columna `Genre` para mostrar el nombre de todos los generos que se incluyen en esa columna.

```sql
/*Muestra el nombre de todos los generos musicales*/
SELECT Name FROM Genre;
```

## Query 7
Muestro la lista de fechas y el importe de las facturas con `SELECT`
`FROM` FACTURA

```sql
SELECT Artist.Name, Album.Title 
FROM Artist, Album 
WHERE Artist.Artistid = Album.ArtistId;
```

## Query 8
Ahora muestro los productos facturados en la factura número 3.
Lo cual hago usando `WHERE CodiFactura` y que sea igual `=` a 3 

```sql
/*LISTA DE PRODUCTOS FACTURADOS EN LA FACTURA NÚMERO 3*/
USE videoclub;
SELECT Descipcio AS DESCRIPCION 
	FROM DETALLFACTURA
		WHERE CodiFactura = 3;
```

## Query 9
Este con un pcoo más de dificultad, debo mostar la lista de facturas en orden decreciente por importe, lo cual se hace con `ORDER BY` seguido del atributo, en este caso `Import`.  

```sql
/*LISTA DE FACTURAS EN ORDEN DECRECIENTE POR IMPORTE*/
SELECT *
FROM FACTURA
ORDER BY Import DESC;
```

## Query 9
En esta última query debo mostrar la lista de los actores cuyo nombre empiece por la letra `X`.
Lo cual se consigue con `LIKE` seguido de `'%X%'`.

```sql
/*LISTA DE LOS ACTORES CUYO NOMBRE EMPIEZE POR X*/
USE videoclub;
SELECT *
FROM ACTOR
	WHERE Nom LIKE '%X%';
```