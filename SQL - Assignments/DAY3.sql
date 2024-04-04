-- Day 1 No questions
-- Day 2 No questions

-- Day 3 
-- Q1):- 
use classicmodels;
SELECT customernumber, customername , state , creditlimit FROM customers
where state is not null 
and creditlimit between 50000 and 100000
order by creditlimit desc;
 
 -- Q2):-
SELECT distinct productline FROM productlines 
 where productline like '%cars';
 
