CREATE TABLE Clientes (
id INT PRIMARY KEY,
nombre VARCHAR(50),
apellido VARCHAR(50),
email VARCHAR(50),
fecha_registro DATE
);

INSERT INTO Clientes (id, nombre, apellido, email, fecha_registro) VALUES
(1, 'Ana', 'García', 'ana.garcia@example.com', '2022-01-10'),
(2, 'Luis', 'Fernández', 'luis.fernandez@example.com', '2022-02-15'),
(3, 'Sofía', 'Ramírez', 'sofia.ramirez@example.com', '2022-03-20'),
(4, 'Diego', 'Sánchez', 'diego.sanchez@example.com', '2022-04-25'),
(5, 'Elena', 'Pérez', 'elena.perez@example.com', '2022-05-30');

SELECT * FROM  Clientes;

SELECT * FROM Clientes WHERE fecha_registro > '2022-01-01';

SELECT * FROM Clientes ORDER BY fecha_registro DESC;

SELECT DISTINCT email FROM Clientes;

SELECT * FROM Clientes WHERE fecha_registro > '2022-01-01' AND apellido = 'García';

SELECT * FROM Clientes WHERE fecha_registro BETWEEN '2022-01-01' AND '2022-12-31';

SELECT * FROM Clientes WHERE nombre LIKE 'A%';

SELECT * FROM Clientes WHERE apellido IN ('García', 'Fernández');