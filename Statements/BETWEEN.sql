-- BETWEEN | Se utiliza para selecciona registros con valores dentro de un rango

-- EJEMPLO - productos cuyo stock se encuentre entre 1 y 5
SELECT * FROM productos WHERE stock BETWEEN 1 AND 5;
-- incluirían los valores de 1 o 5.
-- Si quieres buscar con otro tipo de intervalo, por ejemplo que incluya el valor 10 y no el valor 50 puedes utilizar dos condiciones unidas con un operador and SELECT * productos WHERE stock >= 10 and stock < 50

-- EJEMPLO - Selecciona todos los productos cuyo stock se encuentre entre 20 y 30.
SELECT * FROM productos WHERE stock BETWEEN 20 and 30;