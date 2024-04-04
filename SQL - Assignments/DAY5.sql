-- Day5
-- Q1):- 
use classicmodels;
SELECT year(paymentdate) as year ,
 min(amount) as Min_amount from payments
 group by year
 order by year;
 
 -- Q2):-
 Select year(orderdate) as year ,
 concat('Q',quarter (orderdate)) as quarter,
 count(distinct customernumber) as Unique_customers,
 count(ordernumber) as total_orders
 from orders
 Group by year, quarter;
 
 
-- Q3):-
SELECT MONTHNAME(paymentDate) as 'Month', REPLACE(FORMAT(ROUND(SUM(amount), -3),0),',000','K') as 'formatted amount'
FROM payments
GROUP BY MONTHNAME(paymentDate)
HAVING ROUND(SUM(amount), -3) BETWEEN 500000 AND 1000000
ORDER BY ROUND(SUM(amount), -3) DESC;