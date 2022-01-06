--1.Kiểm tra xem database có tên QuanlynhanvienDB đã tồn tại chưa, nếu có thì xóa.
	DROP DATABASE IF EXISTS QLNV_DB
--2.Tạo mới database: Quanlynhanvien và database QLNV
	CREATE DATABASE QuanLyNhanVien
	CREATE DATABASE QLNV
--3.Đổi tên database Quanlynhanvien thành tên QuanlynhanvienDB
	ALTER DATABASE QuanLyNhanVien MODIFY NAME = QuanLyNhanVienDB
--4.Xóa database QLNV
	DROP DATABASE QLNV
--5.Sử dụng database QuanlynhanvienDB
	USE QuanLyNhanVienDB
--6.Tạo TABLE	
--a)NHANVIEN(honv,tenlot, tennv,manv,ngaysinh,diachi,phai,luong, maquanly,tenphong)
	CREATE TABLE NHANVIEN(
	honv nchar(50),
	tenlot nchar(50),
	manv nchar(4) NOT NULL PRIMARY KEY,
	ngaysinh datetime,
	diachi nvarchar(50),
	gioitinh nchar(4),
	luong int,

	maquanly nchar(4),
	maphong nchar(4) FOREIGN KEY REFERENCES PHONGBAN(maphong) 
	)
	
	INSERT INTO NHANVIEN VALUES(N'Trần','Thanh','001',2000-01-01,N'01 Nguyễn Chí Thanh','Nam','5000','M001','P001')
	UPDATE NHANVIEN SET  honv = N'Trần',tenlot = 'Thanh',manv = '001',ngaysinh = 2000-01-01,diachi = N'01 Nguyễn Chí Thanh',gioitinh = 'Nam',luong = '5000',maquanly = 'M001',tenphong = N'Phòng CNTT'
	INSERT INTO NHANVIEN VALUES()
	SELECT * FROM NHANVIEN

--b)PHONGBAN(tenphong, maphong,truongphong,ngaynhanchuc)
	CREATE TABLE PHONGBAN(
	tenphong nvarchar(50),
	maphong nchar(4) NOT NULL PRIMARY KEY,
	truongphong nchar(50),
	ngaynhanchuc datetime
	)
	INSERT INTO PHONGBAN VALUES(N'Phòng CNTT','P001',N'Đặng Bá Lư','2000-01-01')
	SELECT * FROM PHONGBAN
--c)DIADIEM_PHONG(maphong,diadiem)
	CREATE TABLE DIADIEM_PHONG(
	maphong nchar(4) FOREIGN KEY REFERENCES PHONGBAN(maphong),
	diadiem nvarchar(50),
	PRIMARY KEY(maphong,diadiem)
	)
	INSERT INTO DIADIEM_PHONG VALUES('P001',N'01 Nguyễn Văn Linh Đà Nẵng')
	SELECT * FROM DIADIEM_PHONG
--d)THANNHAN(manv, tentn,phai,ngaysinh,quanhe)
	CREATE TABLE THANNHAN(
	manv nchar(4) FOREIGN KEY REFERENCES NHANVIEN(manv),
	tentn nvarchar(50),
	gioitinh nchar(4),
	ngaysinh datetime,
	quanhe nvarchar(50)
	PRIMARY KEY(manv,tentn)
	)
	INSERT INTO THANNHAN VALUES ('001',N'Trần Thanh Bee','Nam',1990-01-01,'Em')
	SELECT * FROM THANNHAN
--e)DEAN(tenda,mada,diadiemda,phong)
	CREATE TABLE DEAN(
	tenda nvarchar(50),
	mada nchar(4) NOT NULL PRIMARY KEY,
	diadiemda nvarchar(50),
	phong nvarchar(50) 
	)
	INSERT INTO DEAN VALUES (N'website bán hàng','DA01',N'02 Quang Trung Đà Nẵng',N'Phòng CNTT')
--f)PHANCONG(manv,soda,sogio)
	CREATE TABLE PHANCONG(
	manv nchar(4) FOREIGN KEY REFERENCES NHANVIEN(manv),
	soda nchar(4) FOREIGN KEY REFERENCES DEAN(mada),
	sogio int
	PRIMARY KEY(manv,soda)
	)

	INSERT INTO PHANCONG VALUES ('001','DA01',20)
	SELECT * FROM PHANCONG
	USE MASTER
	DROP DATABASE QuanLyNhanVienDB
--7.Thực hiện các truy vấn:
--a)Cho biết tên những nhân viên phòng số 5 và có tham gia đề án “Sản phẩm X” với số giờ làm việc trên 10h

SELECT nv.HoNV + ' ' + nv.TenNV 'Nhan Vien', nv.MaPhong 'Phong Ban', da.TenDA 'De An', pc.ThoiGian 'So Gio'
FROM NhanVien nv 
INNER JOIN PhanCong pc ON pc.MaNV = nv.MaNV
INNER JOIN DeAn da ON da.MaDA = pc.MaDA
WHERE nv.MaPhong = 5 AND da.TenDA = N'Sản phẩm X' AND pc.ThoiGian > 10

b)Cho biết danh sách những trưởng phòng có tối thiểu một thân nhân.
c)Cho biết danh sách những nhân viên không làm việc cho bất kỳ đề án nào.
d)Cho biết danh sách những nhân viên có trên 2 thân nhân.
e)Cho biết danh sách những nhân viên được Nguyễn Thanh Tùng phụ trách trực tiếp.
f)Tăng mức lương thêm 10% cho những nhân viên có thân nhân.
g)Tăng mức lương thêm 20% cho những nhân viên là trưởng phòng đồng thời có thân nhân.
h)Tăng mức lương thêm 30% cho những nhân viên là trưởng phòng và có tuổi trên 50.
i)Với mỗi phòng ban liệt kê tên phòng ban và lương trung bình của những nhân viên làm việc trong phòng ban đó.
j)Với những phòng ban có mức lương trung bình trên 30000. Liệt kê phòng ban và số lượng nhân viên phòng ban đó.
k)Cho biết 3 nhân viên lớn tuổi nhất công ty.
Khai báo một biến số nguyên @phong nhận giá trị là 5, một biến @da có kiểu nvarchar nhận giá trị là ‘Sản phẩm X’,
một biến tham số @thoigian nhận giá trị là 10. Hiển thị những nhân viên phòng số @phong,
có tham gia đề án @da với số giờ làm việc trên @thoigian giờ trên 1 tuần.
