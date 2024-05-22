# Reto 1: Consultas básicas

Carlos L. Garcia

En este reto trabajamos con la base de datos `instagram_low_cost`, que nos viene dada en el fichero `instagram_low_cost.sql`. A continuación realizamos una serie de consultas para extraer la información pedida en cada uno de los enunciados.

El código fuente correspondiente a este reto puede consultarse en: https://gitlab.com/krlosl/ddbb/-/tree/main/UD_C1/reto2_instagram?ref_type=heads

## Query 1
Para seleccionar las fotos del usuario con id 36 he hecho lo siguiente, seleccionamos el `idFoto` de la tabla `fotos` y usamos un __where__ para localizar el `idUsuario` que sea igual a __36__:

```sql
-- Muestre las fotos del usuario con id 36
use instagram_low_cost;
SELECT idFoto
FROM fotos
WHERE idUsuario = 36;
```


## Query 2
Para este usamos las mismas funciones que en el ejercicio anterior pero después del `where` usamos `year` y seleccionamos __2024__ para que nos muestre las fotos del año 2024:

```sql
--Muestre las fotos del usuario con id rio con id 36 que se hayan hecho en el año 2024
use instagram_low_cost;
SELECT idFoto
FROM fotos
WHERE year() = 2024 AND idUsuario = 36;
```
## Query 3
En este ejercicio usamos las tablas `comentarios`, `comentariosFotos` y `usuarios`, las unimos con un `JOIN` y les cambiamos el nombre a nuestro gusto en este caso con las iniciales para hacerlo más corto. 
Para mostrar los comentarios de la foto 12 del usuario 36 lo hacemos de la siguiente forma:

```sql
-- Comentarios del usuario 36 sobre la foto 12 del usuario 11
use instagram_low_cost;
SELECT c.comentario
FROM comentarios c
JOIN comentariosFotos cf ON c.idComentario = cf.idComentario
JOIN usuarios u ON c.idUsuario = u.idUsuario
WHERE u.idUsuario = 36 AND cf.idFoto = 12;

```

## Query 4
Aquí selecciono todo con `*` de la columna `fotos`, la cual he denominado `f`, con un `JOIN` uno la tabla `comentarios` y digo que `idFoto` __sea igual__ al `idComentario`, y con otro `JOIN` uno la tabla usuarios y uno la columna del id de comentario con el de usuario.
Uso un `WHERE` para denominar el __id como 25__ y el comentario que sea como la reacción que se espera.  

```sql
-- Fotos que han sorprendido al usuario 25
use instagram_low_cost;
SELECT f.*
FROM fotos f
JOIN comentarios c ON f.idFoto = c.idComentario
JOIN usuarios u ON c.idUsuario = u.idUsuario
WHERE u.idUsuario = 25 AND c.comentario LIKE '%sorprendido%';
```

## Query 5
Por último, selecciono todo de la tabla `reaccionesFotos` y la denomino como `rf`, y con `WHERE` busco el `idFoto` que sea igual a `12` y el `idUsuario` que sea igual a `45` y añado como `descripción` que se a igual a `Me divierte`;

```sql
-- Número de “Me divierte” de la foto número 12 del usuario 45
use instagram_low_cost;
SELECT *
FROM reaccionesFotos as rf
WHERE rf.idFoto = 12 AND rf.idUsuario = 45 AND rf.descripcion LIKE '%Me divierte%';
```