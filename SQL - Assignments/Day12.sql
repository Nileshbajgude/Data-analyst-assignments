-- day 12

--  1)	Calculate year wise, month name wise count of orders and year over year (YoY) percentage change. Format the YoY values in no decimals and show in % sign.
use classicmodels;
 SELECT
	YEAR(orderDate) AS Year,
    MONTHNAME(orderDate) AS Month,
    COUNT(orderNumber) AS 'Total Orders',
    CONCAT(ROUND(((COUNT(orderNumber) - LAG(COUNT(orderNumber)) OVER (ORDER BY YEAR(orderDate)))/(LAG(COUNT(orderNumber)) OVER (ORDER BY YEAR(orderDate))))*100,0),'%') AS '%YOY Change'
FROM orders
GROUP BY YEAR(orderDate), MONTHNAME(orderDate);


/* 2)	Create the table emp_udf with below fields.

●	Emp_ID
●	Name
●	DOB
Add the data as shown in below query.
INSERT INTO Emp_UDF(Name, DOB)
VALUES ("Piyush", "1990-03-30"),("Aman", "1992-08-15"), ("Meena", "1998-07-28"), ("Ketan", "2000-11-21"), ("Sanjay", "1995-05-21");  */

CREATE TABLE emp_udf (
    Emp_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    DOB DATE
);
INSERT INTO emp_udf (Name, DOB)
VALUES ("Piyush", "1990-03-30"), ("Aman", "1992-08-15"), ("Meena", "1998-07-28"), ("Ketan", "2000-11-21"), ("Sanjay", "1995-05-21");
select * from emp_udf;

DELIMITER //

CREATE FUNCTION calculate_age(dob DATE)
RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
    DECLARE years INT;
    DECLARE months INT;
    DECLARE age VARCHAR(50);
    
    SET years = DATEDIFF(CURRENT_DATE(), dob) DIV 365;
    SET months = (DATEDIFF(CURRENT_DATE(), dob) MOD 365) DIV 30;
    
    SET age = CONCAT(years, " years ", months, " months");
    
    RETURN age;
END //
 DELIMITER ; 

select 
	Emp_ID,
    Name,
    DOB,
    calculate_age(DOB) as Age from emp_udf;
