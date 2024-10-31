
Use Northwind
--DML

--Distinct
Select Distinct  CustomerID, ShipName From Orders

--Where 

Select ProductName, CategoryID, UnitsInStock from Products
Where CategoryID = 1
order by UnitsInStock Desc

-- Seleccionar todos los empleados, donde el Pais sea USA 
-- y ordenarlo de forma asc por su fecha de cumpleaños
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



 