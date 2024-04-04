-- Day 4
-- Q1):-
SELECT ordernumber, status ,COALESCE(comments,"-") AS  comments 
FROM orders
WHERE status = "shipped";


-- Q2):-
SELECT employeenumber , firstname , jobtitle ,
CASE 
WHEN jobtitle = 'President' then 'P'
WHEN jobtitle LIKE 'Sale% Manager%' then 'SM'
WHEN jobtitle = 'Sales Rep' then 'SR'
WHEN jobtitle like 'VP%' then 'VP'
ELSE jobtitle 
END AS Jobtitle_abbr 
FROM employees;