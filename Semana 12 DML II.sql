--Repaso
--Procedimientos Almacenados
  -- Estructura as begin end
  -- Reglas de negocio complejas 
  -- Pueden tener  o no un retorno 
  -- Reutilizacion codigo
  -- CRUD 
  -- SP + Transacciones = proceso atomico (inicio  y un fin)
  -- Se pueden llarmar otros objetos SP, Vistas, Funciones, tablas temporales etc..
  -- Parametros
  -- Puede ser Ajustable 
--Vistas
  -- Tablas virtuales 
  -- Unicamente se pueden seleccionar datos 
  -- Definir una estructura funcional 
  -- Informer no parametrizados 
  -- Se deben de definir sus condiciones de forma constante (where)
  -- Se pueden utilizar funciones   
--Funciones
  -- Escalares (valor unico) y tables 
  -- Definir un retorno 
  -- Reglas estandar 
  -- Pueden o no aceptar parametros 
  -- Como buena practica deberia de minimizar las dependecias 
  

--Tablas temporales
  --#Locales: alcance a nivel de conexion 
  --##Globales: alcance a nivel de instacia  
  --Optimizacion: Segmentacion de datos  
  --Buena practica borrarla 
--Transacciones 
  -- Garantiza la atomicidad 
  -- rollback: devuelve al estado anterior 
  -- commit: confirma los cambios 
  -- Try catch: manejo errores 
  -- Manejo de transacciones 
  
--Triggers 
 -- reacciones a eventos (insert, update, delete) - CUD
 -- se pueden generar validaciones funcionales adicionales  
 -- No permite parametros 
 -- Independecia del cliente
 -- Ipacto en el Redimiento 
 -- Resticciones: no pueden usar tablas temporales

 use Northwind
 select * from Products

 CREATE TABLE ProductAuditLog (
    ProductID INT NOT NULL,          -- Identificador del producto modificado
    ModifiedBy NVARCHAR(100) NOT NULL, -- Usuario que realizó la modificación
    ModifiedDate DATETIME NOT NULL DEFAULT GETDATE(), -- Fecha y hora de la modificación
    OriginalValues NVARCHAR(MAX),    -- Valores originales del producto (JSON o texto)
    NewValues NVARCHAR(MAX)          -- Nuevos valores del producto (JSON o texto)
);

Select * from ProductAuditLog

Create trigger trg_Producto_Auditoria
on Products
After Update
AS
Begin 
	Insert Into ProductAuditLog(ProductID, ModifiedBy, ModifiedDate, OriginalValues, NewValues)
	Select d.ProductID, SYSTEM_USER,GETDATE(),
	CONCAT('Nombre: ',d.ProductName, ', Stock: ', d.UnitsInStock ),
	CONCAT('Nombre: ',i.ProductName, ', Stock: ', i.UnitsInStock )
	From deleted d
	JOIN inserted i on d.ProductID = i.ProductID
End


select * from ProductAuditLog


Update Products
SET ProductName ='Chai Premium',
UnitsInStock= 46
where ProductID=1


Select * from Products
where ProductID=1



 