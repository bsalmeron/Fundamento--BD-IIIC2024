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

--Constraints reglas o restricciones 
--Unique 
--Primary key 
--Not null 
--Foreing key 
--Posterior a a la creacion de la tabla 
--Add Check  (Edad>18)
--Default 'NA'
--identity  

Create table Revistas(
ID_Revistas Int primary key identity (1,1), 
Titulo varchar(200) not null, 
Autor varchar(200) not null, 
Precio int check ( Precio >=1) Default 100  
)

Alter Table Revistas 
Add Constraint DF_Resvistas_Autor
Default 'Sin Autor' For Autor

---FOREIGN KEY
/*
Ejemplo: Relación entre "Estudiantes" y "Cursos"
Un estudiante puede estar inscrito en varios cursos.
Un curso puede tener varios estudiantes inscritos.
Pasos:
Tabla Estudiantes: Representa a los estudiantes.
Tabla Cursos: Representa a los cursos.
Tabla intermedia Estudiantes_Cursos: Contiene las llaves foráneas
tanto de Estudiantes como de Cursos,
y representa la relación de muchos a muchos.
*/

/*La integridad relacional es un conjunto 
de reglas que asegura que los datos en una base 
de datos se mantengan consistentes y correctos.
Su propósito principal es garantizar que las relaciones
entre las tablas se mantengan de manera adecuada.*/

--Estudiantes 
Create database EscuelaDB
Use EscuelaDB
Create Table Estudiantes (
ID_Estudiante Int Primary Key Identity(1,1),
Nombre varchar(100) Not null
)

Create Table Cursos (
ID_Cursos Int Primary Key Identity(1,1), 
Nombre_Curso varchar(100) Not null UNIQUE
)

Create Table  Estudiantes_Cursos (
ID Int Primary Key Identity(1,1),
ID_Estudiante Int ,
ID_Cursos Int, 
Fecha_Matricula Date Default Getdate(), 
Foreign Key(ID_Estudiante) References Estudiantes(ID_Estudiante),
Foreign Key (ID_Cursos) References Cursos(ID_Cursos)
)



Exec sp_help'Estudiantes_Cursos'

SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Estudiantes_Cursos';

 