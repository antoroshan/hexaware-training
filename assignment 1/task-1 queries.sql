
CREATE DATABASE TechShop;

USE TechShop;

CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0)
);

CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

CREATE TABLE OrderDetails (
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT CHECK (Quantity > 0),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


CREATE TABLE Inventory (
    InventoryID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT NOT NULL UNIQUE,
    QuantityInStock INT DEFAULT 0 CHECK (QuantityInStock >= 0),
    LastStockUpdate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES 
    ('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St'),
    ('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Oak St'),
    ('Alice', 'Johnson', 'alice.johnson@example.com', '1122334455', '789 Pine St'),
    ('Bob', 'Williams', 'bob.williams@example.com', '2233445566', '321 Elm St'),
    ('Charlie', 'Brown', 'charlie.brown@example.com', '3344556677', '654 Birch St'),
    ('David', 'Davis', 'david.davis@example.com', '4455667788', '987 Cedar St'),
    ('Emma', 'Wilson', 'emma.wilson@example.com', '5566778899', '741 Maple St'),
    ('Frank', 'Miller', 'frank.miller@example.com', '6677889900', '852 Spruce St'),
    ('Grace', 'Moore', 'grace.moore@example.com', '7788990011', '963 Walnut St'),
    ('Hannah', 'Taylor', 'hannah.taylor@example.com', '8899001122', '159 Chestnut St');

INSERT INTO Products (ProductName, Description, Price)
VALUES 
    ('Laptop', 'High-performance laptop', 1200.00),
    ('Smartphone', 'Latest model smartphone', 800.00),
    ('Tablet', 'Lightweight tablet', 500.00),
    ('Smartwatch', 'Advanced smartwatch', 250.00),
    ('Wireless Earbuds', 'Noise-cancelling earbuds', 150.00),
    ('Gaming Console', 'Next-gen gaming console', 400.00),
    ('Monitor', '4K resolution monitor', 300.00),
    ('Keyboard', 'Mechanical gaming keyboard', 100.00),
    ('Mouse', 'Ergonomic wireless mouse', 50.00),
    ('Headphones', 'Studio-quality headphones', 200.00);


INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES 
    (1, '2024-03-01', 2000.00),
    (2, '2024-03-02', 500.00),
    (3, '2024-03-03', 1000.00),
    (4, '2024-03-04', 1500.00),
    (5, '2024-03-05', 800.00),
    (6, '2024-03-06', 1200.00),
    (7, '2024-03-07', 600.00),
    (8, '2024-03-08', 300.00),
    (9, '2024-03-09', 700.00),
    (10, '2024-03-10', 900.00);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES 
    (1, 1, 1),
    (2, 2, 1),
    (3, 3, 2),
    (4, 4, 1),
    (5, 5, 3),
    (6, 6, 1),
    (7, 7, 2),
    (8, 8, 1),
    (9, 9, 2),
    (10, 10, 1);

INSERT INTO Inventory (ProductID, QuantityInStock)
VALUES 
    (1, 50),
    (2, 30),
    (3, 20),
    (4, 40),
    (5, 60),
    (6, 15),
    (7, 25),
    (8, 35),
    (9, 45),
    (10, 55);

