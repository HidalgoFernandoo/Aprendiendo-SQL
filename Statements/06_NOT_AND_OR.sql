-- NOT | Es la negación de una instruccion, negación de un criterio o condicion

-- Ejemplo - Seleccionar Todas las edades que no contenga un 3
SELECT * FROM global.usuarios WHERE NOT edad LIKE "%3%";
SELECT * FROM global.usuarios WHERE edad NOT LIKE "%3%";

-- AND | Es una condicional que nos permite tenes varias condiciones en una linea o ejecución de código

-- Ejemplo - No debe tener un 1 en su edad ni haberse inscripto en el 2020-07-22
SELECT * FROM global.usuarios WHERE edad NOT LIKE "%1%" AND fecha_inscripcion NOT LIKE "2020-07-22";

-- OR | Es una condicional dónde si se cumple al menos una de las condiciones devuelve TRUE

-- Ejemplo - No debe haberse inscripto en el 2020-07-22 o tener más de 20 años
SELECT * FROM global.usuarios WHERE fecha_inscripcion NOT LIKE "2020-07-22" OR edad >= 20;
