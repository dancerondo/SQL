SELECT * FROM PHANCONG
select * from NHANVIEN
select * from DEAN
select * from PHONGBAN
select * from DIADIEM_PHG
select * from THANNHAN

select TenNV,Phai from NHANVIEN
group by Phai, TenNV
--a) Cho biết tên những nhân viên phòng số 5 và có tham gia 
--   đề án “Sản phẩm X” với số giờ làm việc trên 10h.

select NHANVIEN.MaNV, TenNV
from NHANVIEN join PHANCONG on NHANVIEN.MaNV = PHANCONG.MaNV
join DEAN on PHANCONG.MaDA = DEAN.MaDA
where NHANVIEN.MaPhong = '5' and TenDA = N'Sản phẩm X' and ThoiGian > '10'

--b) Cho biết danh sách những trưởng phòng có tối thiểu một thân nhân.
select distinct TenNV
from PHONGBAN join NHANVIEN on PHONGBAN.TruongPhong = NHANVIEN.MaNV
join THANNHAN on NHANVIEN.MaNV = THANNHAN.MaNV

--c) Cho biết danh sách những nhân viên không làm việc cho bất kỳ đề án nào.
	select TenNV from NHANVIEN	where MaNV not in (select MaNV from PHANCONG)
--d) Cho biết danh sách những nhân viên có trên 2 thân nhân.

select TenNV, count(*) as 'So luong nguoi than'
from NHANVIEN join THANNHAN on NHANVIEN.MaNV = THANNHAN.MaNV
group by TenNV
having count(*) > 2
-- i) Với mỗi phòng ban liệt kê tên phòng ban và lương trung bình 
--    của những nhân viên làm việc trong phòng ban đó.

select TenPhong, avg(Luong) as 'Lương TB của phòng'
from NHANVIEN join PHONGBAN on NHANVIEN.MaPhong = PHONGBAN.MaPhong 
group by TenPhong

-- h) Tăng mức lương thêm 30% cho những nhân viên là trưởng phòng và có tuổi trên 50.
update NHANVIEN
set Luong = Luong*1.3
where MaNV in (select TruongPhong from PHONGBAN) 
and year(getdate())- year(NgaySinh) > 50
-- test kq
select TenNV, year(getdate())- year(NgaySinh) as SoTuoi,Luong
from NHANVIEN join PHONGBAN on NHANVIEN.MaNV = PHONGBAN.TruongPhong

-- hiển thị tên của nhân viên có lương cao nhất công ty
-- Cách 1:
   select top 1 TenNV, Luong from NHANVIEN
   order by Luong desc
-- Cách 2:
	select TenNV, Luong
	from NHANVIEN
	where Luong in (select max(Luong) from NHANVIEN)
	-- 3 nhân viên có tuổi cao nhất 
	select top 3 TenNV, NgaySinh from NHANVIEN
	order by NgaySinh

-- left join 
	select THANNHAN.MaNV, TenNV, TenTN
	from NHANVIEN left join THANNHAN on NHANVIEN.MaNV = THANNHAN.MaNV


-- Hiển thị những nhân viên được quản lý bởi ông Nguyễn Thanh Tùng
select B.TenNV,B.MaNql from NHANVIEN A join NHANVIEN B on A.MaNV = B.MaNql
where A.HoNV = N'Nguyễn' and A.TenLot = N'Thanh' and A.TenNV = N'Tùng'
