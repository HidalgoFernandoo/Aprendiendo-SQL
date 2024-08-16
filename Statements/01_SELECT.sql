-- Normalmente las palabras reservadas de SQL por convención se escriben en mayúsculas
-- SELECT | sirve para seleccionar los datos de una tabla, se utiliza * como universal.
-- * | se utiliza para señalar que son todos los datos.*
-- FROM | hace referencia a lo que estamos seleccionando ¿Seleccionar de dónde?
-- ; | las sentencias se separan con este simbolo
SELECT nombre, id_usuarios, edad, carrera FROM global.usuarios;

-- Nota: el orden de como seleccionamos  los datos importa, esto define como se mostrarán
SELECT id_usuarios, nombre FROM global.usuarios;

SELECT nombre, id_usuarios FROM global.usuarios;

/* Un detalle importante es que las claúsulas tienen un orden.

select,
from
where
*/