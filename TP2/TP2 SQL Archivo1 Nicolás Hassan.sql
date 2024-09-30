CREATE TABLE Empleados2 ( 
id INT PRIMARY KEY, 
nombre VARCHAR(100) NOT NULL, 
salario DECIMAL(10, 2) NOT NULL, 
departamento VARCHAR(50) NOT NULL, 
fecha_contratacion DATE NOT NULL, 
jefe_id INT, 
FOREIGN KEY (jefe_id) REFERENCES Empleados2(id) 
);

INSERT INTO Empleados2 (id, nombre, salario, departamento, fecha_contratacion, jefe_id) VALUES
(1, 'Juan Pérez', 55000, 'Ventas', '2021-01-01', NULL), 
(2, 'María López', 45000, 'Marketing', '2020-05-15', NULL), 
(3, 'Carlos Gómez', 60000, 'Ingeniería', '2019-08-20', NULL), 
(4, 'Ana Rodríguez', 35000, 'Recursos Humanos', '2022-03-10', NULL), 
(5, 'Luis Martínez', 50000, 'Ventas', '2021-06-01', 1), 
(6, 'Laura García', 40000, 'Marketing', '2020-11-20', 2), 
(7, 'Pedro Sánchez', 65000, 'Ingeniería', '2018-07-15', 3), 
(8, 'Sofía Fernández', 30000, 'Recursos Humanos', '2022-09-05', 4),
(9, 'Mariano Lamen', 28000, 'Recursos Humanos', '2019-09-05', 5);

SELECT * FROM Empleados2 WHERE salario > 50000 AND departamento = 'Ventas' OR (salario < 30000 AND departamento = 'Marketing');

SELECT departamento, AVG(salario) AS salario_promedio
FROM Empleados2
GROUP BY departamento
HAVING AVG(salario) > 40000;

SELECT * FROM Empleados2
ORDER BY salario DESC, nombre ASC;

DELETE FROM Empleados2 WHERE fecha_contratacion < '2020-01-01' AND departamento = 'Recursos Humanos';

SELECT e1.nombre, e1.salario FROM Empleados2 e1
WHERE e1.salario > (SELECT AVG(salario) FROM Empleados2);

SELECT nombre, salario,
RANK()OVER(ORDER BY salario DESC) AS ranking
FROM Empleados2;

CREATE VIEW Empleados2_ventas AS
SELECT nombre, salario
FROM Empleados2
WHERE departamento = 'Ventas';

SELECT nombre, salario
FROM Empleados2 e1
WHERE salario > (SELECT AVG(salario) FROM Empleados2 e2 WHERE e1.departamento = e2.departamento);

CREATE INDEX idx_departamento ON Empleados2(departamento);