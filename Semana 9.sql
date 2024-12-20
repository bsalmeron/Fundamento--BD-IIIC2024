--Crear SuperMercadoBD
-- Cliente ID, nombre varchar(50), correo varchar (100)
-- Productos ID, Nombre, varchar(50)
-- Venta ID, ID_Cliente, ID_Producto, Fecha_Compra Default del 
--dia y hora de insercci�n

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
 Values('alonsoa','alonso@ucenfotec.ac.cr'),
 ('alonsosc','alonso@ucenfotec.ac.cr'),
 ('alonsoc','alonso@ucenfotec.ac.cr')

 Select * from Cliente

 --Insertar 3 productos
 Insert Into Producto(Nombre)
 Values('Galletas'),
 ('Refrigeradora'),
 ('Manzanas')
  
 --Inserccion de 2 ventas 
 -- El cliente 1 - Compro Refrigeradora Ayer
 -- El cliente 1 - Compro Manzanas  - No indico
 -- El cliente 2 - Compro Galletas  - Sabado 

 

 Insert Into venta (Fecha_Compra, ID_Producto, ID_Cliente)
 Values('2024-10-27 20:00:00.000',1,2)

 Insert Into venta ( ID_Producto, ID_Cliente)
 Values(1,2)

 --Leer

 Select ID_Cliente, ID_Producto,Fecha_Compra from  venta

 --Update 
 select Id, Nombre, Correo from Cliente

 Update  Cliente
 Set Nombre ='Adrian', 
 Correo='adrianucenfotec.ac.cr'
 Where ID=4

 -- Actualizar la tabla productos donde el ID = 2 
 Select ID, Nombre from Producto

 Update Producto
 Set Nombre ='Coca cola'
 Where ID=1

 --Eliminar 

 Delete venta
 Where ID=3
 Delete venta
 Where ID =1  

 Delete Producto 
 Where ID= 1

 Select * from venta