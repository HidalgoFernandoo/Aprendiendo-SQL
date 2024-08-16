-- ORDER BY | sirve para ordenar como se reciben los datos segun un criterio
SELECT * FROM global.usuarios ORDER BY edad;

-- ASC | ordena los elementos de menor a mayor, ascendentemente
SELECT * FROM global.usuarios ORDER BY edad ASC;

-- DESC | Ordena los elementos de mayor a menor, descendentemente
SELECT * FROM global.usuarios ORDER BY edad DESC;

-- EJEMPLO 1 - COMBINADO
SELECT * FROM global.usuarios WHERE fecha_inscripcion = "2020-07-22" ORDER BY edad DESC;


-- Para lograr que los valores nulos queden al principio o al final de la lista independiente de en cual direccion ordenemos.
-- NULLS FIRST o NULLS LAST

-- EJEMPLO - Ordena las filas de la tabla en función del precio de forma ascendente. Asegúrate de que las filas con valores nulos en la columna 'precio' aparezcan al final de la lista ordenada.
SELECT * FROM productos ORDER BY precio NULLS LAST;

SELECT * FROM productos ORDER BY stock ASC, color ASC

-- Selecciona una lista de todos los empleados ordenados por su salario y por su nombre.
SELECT * FROM empleados ORDER BY salario, nombre;

-- EJEMPLO - Selecciona todos los registros de la tabla 'productos' y ordénalos primero por 'stock' de forma descendente y luego por 'color' de forma ascendente.
SELECT * FROM productos ORDER BY stock DESC, color ASC;

SELECT * FROM productos WHERE precio > 100 ORDER BY precio DESC, nombre ASC;