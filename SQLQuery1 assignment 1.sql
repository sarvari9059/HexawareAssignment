create table customer
(
CUSTOMER_NUMBER varchar(20) primary key,
FIRSTNAME varchar(50) NOT NULL,
middlename varchar(40),
lastname varchar(30) NOT NULL,
CUSTOMER_CITY varchar(30) NOT NULL,
CUSTOMER_CONTACT_NO varchar(10) NOT NULL,
occuption varchar(20) NOT NULL,
CUSTOMER_DATE_OF_BIRTH date
)
SELECT *from customer

insert into customer values('C00001','RAMESH','CHANDRA','SHARMA','DELHI','9543198345','SERVICE','1976-12-06')
insert into customer values('C00002','AVINASH','SUNDER','MINHA','DELHI','9876532109','SERVICE','1974-10-16')
insert into customer values('C00003','RAHUL','NULL','RASTOGI','DELHI','9765178901','STUDENT','1981-09-26')

SELECT *from customer



----Display no of customers belongs to each city
select CUSTOMER_CITY,count(CUSTOMER_CITY)from customer group by CUSTOMER_CITY


----Display all city names from customer table without duplicate values
select distinct(CUSTOMER_CITY)from customer

----Display no.of customers from different occupations
select occuption,count(CUSTOMER_NUMBER) as 'count' from customer group by occuption
select occuption,count(occuption) as 'count' from customer group by occuption


----Display customer details with the ascending order based on firstname
select *from customer order by FIRSTNAME


----Display the data in descnding order based on ovvuption and display the firstname in ascending of each occuption
select * from customer order by occuption desc,FIRSTNAME

----display customers who has middlename as null
select *from customer where middlename is null


--day 2 assignment---


create table customer_master
(
CUSTOMER_NUMBER varchar(20) primary key,
FIRSTNAME varchar(50) NOT NULL,
middlename varchar(40),
lastname varchar(30) NOT NULL,
CUSTOMER_CITY varchar(30) NOT NULL,
CUSTOMER_CONTACT_NO varchar(10) NOT NULL,
occuption varchar(20) NOT NULL,
CUSTOMER_DATE_OF_BIRTH date
)
create table loan_details
(
CUSTOMER_NUMBER VARCHAR(20) foreign key  references customermaster(CUSTOMER_NUMBER),
branch_id int,
loan_amount bigint
)
create table account_master1
(
account_number varchar(20) primary key ,
customer_number varchar(20) foreign key references customermaster(CUSTOMER_NUMBER),
branch_id int,
opening_balance bigint,
account_opening_date date,
account_type varchar(20),
account_status varchar(20)
)
create table branch_master
(
branch_id int primary key identity,
branch_name varchar(20),
branch_city varchar(20)
)
create table transaction_details1
(
	transaction_number int primary key,
	account_number varchar(20) foreign key references account_master1(account_number),
	date_of_transaction date,
	medium_of_transaction varchar(10),
	transaction_type varchar(10),
	transaction_amount bigint
)


