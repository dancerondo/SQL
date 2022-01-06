Create view vwThongTinTN
as
select NHANVIEN.MaNV,TenNV,TenTN
from NHANVIEN join THANNHAN on NHANVIEN.MaNV = THANNHAN.MaNV
go
 select * from vwThongTinTN
 -- Lệnh Insert và Delete bị lỗi do đụng khóa ngoại
 insert into vwThongTinTN values ('0000','Tien','Hoa')
 delete from vwThongTinTN

 --Lệnh Update không bị lỗi
 update vwThongTinTN 
 set TenNV = N'Tùng' where TenTN = 'Quang'
 go



go
Create View vwNHANVIEN 
as
select MaNV,TenNV,Luong
from NHANVIEN
go
Alter View vwNHANVIEN as
select MaNV,TenNV,Phai,Luong
from NHANVIEN
go
select * from NHANVIEN
select * from vwNHANVIEN
insert into NHANVIEN(MaNV,TenNV) values ('00000','ABC')
insert into vwNHANVIEN(MaNV,TenNV) values ('00000','ABC')

update vwNHANVIEN
set TenNV = N'Vân'
where MaNV = '999887777'

delete from vwNHANVIEN where MaNV = '00000'
drop view vwNHANVIEN
go
-- Store procedure
--Thủ tục không có tham số
create proc spThongTin as
select * from NHANVIEN where Phai = 'Nam'
go
execute spThongTin
go
--Thủ tục có 1 tham số đầu vào
create Procedure spThongTinNV (@tennv nvarchar(20)) as
select * from NHANVIEN
where TenNV = @tennv

Execute spThongTinNV N'Tiến'
go
--Thủ tục có 2 tham số đầu vào
create Procedure spThongTinNV1 (@tennv nvarchar(20), @phai nvarchar(20)) as
select * from NHANVIEN
where TenNV = @tennv and Phai = @phai

exec spThongTinNV1 N'Tùng',N'Nữ'