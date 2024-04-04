-- Day10
-- Q1):-
use classicmodels;
CREATE VIEW products_status AS
SELECT
    YEAR(o.orderDate) AS Year,
    CONCAT(count(od.priceEach),
        ' (',ROUND((SUM(od.priceEach * od.quantityOrdered) / (SELECT SUM(od2.priceEach * od2.quantityOrdered) FROM OrderDetails od2)) * 100),'%)'
    ) AS Value
FROM Orders o
JOIN OrderDetails od ON o.orderNumber = od.orderNumber
GROUP BY Year
ORDER BY Value desc;
