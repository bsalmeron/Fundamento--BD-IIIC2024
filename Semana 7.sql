--DDL 
--Creación de una base de datos
Create Database BancoBD
--Eliminar base de datos 
Drop Database BancoBD
-- Backup e
BACKUP DATABASE BancoBD TO DISK = 'C:\Backup\BancoBD.bak'


--indicar BD 
Use BancoBD

-- Crear una tabla
Create Table Cliente (
ID_Cliente Int Primary Key identity(1,1),
Nombre Varchar(100) Not Null,
Email Varchar (250) Unique Not Null
);

--1. Crea una tabla llamada Libros con las columnas ID_Libro (id),--Titulo, y Autor, todos son obligatorios 
Create table Libros(
ID_Libro Int primary key identity (1,1), 
Titulo varchar(200) not null, 
Autor varchar(200) not null
)

--Modificar la tabla 

Alter table Cliente Add telefono Varchar(15)

--Modificar columnas 
Alter table Cliente
Alter Column telefono  Varchar(20) Not null

EXEC sp_rename 'Cliente.telefono', 'telefonoPersonal','COLUMN'