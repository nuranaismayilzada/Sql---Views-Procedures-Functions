create database ViewTest

create table Studentts(
Id int primary key identity (1,1),
[Name] nvarchar(50),
[Surname] nvarchar(100),
[Age] int 
)
insert into Studentts ([Name],[Surname],[Age])
values ('Nurane','Ismayilzade',22),
		('Nunu','Isi',21),
		('Isi','Ismayil',17),
		('Nazrin','Ismayilzade',16)

select *from Studentts

create view vw_getStudentsByAge
as
select *from Studentts where [Age]>20

--create view vw_joinStudentDatass
--as
--select st.FullName as 'Studentts', ct.Name as 'City',co.Name 'Country' from Students st
--inner join Cities ct
--on st.CityId=ct.Id
--join Countries co
--on ct.CountyId=co.Id

--create view vw_joinStudentDatass
--as
--select st.Id , ct.FullName as 'City',co.Name 'Country' from Students st
--inner join Cities ct
--on st.CityId=ct.Id
--join Countries co
--on ct.CountyId=co.Id


--create view vw_joinStudentDatass
--as
--select ct.FullName as 'Student',ct.Name as 'City' from Students st
--inner join Cities ct
--on st.CityId=ct.Id
--join Countries co
--on ct.CountyId=co.Id





select * from vw_getStudentsByAge



--create function dbo.showWord()
--returns nvarchar(50)
--as
--begin 
--	return 'P418'
--end

--declare @result nvarchar(50)=(select dbo.showWord())
--print @result




create function dbo.showWordWithParamm(@text nvarchar(50))
--returns nvarchar(50)
--as
--begin 
--	return @text 
--end

--select dbo.showWordWithParamm('Nurane') as 'Name'


--create function dbo.getStudentsAvgAgesByIds( @id int)
--returns int
--as 
--begin
--	declare @count int= (select Count(*) from Students where [Id]>@id)
--	declare @sumAge int= (select SUM(Age) from Students where [Id]>@id)
--	return @sumAge/@count
--end
--select *from Studentts

--select dbo.getStudentsAvgAgesByIds(2)

--create function dbo.getStudentsAvgAgesByIds2( @id int)
--returns int
--as 
--begin
--	declare @AvgAge int =(select AVG(age) from Studentts where [Id]>@id)
--end
--select *from Studentts

--select dbo.getStudentsAvgAgesByIds(3)

--declare @avgAgee=(select dbo.vw_getStudentsByAge(3))



--create function dbo.getAStudentsByCondition(@avgAge int)
--returns table
--as
--return (select * from Studentss where [Age] > @avgAge)

--declare @avgAge int =(select dbo.getAStudentsByCondition(3))

--select getAStudentsByCondition(@avgAge)

create procedure usp_showText
as
print 'salam'

execute usp_showText

usp_showText

create procedure usp_showwTeext
@text nvarchar(50)
as
print @text

exec usp_showwTeext 'Azerbaycan'


create procedure usp_delStuById
@id int
as
delete from Students where [Id]=@id

exec usp_delStuById 1



create procedure usp_delStuById
@id int
as
delete from Students where [Id]=@id

select *from Studentts

exec usp_delStuById

create procedure usp_createStuu
@name nvarchar(50),
@surname nvarchar(50),
@email nvarchar(100)
@age int
as 
begin 
	insert into Students ([Name],[Surname],[Email],[Age])
	values (@name,@surname,@email,@age)
end

exec usp_createStuu 'Nunu','Ismayilzada','nunu@gmail.com',21



create function dbo.getEmpAvgAges()
returns int
as
begin
	return (select AVG(Age) from Students)
end



create procedure usp_deleteStuByAvgAge
as
begin
	declare @avgAge int=(select dbo.getEmpAvgAges())
	delete from Studentts where [Age]>@avgAge
end

select * from Studentts
exec usp_deleteStuByAvgAge
