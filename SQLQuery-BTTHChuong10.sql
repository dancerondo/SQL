--a.
Create view cus_rental_vw as
select C.CNo, CName, Property_No, RentStart, RentFinish  from Customer C, Rental R
where C.CNo = R.CNo

--b.
select * from cus_rental_vw

select top 3 * from cus_rental_vw
order by CName DESC
--c.
alter view cus_rental_vw as
select C.CNo, CName, RentStart, RentFinish  from Customer C, Rental R
where C.CNo = R.CNo

--d.
drop view cus_rental_vw

--e.
create view Propertyinfo_vv
with schemabinding
as select Property_No, PAddress, Rentprice, OwnerNo
from dbo.Property

create unique clustered index IX_Propertyinfo
on Propertyinfo_vv(Property_No)

--f.
create view Property_Report_vw 
as
select C.CNo, CName, COUNT(*) as "Number of Property"
from Customer C, Rental R
where R.CNo = C.CNo
and DATEDIFF(MM, RentStart, RentFinish)>10
group by C.CNo, CName

--g.
create view property_vw
as
select * from Property
where RentPrice>300
with check option

--h.
insert into property_vw values('P011', '15 Chau Van Liem street, 2 dist, HCM city', 370, 'W002' )

sp_helptext Property_Report_vw