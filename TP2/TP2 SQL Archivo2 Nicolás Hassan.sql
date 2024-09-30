-- 1 Crear tabla
CREATE TABLE Productos2 (
id INT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio DECIMAL(10,2) NOT NULL,
categoria VARCHAR(50) NOT NULL,
fecha_lanzamiento DATE NOT NULL,
proveedor_id INT,
FOREIGN KEY (proveedor_id) REFERENCES Productos2(id)
);

-- 2 Insertar valores a la tabla
INSERT INTO Productos2 (id, nombre, precio, categoria, fecha_lanzamiento, proveedor_id) VALUES
(1, 'Laptop', 1200.00, 'Electrónica', '2021-01-01', NULL), 
(2, 'Smartphone', 800.00, 'Electrónica', '2020-05-15', NULL), 
(3, 'Cafetera', 50.00, 'Hogar', '2019-08-20', NULL), 
(4, 'Libro', 20.00, 'Libros', '2022-03-10', NULL), 
(5, 'Tablet', 300.00, 'Electrónica', '2021-06-01', 1), 
(6, 'Aspiradora', 150.00, 'Hogar', '2020-11-20', 2), 
(7, 'Monitor', 250.00, 'Electrónica', '2018-07-15', 3), 
(8, 'Juego de Mesa', 30.00, 'Juegos', '2022-09-05', 4);

/*3. Seleccionar Datos con Condiciones Complejas 
Escribe una consulta SQL que seleccione todos los productos cuyo precio 
sea mayor a 200.00 y pertenezcan a la categoría 'Electrónica', o cuyo 
precio sea menor a 50.00 y pertenezcan a la categoría 'Hogar'. 
*/
SELECT * FROM Productos2 WHERE precio > 200 AND categoria = 'Electrónica' OR (precio < 50 AND categoria = 'Hogar');

/*4. Agrupar y Agregar Datos 
Escribe una consulta SQL que calcule el precio promedio de los 
productos agrupados por categoría y que solo muestre las categorías 
cuyo precio promedio sea mayor a 100.00. 
*/
SELECT categoria, AVG(precio) AS precio_promedio
FROM Productos2
GROUP BY categoria
HAVING AVG(precio) > 100;

/*5. Ordenar Datos  
Escribe una consulta SQL que seleccione todos los productos y los 
ordene en orden descendente por precio y en orden ascendente por 
nombre.
*/ 
SELECT * FROM Productos2
ORDER BY precio DESC, nombre ASC;

/*6. Actualizar Datos con Condiciones 
Escribe una consulta SQL que actualice el precio de todos los productos 
de la categoría 'Electrónica' que fueron lanzados después del 1 de enero 
de 2020, incrementando su precio en un 10%.
*/ 
UPDATE Productos2
SET precio = precio * 1.10
WHERE categoria = 'Eletrónica' AND fecha_lanzamiento > '2020-01-01';

SELECT * FROM Productos2;

/*7. Eliminar Datos con Condiciones 
Escribe una consulta SQL que elimine todos los productos de la categoría 
'Libros' que fueron lanzados antes del 1 de enero de 2020.
*/ 
DELETE FROM Productos2 WHERE fecha_lanzamiento < '2020-01-01' AND categoria = 'Libros';

/*8. Unir Datos con Subconsultas 
Escribe una consulta SQL que seleccione el nombre y el precio de los 
productos cuyo precio sea mayor que el promedio de precios de todos los 
productos.
*/
SELECT p1.nombre, p1.precio FROM Productos2 p1
WHERE p1.precio > (SELECT AVG(precio) FROM Productos2);

/*9. Usar Funciones de Ventana 
Escribe una consulta SQL que seleccione el nombre y el precio de los 
productos y les asigne un ranking basado en el precio en orden 
descendente.
*/ 
SELECT nombre, precio,
RANK()OVER(ORDER BY precio DESC) AS ranking
FROM Productos2;

/*10. Crear Vistas 
Escribe una consulta SQL que cree una vista llamada 
`productos_electronica` que seleccione el nombre y el precio de los 
productos de la categoría 'Electrónica'.
*/ 
CREATE VIEW Productos2_electronica AS
SELECT nombre, precio
FROM Productos2
WHERE categoria = 'Electrónica';

/*11. Usar Subconsultas Correlacionadas 
Escribe una consulta SQL que seleccione el nombre y el precio de los 
productos cuyo precio sea mayor que el promedio de precios de los 
productos de la misma categoría. 
*/
SELECT nombre, precio
FROM Productos2 p1
WHERE precio > (SELECT AVG(precio) FROM Productos2 p2 WHERE p1.categoria = p2.categoria);

-- 12. Usar Índices 
CREATE INDEX idx_categoria ON Productos2(categoria);
CREATE INDEX idx_fecha_lanzamineto ON Productos2(fecha_lanzamiento);

EXPLAIN SELECT nombre, precio
FROM Productos2
WHERE categoria = 'Electrónica' AND fecha_lanzamiento > '2020-01-01';

/*13. Seleccionar Productos con Precio Mayor al Promedio IDEM 8
Escribe una consulta SQL que seleccione el nombre y el precio de los 
productos cuyo precio sea mayor que el promedio de precios de todos los 
productos. 
*/
SELECT p1.nombre, p1.precio FROM Productos2 p1
WHERE p1.precio > (SELECT AVG(precio) FROM Productos2);

/*14. Seleccionar Productos con Precio Mayor al Promedio de su Categoría 
Escribe una consulta SQL que seleccione el nombre y el precio de los 
productos cuyo precio sea mayor que el promedio de precios de los 
productos de la misma categoría. 
*/ 
SELECT nombre, precio
FROM Productos2 p1
WHERE precio > (SELECT AVG(precio) FROM Productos2 p2 WHERE p1.categoria = p2.categoria);

/*15. Seleccionar Productos con Precio Mayor al Mínimo de su Categoría 
Escribe una consulta SQL que seleccione el nombre y el precio de los 
productos cuyo precio sea mayor que el precio mínimo de los productos 
de la misma categoría.
*/ 
SELECT nombre, precio
FROM Productos2 p1
WHERE precio > (SELECT MIN(precio) FROM Productos2 p2 WHERE p1.categoria = p2.categoria);

/*16. Seleccionar Productos con Precio Mayor al Máximo de su Categoría 
Escribe una consulta SQL que seleccione el nombre y el precio de los 
productos cuyo precio sea mayor que el precio máximo de los productos 
de la misma categoría. 
*/
SELECT nombre, precio
FROM Productos2 p1
WHERE precio > (SELECT MAX(precio) FROM Productos2 p2 WHERE p1.categoria = p2.categoria);

/*17. Seleccionar Productos con Precio Igual al Máximo de su Categoría 
Escribe una consulta SQL que seleccione el nombre y el precio de los 
productos cuyo precio sea igual al precio máximo de los productos de la 
misma categoría.
*/ 
SELECT nombre, precio
FROM Productos2 p1
WHERE precio = (SELECT MAX(precio) FROM Productos2 p2 WHERE p1.categoria = p2.categoria);

/*18. Seleccionar Productos con Precio Igual al Mínimo de su Categoría 
Escribe una consulta SQL que seleccione el nombre y el precio de los 
productos cuyo precio sea igual al precio mínimo de los productos de la 
misma categoría.
*/
SELECT nombre, precio
FROM Productos2 p1
WHERE precio = (SELECT MIN(precio) FROM Productos2 p2 WHERE p1.categoria = p2.categoria);

/*19. Seleccionar Productos con Precio Mayor al Promedio de Todos los 
Productos 
Escribe una consulta SQL que seleccione el nombre y el precio de los 
productos cuyo precio sea mayor que el promedio de precios de todos los 
productos en la tabla. 
*/
SELECT p1.nombre, p1.precio FROM Productos2 p1
WHERE p1.precio > (SELECT AVG(precio) FROM Productos2);

/*20. Seleccionar Productos con Precio Mayor al Promedio de Productos de 
Otra Categoría 
Escribe una consulta SQL que seleccione el nombre y el precio de los 
productos cuyo precio sea mayor que el promedio de precios de los 
productos de una categoría específica (por ejemplo, 'Electrónica').  
*/
SELECT nombre, precio
FROM Productos2
WHERE categoria = 'Hogar'
AND precio > (SELECT AVG(precio) FROM Productos2 WHERE categoria = 'Hogar');

/*21. Seleccionar Productos con Precio Mayor al Promedio de Productos de 
la Misma Categoría y Fecha de Lanzamiento Reciente 
Escribe una consulta SQL que seleccione el nombre y el precio de los 
productos cuyo precio sea mayor que el promedio de precios de los 
productos de la misma categoría y que hayan sido lanzados después de 
una fecha específica (por ejemplo, '2020-01-01').
*/
SELECT nombre, precio
FROM Productos2 p1
WHERE precio > (SELECT AVG(precio) FROM Productos2 p2 WHERE p1.categoria = p2.categoria)
AND fecha_lanzamiento > '2020-08-01';

/*22. Seleccionar Productos con Precio Mayor al Promedio de Productos de 
la Misma Categoría y Proveedor Asignado 
Escribe una consulta SQL que seleccione el nombre y el precio de los 
productos cuyo precio sea mayor que el promedio de precios de los 
productos de la misma categoría y que tengan un proveedor asignado 
(proveedor_id no es NULL).
*/
SELECT nombre, precio
FROM Productos2 p1
WHERE precio > (SELECT AVG(precio) FROM Productos2 p2 WHERE p1.categoria = p2.categoria)
AND proveedor_id IS NOT NULL;