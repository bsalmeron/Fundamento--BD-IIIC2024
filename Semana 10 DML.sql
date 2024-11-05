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


 