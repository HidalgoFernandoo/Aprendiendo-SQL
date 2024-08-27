-- La cláusula GROUP BY es una poderosa herramienta en SQL que se utiliza para agrupar filas con valores idénticos en una o varias columnas específicas, permitiendo realizar operaciones de agregación en cada grupo.

-- GROUP BY es comúnmente utilizada junto con funciones de agregación como COUNT, MAX, MIN, SUM y AVG para obtener información resumida de un conjunto de datos.

--  GROUP BY para obtener todos los elementos distintos de una tabla
SELECT color as color_unico FROM colores GROUP BY color

-- Dada la siguiente tabla de usuarios
-- Crea una consulta que nos muestre cada correo una única vez. La columa mostrada debe llamarse correo_unico
-- NOTA: El alias va junto a la variable
SELECT correo AS correo_unico FROM usuarios GROUP BY correo;

-- Queremos saber cuantas veces aparece cada color. Esto lo podemos lograr combinando GROUP BY y la función de agregación COUNT
SELECT color, COUNT(color) as Repeticiones FROM colores GROUP BY color

-- Dada la siguiente tabla de usuarios
-- Crea una consulta que nos muestre cada correo una única vez junto a la cantidad de repeticiones. Las columnas deben llamarse correo y repeticiones.

SELECT correo AS correo, COUNT(CORREO) as repeticiones FROM usuarios GROUP BY correo;

-- Dada la siguiente tabla empleados
-- Se pide contar cuantas personas trabajan en cada departamento. Las columnas resultantes deben llamarse departamento y cantidad_empleados
SELECT departamento, COUNT(departamento) AS cantidad_empleados FROM empleados GROUP BY departamento;

-- Agrupar y sumar

-- Si queremos calcular cuanto ha gastado cada cliente, podemos realizar la siguiente consulta

SELECT Cliente, SUM(Monto) AS Monto_Total FROM pedidos GROUP BY Cliente;

-- Utilizando la siguiente tabla ventas de una empresa, crea una consulta que muestre cuanto se vendió en total por cada categoría. Las columnas de la consulta deben llamarse categoria y monto_total
SELECT categoria, SUM(monto) AS monto_total FROM ventas GROUP BY categoria;

-- Previamente aprendimos que AVG nos permite calcular el promedio de los elementos de una columna en una tabla. En este ejercicio lo utilizaremos para calcular promedios por grupo.
SELECT grupo, AVG(columna) FROM tabla GROUP by grupo

-- Encuentra el promedio de notas de cada estudiante. Las columnas deben tener el nombre de Nombre_Completo y Promedio_Notas respectivamente.

-- Dada la siguiente tabla de estudiantes

-- Este ejercicio tiene un supuesto importante: que no hay dos estudiantes con el mismo nombre y apellido. Discutiremos este tipo de supuestos más adelante cuando revisemos el concepto de integridad.

SELECT nombre_completo, AVG(nota) AS promedio_notas FROM estudiantes GROUP BY nombre_completo;

-- En este ejercicio combinaremos la función de agregación MAX() con group by para poder obtener el monto mas alto de cada grupo. La sintaxis de la consulta será igual a las vistas previamente, es decir:

SELECT grupo, MAX(columna) FROM tabla GROUP by grupo


-- Dada la siguiente tabla de ventas:
-- Crea una consulta para calcular el monto mas alto por cada categoría. La tabla resultante debe tener dos columnas: categoria y monto_mas_alto.
SELECT categoria, MAX(monto) AS monto_mas_alto FROM ventas GROUP BY categoria;


-- En este ejercicio combinaremos la función MIN() con GROUP BY para poder obtener el monto mas bajo de cada grupo.La sintaxis de la consulta será igual a las vistas previamente, es decir:
SELECT grupo, MIN(columna) FROM tabla GROUP by grupo


-- Dada la tabla ventas:
-- Crea una consulta para calcular el monto más bajo por cada categoría. La tabla resultante debe tener dos columnas: categoria y monto_mas_bajo.
SELECT categoria, MIN(monto) AS monto_mas_bajo FROM ventas GROUP BY categoria;

-- Funciones de agregación y fechas
-- A la hora de construir informes, frecuentemente necesitaremos entregar información agrupada en un periodo de tiempo. Para lograr esto utilizaremos una combinación de GROUP BY con la función strftime.

-- Tenemos la tabla "ventas" con la siguiente información:

-- Se nos solicita determinar el monto total de ventas por año. Para resolverlo tenemos que agrupar por fecha y sumar los montos de la siguiente forma:
SELECT SUM(monto), strftime("%Y", fecha_venta) AS año FROM ventas GROUP BY strftime("%Y", fecha_venta)


-- Utilizando esta nueva tabla de ventas.
-- Calcula el total de ventas por mes. El nombre de las columnas resultantes será "suma_ventas" y "mes" respectivamente.
SELECT SUM(monto) AS suma_ventas, STRFTIME("%m", fecha_venta) AS mes FROM ventas GROUP BY mes;

-- Funciones de agregación y fechas
-- Se tiene una tabla llamada inscripciones con distintas fechas de inscripciones de un usuario a un sitio web.

-- Ejercicio
-- Se tiene una tabla llamada inscripciones con distintas fechas de inscripciones de un usuario a un sitio web.
-- Cuenta cuántos usuarios se registraron cada mes. Las columnas resultantes deben llamarse "mes" y "cantidad_usuarios".
SELECT STRFTIME("%m", fecha_inscripcion) AS mes, COUNT(fecha_inscripcion) AS cantidad_usuarios FROM inscripciones GROUP BY mes;

-- Agrupando sin indicar el nombre de las columnas
-- Cuando se trata de agrupar datos en una consulta SQL, existe una forma de evitar la redundancia de la cláusula SELECT. Por ejemplo, considera la siguiente consulta:
SELECT strftime("%Y", fecha_venta) AS año, SUM(monto) FROM ventas GROUP BY strftime("%Y", fecha_venta)

-- Puedes simplificarla de la siguiente manera:
SELECT strftime("%Y", fecha_venta) AS año, SUM(monto) FROM ventas GROUP BY 1

-- Esta notación se interpreta como "agrupa por el primer criterio" (el primer select) . También es posible aplicar esta sintaxis en la cláusula ORDER BY:
SELECT strftime("%Y", fecha_venta) AS año, SUM(monto) FROM ventas GROUP BY 1 ORDER BY 1
-- De esta manera, puedes lograr la misma agrupación y ordenamiento sin repetir la expresión de la cláusula SELECT.

-- Ejercicio
-- Dada la siguiente tabla de usuarios
-- Crea una consulta que nos muestre cada correo una única vez acompañado del número de veces que se repite. Las columnas deben llevar los nombres "correo" y "repeticiones", respectivamente, y deben estar ordenadas alfabéticamente.
SELECT correo, COUNT(correo) AS repeticiones FROM usuarios GROUP BY 1;

-- Agrupando por múltiples columnas
-- En SQL es posible agrupar por múltiples columnas utilizando la siguiente sintaxis:
SELECT columna1, columna2, funcion_agrupado(columna3) FROM tabla GROUP BY columna1, columna2

-- Y como aprendimos en el ejercicio anterior, también podemos escribir la consulta de la siguiente manera:
SELECT columna1, columna2, funcion_agrupado(columna3) FROM tabla GROUP BY 1, 2

-- Ejercicio
-- Tenemos la siguiente tabla estudiantes
-- Calcula el promedio de cada estudiante en cada materia. Las columnas deben llamarse correo, materia y promedio_notas
SELECT correo, materia, AVG(nota) AS promedio_notas FROM estudiantes GROUP BY 1, 2;
