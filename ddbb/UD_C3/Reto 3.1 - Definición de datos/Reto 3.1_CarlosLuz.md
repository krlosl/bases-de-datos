# Reto 3.1 DDL: Definición de Datos en Mysql

Autor: Carlos Luz García

En este reto definiré la estructura de datos para un programa de gestión de vuelos, incluyendo las tablas Vuelos, Pasajeros y Reservas. Explicaré cómo insertar registros y las claves foráneas. También documentaré varios comandos principales para gestionar bases de datos en SQL.

## Definición de la estructura de datos

*¿Por qué necesitamos tres tablas?*

Las tablas que necesitamos son tres (Vuelos, Pasajeros y Reservas) para organizar los datos de manera lógica. La tabla Vuelos contiene información sobre cada vuelo, la tabla Pasajeros almacena los datos de los pasajeros, y la tabla Reservas relaciona a los pasajeros con los vuelos, permitiendo la gestión de las reservas.

*¿Cuáles son las claves primarias y foráneas?*

* *Vuelos*
  - Clave primaria: vuelo_id
* *Pasajeros*
  - Clave primaria: pasajero_id
* *Reservas*
  - Clave primaria: reserva_id
  - Claves foráneas: vuelo_id (referencia a Vuelos), pasajero_id (referencia a Pasajeros)

  Esto es importante para poder relacionar los pasajeros con los vuelos, porque sin la reserva no se puede

## Sobre las restricciones

### Ventajas y desventajas de las restricciones que hemos definido

*Cancelar un vuelo:*
- *Ventaja:* Las restricciones de clave foránea aseguran que las reservas se gestionen adecuadamente.
- *Inconveniente:* Puede ser necesario realizar varias operaciones para actualizar o eliminar registros relacionados.

*Asignar un mismo asiento a dos pasajeros diferentes:*
- *Ventaja:* Las restricciones de unicidad pueden prevenir esta situación, al ser único el id de pasajero, no se puede asignar más de un asiento al mismo pasajero.

*Asignar un pasajero a un vuelo inexistente:*
- *Ventaja:* Las claves foráneas evitan esto, asegurando que no se pueda asignar un pasajero a un vuelo que no existe.
- *Inconveniente:* Requiere que los vuelos existan antes de que se puedan hacer reservas, como es lógico.

### Situaciones para asegurar la integridad de los datos

El SGBD debería manejar situaciones como:
- Evitar la sobreventa de asientos.
- Gestionar cambios de vuelo y notificar a los pasajeros.
- Manejar la duplicación de registros de pasajeros para evitar inconsistencias.

## Comandos de SQL
Algunos commits que podemos usar son:
```sql
COMMIT - para commitear
ROLLBACK - para volver hacia atrás
SET AUTOCOMMIT = 0 - para desactivar el commit
SET AUTOCOMMIT = 1 - para activar el commit
```

### Explorar bases de datos en el SGBD
Para explorar las tablas podemos usar
*USE* *nombre_de_la_base_de_datos;*
*SHOW TABLES;*
Y para conocer los tipos de datos y restricciones:
*DESCRIBE nombre_de_la_tabla;*


```sql
SHOW DATABASES;
```

# PD
Gracias por porporcionar los enlaces de W3Schools, han sido muy útiles