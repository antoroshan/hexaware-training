# TechShop Database and Application

This project implements a comprehensive SQL database and an OOP-based application for **TechShop**, an electronic gadgets store. It includes database design, CRUD operations, and object-oriented programming principles to manage products, customers, and orders.

---

## 🚀 Features
### Database Design
- **Customers Table** – Stores customer details (ID, Name, Email, Phone, Address)
- **Products Table** – Stores product details (ID, Name, Description, Price)
- **Orders Table** – Stores order details (ID, Customer ID, Order Date, Total Amount)
- **OrderDetails Table** – Stores details of each order (Order ID, Product ID, Quantity)
- **Inventory Table** – Stores inventory details (Product ID, Quantity In Stock, Last Stock Update)

---

### OOP Implementation
- **Customers Class** – Handles customer details and operations.
- **Products Class** – Manages product details and availability.
- **Orders Class** – Manages order creation, updates, and cancellations.
- **OrderDetails Class** – Manages product quantities and prices in each order.
- **Inventory Class** – Handles inventory updates, availability checks, and low stock alerts.

---

## 📌 Tasks Overview
### ✅ Database Tasks
- Create database and tables with appropriate primary and foreign keys.
- Insert sample data into tables.
- Perform CRUD operations and implement joins and aggregate functions.

### ✅ SQL Queries
- Filter and search using `WHERE`, `LIKE`, `IN`, `BETWEEN`, `AND`, `OR`.
- Perform aggregate operations with `GROUP BY`, `HAVING`, and `ORDER BY`.

### ✅ OOP Tasks
- Create and manage classes with encapsulation, inheritance, and composition.
- Handle user-defined exceptions for validation, inventory, and payment.
- Implement data persistence with database connectivity.

---

## 🏆 How to Run
1. Clone the repository:
```bash
git clone https://github.com/your-username/techshop.git
