-- LIMIT | consigue los datos hasta cierto limite, por ejemplo los primeros 3 de la tabla

-- EJEMPLO - Muestra los primeros 3 elementos de la tabla "usuarios"
SELECT * FROM global.usuarios LIMIT 3;

-- Si queremos obtener sólo los primeros 5 registros de una tabla
SELECT * FROM tabla LIMIT 5

-- NOTA: La claúsula LIMIT se agrega al final de la consulta, por ejemplo

SELECT * FROM tabla WHERE campo > 10 ORDER BY campo2 LIMIT 5

-- Selecciona los primeros 3 usuarios de la tabla de usuarios según el id.
SELECT * FROM usuarios LIMIT 3;

-- NOTA: La combinación de las cláusulas ORDER BY y LIMIT nos permite obtener el valor o valores máximos de una columna en una tabla.


-- Se tiene una tabla de puntajes con las columnas id y puntaje. Utiliza lo aprendido para obtener el puntaje más alto de la tabla utilizando ORDER BY y LIMIT
SELECT puntaje FROM puntajes ORDER BY puntaje DESC LIMIT 1;

/* 
Se tiene una base de datos con la tabla conciertos en la cual se almacena información sobre cada concierto
incluyendo el nombre del concierto y la cantidad de entradas vendidas. 
Los datos dentro de la base de datos corresponden a la siguiente tabla.

Encuentra el nombre del concierto que ha vendido la mayor cantidad de entradas (utiliza ORDER BY y LIMIT).
*/

SELECT nombre_concierto, entradas_vendidas FROM conciertos ORDER BY entradas_vendidas DESC LIMIT 1;
