CREATE TABLE Productos (
id INT PRIMARY KEY,
nombre VARCHAR(50),
categoria VARCHAR(50),
precio DECIMAL(10,2),
stock INT
);

INSERT INTO Productos (id, nombre, categoria, precio, stock) VALUES
(1, 'IPhoneX', 'Electrónico', '400', '12'),
(2, 'Auricular HyperX', 'Electrónico', '80', '5'),
(3, 'Grip Tip in ear', 'Repuestos', '10', '40'),
(4, 'Funda SamsungA05', 'Accesorio', '13', '16'),
(5, 'Parlante JBL', 'Electrónico', '210', '3');

SELECT * FROM Productos;

SELECT * FROM Productos WHERE categoria = 'Electrónico';

SELECT * FROM Productos ORDER BY precio ASC;

SELECT DISTINCT categoria FROM Productos;

SELECT * FROM Productos WHERE precio > 50 AND categoria = 'Electrónico';

SELECT * FROM Productos WHERE precio BETWEEN '10' AND '100';

SELECT * FROM Productos WHERE nombre LIKE 'Parlante JBL';

SELECT * FROM Productos WHERE categoria IN ('Electrónico', 'Accesorio');