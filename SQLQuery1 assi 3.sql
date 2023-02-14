create database day3ass
use day3ass

select * from tablemp
create table tablemp
(
id int primary key identity,
name varchar(40),
gender varchar(40),
salary int,deptid int 
)
insert into tablemp values('mark','male',9000,1),
		('ark','male',91000,3),
		('maozrk','male',19000,2),
		('markini','female',29000,1),
		('marks','female',9000,3)
select * from tablemp
1---------------
create proc userassi
as 
begin
select 'Welcom to SQL Server'
end
exec  userassi

drop procedure userassi
2------------------------

create procedure usptablemployee(@gender varchar(10),@deptid int)
as
begin
select name,gender,salary from dbo.tablemp
where gender=@gender and deptid=@deptid;
end
exec dbo.usptablemployee 'female',3
drop proc usptablemployee
3--------------------


alter proc usptablemployeecount (@gender varchar(20),@deptid int, @total int output)
as 
begin
select name,gender,salary from tablemp where gender=@gender and deptid=@deptid;
select @total=@@rowcount
end
declare @count int 
exec usptablemployeecount 'female',3,@total=@count output
select @count


4-------------------
create procedure totalcount
as
begin
select gender,count(gender) as totalemplyeecount from tablemp group by gender
end
exec totalcount
drop procedure totalcount


5-------------
create proc uspadd(@n1 int =2,@n2 int =4,@n3 int =6)
as 
begin
declare @sum int
set @sum=@n1+@n2+@n3
select @sum as 'total sum'
end

exec uspadd 7,8,9
