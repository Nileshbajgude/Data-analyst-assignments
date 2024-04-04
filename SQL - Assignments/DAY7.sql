-- Day7
-- Q1):-
use classicmodels;
SELECT
    e.employeeNumber AS employeeNumber,
    CONCAT(e.firstName, ' ', e.lastName) AS SalesPerson,
    COUNT(DISTINCT c.customerNumber) AS uniqueCustomers
FROM Employees e
LEFT JOIN Customers c ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY e.employeeNumber, SalesPerson
ORDER BY uniqueCustomers DESC;

-- Q2):-
select c.customernumber as customerNumber, c.customername as customerName,
p.productcode as productCode , p.productName as productName ,
    SUM(od.quantityOrdered) AS Ordered_Qty,
    p.quantityInStock AS Total_inventory,
    p.quantityInStock - SUM(od.quantityOrdered) AS Left_Qty
FROM Customers c
JOIN Orders o ON c.customerNumber = o.customerNumber
JOIN OrderDetails od ON o.orderNumber = od.orderNumber
JOIN Products p ON od.productCode = p.productCode
LEFT JOIN products s ON p.productCode = s.productCode
GROUP BY c.customerNumber, p.productCode
ORDER BY c.customerNumber;

-- Q3):- 
CREATE DATABASE IF NOT exists Day7;
use Day7;
CREATE TABLE laptop (
laptop_name varchar(100) not null);
CREATE TABLE colour (
colour_name varchar(100) not null);

INSERT INTO laptop(laptop_name) VALUES ('DELL'),('HP');
INSERT INTO colour(colour_name) VALUES ('WHITE'),('SILVER'),('BLACK');

select 
   * from laptop l
CROSS JOIN  colour c;

-- Q4):-
CREATE TABLE project (
EmployeeID int ,
FullName varchar(100),
Gender varchar(10),
ManagerID int 
);
INSERT INTO Project VALUES(1, 'Pranaya', 'Male', 3);
INSERT INTO Project VALUES(2, 'Priyanka', 'Female', 1);
INSERT INTO Project VALUES(3, 'Preety', 'Female', NULL);
INSERT INTO Project VALUES(4, 'Anurag', 'Male', 1);
INSERT INTO Project VALUES(5, 'Sambit', 'Male', 1);
INSERT INTO Project VALUES(6, 'Rajesh', 'Male', 3);
INSERT INTO Project VALUES(7, 'Hina', 'Female', 3);

select * from project;

SELECT
    p1.FullName AS "Manager Name",
    p2.FullName AS "Emp Name"
FROM Project p1
JOIN Project p2 ON p1.EmployeeID = p2.ManagerID;