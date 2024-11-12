 use master
  
Drop database [Empresa]


-- Creación de la base de datos
CREATE DATABASE Empresa;
GO

-- Seleccionamos la base de datos
USE Empresa;
GO

-- Creación de la tabla departamentos
CREATE TABLE departamentos (
    id INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(100)
);
GO

-- Creación de la tabla empleados
CREATE TABLE empleados (
    id INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(100),
    salario DECIMAL(10, 2),
    fecha_ingreso DATE,
    departamento_id INT,
	FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
);
GO


 
-- Creación de la tabla proyectos
CREATE TABLE proyectos (
    id INT PRIMARY KEY IDENTITY,
    empleado_id INT,
    fecha_inicio DATE,
    FOREIGN KEY (empleado_id) REFERENCES empleados(id)
);
GO

-- Insertar algunos datos de muestra en la tabla departamentos
INSERT INTO departamentos (nombre)
VALUES ('Ventas'), ('Marketing'), ('TI'), ('Finanzas');
GO

-- Insertar algunos datos de muestra en la tabla empleados
INSERT INTO empleados (nombre, salario, fecha_ingreso, departamento_id)
VALUES ('Carlos', 55000, '2020-05-10', 1),
       ('Ana', 45000, '2021-07-15', 2),
       ('Pedro', 75000, '2019-11-20', 3),
       ('Luisa', 60000, '2022-01-10', 4);
GO


-- Insertar algunos datos de muestra en la tabla proyectos
INSERT INTO proyectos (empleado_id, fecha_inicio)
VALUES (1, '2023-01-01'),
       (2, '2023-03-01'),
       (3, '2023-06-01');
GO

 
