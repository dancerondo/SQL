--1.
insert into Loaihang values ('GD01','electronic rice cooker Sharp COM-18V')

--2.
update Dondathang set ngaygiao='2015-04-13' where sohoadon=5

--3,4,5
select tencty,tenloaihang,diachi,sohoadon,giaban,Chitietdathang.soluong 
from Nhacungcap,Chitietdathang,Mathang,Loaihang 
where Nhacungcap.macty=Mathang.macty and Mathang.mahang= Chitietdathang.mahang and Mathang.maloaihang=Loaihang.maloaihang

--6.
select tencty,hoten,ngaygiao,ngaychuyen from Khachhang,Dondathang,Nhanvien 
where Khachhang.makh=Dondathang.makh and Dondathang.manv=Nhanvien.manv
and SoHoaDon= '1'
--7. 
select distinct hoten from Nhanvien,Dondathang 
where Nhanvien.manv not in (select Dondathang.manv from Dondathang)

--8.
select ho+ten as HoTen from Nhanvien where luongcoban in 
(select max(luongcoban) from Nhanvien)

--9.
select count(*) as SoLuongDaBan,Dondathang.manv,hoten,ISNULL(sohoadon,0) as sohoadon,
from Nhanvien left outer join Dondathang on Nhanvien.manv=Dondathang.manv
group by Dondathang.manv,hoten

--10.
update Nhanvien set luongcoban=luongcoban*0.75
where Nhanvien.manv in (select Dondathang.manv 
from Dondathang where year(Dondathang.ngaydat) <> 2003)

--Cach 2: không bán được năm 2003
where Nhanvien.manv not in (select Dondathang.manv 
from Dondathang where year(Dondathang.ngaydat) = 2003)

