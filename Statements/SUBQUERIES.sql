-- Las subconsultas, también conocidas como "subqueries", nos permiten utilizar los resultados de una consulta dentro de otra consulta.
-- Veamos un ejemplo práctico.
-- Dada la siguiente tabla empleados

Nombre	    Apellido	Sueldo	Departamento
Juan	    Pérez	    3000	Ventas
María	    González	3500	Marketing
Carlos	    Rodríguez	4000	Tecnología
Ana	        Martínez	2800	Recursos Humanos
Luis	    García	    3200	Finanzas
Carmen	    López	    3100	Administración
José	    Hernández	2900	Operaciones
Francisco	Martín	    3400	Legal
Laura	    Sánchez	    3300	Compras
Antonio	    Díaz	    3600	Producción
Sofía	    Ruiz	    2750	Ventas
Jorge	    Vargas	    3900	Tecnología
Elena	    Castro	    3050	Marketing
Pedro	    Ortega	    3150	Finanzas

-- Se nos pide seleccionar a todas las personas que ganan sobre el promedio.
-- Este tipo de preguntas podemos contestarlas utilizando subconsultas.
-- La idea para contestar esto es la siguiente.
-- Calculamos el promedio SELECT avg(sueldo) FROM empleados
-- Seleccionamos todos los empleados cuyo sueldo es mayor a la consulta anterior. SELECT * FROM empleados WHERE sueldo > (SELECT AVG(sueldo) FROM empleados)

-- Ejercicio
-- Utilizando los mismos datos de la tabla empleados, selecciona todos los registros cuyo sueldo sea menor o igual al promedio.

SELECT * FROM empleados WHERE sueldo <= (SELECT AVG(sueldo) FROM empleados);

-- Subconsultas y where parte 1
-- Dentro de las subconsultas, podemos utilizar las mismas cláusulas que hemos aprendido hasta ahora, como la cláusula WHERE. Esto significa que podemos aplicar la cláusula WHERE tanto dentro de la subconsulta como fuera de ella.

-- Ejercicio
-- Dada la siguiente tabla empleados

Nombre	    Apellido	Sueldo	Departamento
Juan	    Pérez	    3000	Ventas
María	    González	3500	Marketing
Carlos	    Rodríguez	4000	Tecnología
Ana	        Martínez	2800	Recursos Humanos
Luis	    García	    3200	Finanzas
Carmen	    López	    3100	Administración
José	    Hernández	2900	Operaciones
Francisco	Martín	    3400	Legal
Laura	    Sánchez	    3300	Compras
Antonio	    Díaz	    3600	Producción
Sofía	    Ruiz	    2750	Ventas
Jorge	    Vargas	    3900	Tecnología
Elena	    Castro	    3050	Marketing
Pedro	    Ortega	    3150	Finanzas

-- Selecciona toda la información de los registros que sean mayores al promedio del departamento de finanzas.
SELECT departamento, AVG(sueldo) FROM empleados WHERE departamento = "Finanzas";

-- Si colocamos:
SELECT * FROM empleados WHERE sueldo > (SELECT departamento, AVG(sueldo) FROM empleados WHERE departamento = "Finanzas");
-- Nos marcara un error, no podemos seleccionar dos columnas en una subconsulta, en este caso "Departamento y AVG(sueldo)", lo cual no está permitido en este contexto.
-- Por lo tanto, nuestra solución seria:
SELECT * FROM empleados WHERE sueldo > (SELECT AVG(sueldo) FROM empleados WHERE departamento = "Finanzas");

-- Tip:
-- Se pide el promedio exclusivamente del departamento de finanzas por lo que no hay necesidad de agrupar los datos.
-- Para este tipo de problema usualmente hay más de una solución.


-- Subconsultas y where parte 2
-- Ejercicio

Nombre	    Apellido	Sueldo	Departamento
Juan	    Pérez	    3000	Ventas
María	    González	3500	Marketing
Carlos	    Rodríguez	4000	Tecnología
Ana	        Martínez	2800	Recursos Humanos
Luis	    García	    3200	Finanzas
Carmen	    López	    3100	Administración
José	    Hernández	2900	Operaciones
Francisco	Martín	    3400	Legal
Laura	    Sánchez	    3300	Compras
Antonio	    Díaz	    3600	Producción
Sofía	    Ruiz	    2750	Ventas
Jorge	    Vargas	    3900	Tecnología
Elena	    Castro	    3050	Marketing
Pedro	    Ortega	     3150	Finanzas

-- Utilizando los datos de la tabla empleados, selecciona todos los empleados cuyo sueldo sea mayor al empleado que tiene el mayor sueldo del departamento de finanzas.

-- 1er consulta: 
SELECT sueldo FROM empleados WHERE departamento = "Finanzas" ORDER BY sueldo DESC LIMIT 1;

-- Final:
SELECT * FROM empleados WHERE sueldo > (SELECT sueldo FROM empleados WHERE departamento = "Finanzas" ORDER BY sueldo DESC LIMIT 1);

-- Ejercicio
-- Se tiene la siguiente tabla notas:

email	                notas
Alumno1@ejemplo.com	    90
Alumno1@ejemplo.com	    50
Alumno1@ejemplo.com	    30
Alumno2@ejemplo.com	    90
Alumno2@ejemplo.com	    20
Alumno3@ejemplo.com 	80
Alumno2@ejemplo.com	    50
Alumno3@ejemplo.com	    30
Alumno3@ejemplo.com 	10

-- Selecciona todos los registros superiores al promedio de nota.
-- 1er consulta:
SELECT AVG(notas) FROM notas;

-- Final:
SELECT * FROM notas where notas > (SELECT AVG(notas) FROM notas);

-- Subconsultas con IN
-- El operador IN es un operador muy útil en subconsultas. Para entenderlo, primero probaremos una consulta sencilla utilizandolo directamente sin subconsultas.

País	        Código Teléfono
Argentina	    +54
Brasil	        +55
Chile	        +56
Colombia	    +57
España	        +34
Estados Unidos	+1
México	        +52

-- Queremos seleccionar todos los códigos de Argentina, Brasil, Chile o Colombia. Una forma de abordar el problema sería combinar todas las opciones con where y múltiples operadores or. Otra opción es utilizando el operador IN de la siguiente manera:

-- TIP: Podemos realizar consultas de la siguiente manera:
SELECT * 
FROM paises 
WHERE pais IN ('Argentina', 'Brasil', 'Chile', 'Colombia')
-- Esta consulta es más legible que poner todo el código junto

-- De la misma forma podemos hacer una consulta como la siguiente:

SELECT * FROM table WHERE columna IN (SELECT * from otra_tabla)
-- Operador IN con subconsultas
-- Se tiene la siguiente tabla de estudiantes

estudiante_id	nombre
1	            Juan
2	            María
3	            Pedro
4	            Ana

-- y la tabla de notas

estudiante_id	promedio_notas
1	                85
2	                65
3	                49
4	                38

-- Se nos pide mostrar los nombres de todas las personas que tengan un promedio de notas menor que 50.

-- Seleccionamos los ids de la tabla notas con promedio_notas <= 50
-- Seleccionamos los nombres de de la tabla estudiantes cuyo id esté dentro de la subconsulta anterior.

SELECT nombre from estudiantes
WHERE estudiante_id IN (SELECT estudiante_id from notas where promedio_notas <= 50)

-- Ejercicio
-- Se tiene una tabla estudiantes con un código y un nombre

estudiante_id	nombre
1	Juan
2	María
3	Pedro
4	Ana

-- Y se tiene una tabla promedios con el código del estudiante y su promedio de notas.

estudiante_id	promedio_notas
1	85
2	65
3	49
4	38

-- Muestra los nombres de todos los estudiantes que tengan un promedio de notas sobre 50

-- Tip 1: No necesitas agrupar ni promediar ni contar Tip 2: Hay más de una forma de resolver este ejercicio, no te adelantes a joins e intenta resolverlo utilizando subqueries
SELECT nombre
FROM estudiantes 
WHERE estudiante_id IN (SELECT estudiante_id FROM promedios WHERE promedio_notas > 50)

-- Subconsultas con IN parte 2
-- Ejercicio
-- Se tiene la tabla libros

libro_id	nombre
1	        La Odisea
2	        Cien Años de Soledad
3	        El Principito
4	        Moby Dick

-- Y se tiene la tabla valoraciones

libro_id	valoracion_promedio
1	        4.5
2	        4.7
3	        4.2
4	        3.9

-- Crea una consulta que muestre todos los títulos con valoración_promedio > 4. La columna resultante debe llamarse nombres_seleccionados.

SELECT nombre AS nombres_seleccionados 
FROM libros 
WHERE libro_id IN (SELECT libro_id FROM valoraciones WHERE valoracion_promedio > 4)

-- Ejercicio
-- Se tiene una tabla de pacientes

paciente_id	    nombre
1	            Roberto
2	            Carmen
3	            Luisa
4	            Esteban

-- Se tiene una tabla de consultas

paciente_id	    fecha_consulta
1	            2023-05-10
2	            2023-05-15
3	            2023-05-20
4	            2023-05-25

-- Se pide obtener los nombres de todos los pacientes que tuvieron su última consulta antes del 16 de mayo de 2023. La columna se debe llamar nombres_pacientes.

-- 1er consulta:
SELECT paciente_id FROM consultas WHERE fecha_consulta < "2023-05-16"

-- Final:
SELECT nombre AS nombres_pacientes 
FROM pacientes 
WHERE paciente_id IN (SELECT paciente_id FROM consultas WHERE fecha_consulta < "2023-05-16");


-- Subconsultas en el FROM
-- Las subconsultas, también conocidas como "subqueries", nos permiten utilizar los resultados de una consulta dentro de otra consulta. En los ejercicios anteriores utilizamos las subconsultas dentro de la claúsula WHERE, pero también es posible utilizarlas dentro de otras claúsulas. En este ejercicio abordaremos como utilizarla dentro de FROM

-- Una subconsulta en el FROM tiene la siguiente forma.

SELECT * 
    FROM (
        SELECT * FROM tabla1
)
-- En este caso no parece tan útil ya que simplemente estamos seleccionando lo mismo, pero veamos un caso donde si sería necesario.

-- Se tiene la tabla ventas que tiene el código de vendedor y el monto de cada venta realizada. Nos piden saber cuanto es el promedio total vendido.

empleado_id	    monto
1	            100
1	            150
2	            200
2	            250
3	            300
3	            350
4	            400

-- Para esto primero necesitamos sumar los montos por vendedor y luego sobre estos resultados sacamos el promedio de las ventas.

SELECT AVG(total_venta) as promedio_ventas
FROM (
    SELECT empleado_id, SUM(monto) as total_venta
    FROM ventas
    GROUP BY empleado_id
) 

-- ¿Cómo llegamos a esto?
-- Si queremos saber los promedios, primero tenemos que saber los totales, para eso necesitamos sumar por empleado.

SELECT empleado_id, SUM(monto) as total_venta
FROM ventas
GROUP BY empleado_id

-- El código anterior nos generará los siguientes resultados.

empleado_id	    total_venta
1	            250
2	            450
3	            650
4	            400

-- Luego sacamos el promedio de los montos de esta nueva tabla.

SELECT AVG(total_venta) as promedio_ventas
FROM (
    SELECT empleado_id, SUM(monto) as total_venta
    FROM ventas
    GROUP BY empleado_id
) 

-- Este tipo de ejercicio suele ser un poco mas complejo de pensar y escribir y requiere de cierta práctica dominar, por lo mismo el primer ejercicio consistirá en escribir el mismo query. Intenta hacerlo sin mirar la respuesta.

-- Ejercicio
-- Se tiene la tabla ventas que tiene el código de vendedor y el monto de la venta. Nos piden saber cuanto es el promedio total vendido. El resultado debe estar en la columna promedio_ventas

-- 1er consulta:
SELECT SUM(monto) AS promedio FROM ventas GROUP BY empleado_id

-- Final:
SELECT AVG(promedio) AS promedio_ventas
FROM (
    SELECT SUM(monto) 
    AS promedio 
    FROM ventas 
    GROUP BY empleado_id
) 

-- Ejercicio
-- Se tiene la tabla goles que registra los goles logrados por cada jugador en distintos partidos.

jugador_id	nombre	goles
1	        Juan	2
1	        Juan	1
2	        María	1
2	        María	1
3	        Pedro	3
4	        Ana	    1

-- Nos piden una consulta para calcular el promedio total de goles por jugador.

-- Tip: No es lo mismo que el promedio de goles por partido.

-- 1er Consulta:
SELECT SUM(goles) AS promedio_goles FROM goles GROUP BY nombre

-- Final:
SELECT AVG(promedio_goles) AS promedio_goles
FROM (
    SELECT SUM(goles) AS promedio_goles 
    FROM goles 
    GROUP BY nombre
)

