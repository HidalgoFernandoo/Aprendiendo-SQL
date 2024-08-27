-- La función MAX() la cual nos permite encontrar el valor más alto del campo que especifiquemos.
-- Cuando usamos funciones de agregación, no podemos seleccionar directamente otros elementos de la misma tabla.

-- Utilizando los mismos datos previos selecciona la mayor edad de la tabla empleados
SELECT MAX(edad) FROM empleados;

-- Función Min()
--  Esta función toma como argumento el nombre de la columna y devuelve el valor más pequeño en esa columna.

SELECT MIN(columna) FROM tabla

-- Utilizando la tabla empleados, encuentra el menor sueldo presente.
SELECT MIN(sueldo) FROM empleados;

-- SUM(). Con esta podemos sumar todos los elementos de una columna.
SELECT SUM(columna) FROM tabla
-- NOTA: Tener en cuenta que la columna sobre la cual se aplica la función SUM() debe contener valores numéricos, de lo contrario, la consulta puede generar un error o un resultado inesperado.

-- Utilizando la tabla empleados, encuentra la suma de todos los sueldos.
SELECT SUM(sueldo) FROM empleados;

-- AVG(). El nombre de la función viene del término en inglés average | Calcula promedios
SELECT AVG(columna) FROM tabla

-- Utilizando la tabla empleados, encuentra el promedio de todos los sueldos.
SELECT AVG(sueldo) FROM empleados;

-- COUNT(). Con esta podemos contar la cantidad de registros dentro de una tabla. | Cantidad de filas
SELECT COUNT(*) FROM tabla

-- NOTA: Todas las funciones se pueden combinar pero debemos respetar un orden
SELECT AVG(columna1) FROM tabla WHERE columna2 < valor

-- Utilizando la tabla empleados, calcula la suma de sueldos de todas las personas mayores a 27 años.
SELECT SUM(sueldo) FROM empleados WHERE edad > 27;

-- Utilizando la tabla empleados, calcula el promedio de los sueldos de todas las personas que ganan más de 50,000

-- NOTA: EN SQL EL PUNTO . SE UTILIZA COMO LA COMA DECIMAL
SELECT AVG(sueldo) FROM empleados WHERE sueldo > 50000;

-- Dada la siguiente tabla empleados
-- Calcula cuantas personas trabajan en el área de marketing
SELECT COUNT(*) FROM empleados WHERE departamento = "Marketing";

-- Dada la siguiente tabla empleados
-- Calcula cuantas personas trabajan en total en las areas de finanzas y marketing
SELECT COUNT(*) FROM empleados WHERE departamento = "Marketing" OR departamento = "Finanzas";

-- Conteo con condiciones con string
-- Se tiene la tabla usuarios con la siguiente información:
-- Cuenta la cantidad de usuarios cuyo nombre termina con la letra 'a' en la tabla de usuarios.

SELECT COUNT(*) FROM usuarios WHERE SUBSTR(nombre, -1, 2) = "a";