--Crear SuperMercadoBD
-- Cliente ID, nombre varchar(50), correo varchar (100)
-- Productos ID, Nombre, varchar(50)
-- Venta ID, ID_Cliente, ID_Producto, Fecha_Compra Default del 
--dia y hora de insercciòn

--Fecha_Compra Datetime Default GETDATE()

 CREATE Database SuperMercadoBD

 Use SuperMercadoBD


 Create table Cliente (
 ID Int Primary Key Identity(1,1), 
 Nombre Varchar (50) Not null, 
 Correo varchar(100) Not null 
 )

 Create table Producto(
 ID Int Primary Key Identity(1,1), 
 Nombre Varchar (50) Not null
 )


 Create table Venta (
 ID Int Primary key identity(1,1), 
 ID_Cliente Int Not null, 
 ID_Producto Int Not null, 
 Fecha_Compra Datetime Default GETDATE(), 
 Foreign Key (ID_Cliente) References Cliente(ID), 
 Foreign Key (ID_Producto) References Producto(ID) 
 )

 --CRUD  

 --Crear o insertar 
 Insert Into Cliente (Nombre,Correo)
 Values('alonso','alonso@ucenfotec.ac.cr')

 Select * from Cliente