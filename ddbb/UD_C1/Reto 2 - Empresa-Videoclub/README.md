# Reto 1: Consultas básicas II

Carlos L. Garcia

En este reto voy a hacer unas consultas en la base de datos `Empresa` y en `videoclub`, dónde haré 5 consultas en cada base de datos.
## BASE DE DATOS: EMPRESA

![Imagen de la base de datos empresa](/home/daw/Imágenes/empresa.png)

## Query 1
En esta query debo mostrar el código y la descripción de los prodcutos por lo que uso empresa y selecciono todo desde la columna `PRODUCTE`.

```sql
/*MUESTRA LOS EL CODIGO Y LA DESCRIPCIÓN DE LOS PRODUCTOS*/
USE empresa;
SELECT * FROM PRODUCTE;
```

## Query 2
Aquí muestro el código y descipción de todos los productos que tengan `Tennis` en su descripción.
Por lo que uso el `LIKE %tennis%` para seleccionarlos.

```sql
/*MUESTRA EL CODIGO Y DESCRIPCION DE TODOS LOS PRODUCTOS QUE CONTENGAN TENNIS EN SU DESCRIPCIÓN*/
USE empresa;
SELECT * FROM PRODUCTE
WHERE DESCRIPCIO LIKE '%tennis%';
```

## Query 3
En este debo mostar el nombre, dirección y teléfono de los clientes de la empresa, por lo cual selecciono todos los atributos uno por uno de `CLIENT`.

```sql
/*MUESTRA EL NOMBRE, DIRECCION Y TELEFONO DE TODOS LOS CLIENTES DE LA EMPRESA*/
USE empresa;
SELECT Nom as Nombre, Adreca as Direccion, Telefon as Telefono
FROM CLIENT
```

## Query 4
En esta query muestro el codigo, el nombre y la direccion de los clientes que no son del área telefónica 636.
Selecciono los atributos uno por uno de CLIENT como el ejercicio anterior pero ahora con `WHERE` le digo que no sea del área 636 con `!=`.

```sql
/*MUESTRA EL CODIGO NOMBRE Y DIRECCION DE LOS CLIENTES QUE NO SON DEL AREA TELEFONICA 636*/
USE empresa;
SELECT CLIENT_COD AS CODIGO, Nom as NOMBRE, Adreca as DIRECCION
FROM CLIENT
	WHERE AREA != 636;
```

## Query 5
Como las anteriores, selecciono cada atributo, les cambio los nombres y selecciono desde `COMANDA`.

```sql
/*MUESTRA LAS ORDENES DE COMPRA DE LA TABLA DE PEDIDOS (CODIGO, FECHA DE ORDEN Y DE ENVIO)*/
USE empresa;
SELECT COM_NUM AS CODIGO, COM_DATA AS FECHA, DATA_TRAMESA AS ENVIO
FROM COMANDA;
```
## BASE DE DATOS: VIDEOCLUB

![Imagen de la base de datos videoclub](/home/daw/Imágenes/videoclub.png)

## Query 6
Aquí cambiamos a la base de datos `videoclub`, así que es lo mismo que en la query1 pero solamente cambiando la base de datos.

```sql
/*LISTA DE NOMBRES Y TELEFONOS DE LOS CLIENTES*/
USE videoclub;
SELECT Nom AS NOMBRE, Telefon AS TELEFONO
FROM CLIENT;
```

## Query 7
Muestro la lista de fechas y el importe de las facturas con `SELECT`
`FROM` FACTURA

```sql
/*LISTA DE FECHAS E IMPORTE DE LAS FACTURAS*/
USE videoclub;
SELECT Data AS FECHA, Import AS IMPORTE
FROM FACTURA;
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