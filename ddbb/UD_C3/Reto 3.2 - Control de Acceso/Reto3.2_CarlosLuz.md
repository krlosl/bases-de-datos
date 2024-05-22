# Gestión de Usuarios en MySQL

Made by: __Carlos Luz García__

En este documento, voy a documentar cómo registrar, modificar y eliminar usuarios en MySQL, cómo se autentican y las opciones de autenticación que ofrece este SGBD.

También explicaré cómo mostrar los usuarios existentes y sus permisos, los tipos de permisos disponibles, y qué permisos son necesarios para gestionar usuarios y sus permisos. 

Además, incluiré la posibilidad de agrupar usuarios y los comandos necesarios para gestionar usuarios y sus permisos.

## Registro, Modificación y Eliminación de Usuarios

### Crear un Nuevo Usuario

Para crear un nuevo usuario en MySQL, usamos el comando `CREATE USER` seguido de las credenciales del usuario.

```sql
CREATE USER 'nombre_usuario'@'host' IDENTIFIED BY 'contraseña';
-- en caso de que necesitemos identificar al usuario con su contraseña
```
`nombre_usuario` introduciremos el nombre del usuario de la tabla

`host`el host desde el cual el usario puede conectarse -- podríamos cambiarlo por `localhost`

`contraseña`la contraseña del usuario

### Modificar un usuario existente

Para esto, utilizaremos el comano `ALTER USER`.
```sql
'christian'@'localhost' IDENTIFIED BY 'contraseña';
-- ahora le cambiaremos la contraseña
ALTER USER 'christian'@'localhost' IDENTIFIED BY '123';
```

### Elminar un usuario

Para esta acción utilizaremos el comando `DROP USER`.
```sql
DROP USER 'usuario'@'localhost';
```

Con esto, habremos eliminado el usuario con los parámetros que introduzcamos

## Autenticación de usuarios

Mysql ofrece varios métodos de autenticación como pueden ser:

__Basada en contraseña__: El común método donde los usuarios entran mediante un nombre de usuario y una contraseña

__Autenticación de Pluggable Authentication Modules (PAM)__: Permite la integración con el sistema de autenticación PAM.

__Autenticación LDAP__: Utiliza LDAP para la autenticación de usuarios.

__Autenticación con Certificados SSL/TLS__: Los usuarios se autentican mediante certificados SSL/TLS.

```sql
-- quiero destacar que esta información me la ha proporcionado chat gpt porque le he pedido que me explicara un poco los métodos
```

Por ejemplo, si quieremos que un usuario necesite SSL para iniciar sesión podriamos usar este comando

```sql
CREATE USER 'usuario'@'localhost' REQUIRE SSL;
```

Con los demás métodos sería exactamente lo mismo, `REQUIRE PAM` `REQUIRE LDAP` `REQUIRE TLS`.

## Mostrar usuarios existentes y sus permisos

Para ver los permisos de un usuario específico usaríamos el comando __GRANTS__

```sql
-- esto mostraría los permisos que tiene el usuario designado
SHOW GRANTS FOR 'usuario'@'localhost';
```

## Permisos de usuario y nivel de granularidad

### Tipos de permiso

Mysql ofrece diferentes tipos de permiso, estos son:

__Globales__: Afectan a toda la base de datos.

__De base de datos__: Afectan a una base de datos específica como podría ser Chinook.

__De Tabla__: Afectan a las tablas específicas de una base de datos.

__De Columna__: Afectan a las columnas específicas de una tabla de una base.

__De procedimiento o Función__: Afectan a procedimientos y funciones almacenadas.

## Permisos para la gestión de usuarios

A un usuario el cual su rol fuera gestionar los permisos y los usuarios deberíamos concederle los siguientes permisos de administrador:

`CREATE USER`, `DROP USER`, `GRANT`, `REVOKE`

```sql
-- esto otorgaría los permisos de crear y eliminar usuarios al usuario designado
GRANT CREATE USER, DROP USER, GRANT OPTION TO *.* TO 'usuario'@'localhost';
```

## Agrupación de usuarios

### Creación de roles
Con mysql también tenemos la posibilidad de agrupar por por grupos y por roles a los usuarios de la base de datos.

Para esto primero deberíamos crear un rol.

```sql
-- esto crea un rol con el nombre que deseemos
CREATE ROL 'nombre_rol';
```

```sql
-- con esto asignaremos los permisos de ver e insertar datos en todas las tablas de la base de datos que consideremos
GRANT SELECT, INSERT ON 'base_de_datos'.* TO 'nombre_rol';
```

```sql
-- con esto asignaremos el rol creado a un usuario
GRANT 'nombre_rol' TO 'usuario'@'localhost';
```
```sql
-- con este ejemplo, podríamos agrupar a los usuarios por roles
SELECT bd.Rol AS 'Rol', GROUP_CONCAT(CONCAT(bd.usuario, '@', bd.localhost)) AS 'usuarios'
FROM 'base_datos' bd
GROUP BY bd.Rol;
```

La salida del último ejemplo debería ser algo parecido a esto:
```sql
+------+----------------------+
| rol  | usuarios             |
+------+----------------------+
| rol1 | `usuario1`@`localhost`,`usuario3`@`localhost` |
| rol2 | `usuario2`@`localhost`                        |
+------+----------------------+
```

## Gestión de usuarios y permisos

A continuación, proporcionaré una serie de comandos para gestionar los usuarios y sus permisos

```sql
-- crearemos un usuario y le agregaremos una contraseña
CREATE USER 'nombre'@'localhost' IDENTIFIED BY 'contraseña';
```
```sql
-- modificaremos la contraseña del usuario
ALTER USER 'nombre'@'localhost' IDENTIFIED BY 'nueva_contraseña';
```
```sql
-- mostraremos los permisos de un usuario
SHOW GRANTS FOR 'nombre'@'localhost';
```
```sql
-- asignaremos permisos a un usuario
GRANT SELECT, INSERT ON `base_datos`.* TO 'nombre'@'localhost';
```
```sql
-- le quitaremos permisos de ver e insertar datos en las tablas a un usuario
REVOKE SELECT, INSERT ON 'base_datos'.* FROM 'nombre'@'localhost';
```