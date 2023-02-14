use day5 assig
create table student1
(
id int primary  key identity,
name varchar(20),
branchid int,
gender varchar(20),
branch varchar(20)
)
insert into student1 values('megha',2,'female','it'),
('lanka',1,'male','cse'),
('joshi',3,'male','eee'),
('priya',2,'female','it'),
('roshan',3,'male','eee')
select *from student1
drop table student

------info by branchid

create function branchidfun(@bid int)
returns table
as 
return(select * from student1 where branchid=@bid)
select * from dbo.branchidfun(2)


------info by gender

create function genderfun(@gender varchar(10))
returns table
as 
return(select * from student1 where gender=@gender)
select * from dbo.genderfun('female')
drop function genderfun

------
create table tablemplyee(id int,name varchar(40),gender varchar(40),salary int,deptid int )
insert into tablemplyee values(1,'kon','male',9000,1),(2,'arc','male',91000,3),(3,'dp','male',19000,2),(4,'kini','female',29000,1),(5,'jos','female',9000,3)
select * from tablemplyee
drop table tablemplyee
drop table tablemplyeeaudit
create table tablemplyeeaudit(id int identity(1,1) primary key,auditdata nvarchar(1000) )
create trigger tr_tblemployee_fordelete
on tablemplyee
for delete
as
begin 
declare @id int
select @id=id from deleted
insert into tablemplyeeaudit values ('new employee'+cast(@id as varchar (10))+'is insrted'+cast(getdate() as varchar(30)))
end
select *from tablemplyee
select *from tablemplyeeaudit
delete from tablemplyee  where id=3

insert into tablemplyee values (6,'geetha','female',894798,4)
drop trigger tr_tblemployee_fordelete