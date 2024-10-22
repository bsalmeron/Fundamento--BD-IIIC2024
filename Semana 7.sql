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
)