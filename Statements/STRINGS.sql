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

--  Si queremos obtener la cadena más corta de la columna, debemos combinar la función LENGTH() con ORDER BY y LIMIT.
SELECT LENGTH(nombre) as largo_nombre FROM usuarios ORDER BY LENGTH(nombre) LIMIT 1 ;

SELECT LENGTH(nombre) as largo_nombre FROM usuarios ORDER BY LENGTH(nombre) DESC LIMIT 1 ;

-- Utiliza lo aprendido para seleccionar los 3 correos más largos de la tabla. El resultado debe mostrar dos columnas: una con los emails y otra con sus largos respectivos.
SELECT email, LENGTH(email) FROM usuarios ORDER BY LENGTH(email) DESC LIMIT 3;

-- Concatenar strings
-- si tenemos una columna con un nombre y otra con un apellido, podemos generar una única columna con el nombre y apellido. 

SELECT nombre || ' ' || apellido AS nombre_completo FROM empleados;

-- Supongamos que tienes una tabla llamada productos con los campos 'producto', 'marca' y 'precio'. Selecciona una lista de todos los productos con su nombre, seguido de un guion ("-"), y su marca. Asigna el alias 'marca_producto' a la columna creada.
SELECT producto || "-" || marca AS marca_producto FROM productos; 

-- Seleccionando caracteres de un string con SUBSTR
-- SUBSTR( string, inicio, largo )
-- tiene 3 argumentos
-- 1. String: el nombre de la columna o palabra que será utilizada 
-- 2. Inicio: un integer que especifica la posicion de inicio desde la cual se extraerán caracteres al string. 
-- 3. Largo: la cantidad de caracteres extraidos

SELECT SUBSTR(nombre, 1, 1) AS primera_letra FROM productos;
-- En este ejemplo estamos indicando que en la columna nombre, partiendo desde su primera letra, nos devuelva sólo 1 caracter que corresponderá a la primera letra de cada nombre.
-- algunas funciones tienen distintos nombres dependiendo del motor de base de datos.

-- Se tiene una tabla de usuarios con las columnas nombre y apellido. Utilizando la función SUBSTR(), selecciona 3 caracteres del apellido de María, partiendo desde el segundo caracter. Asigna el alias 'tres_caracteres_del_apellido' a la columna creada.
SELECT SUBSTR(apellido, 2, 3) AS "tres_caracteres_del_apellido" FROM usuarios WHERE nombre = "María";

