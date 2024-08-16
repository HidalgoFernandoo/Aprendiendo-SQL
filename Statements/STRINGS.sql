-- Podemos seleccionar todos los nombres transformándolos a mayúsculas utilizando la siguiente consulta:
SELECT UPPER(nombre) FROM usuarios;

-- NOTA: No modifica los datos en la tabla, sólo los transforma para los resultados de la consulta.

-- NOTA: Al utilizar funciones de este tipo, será frecuente que renombremos la columna utilizando un alias.

/*
Se tiene una tabla de usuarios con las columnas nombre, apellido, email y teléfono.

Selecciona los emails de la tabla usuarios con el alias email_upper. Todos los emails deben ser mostrados en mayúsculas.
*/

SELECT UPPER(email) AS email_upper FROM usuarios; 

/*
Se tiene una tabla de usuarios con los campos id, nombre, e email. El campo email es de tipo texto y contiene algunas mayúsculas, lo que puede ocasionar errores en la base de datos.

Selecciona los emails de la tabla usuarios con el alias email_lower. Todos los emails deben ser mostrados en minúsculas.
*/

SELECT LOWER(email) AS email_lower FROM usuarios;

-- Quitando espacios en blanco de un string | la función TRIM() se utiliza para eliminar los espacios en blanco iniciales y finales de un string.

-- si tenemos una tabla de productos con una columna 'nombre' que contiene espacios en blanco al inicio y final de cada nombre, podemos utilizar la siguiente consulta para quitar esos espacios:
SELECT TRIM(nombre) FROM productos;

-- En SQL podemos combinar funciones. Veamos un ejemplo combinando LOWER y TRIM :

SELECT LOWER(TRIM(email)) as email_limpios from usuarios;

-- En SQL, podemos utilizar la función LENGTH() para obtener la longitud de una cadena de caracteres. 
-- Por ejemplo, si queremos obtener la longitud del nombre de todos los usuarios en la tabla 'usuarios'
SELECT nombre, LENGTH(nombre) FROM usuarios;

SELECT LENGTH(apellido) FROM usuarios;