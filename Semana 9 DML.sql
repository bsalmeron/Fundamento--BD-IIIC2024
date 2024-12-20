
Use Northwind
--DML

--Distinct
Select Distinct  CustomerID, ShipName From Orders

--Where 

Select ProductName, CategoryID, UnitsInStock from Products
Where CategoryID = 1
order by UnitsInStock Desc

-- Seleccionar todos los empleados, donde el Pais sea USA 
-- y ordenarlo de forma asc por su fecha de cumpleaņos
-- Nombre, pais, fecha cumple, TitleOfCourtesy

Select TitleOfCourtesy, FirstName, Country, BirthDate from Employees
where Country ='USA'
order by BirthDate asc

--JOINS
use Northwind
Select A.CustomerID, A.CompanyName, B.OrderID, B.OrderDate
from Customers A 
Left join Orders B 
on A.CustomerID = B.CustomerID

Select B.OrderID, B.OrderDate, A.CustomerID, A.CompanyName
from Customers A 
Right join Orders B 
on A.CustomerID = B.CustomerID



Select A.CustomerID, A.CompanyName, B.OrderID, B.OrderDate
from Customers A 
inner join Orders B 
on A.CustomerID = B.CustomerID


-- Grupo 1  Insert [dbo].[Categories] SP
-- Grupo 2  Update [dbo].[Products] SP
-- Grupo 3  Delete [dbo].[Orders]  SP
-- Grupo 4  Select con Ineer Join [dbo].[Order Details] SP
-- Grupo 5  Select Con left [dbo].[Products]  SP

 