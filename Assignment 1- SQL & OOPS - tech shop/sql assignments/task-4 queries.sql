--Customers with no orders
SELECT FirstName, LastName FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);

--Total number of products for sale
SELECT COUNT(*) AS TotalProducts FROM Products;

--Total revenue of TechShop
SELECT SUM(o.TotalAmount) AS TotalRevenue FROM Orders o;

--Average quantity for a specific category
DECLARE @Category NVARCHAR(50) = 'Smartphones';
SELECT AVG(od.Quantity) AS AvgQuantity
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.Category = @Category;

--Total revenue by customer
DECLARE @CustomerID INT = 1;
SELECT SUM(o.TotalAmount) AS CustomerRevenue
FROM Orders o
WHERE o.CustomerID = @CustomerID;

--Customers with most orders
SELECT TOP 1 c.FirstName, c.LastName, COUNT(o.OrderID) AS OrderCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY OrderCount DESC;

--Most popular category (by quantity)
SELECT TOP 1 p.Category, SUM(od.Quantity) AS TotalQuantity
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY TotalQuantity DESC;

--Customer with highest spending
SELECT TOP 1 c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY TotalSpent DESC;

--Average order value overall
SELECT AVG(TotalAmount) AS AverageOrderValue FROM Orders;

--Order count per customer
SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName;
