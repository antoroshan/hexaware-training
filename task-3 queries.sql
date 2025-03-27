--Orders with Customer Info
SELECT o.OrderID, o.OrderDate, c.FirstName, c.LastName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;

--Total revenue per product
SELECT p.ProductName, SUM(od.Quantity * p.Price) AS TotalRevenue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName;

--Customers who have made at least one purchase
SELECT DISTINCT c.FirstName, c.LastName, c.Email, c.Phone
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

--Most popular gadget (highest quantity ordered)
SELECT TOP 1 p.ProductName, SUM(od.Quantity) AS TotalOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalOrdered DESC;

--Gadgets with categories ALTER TABLE Products ADD Category NVARCHAR(50);
SELECT ProductName, Category FROM Products;

--Average order value per customer
SELECT c.FirstName, c.LastName, AVG(o.TotalAmount) AS AvgOrderValue
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.FirstName, c.LastName;

--Order with highest revenue
SELECT TOP 1 o.OrderID, c.FirstName, c.LastName, o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.TotalAmount DESC;

--Product order frequency
SELECT p.ProductName, COUNT(od.OrderDetailID) AS TimesOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName;

--Customers who purchased specific product (use parameter)
DECLARE @ProductName NVARCHAR(100) = 'iPhone 14';
SELECT DISTINCT c.FirstName, c.LastName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = @ProductName;

--Total revenue in date range
DECLARE @StartDate DATE = '2024-01-01';
DECLARE @EndDate DATE = '2024-12-31';
SELECT SUM(o.TotalAmount) AS TotalRevenue
FROM Orders o
WHERE o.OrderDate BETWEEN @StartDate AND @EndDate;
