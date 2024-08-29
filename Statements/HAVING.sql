-- En SQL, la cláusula GROUP BY nos permite agrupar datos. Si queremos filtrar la información obtenida utilizaremos HAVING.

-- HAVING permite aplicar condiciones de filtrado a los resultados de funciones como COUNT, MAX, MIN, SUM y AVG después de que se han agrupado los datos con la cláusula GROUP BY.

-- Por ejemplo, si tenemos la siguiente tabla de inscripciones
-- Nos piden crear un reporte mostrando los meses y la cantidad de inscritos, pero solo donde hayan 2 o más inscritos.

SELECT strftime("%m", Fecha_Inscripcion) AS mes, COUNT(Fecha_Inscripcion) cantidad_usuarios FROM inscripciones GROUP BY strftime("%m", Fecha_Inscripcion) HAVING cantidad_usuarios >= 2

-- En esta consulta, primero utilizamos GROUP BY para agrupar por mes. Luego, utilizamos la función de agregación COUNT(Fecha_Inscripcion) para contar la cantidad de inscritos.Después de haber agrupado los datos y calculado el total de inscritos, aplicamos la cláusula HAVING para filtrar los resultados.

-- Crea un reporte mostrando los meses y la cantidad de inscritos pero solo donde haya 1 inscrito. Las columnas deben llamarse mes y cantidad_usuarios respectivamente.
SELECT STRFTIME("%m", fecha_inscripcion) AS mes, count(fecha_inscripcion) AS cantidad_usuarios FROM inscripciones GROUP BY 1 HAVING cantidad_usuarios = 1;

-- Uno de los usos mas recurrentes de HAVING es buscar duplicados. Por ejemplo, dada una tabla de correos ver cuales están más de 1 vez.

-- Ejercicio
-- Se tiene la tabla correos_corporativos
-- Muestra los correos que aparezcan en más de una ocasión. La tabla resultante debe tener dos columnas: una llamada correo, y otra llamada cuenta_correos que muestra la cantidad de repeticiones correspondiente a cada correo.
SELECT correo, COUNT(correo) AS cuenta_correos FROM correos_corporativos GROUP BY 1 HAVING cuenta_correos > 1;

-- Ejercicio
-- Dada la siguiente tabla empleados
-- Crea una consulta que muestre la cantidad de usuarios y el departamento en donde haya más de un empleado. Las columnas deben llamarse cantidad_de_usuarios y departamento, respectivamente.

SELECT count(nombre) AS cantidad_de_usuarios, departamento FROM empleados GROUP BY departamento HAVING cantidad_de_usuarios > 1;

-- Having y promedio
-- Ejercicio
-- Se tiene la siguiente tabla notas:
-- Crea una consulta para determinar cuales son los estudiantes que aprobaron. El criterio de aprobación es promedio de notas >= 50.
-- Las columnas a mostrar deben ser email y promedio_notas.

SELECT email, AVG(notas) AS promedio_notas FROM notas GROUP BY email HAVING promedio_notas >= 50;

-- Having y order
-- Una vez que hemos agrupado datos utilizando la cláusula GROUP BY, es común que necesitemos ordenar esos grupos según algún criterio específico. Por lo general, queremos ordenar los grupos en función de alguna métrica agregada, como la suma, el conteo, el promedio, etc. Para hacer esto, usamos la cláusula ORDER BY junto con las funciones de agregación.

-- El orden de las clausulas en una consulta debe ser el siguiente:
Orden	Clausula	Descripción
1	     SELECT	      Especifica las columnas que se deben retornar en el resultado.
2	     FROM	      Especifica las tablas de las cuales se extraerán los datos.
3	     WHERE	      Filtra registros antes de cualquier agregación o agrupación.
4	     GROUP BY	  Agrupa registros por una o más columnas.
5	     HAVING	      Filtra registros después de la agregación.
6	     ORDER BY	  Ordena los registros retornados por una o más columnas.
7	     LIMIT	      Limita el número de registros retornados.

-- Ejercicio
-- Dada la siguiente tabla ventas, escribe una consulta SQL para obtener los productos que se han vendido en una cantidad total mayor a 1000, ordenados en orden descendente de cantidad vendida.
Producto	Cantidad
A	        500
B	        2000
C	        300
D	        1500
E	        700
A	        600
B	        800
C	        1200
D	        400
E	        300

SELECT producto, sum(cantidad) AS cantidad_total FROM ventas GROUP BY producto HAVING cantidad_total > 1000 ORDER BY cantidad_total DESC;

-- Ejercicio
-- Supongamos que tienes una tabla de empleados con los siguientes datos:

ID_Empleado	Nombre	Departamento	Salario
1	        Juan	 Ventas	        3000
2	        Maria	 Marketing   	3500
3	        Carlos	 Ventas	        4000
4	        Ana	     Marketing	    2800
5	        Luis	 Ventas	        3200

-- Tu tarea es escribir una consulta SQL que devuelva los departamentos cuyo salario promedio es mayor a 3000, ordenados de mayor a menor salario promedio. Los resultados deben mostrar el nombre del departamento y el salario promedio, con los nombres de las columnas como Departamento y Salario_Promedio respectivamente.

SELECT departamento AS Departamento, AVG(salario) AS Salario_Promedio FROM empleados GROUP BY departamento  HAVING Salario_Promedio > 3000 ORDER BY Salario_Promedio DESC