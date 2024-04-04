-- Day6
-- Q1):- 
CREATE DATABASE  if not exists day6;
use day6;
create table journey (
Bus_id int not null primary key ,
Bus_Name varchar(25) not null,
Source_Station varchar(25) not null,
Destination varchar(25) not null,
email varchar(25) unique);
select * from journey;


-- Q2):- 
CREATE TABLE vendor (
Vendor_id int not null unique ,
Name varchar(25) not null ,
Email varchar(25) unique ,
Country varchar(25) DEFAULT 'NA');
SELECT * FROM Vendor;

-- Q3):-
Create table movies (
Movie_id int not null unique , 
Name varchar(25) not null ,
Release_Year int  ,
Cast varchar(25) not null ,
Gender enum('Male', 'Female') not null , 
No_of_shows int check(No_of_shows > 0));
select * from movies;

-- Q4):-
CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(255) NOT NULL,
    location VARCHAR(255)
);

CREATE TABLE PRODUCTS (
Product_ID INT PRIMARY KEY auto_increment,
Product_Name VARCHAR(25) NOT NULL unique,
description varchar(125),
supplier_id int ,
foreign key(supplier_id) references suppliers(supplier_id));

create table stock (
id int primary key,
product_id int ,
balance_stock int,
foreign key(product_id) references products(product_id));