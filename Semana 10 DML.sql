Use Northwind

--Order by asc o desc

Select FirstName, BirthDate from Employees
Order by FirstName desc

-- AND  - OR 

Select P.ProductName, C.CategoryName, P.UnitsInStock 
from Products P
Inner Join Categories C
on P.CategoryID = C.CategoryID
where C.CategoryName ='Beverages' AND P.UnitsInStock>30


Select P.ProductName, C.CategoryName, P.UnitsInStock,
P.Discontinued
from Products P
Inner Join Categories C
on P.CategoryID = C.CategoryID
where (C.CategoryName ='Beverages' OR P.UnitsInStock>30)
AND P.Discontinued =1
Order by  P.UnitsInStock asc

--NULL
 

Select Customers.ContactName, Orders.ShipRegion from Orders
Inner Join Customers
on Orders.CustomerID = Customers.CustomerID
where Orders.ShipRegion is null

Select Customers.ContactName, Orders.ShipRegion from Orders
Inner Join Customers
on Orders.CustomerID = Customers.CustomerID
where Orders.ShipRegion is not null

--Agregacion 


Select  P.ProductName,
SUM( OD.UnitPrice*OD.Quantity) 'precio Total' 
from [Order Details] OD Inner Join Products P
on OD.ProductID=P.ProductID
Group by P.ProductName   



/*
Mostrar la cantidad de Ordenes, por nombre de cliente y nombre de producto comprado


*/

Select C.ContactName, p.productName, COUNT(O.OrderID)'cantidadOrdenes' from 
Customers C Inner join 
Orders O on C.CustomerID = O.CustomerID
Inner Join [Order Details] OD 
on O.OrderID = OD.OrderID
Inner Join Products P 
on OD.ProductID=P.ProductID
Group by C.ContactName, p.productName
Order by  C.ContactName asc , COUNT(O.OrderID) desc 

-- having 

Select C.ContactName, p.productName, COUNT(O.OrderID)'cantidadOrdenes' from 
Customers C Inner join 
Orders O on C.CustomerID = O.CustomerID
Inner Join [Order Details] OD 
on O.OrderID = OD.OrderID
Inner Join Products P 
on OD.ProductID=P.ProductID
Group by C.ContactName, p.productName
Having  COUNT(O.OrderID)>3
Order by  C.ContactName asc , COUNT(O.OrderID) desc 
 

--Procedimiento almacenado que reciba el nombre del cliente y muestre las ordenes de un cliente
--donde ha comprado mas de 4 veces un producto 


Create Procedure ObtenerOrdenesClientes 

@NombreCliente Varchar(100)
as
Begin
	Select C.ContactName, p.productName, COUNT(O.OrderID)'cantidadOrdenes' from 
	Customers C Inner join 
	Orders O on C.CustomerID = O.CustomerID
	Inner Join [Order Details] OD 
	on O.OrderID = OD.OrderID
	Inner Join Products P 
	on OD.ProductID=P.ProductID
	Where C.ContactName = @NombreCliente
	Group by C.ContactName, p.productName
	Having  COUNT(O.OrderID)>3
	Order by  C.ContactName asc , COUNT(O.OrderID) desc
	
End


Exec ObtenerOrdenesClientes 'Horst Kloss'

--Orden ejecuccion SQL 
-- https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhagQGV4V5ga4aLTVt5YLFl8ITK5jaScd5QoR1gd7dUcdo4xZR8UWYdpgoSqqX8kp4DDSHMLMSSAUWobHkwO91d7uFd4eDWjsp9xaXyBhYbRpHu5XmH58iLQHZc5dt2GQJ1RNXEe0EOuKOk/s1600/orden_sql_ejecucion.png



--Group By 
Use [Northwind]

Select C.CategoryName, COUNT(O.OrderID)'cantidadOrdenes',SUM(O.Quantity*O.UnitPrice) 'montoTotalProducto',
MAX(O.UnitPrice) 'precioMasAltoVenta', MIN(O.UnitPrice) 'precioMasBajoVenta'
from [Order Details] O
Inner Join Products P
On O.ProductID = P.ProductID 
Inner Join Categories C 
On C.CategoryID=P.CategoryID
Group By C.CategoryName
Order by  C.CategoryName

--TOP 10 de clientes con mas ordenes 

Select  Top 15 C.ContactName, COUNT(O.OrderID)'cantidadOrdenes' From Orders O 
Inner Join Customers C 
On o.CustomerID = C.CustomerID
Group By C.ContactName 
Order by COUNT(O.OrderID) desc

-- Like 

Select ProductName, QuantityPerUnit from Products
where ProductName Like '%ca%'

