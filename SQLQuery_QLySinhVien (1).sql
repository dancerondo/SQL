
/*=====================Create DataBase======================*/

if exists(select name from sysdatabases where name='QuanLyDiemSV')
drop Database QuanLyDiemSV
go
Create Database QuanLyDiemSV
go

use QuanLyDiemSV
go


/*=============DANH MUC KHOA==============*/


Create table DMKhoa
(
MaKhoa char(2) primary key,
TenKhoa nvarchar(30)not null,
)


/*==============DANH MUC SINH VIEN============*/


Create table DMSV
(
MaSV char(3)not null primary key,
HoSV nvarchar(15)not null,
TenSV nvarchar(7)not null,
Phai nchar(7),
NgaySinh datetime not null,
NoiSinh nvarchar(20),
MaKhoa char(2),
HocBong float,

)




/*===================MON HOC========================*/



create table DMMH
(
MaMH char(2)not null,
TenMH nvarchar(25)not null,
SoTiet tinyint
Constraint DMMH_MaMH_pk primary key(MaMH)
)



/*=====================KET QUA===================*/

Create table KetQua
(
MaSV char(3)not null,
MaMH char(2)not null,
LanThi tinyint,
Diem decimal(4,2),
Constraint KetQua_MaSV_MaMH_LanThi_pk primary key(MaSV,MaMH,LanThi)
)

/*==========================TAO KHOA NGOAI==============================*/
Alter table dmsv
add Constraint DMKhoa_MaKhoa_fk foreign key(MaKhoa)
References DMKhoa (MaKhoa)
Alter table KetQua
add constraint KetQua_MaSV_fk foreign key(MaSV)references DMSV (MaSV),
constraint DMMH_MaMH_fk foreign key(MaMH)references DMMH (MaMH)


/*==================NHAP DU LIEU====================*/

/*==============NHAP DU LIEU DMMH=============*/
Insert into DMMH(MaMH,TenMH,SoTiet)
values('01',N'Cơ Sở Dữ Liệu',45),
      ('02',N'Trí Tuệ Nhân Tạo',45),
	  ('03',N'Truyền Tin',45),
	  ('04',N'Đồ Họa',60),
	  ('05',N'Văn Phạm',60)

/*==============NHAP DU LIEU DMKHOA=============*/
Insert into DMKhoa(MaKhoa,TenKhoa)
values('AV',N'Anh Văn')
Insert into DMKhoa(MaKhoa,TenKhoa)
values('TH',N'Tin Học')
Insert into DMKhoa(MaKhoa,TenKhoa)
values('TR',N'Triết')
Insert into DMKhoa(MaKhoa,TenKhoa)
values('VL',N'Vật Lý')


/*==============NHAP DU LIEU DMSV=============*/


Insert into DMSV
values('A01',N'Nguyễn Thị',N'Hải',N'Nữ','23/02/1990',N'Hà Nội','TH',130000)
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A02',N'Trần Văn',N'Chính',N'Nam','24/12/1992',N'Bình Định','VL',150000)
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A03',N'Lê Thu Bạch',N'Yến',N'Nữ','21/02/1990',N'TP Hồ Chí Minh','TH',170000)
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A04',N'Trần Anh',N'Tuấn',N'Nam','20/12/1990',N'Hà Nội','AV',80000)
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('B01',N'Trần Thanh',N'Mai',N'Nữ','12/08/1991',N'Hải Phòng','TR',0)
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('B02',N'Trần Thị Thu',N'Thủy',N'Nữ','02/01/1991',N'TP Hồ Chí Minh','AV',0)

/*==============NHAP DU LIEU BANG KET QUA=============*/

Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','01',1,3)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','01',2,6)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','02',2,6)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','03',1,5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','01',1,4.5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','01',2,7)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','03',1,10)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','05',1,9)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','01',1,2)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','01',2,5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','03',1,2.5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','03',2,4)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A04','05',2,10)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','01',1,7)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','03',1,2.5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','03',2,5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B02','02',1,6)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B02','04',1,10)


/*===============CAP NHAT THONG TIN=================*/

--câu 2--
update dmmh
set sotiet=45
where mamh='05'
--câu 3,4---
update dmsv
set tensv=N'Kỳ',phai ='Nam'
where masv='b01'
-------câu 5-----
update dmsv
set ngaysinh='05/07/1990'
where masv='b02'
----------câu 6----------
update dmsv
set hocbong=hocbong+100000
where makhoa='Av'
-------câu 7----------
delete from ketqua
where lanthi=2 and diem<5
-------câu 8---------
--delete from dmsv
--where hocbong=0
--không được vì có ràng buộc khóa ngoại --

--B.Truy vấn những câu đơn giản
--9. Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh viên, Tên 
--sinh viên, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã sinh viên tăng dần. 
select masv as'Mã sinh viên',hosv as'Họ sinh viên',tensv as'Tên sinh viên',hocbong as'Học Bổng'
from dmsv
orderby masv asc

--10. Danh sách các sinh viên gồm thông tin sau: Mã sinh viên, họ tên sinh viên, Phái, Ngày 
--sinh. Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ. 
select masv as'Mã sinh viên',hosv+' '+tensv as'họ tên sinh viên',phai as'Phái',ngaysinh as'Ngày sinh'
from dmsv
orderby phai asc

--11. Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. Thông tin sẽ 
--được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần. 
select hosv+' '+tensv as'họ tên sinh viên',ngaysinh as'Ngày sinh',hocbong as'Học bổng'
from dmsv
orderby ngaysinh asc,hocbong desc
--12. Danh sách các môn học có tên bắt đầu bằng chữ T, gồm các thông tin: Mã môn, Tên 
--môn, Số tiết. 
select mamh as'Mã môn học',tenmh as'Tên môn học',sotiet as'số tiết'
from dmmh
where tenmh like't%'

--13. Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, gồm các thông 
--tin: Họ tên sinh viên, Ngày sinh, Phái. 
select hosv+' '+tensv as'Họ tên sinh viên',ngaysinh as'Ngày sinh',phai as'Phái'
from dmsv
where tensv like'%i'
--14. Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm các thông tin: 
--Mã khoa, Tên khoa. 
select makhoa as'Mã khoa',tenkhoa as'tên khoa'
from dmkhoa
where tenkhoa like'_n%'
--15. Liệt kê những sinh viên mà họ có chứa chữ Thị. 
select*
from dmsv
where hosv like N'%thị%'

--16. Cho biết danh sách những sinh viên có ký tự đầu tiên của tên nằm trong khoảng từ a 
--đến m, gồm các thông tin: Mã sinh viên, Họ tên sinh viên, Phái, Học bổng. 
Select MaSV As N'Mã Sinh Viên',HoSV+' '+TenSV As N'Họ Tên Sinh Viên',Phai As N'Phái',HocBong As N'Học Bổng'
from dmsv
where tensv between'a'and'm'

--17. Cho biết danh sách những sinh viên mà tên có chứa ký tự nằm trong khoảng từ a đến 
--m, gồm các thông tin: Họ tên sinh viên, Ngày sinh, Nơi sinh, Học bổng. Danh sách 
--được sắp xếp tăng dần theo họ tên sinh viên. 
Select MaSV As N'Mã Sinh Viên',HoSV+' '+TenSV As N'Họ Tên Sinh Viên',Phai As N'Phái',HocBong As N'Học Bổng'
From DMSV
Where TenSV like'%[a-m]%'
Order by HoSV+' '+TenSV ASC

--18. Cho biết danh sách các sinh viên có học bổng lớn hơn 100,000, gồm các thông tin: Mã 
--sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự 
--Mã khoa giảm dần. 
Select MaSV As N'Mã Sinh Viên',HoSV+' '+TenSV As N'Họ Tên Sinh Viên',MaKhoa As N'Mã Khoa',HocBong As N'Học Bổng'
from dmsv
where hocbong>100000
order by makhoa desc

--19. Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm các thông 
--tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng. 
Select HoSV+' '+TenSV As N'Họ Tên Sinh Viên',MaKhoa As N'Mã Khoa',NoiSinh As N'Nơi Sinh',HocBong As N'Học Bổng'
From DMSV
Where HocBong>=150000 and NoiSinh=N'Hà Nội'

--20. Danh sách các sinh viên của khoa Anh văn và khoa Vật lý, gồm các thông tin: Mã sinh 
--viên, Mã khoa, Phái. 
Select MaSV As N'Mã Sinh Viên',MaKhoa As N'Mã Khoa',Phai As N'Phái'
From DMSV
Where MaKhoa='AV'or MaKhoa='VL'

--21. Cho biết những sinh viên có ngày sinh từ ngày 01/01/1991 đến ngày 05/06/1992 gồm 
--các thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học bổng. 
Select MaSV As N'Mã Sinh Viên',NgaySinh As N'Ngày Sinh',NoiSinh As N'Nơi Sinh',HocBong As N'Học Bổng'
From DMSV
Where NgaySinh>='01/01/1991'and NgaySinh<='05/06/1992'

--22. Danh sách những sinh viên có học bổng từ 80.000 đến 150.000, gồm các thông tin: Mã 
--sinh viên, Ngày sinh, Phái, Mã khoa. 
Select MaSV As N'Mã Sinh Viên',NgaySinh As N'Ngày Sinh',Phai As N'Phái',MaKhoa As N'Mã Khoa'
From DMSV
Where HocBong>=80000 and HocBong<=150000

--23. Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn 45, gồm các thông tin: Mã 
--môn học, Tên môn học, Số tiết. 
Select MaMH As N'Mã Môn Học',TenMH As N'Tên Môn Học',SoTiet As N'Số Tiết'
From DMMH
Where SoTiet>30 and SoTiet<45
--24. Liệt kê những sinh viên nam của khoa Anh văn và khoa tin học, gồm các thông tin: Mã 
--sinh viên, Họ tên sinh viên, tên khoa, Phái. 
select masv 'Mã sinh viên','Họ tên sinh viên'=hosv+' '+tensv,tenkhoa 'Tên khoa',phai 'Phái'
from dmsv sv,dmkhoa khoa
where sv.makhoa=khoa.makhoa
--25. Liệt kê những sinh viên nữ, tên có chứa chữ N--
select*
from dmsv
where phai=N'nữ'and tensv like N'%n%'
--C. Truy vấn sử dụng hàm: year, month, day, getdate, case, …. 
--26. Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02, gồm các thông tin: Họ 
--sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.
select hosv 'Họ sinh viên',tensv 'Tên sinh viên',noisinh 'Nơi sinh',ngaysinh 'ngày sinh'
from dmsv
where noisinh=N'Hà nội'andmonth(ngaysinh)=2
--27. Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh viên, Tuổi,Học bổng. 
select hosv+' '+tensv 'Tên sinh viên','Tuổi'=year(getdate())-year(ngaysinh),hocbong 'Học bổng'
from dmsv
whereyear(getdate())-year(ngaysinh)>20
--28. Danh sách những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh viên, Tuổi, 
--Tên khoa. 
select hosv+' '+tensv 'Tên sinh viên','Tuổi'=year(getdate())-year(ngaysinh),tenkhoa 'Tên khoa'
from dmsv sv,dmkhoa khoa
where sv.makhoa=khoa.makhoa and(year(getdate())-year(ngaysinh)between 20 and 25)
--29. Danh sách sinh viên sinh vào mùa xuân năm 1990, gồm các thông tin: Họ tên sinh viên, 
--Phái, Ngày sinh. 
select hosv+' '+tensv 'Tên sinh viên',phai 'Phái',ngaysinh 'Ngày sinh'
from dmsv
where year(ngaysinh)=1990 and(month(ngaysinh)in(1,2,3))--between 1 and 3)
--30. Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên, Phái, Mã 
--khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học bổng cao” nếu giá trị 
--của field học bổng lớn hơn 500,000 và ngược lại hiển thị là “Mức trung bình” 
select masv'Mã sinh viên',phai'Phái',makhoa 'Mã khoa','Mức trung bình'=case when hocbong>500000 then N'Học bổng cao'else N' Mức trung bình'end
from dmsv 

--D. Truy vấn sử dụng hàm kết hợp: max, min, count, sum, avg và gom 
--nhóm 
--32. Cho biết tổng số sinh viên của toàn trường
select'Tổng sinh viên toàn trường'=count(masv)
from dmsv
--33. Cho biết tổng sinh viên và tổng sinh viên nữ. 
--đây là cách viết gộp trong bảng
select'Tổng sinh viên'=count(masv),'Tổng sinh viên nữ'=sum(case phai when N'nữ'then 1 else 0 end)
from dmsv
------------
select'Tổng sinh viên'=count(masv),t.nu 'Tổng sinh viên nữ'
from dmsv,
(
select count(masv)as'nu'
from dmsv
where phai=N'Nữ'
)as t
group by t.nu

--34. Cho biết tổng số sinh viên của từng khoa. 
select makhoa 'Mã khoa','Mã sinh viên'=count(masv)
from dmsv
group by makhoa

--35. Cho biết số lượng sinh viên học từng môn. 
select tenmh'Tên môn học',count(distinct masv)'Mã sinh viên'
from ketqua kq,dmmh mh
where kq.mamh=mh.mamh 
group by tenmh
--36. Cho biết số lượng môn học mà sinh viên đã học(tức tổng số môn học có torng bảng kq)
select count(distinct mamh)'Tổng số môn học'
from ketqua

--37. Cho biết tổng số học bổng của mỗi khoa. 
select makhoa 'Mã khoa',sum(hocbong)'Tổng học bổng'
from dmsv
group by makhoa
--38. Cho biết học bổng cao nhất của mỗi khoa. 
select makhoa 'Mã khoa',max(hocbong)'Học bổng cao nhất'
from dmsv
group by makhoa
--39. Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa. 
select makhoa,'Tổng sinh viên nam'=sum(case phai when N'nam'then 1 else 0 end),'Tổng sinh viên nữ'=sum(case phai when N'nữ'then 1 else 0 end)
from dmsv
group by makhoa
--40. Cho biết số lượng sinh viên theo từng độ tuổi. 
select year(getdate())-year(ngaysinh)'Tuổi',count(masv)'Số sinh viên'
from dmsv
group by year(getdate())-year(ngaysinh)

--41. Cho biết những năm sinh nào có 2 sinh viên đang theo học tại trường. 
select year(ngaysinh)'Năm',count(Masv)'Số sinh viên'
from dmsv
group by year(ngaysinh)
having count(Masv)=2

--42. Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trường. 
select NoiSinh,count(Masv)'Số sinh viên'
from dmsv
group by NoiSinh
having count(Masv)>=2
--43. Cho biết những môn nào có trên 3 sinh viên dự thi. 
select mamh 'Mã môn học',count(masv)'Số Sinh viên'
from ketqua
group by mamh
having count(masv)>3

--44. Cho biết những sinh viên thi lại trên 2 lần. 
select masv,mamh,count(lanthi)'so lan thi lai' 
from ketqua
group by masv,mamh
having count(lanthi)>2

--45. Cho biết những sinh viên nam có điểm trung bình lần 1 trên 7.0 
select Hosv+' '+tensv 'Họ tên sinh viên',phai,lanthi,avg(Diem)'diem trung binh'
from ketqua kq,dmsv sv
where kq.masv=sv.masv and lanthi=1 and phai=N'nam'
group by lanthi,phai, Hosv+' '+tensv 
having avg(Diem)>7.0

--46. Cho biết danh sách các sinh viên rớt trên 2 môn ở lần thi 1.
select masv 'Mã sinh viên',count(mamh)'Số môn rớt'
from ketqua
where lanthi=1 and diem<5
group by masv
having count(mamh)>=2
--47. Cho biết danh sách những khoa có nhiều hơn 2 sinh viên nam 
select makhoa 'Mã khoa','Số sinh viên nam'=count(masv)
from dmsv
where phai=N'Nam'
group by makhoa
having count(masv)>=2

--48. Cho biết những khoa có 2 sinh đạt học bổng từ 200.000 đến 300.000. 
select makhoa 'Mã khoa','Số sinh viên'=count(masv)
from dmsv
where hocbong between 200000 and 300000
group by makhoa
having count(masv)>2

--49. Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt của từng môn trong lần thi 1. 
--làm từng bảng
select tenmh,'Số sinh viên Đậu'=count(masv)
from ketqua kq,dmmh mh
where kq.mamh=mh.mamh and lanthi=1 and diem>=5
group by tenmh

select tenmh,'Số sinh viên Rớt'=count(masv)
from ketqua kq,dmmh mh
where kq.mamh=mh.mamh and lanthi=1 and diem<5
group by tenmh
--Làm gộp
select tenmh 'Tên môn học','Số sinh viên Đậu'=sum(case when diem>=5 then 1 else 0 end),'Số sinh viên Rớt'=sum(case when diem<5 then 1 else 0 end)
from ketqua kq,dmmh mh
where kq.mamh=mh.mamh and lanthi=1
group by tenmh
--50. Cho biết số lượng sinh viên nam và số lượng sinh viên nữ của từng khoa. 
--trùng lại câu 39
select makhoa,'Tổng sinh viên nam'=sum(case phai when N'nam'then 1 else 0 
end),'Tổng sinh viên nữ'=sum(case phai when N'nữ'then 1 else 0 end)
from dmsv
group by makhoa
------

--F. Truy vấn con trả về một giá trị 
--51. Cho biết sinh viên nào có học bổng cao nhất. 
select hosv+' '+tensv 'Họ tên sinh viên',hocbong
from dmsv
where hocbong=(select max(hocbong)from dmsv)
--52. Cho biết sinh viên nào có điểm thi lần 1 môn cơ sở dữ liệu cao nhất. 

select hosv+' '+tensv 'Họ tên sinh viên',tenmh 'Tên môn học',lanthi,diem
from ketqua kq,dmmh mh,dmsv sv
where sv.masv=kq.masv and kq.mamh=mh.mamh and lanthi=1 and tenmh=N'cơ sở dữ liệu'
and diem=
(
select max(diem)
from ketqua kq,dmmh mh 
where kq.mamh=mh.mamh and tenmh=N'cơ sở dữ liệu'and lanthi=1
)
--53. Cho biết sinh viên khoa anh văn có tuổi lớn nhất. 
select hosv+' '+tensv 'Họ tên sinh viên',ngaysinh 'Ngày sinh',makhoa 'Mã khoa'
from dmsv
where/*makhoa='av' and*/ ngaysinh=(
select min(ngaysinh)
from dmsv
where makhoa='av'

)

--or
select hosv+' '+tensv 'Họ tên sinh viên',ngaysinh 'Ngày sinh',makhoa 'Mã khoa'
from dmsv
where(getdate()-ngaysinh)=
(
select max(getdate()-ngaysinh)
from dmsv
where makhoa='av'

)
--54. Cho biết khoa nào có đông sinh viên nhất. 
--cach 1:
select tenkhoa
from dmsv sv,dmkhoa kh
where sv.makhoa=kh.makhoa
group by tenkhoa
having count(tenkhoa)>= all(select count(masv)
from dmsv 
group by makhoa)
--cach 2:
select tenkhoa
from dmsv sv,dmkhoa kh
where sv.makhoa=kh.makhoa
group by tenkhoa
having count(tenkhoa)=(select max(t.tong)
from
(
select count(masv)as tong
from dmsv 
group by makhoa
)as t
)

--55. Cho biết khoa nào có đông nữ nhất. 
select tenkhoa 'Tên khoa'
from dmsv sv,dmkhoa kh
where sv.makhoa=kh.makhoa and phai=N'nữ'
group by tenkhoa 
having count(tenkhoa)>=all(select count(masv)
from dmsv
where phai=N'nữ'
group by makhoa)
--56. Cho biết môn nào có nhiều sinh viên rớt lần 1 nhiều nhất. 

select mamh
from ketqua 
where lanthi=1 and diem<5
group by mamh
having count(diem)>=all(select count(diem)
from ketqua
where lanthi=1 and diem<5
group by mamh)
--57. Cho biết sinh viên không học khoa anh văn có điểm thi môn phạm lớn hơn điểm thi văn 
--phạm của sinh viên học khoa anh văn. 
select distinct kq.masv
from ketqua kq, dmsv sv
where sv.masv=kq.masv and mamh='05'and makhoa not like'av'and diem>(
select diem
from ketqua kq, dmsv sv
where sv.masv=kq.masv and mamh='05'and makhoa='av'
)
--G. Truy vấn con trả về nhiều giá trị, sử dụng lượng từ all, any, union, top. 
--58. Cho biết sinh viên có nơi sinh cùng với Hải. 
select masv,hosv+' '+tensv
from dmsv
where noisinh=(select noisinh
from dmsv
where tensv=N'hải')
--59. Cho biết những sinh viên nào có học bổng lớn hơn tất cả học bổng của 
--sinh viên thuộc khoa anh văn 
select masv
from dmsv
where hocbong>=all(select hocbong from dmsv where makhoa='av')
--60. Cho biết những sinh viên có học bổng lớn hơn bất kỳ học bổng của sinh viên học khóa anh văn 
select masv,hocbong
from dmsv
where hocbong>=any(select hocbong from dmsv where makhoa='av')
--61. Cho biết sinh viên nào có điểm thi môn cơ sở dữ liệu lần 2 lớn hơn tất cả điểm thi lần 1 
--môn cơ sở dữ liệu của những sinh viên khác. 
select masv
from ketqua
where mamh='01'and lanthi=2 and diem>=all(select diem from ketqua where mamh='01'and lanthi=1)
--62. Cho biết những sinh viên đạt điểm cao nhất trong từng môn. 
select masv,ketqua.mamh,diem
from ketqua,(select mamh, max(diem)as maxdiem
from ketqua
group by mamh)a
where ketqua.mamh=a.mamh and diem=a.maxdiem
--63. Cho biết những khoa không có sinh viên học. 
select*
from dmkhoa
where not exists(select distinct makhoa
from ketqua,dmsv where ketqua.masv=dmsv.masv and makhoa=dmkhoa.makhoa)
--64. Cho biết sinh viên chưa thi môn cơ sở dữ liệu. 
select*
from dmsv
where not exists
(select distinct*
from ketqua
where mamh ='01'and masv=dmsv.masv)
--65. Cho biết sinh viên nào không thi lần 1 mà có dự thi lần 2. 
select masv
from ketqua kq
where lanthi=2 and not exists
(select*
from ketqua
where lanthi=1 and masv=kq.masv)
--66. Cho biết môn nào không có sinh viên khoa anh văn học. 
select tenmh
from dmmh
where not exists
(select mamh
from ketqua kq,dmsv sv 
where sv.masv=kq.masv and sv.makhoa='av'and dmmh.mamh=mamh)

--67. Cho biết những sinh viên khoa anh văn chưa học môn văn phạm. 
Select MaSV
From DMSv dmsv

Where MaKhoa='AV'And Not Exists(Select* From KetQua
Where MaMH='05'And MaSV=dmsv.MaSV
)


--68. Cho biết những sinh viên không rớt môn nào. 
Select MaSV
From DMSV dmsv
Where Not Exists(Select*
From KetQua
Where Diem<=5 And MaSV=dmsv.MaSV
)



--69. Cho biết những sinh viên học khoa anh văn có học bổng và những sinh viên chưa bao 
--giờ rớt.
Select MaSV,MaKhoa,HocBong
From DMSv dmsv
Where MaKhoa='AV'And HocBong>0 And Not Exists(Select* From KetQua
Where Diem<5 And MaSV=dmsv.MaSV
)


--70. Cho biết khoa nào có đông sinh viên nhận học bổng nhất và khoa nào khoa nào có ít 
--sinh viên nhận học bổng nhất. 
Select MaKhoa,count(MaSV)'So Luong SV'
From DMSV
Where HocBong>0
Group By MaKhoa
Having count(MaSV)>=All(Select count(MaSV)
From DMSv
where hocbong>0
Group By MaKhoa
)
UNION
Select MaKhoa,count(MaSV)'So Luong SV'
From DMSV
Where HocBong>0
Group By MaKhoa
Having count(MaSV)<=All(Select count(MaSV)
From DMSV
where hocbong>0
Group By MaKhoa
)


--71. Cho biết 3 sinh viên có học nhiều môn nhất. 

Select top 3 MaSV,Count(Distinct MaMH)'Số môn học'
From KetQua
Group By MaSV
Having Count(Distinct MaMH)>=All(Select count(distinct MaMH)
From KetQua
Group By MaSV
)


/*==========================H. Truy vấn dùng phép chia =========================*/
--72. Cho biết những môn được tất cả các sinh viên theo học. 
Select MaMH
From KetQua
Group By MaMH
Having count(distinct MaSV)=(Select count(MaSV)
From DMSv
)


--73. Cho biết những sinh viên học những môn giống sinh viên có mã số A02 học. 
Select distinct MaSV
From KetQua kq
Where Exists(Select distinct MaMH
From KetQua
Where MaSV='A02'and MaMH=kq.MaMH
)


--74.Cho biết những sinh viên học những môn bằng đúng những môn mà sinh viên A02 học.
Select TenSV
From KetQua kq,DMSv dmsv,(Select MaSV,MaMH,count(distinct MaMH)SoMon
From KetQua
Where MaSV='A02'
Group By MaSV,MaMH)a
Where kq.MaSV=dmsv.MaSV and kq.MaMH=a.MaMH and kq.MaSV <>a .MaSV
Group By TenSV
Having count(distinct kq.MaMH)=(Select count(distinct MaMH)
From KetQua
Where MaSV='A02')
--or

Select dmsv.MaSV
From KetQua kq, DMSv dmsv
Where kq.MaSV=dmsv.MaSV and MaMH=(Select distinct MaMH
From KetQua
Where MaSV='A02'and MaMH=kq.MaMH)and dmsv.MaSV Not Like'A02'
Group By dmsv.MaSV
Having count(distinct MaMH)=(Select count(distinct MaMH)
From KetQua
Where MaSV='A02')

--75. Tạo một bảng mới tên sinhvien-ketqua: gồm: MASV, HoSV, TenSV, SoMonHoc. Sau 
--đó Thêm dữ liệu vào bảng này dựa vào dữ liệu đã có. 
Create Table SinhVien_KetQua
(
MaSV char(3)not null,
HoSV nvarchar(15)not null,
TenSV nvarchar(7)not null,
SoMonHoc tinyint
)

Insert Into SinhVien_KetQua
Select dmsv.MaSV,HoSV,TenSV,count(distinct MaMH)
From DMSV dmsv,KetQua kq
Where dmsv.MaSV=kq.MaSV
Group By dmsv.MaSV,HoSV,TenSV


--76. Thêm vào bảng khoa cột Siso, cập nhật sỉ số vào khoa từ dữ liệu sinh viên. 
go
alter table dmkhoa
add siso tinyint
go

update dmkhoa
set siso =(select count(masv)
from dmsv
where makhoa='av'
group by(makhoa))
where makhoa='av'

update dmkhoa
set siso=(select count(masv)
from dmsv
where makhoa='TH'
group by(makhoa))
where makhoa='Th'


update dmkhoa
set siso=(select count(masv)
from dmsv
where makhoa='Tr'
group by(makhoa))
where makhoa='Tr'

update dmkhoa
set siso=(select count(masv)
from dmsv
where makhoa='vl'
group by(makhoa))
where makhoa='vl'

--77. Tăng thêm 1 điểm cho các sinh viên vớt lần 2. Nhưng chỉ tăng tối đa là 5 điểm 
update ketqua
set diem=diem+1
where lanthi=2 and diem+1<=5

select*from ketqua
--78. Tăng học bổng lên 100000 cho những sinh viên có điểm trung bình là 6.5 trở lên 
update dmsv
set hocbong=hocbong+100000
where masv in(select masv 
from ketqua 
group by masv 
having avg(diem)>=6.5)
--79. Thiết lập học bổng bằng 0 cho những sinh viên thi hai môn rốt ở lần 1 
update dmsv
set hocbong=0
where masv in(select masv
from ketqua
where lanthi=1 and diem<5
group by masv
having count(mamh)=2
)

--80. Xoá tất cả những sinh viên chưa dự thi môn nào. 
delete from dmsv
where not exists(select masv
from ketqua
where masv=dmsv.masv
)
--81. Xóa những môn mà không có sinh viên học. 
delete from dmmh
where not exists(select mamh 
from ketqua
where mamh=dmmh.mamh
)
-- Tạo view 
--82. Danh sách sinh viên không bi rớt môn nào 
create view cau82
as
select dmsv.masv,hosv,tensv,phai,ngaysinh,noisinh,hocbong
from dmsv,ketqua
where dmsv.masv=ketqua.masv 
group by dmsv.masv,hosv,tensv,phai,ngaysinh,noisinh,hocbong
having min(diem)>=5


--83. Danh sách sinh viên học môn văn phạm và môn cơ sở dữ liệu 
create view cau83
as
select*from dmsv
where masv in
(select distinct ketqua.masv
from ketqua,dmsv
where dmsv.masv=ketqua.masv and(mamh='01'or mamh='05')
)
drop view cau83

--84. Trong mỗi sinh viên cho biết môn có điểm thi lớn nhất. Thông tin gồm: mã sinh viên, 
--tên sinh viên, tên môn, điểm. 



create view cau84
as
select distinct dmsv.masv,tensv,tenmh,max(diem)diem
from dmsv,ketqua,dmmh
where dmsv.masv=ketqua.masv and dmmh.mamh=ketqua.mamh 
group by dmsv.masv,tensv,tenmh
select*from cau84
--85. Danh sách sinh viên: Không rớt lần 1 hoặc ,Không học môn văn phạm 
create view cau85
as
select*from dmsv
where masv in
(select masv
from ketqua
where(lanthi=1 and diem <5)or not exists
(Select* From KetQua
Where MaMH='05'And MaSV=ketqua.MaSV
))

--86. Danh sách những sinh viên khoa có 2 sinh viên nữ trở lên
create view cau86
as
select*from dmsv
where makhoa=
(select sv.makhoa
from dmsv sv,dmkhoa kh
where sv.makhoa=kh.makhoa and phai=N'nữ'
group by sv.makhoa
having count(tenkhoa)>=all(select count(masv)
from dmsv
where phai=N'nữ'
group by makhoa))



/*===============HẾT================*/