use Northwind


-- Escalares
-- Tipo Tabla


CREATE FUNCTION dbo.GetLowStockProducts(@StockLevel INT)
RETURNS TABLE
AS
RETURN (
    SELECT ProductID, ProductName, UnitsInStock
    FROM Products
    WHERE UnitsInStock > @StockLevel
);


