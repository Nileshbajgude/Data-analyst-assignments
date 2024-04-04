-- Day 11 
-- Q1):-
CALL GetCustomerLevel(103,@level);
SELECT @level AS CustomerLevel;
DELIMITER //

CREATE PROCEDURE GetCustomerLevel(IN customerNumber INT, OUT customerLevel VARCHAR(10))
BEGIN
    DECLARE credit DECIMAL(10, 2);

    SELECT creditLimit INTO credit FROM Customers WHERE customerNumber = customerNumber LIMIT 1;

    IF credit > 100000 THEN
        SET customerLevel = 'Platinum';
    ELSEIF credit >= 25000 AND credit <= 100000 THEN
        SET customerLevel = 'Gold';
    ELSE
        SET customerLevel = 'Silver';
    END IF;
END //

DELIMITER ;
CALL GetCustomerLevel(103,@level);
SELECT level AS "Customer Level";


-- Q2):-
DELIMITER //

CREATE PROCEDURE Get_country_payments(IN inputYear INT, IN inputCountry VARCHAR(255))
BEGIN
    SELECT
        YEAR(p.paymentDate) AS Year,
        c.country AS Country,
        CONCAT(FORMAT(SUM(p.amount)/1000, 0), 'K') AS 'Total Amount'
    FROM Payments p
    JOIN Customers c ON p.customerNumber = c.customerNumber
    WHERE YEAR(p.paymentDate) = inputYear AND c.country = inputCountry
    GROUP BY Year, Country;
END //
DELIMITER ;
CALL Get_country_payments(2003, 'France');