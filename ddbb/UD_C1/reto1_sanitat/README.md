# Reto 1: Consultas básicas

Carlos L. Garcia

En este reto trabajamos con la base de datos `sanitat`, que nos viene dada en el fichero `sanitat.sql`. A continuación realizamos una serie de consultas para extraer la información pedida en cada uno de los enunciados.

El código fuente correspondiente a este reto puede consultarse en: https://gitlab.com/krlosl/ddbb/-/tree/main/UD_C1/reto1_sanitat?ref_type=heads

## Query 1
Para seleccionar el número, nombre y teléfono de todos los hospitales existentes, seleccionaremos estos tres atributos, que se corresponden con las columnas `HOSPITAL_COD`, `NOM`, y `TELEFON`, respectivamente, de la tabla `HOSPITAL`. También he usado el comando "as" con el que se consigue cambiar el nombre de las columnas al gusto, por ejemplo en vez de HOSPITAL_COD pondrá Código. Lo llevaremos a cabo con la siguiente sentencia SQL:

```sql
--Muestre los hospitales existentes (número, nombre y teléfono).
SELECT HOSPITAL_COD as "Código",NOM as "Nombre",TELEFON as "Teléfono" FROM HOSPITAL;
```


## Query 2
He resuelto el ejercicio de la siguiente manera, igual que el ejercicio anterior solo que añadimos `WHERE` seguido de `SUBSTRING` 2 y 1 con la letra `A` para sacar que la segunda letra del nombre sea la `A`.

```sql
--Muestre los hospitales existentes (número, nombre y teléfono) que tengan una letra A en la segunda posición del nombre.
USE sanitat;
SELECT HOSPITAL_COD as "Código", NOM as "Nombre", TELEFON as "Teléfono"
FROM HOSPITAL
WHERE SUBSTRING(NOM, 2, 1) = 'A';
```
## Query 3
En este ejercicio selecciono los atributos `HOSPITAL_COD`, `SALA_COD`, `EMPLEAT_NO` y `COGNOM` para sacar las columnas correspondientes de la plantilla.

```sql
--Muestre los trabajadores (código hospital, código sala, número empleado y apellido) existentes.
USE sanitat;
SELECT HOSPITAL_COD as "Código", SALA_COD as "Código sala", EMPLEAT_NO as "Num Empleado", COGNOM
FROM PLANTILLA;
```

## Query 4
Aquí selecciono lo mismo que el ejercicio anterior pero añado el `WHERE` seguido de `TORN` no igual "!=" a `N` así extraigo los empleados que no son del turno de noche. 

```sql
--Muestre los trabajadores (código hospital, código sala, número empleado y apellido) que no sean del turno de noche.
USE sanitat;
SELECT HOSPITAL_COD as "Código", SALA_COD as "Código sala", EMPLEAT_NO as "Num Empleado", COGNOM
FROM PLANTILLA
	WHERE TORN != "N";
```

## Query 5
Aquí de `MALALT` saco el año `YEAR` y la fecha de nacimiento, que corresponde a `DATA_NAIX` y sea igual a 1960 para enseñar los enfermos de 1960.

```sql
--Muestre a los enfermos nacidos en 1960.
USE sanitat;
SELECT *
FROM MALALT
WHERE YEAR(DATA_NAIX) = 1960;
```

## Query 6
Aquí igual que el ejercicio anterior pero que sea mayor o igual >= a 1960 para sacar los que hayan enfermado después de 1960.

```sql
--Muestre a los enfermos nacidos a partir del año 1960.
USE sanitat;
SELECT *
FROM MALALT
WHERE YEAR(DATA_NAIX) >= 1960;
```