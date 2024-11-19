/*
1- Procedimiento almacenado
    a-Reglas de negocio complejas 
    b-CRUD 
    c-Un Componete (Usiario, Aplicaciones, Api Etc)
    necesita conusmir nuestra base de datos
2- Vistas
    a- Solo funciona con select 
	b- Estructura defina
3-  Funciones 
    Escalares ** 
    a- Calculos estandar 
	    caluloIMC(id_Persona)
		30
    Tabla
	    analisisCorporal(idPersona)
		CalculoIMC  CalucloGrasaViseral etc ...
*/

--Vistas 

use Northwind

Create View reporteOrdenes AS
select OrderID 'NumOrden',
CustomerID 'Cliente', OrderDate 'FechaCompra' 
from Orders

Select * from reporteOrdenes


--Top 10 clientes con mas ordenes 
create view reporteTopClientes as
Select top 10 C.ContactName 'NombreCLiente',
c.CompanyName 'nombreCompalia',
Count(o.OrderID) 'cantidadOrdenes'
from Customers C
Inner Join Orders O 
on C.CustomerID= O.CustomerID
Group by C.ContactName , 
c.CompanyName  
order by Count(o.OrderID) desc
 
-- Funciones Escalares 

Create Function obtenerStock (@productId int)
returns Int 
As
Begin 
Return (select UnitsInStock from Products 
where ProductID =@productId)
end

Create Function calculoIva (@orderId int)
returns Int 
As
Begin 
Return (
Select SUM(   UnitPrice*0.13 ) from [Order Details] Iva
where OrderID=  @orderId 
)
end

 -- Orden por cliente, y la cantidad de Iva pagado 
 select C.CompanyName, C.ContactName, OrderID,dbo.calculoIva(OrderID) IvaTotal 
 from Customers C
 inner join Orders O 
 On c.CustomerID= O.CustomerID


 --Tabla temporales
 -- a local 

CREATE TABLE #TempProducts (
    ProductID INT,
    ProductName NVARCHAR(50)
);

select * into #TempOrders 
From Orders
where CustomerID='ANATR'


select * from #TempOrdersLocal

Drop table #TempOrdersLocal

--b. Global 

CREATE TABLE ##TempProductsGlobal (
    ProductID INT,
    ProductName NVARCHAR(50)
);

select * into ##TempOrdersGlobal 
From Orders
where CustomerID='ANATR'


select * from ##TempOrdersGlobal

Drop table ##TempOrdersGlobal

--Transacciones 
Begin Transaction
Update Customers
set ContactName='Brayner'
Commit
Rollback


try
	logica
	Paso 1
	Paso 2
	throw
	Paso 3
	Commit
catch
	Rollback

 