-- Para comparar textos debemos utilizar comillas simples ('')

-- EJEMPLO - tenemos una tabla productos, necesitamos obtener todos los productos con el nombre "Camiseta"
SELECT * FROM productos WHERE nombre = 'Camiseta';
-- Estamos indicando que no se trata de una palabra clave ni de un nombre de tabla o columna, sino que es un valor que debe ser tomado literalmente.

-- Camiseta' y 'camiseta' se considerarán diferentes valores en la comparación. Si deseamos realizar una comparación sin considerar la distinción entre mayúsculas y minúsculas, se pueden utilizar funciones o cláusulas específicas proporcionadas por el motor de base de datos.
SELECT * FROM productos WHERE nombre = "Silla de Oficina";
SELECT * FROM productos WHERE nombre = "Silla de OfiCina";

-- booleano true
-- EJEMPLO - Una tabla de productos con una columna 'destacado' de tipo booleano que indica si un producto está destacado o no

SELECT * FROM productos WHERE destacada = true;

-- NOTA: Tambien se puede utilizar 1 o 0 para indicar TRUE o FALSE;
SELECT * FROM productos WHERE destacado = 1;
SELECT * FROM productos WHERE destacado = 0;

-- EJEMPLO - Selecciona todos los productos de la tabla productos que no están destacados.
SELECT * FROM productos WHERE destacado = 0;
