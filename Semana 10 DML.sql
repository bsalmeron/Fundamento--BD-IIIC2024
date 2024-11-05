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