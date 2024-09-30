CREATE TABLE Ventas (
id INT PRIMARY KEY,
fecha DATE,
cliente_id INT,
producto_id INT,
cantidad INT,
total DECIMAL(10,2)
);

INSERT INTO Ventas (id, fecha, cliente_id, producto_id, cantidad, total) VALUES
(1, '2023-01-10', 1, 1, 2, 2000.00),
(2, '2023-01-15', 2, 2, 1, 500.00),
(3, '2023-01-20', 3, 3, 3, 60.00),
(4, '2023-01-25', 4, 4, 2, 30.00),
(5, '2023-01-30', 5, 5, 5, 25.00);

SELECT * FROM Clientes;

SELECT * FROM Ventas WHERE fecha > '2023-01-01';

SELECT * FROM Ventas ORDER BY fecha ASC;

SELECT DISTINCT cliente_id FROM Ventas;

SELECT * FROM Ventas WHE RE total > 100 AND fecha > '2023-01-01';

SELECT * FROM Ventas WHERE fecha BETWEEN '2023-01-01' AND '2023-01-31';

SELECT * FROM Ventas WHERE fecha LIKE '2023-01%';

SELECT * FROM Ventas WHERE cliente_id IN (1, 2)