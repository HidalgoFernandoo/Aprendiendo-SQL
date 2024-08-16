-- AS | Sirve para asignar un alias a una columna
SELECT nombre AS clientes FROM global.usuarios;

-- NOTA: Se puede cambiar el nombre a múltiples columnas en la misma consulta.
SELECT nombre AS nombre_cliente, apellido AS apellido_cliente FROM global.usuarios;

-- AS junto con comillas dobles para cambiar el nombre de una columna en los resultados de una consulta. Esto es útil cuando queremos dar un nombre más descriptivo o cuando el nombre de la columna contiene espacios o tildes.
SELECT nombre, gastado AS "Gasto por persona" FROM global.usuarios;
