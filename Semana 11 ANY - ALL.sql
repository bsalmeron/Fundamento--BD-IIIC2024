CREATE DATABASE Libreria;
USE Libreria;

CREATE TABLE Libros (
    libro_id INT IDENTITY(1,1) PRIMARY KEY,  -- El valor se incrementará automáticamente
    titulo VARCHAR(100),
    autor VARCHAR(100),
    precio DECIMAL(10, 2)
);

CREATE TABLE Ventas (
    venta_id INT IDENTITY(1,1) PRIMARY KEY,  -- El valor se incrementará automáticamente
    libro_id INT,
    fecha DATE,
    cantidad INT,
    FOREIGN KEY (libro_id) REFERENCES Libros(libro_id)
);

INSERT INTO Libros (titulo, autor, precio) VALUES
('El Quijote', 'Miguel de Cervantes', 25.00),
('1984', 'George Orwell', 15.00),
('La Sombra del Viento', 'Carlos Ruiz Zafón', 30.00),
('Harry Potter', 'J.K. Rowling', 40.00),
('Cien Años de Soledad', 'Gabriel García Márquez', 35.00),
('Cien Años de Soledad', 'Gabriel García Márquez', 100.00);

INSERT INTO Ventas (libro_id, fecha, cantidad) VALUES
(1, '2024-10-01', 2),
(2, '2024-10-02', 5),
(3, '2024-10-03', 1),
(4, '2024-10-04', 3),
(5, '2024-10-05', 4),
(5, '2024-10-05', 4);


--ANY

SELECT titulo, precio
FROM Libros
WHERE precio = ANY (
    SELECT precio
    FROM Libros
    INNER JOIN Ventas ON Libros.libro_id = Ventas.libro_id
    GROUP BY precio
    HAVING SUM(cantidad) > 1
);

 
 
SELECT titulo, precio
FROM Libros
WHERE precio > ANY (
    SELECT precio
    FROM Libros
    JOIN Ventas ON Libros.libro_id = Ventas.libro_id
    GROUP BY precio
    HAVING SUM(cantidad) > 1
);


SELECT titulo, precio
FROM Libros
WHERE precio < ANY (
    SELECT precio
    FROM Libros
    JOIN Ventas ON Libros.libro_id = Ventas.libro_id
    GROUP BY precio
    HAVING SUM(cantidad) > 1
);

--ALL

SELECT titulo, precio
FROM Libros
WHERE precio > ALL (
    SELECT precio
    FROM Libros
    JOIN Ventas ON Libros.libro_id = Ventas.libro_id
    GROUP BY precio
    HAVING SUM(cantidad) > 1
);