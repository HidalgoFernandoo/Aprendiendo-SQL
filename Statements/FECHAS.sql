-- Con la función DATE() podemos obtener la fecha de hoy. 
-- recibe distintos nombres en cada uno de los motores.
-- en MySQL se utiliza CURDATE(), y en Microsoft SQL Server se utiliza GETDATE()
-- Por ejemplo la podemos utilizar en la claúsula WHERE para obtener todos lo registros de hoy.

SELECT * FROM usuarios WHERE fecha_registro = DATE();

-- También es posible indicar explícitamente a la función que la fecha deseada es la de hoy.

SELECT * FROM usuarios WHERE fecha_registro = DATE('now');

-- Se tiene una tabla llamada tareas con las siguientes columnas: "id" (identificador único)
-- "descripcion" (descripción de la tarea) y "fecha_limite" (fecha límite para completar la tarea).

-- Obtén la descripción de todas las tareas que tengan fecha_limite igual a la fecha actual.
SELECT descripcion FROM tareas WHERE fecha_limite = DATE();

-- EN SQL es posible sumar fechas para obtener fechas futuras. En SQLite lo podemos lograr pasando un segundo argumento a la función DATE. Esto suena complicado pero es mas sencillo de lo que parece:
DATE('now', '1 day')
-- En este ejemplo, estamos sumando 1 día a la fecha de hoy (now). Si queremos sumar más días, por ejemplo 5 días, utilizaremos DATE('now', '5 day').
2 Semanas: DATE('now', '2 week') 3 Meses: DATE('now', '3 month')

SELECT * FROM tabla where fecha > DATE('now', '2 week')

-- Se tiene una tabla de tareas con los campos id, descripcion y fecha_limite. Se pide seleccionar todos los campos de las tareas que tienen como fecha límite el día de mañana.
SELECT * FROM tareas WHERE fecha_limite = date("now", "1 day");

-- RESTAR FECHAS
-- Supongamos que tenemos una tabla llamada ganancias con las columnas "id" (identificador único), "fecha" (fecha de registro) y "monto" (ganancia del día).

-- Muestra el monto correspondiente al día de ayer.


SELECT monto FROM ganancias WHERE fecha = DATE("now", "-1 day");


-- Extracción del año

-- Nos piden mostrar toda la información de la tabla y adicionalmente agregar una columna con el año de la venta.

SELECT *, strftime('%Y', fecha_venta) as año_venta FROM ventas 


-- Dada una tabla ventas con las columnas monto y fecha_venta, crea una consulta que muestre únicamente el monto y el año de la venta. La columna que muestre el año de la venta debe llamarse año_venta
SELECT monto, strftime("%Y", fecha_venta) as año_venta FROM ventas;

-- Extracción del mes
SELECT strftime('%m', columna) FROM tabla
--  En lugar de usar %M, que representa los minutos (de 00 a 59), deberías usar %m, que representa el mes (de 01 a 12).

-- Dada la tabla ventas previamente presentada con las columnas monto y fecha_venta, crea una consulta que muestre una tabla con el monto, el mes de la venta y el año de la venta, en ese mismo orden. La columna para el mes de la venta debe llamarse mes_venta y aquella para el año de la venta debe llamarse año_venta
SELECT monto, strftime("%m", fecha_venta) AS mes_venta, strftime("%Y", fecha_venta) AS año_venta FROM ventas;

-- Para extraer tanto el mes como el año de una fecha en una sola columna, puedes utilizar la función strftime('%m-%Y').
-- LOS % POR DELANTE
SELECT monto, strftime("%m-%Y", fecha_venta) AS mes_año FROM ventas;

-- Dada una tabla ventas con las columnas monto y fecha_venta, selecciona toda la información de las ventas del 2015
SELECT * FROM ventas WHERE strftime("%Y", fecha_venta) = "2015";

