-- Algunos registros pueden tener valores nulos para algunos de sus campos. Por ejemplo, podríamos tener una tabla de usuarios con nombres y emails pero no tener todos los nombres de cada uno de los registros como ilustra la siguiente tabla.
-- Para seleccionar todos los valores no nulos utilizaremos IS NOT NULL

-- EJEMPLO - Seleccionar todos los nombres no nulos
SELECT * FROM empleados WHERE nombre IS NOT NULL;

/* EJEMPLO 
   Se tiene una tabla productos con id, nombre, precio y descuento, siendo descuento de tipo integer.
   Selecciona todos los registros de la tabla productos cuyo campo descuento no sea nulo.
*/
SELECT * FROM productos WHERE descuento NOT NULL;

-- Seleccionar valores NULOS
-- Seleccionar todos los usuarios que no tengan un número de teléfono registrado en la tabla de usuarios.
SELECT * FROM usuarios WHERE telefono IS NULL;

-- EJEMPLO - Selecciona todos los usuarios que no tengan un email registrado en la tabla de usuarios.
