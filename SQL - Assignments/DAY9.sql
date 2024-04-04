USE DAY7;
create table University (
ID INT , Name varchar(25));
INSERT INTO university VALUES (1, " Pune University "), (2, " Mumbai University "), (3, " Delhi University "), (4, "Madras University"), (5, "Nagpur University");
update University set Name = replace(Name , " ","") ;
select * from university;