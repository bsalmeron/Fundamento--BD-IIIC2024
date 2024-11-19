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
 

Select * from  [dbo].[reporteTopClientes]