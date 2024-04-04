-- Day8
-- Q1):-
USE DAY7;
Create table facility (
Facility_id int,
Name varchar(25),
State varchar(25),
Country varchar(25));
alter table facility modify column facility_id int primary key auto_increment;
alter table facility add column city varchar(25) not null after name;

describe facility;