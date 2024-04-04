-- Day 13

## 1)	Display the customer numbers and customer names from customers table who have not placed any orders using subquery
-- Table: Customers, Orders
use classicmodels;
SELECT CustomerNumber, CustomerName
FROM Customers
WHERE CustomerNumber NOT IN (SELECT CustomerNumber FROM Orders);
 
## 2)	Write a full outer join between customers and orders using union and get the customer number, customer name, count of orders for every customer.
-- Table: Customers, OrdersSELECT C.CustomerNumber, C.CustomerName, IFNULL(COUNT(O.OrderNumber), 0) AS OrderCount

SELECT C.CustomerNumber, C.CustomerName, IFNULL(COUNT(O.OrderNumber), 0) AS OrderCount
FROM Customers AS C
LEFT JOIN Orders AS O ON C.CustomerNumber = O.CustomerNumber
GROUP BY C.CustomerNumber, C.CustomerName
UNION
SELECT O.CustomerNumber, C.CustomerName, IFNULL(COUNT(O.OrderNumber), 0) AS OrderCount
FROM Customers AS C
RIGHT JOIN Orders AS O ON C.CustomerNumber = O.CustomerNumber
GROUP BY O.CustomerNumber, C.CustomerName;

## 3)	Show the second highest quantity ordered value for each order number.
-- Table: Orderdetails
SELECT
    OrderNumber,
    MAX(QuantityOrdered) AS quantityOrdered
FROM
    Orderdetails AS od1
WHERE
    QuantityOrdered < (
        SELECT MAX(QuantityOrdered)
        FROM Orderdetails AS od2
        WHERE od1.OrderNumber = od2.OrderNumber
    )
GROUP BY OrderNumber;

## 4)	For each order number count the number of products and then find the min and max of the values among count of orders.
-- Table: Orderdetails
    
    SELECT
    MAX(ProductCount) AS "MAX(Total)",
    MIN(ProductCount) AS "MIN(Total)"
FROM (
    SELECT OrderNumber,
        COUNT(*) AS ProductCount
    FROM Orderdetails
    GROUP BY OrderNumber) AS Counts;

## 5)	Find out how many product lines are there for which the buy price value is greater than the average of buy price value. Show the output as product line and its count.

SELECT p.ProductLine,
    COUNT(*) AS Total
FROM Products AS p
JOIN (SELECT
        AVG(BuyPrice) AS AvgBuyPrice
    FROM Products) AS avg_prices
ON p.BuyPrice > avg_prices.AvgBuyPrice
GROUP BY p.ProductLine
ORDER BY Total DESC;
    
