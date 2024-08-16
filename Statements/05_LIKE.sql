-- CRITERIOS DE BUSQUEDA DINAMICOS
-- LIKE | se utiliza para señalar que si un elemento contiene o se parece a "X" búsqueda lo muestre

-- Ejemplo 1 - Obtener todos los nombres que contengan al menos una letra "a":
SELECT * FROM global.usuarios WHERE nombre LIKE "%a";
-- En este caso mostrará los nombres que terminen con la letra "a"

SELECT * FROM global.usuarios WHERE nombre LIKE "%a%";
-- En este caso mostrará los nombres que comiencen, contengan o terminen con la letra "a"*

-- EJEMPLO - buscar todos los usuarios cuyo nombre empiece con la letra 'J' en la tabla de usuarios.
SELECT * FROM usuarios WHERE nombre LIKE 'J%'