-- WHERE | funciona como condicional, por ejemplo: WHERE nombre = "fernando"
SELECT id_usuarios, nombre, apellido FROM global.usuarios WHERE apellido = "hidalgo"; 

-- Se puede combinar entre si para lograr mejor resultado, en este caso busco solo los que tienen edad 13 pero sin repetir.
SELECT DISTINCT edad FROM global.usuarios WHERE edad = 13;