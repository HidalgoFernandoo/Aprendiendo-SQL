-- En SQL el keyword DISTINCT nos permite filtrar los resultados repetidos de una consulta.
-- DISTINCT | Lo que hace es traer los resultados distintos a lo que nosotros señalamos
SELECT DISTINCT name FROM usuarios;

-- Intentemos que nos muestre solo los campos que son distintos.
SELECT DISTINCT fecha_inscripcion FROM global.usuarios;

-- Supongamos que tenemos la siguiente tabla llamada colores
-- Nos piden crear una consulta que nos muestre cada color una única vez. Para esto utilizaremos la siguiente consulta

SELECT DISTINCT color AS color_unico FROM colores;

-- Dada la siguiente tabla de usuarios
-- Crea una consulta que nos muestre cada correo una única vez. La columa mostrada debe llamarse correo_unico

SELECT DISTINCT correo AS correo_unico FROM usuarios;

-- Se tiene la tabla ventas con la siguiente información:
-- Se nos ha solicitado crear una consulta que muestre los años en los que se han realizado transacciones, excluyendo repeticiones.
SELECT DISTINCT strftime('%Y', fecha_venta) as año_unico FROM ventas

-- Utilizando la misma tabla de ventas previamente utilizada, selecciona todos los meses distintos, asignándole a la columna el alias "mes_unico".
SELECT DISTINCT STRFTIME("%m", fecha_venta) AS mes_unico FROM ventas;

--  podemos combinar las funciones COUNT y DISTINCT de la siguiente manera:COUNT(DISTINCT columna)
-- Podemos contar la cantidad de departamentos únicos de la empresa con:
SELECT COUNT(DISTINCT Departamento) FROM Empleados;

-- Crea una consulta que cuente la cantidad de teléfonos únicos en la tabla. La columna mostrada debe llamarse telefonos_unicos

SELECT COUNT(DISTINCT telefono) AS telefonos_unicos FROM usuarios;

-- Dada la siguiente tabla de usuarios
-- Crea una consulta para contestar cuantos correos únicos existen en la tabla. La columna resultante debe llamarse correos_cant
SELECT COUNT(DISTINCT correo) AS correos_cant FROM usuarios;

-- Podemos usar DISTINCT con más de una columna para obtener combinaciones únicas de esas columnas. Supongamos que tienes una tabla llamada empleados con las columnas departamento y puesto.

SELECT DISTINCT departamento, puesto FROM empleados;

-- Para la siguiente tabla "productos" deseamos obtener todas las combinaciones únicas de "Categoria" y "Precio"
SELECT DISTINCT categoria, precio FROM productos;
