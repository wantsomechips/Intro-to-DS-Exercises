-- Exercise 3: SQL Basics on Northwind 2000 SQLite Database

-- 1. List the first name, last name, and hire date of all employees hired after January 1st, 1994.
SELECT FirstName, LastName, HireDate
FROM Employees
WHERE HireDate > '1994-01-01'
ORDER BY HireDate;

-- 2. Count how many orders each customer has placed.
SELECT c.CustomerID, c.CompanyName, COUNT(o.OrderID) as OrderCount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY OrderCount DESC;

-- 3. Find the names of all customers who have ordered the product "Chai".
SELECT DISTINCT c.CustomerID, c.CompanyName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Chai'
ORDER BY c.CompanyName;

-- 4. Find all orders that have been placed but not yet shipped.
SELECT OrderID, CustomerID, OrderDate, RequiredDate, ShippedDate
FROM Orders
WHERE ShippedDate IS NULL
ORDER BY OrderDate;

-- 5. Find the customer who has placed the most orders.
SELECT c.CustomerID, c.CompanyName, COUNT(o.OrderID) as OrderCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CompanyName
ORDER BY OrderCount DESC
LIMIT 1;