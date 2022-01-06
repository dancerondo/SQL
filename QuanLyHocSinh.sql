CREATE DATABASE QuanLyHocSinhDB
USE QuanLyHocSinhDB
GO 

CREATE TABLE LOP(
MaLop char(4) NOT NULL PRIMARY KEY,
TenLop varchar(50) NOT NULL,
NamHoc int
)
INSERT INTO LOP VALUES('L001','SQL','2021')
INSERT INTO LOP VALUES('L002','HTML','2021')


CREATE TABLE DANHSACHHOCSINH(
MaLop char(4) FOREIGN KEY REFERENCES LOP(MaLop), 
MaHS nchar(4) NOT NULL PRIMARY KEY,
HoTenHS nchar(50),
NgaySinh datetime,
NoiSinh nvarchar(50),
DiaChi nvarchar(50),
GioiTinh nchar(3),
HoTenBo nchar(50),
NgheNghiepBo nvarchar(50),
HoTenMe nchar(50),
NamHoc nchar(4),
TenKhoi nchar(2),
)
INSERT INTO DANHSACHHOCSINH VALUES ('L001','001',N'Nguyễn Văn A','2000-01-01','Da Nang',N'01 Yên Bái Đà Nẵng','Nam',N'Nguyễn Văn AA',N'Kỹ Sư',N'Nguyễn Thị AAA','2021','LT')
INSERT INTO DANHSACHHOCSINH VALUES ('L001','002',N'Nguyễn Văn B','2000-01-02','Quang Nam',N'01 Trần Phú Đà Nẵng','Nam',N'Nguyễn Văn BB',N'Giáo Viên',N'Nguyễn Thị BBB','2021','LT')
INSERT INTO DANHSACHHOCSINH VALUES ('L001','003',N'Nguyễn Thị C','2000-01-03','Hue',N'01 Nguyễn Thị Minh Khai',N'Nữ',N'Nguyễn Văn CC',N'Giáo Sư',N'Nguyễn Thị CCC','2021','LT')
INSERT INTO DANHSACHHOCSINH VALUES ('L002','004',N'Nguyễn Văn D','2001-01-01','Ha Noi',N'01 Nguyễn Tri Phương Đà Nẵng','Nam',N'Nguyễn Văn DD',N'Kỹ Sư',N'Nguyễn Thị DDD','2021','LT')
INSERT INTO DANHSACHHOCSINH VALUES ('L002','005',N'Nguyễn Văn E','2001-01-02','Nghe An',N'01 Huỳnh Ngọc Huệ Đà Nẵng','Nam',N'Nguyễn Văn EE',N'Giáo Viên',N'Nguyễn Thị EEE','2021','LT')
INSERT INTO DANHSACHHOCSINH VALUES ('L002','006',N'Nguyễn Thị F','2001-01-03','Thanh Hoa',N'01 Hà Huy Tập',N'Nữ',N'Nguyễn Văn FF',N'Giáo Sư',N'Nguyễn Thị FFF','2021','LT')
DELETE FROM DANHSACHHOCSINH WHERE MaHS = '002'
SELECT * FROM DANHSACHHOCSINH
DELETE FROM DANHSACHHOCSINH 

CREATE TABLE MONHOC (
MaMH nchar(4) NOT NULL PRIMARY KEY,
TenMH nvarchar(50) NOT NULL,
HeSoMH int,
)
SELECT * FROM MONHOC
INSERT INTO MONHOC VALUES('001','SQL',2)
INSERT INTO MONHOC VALUES('002','HTML',1)
INSERT INTO MONHOC VALUES('003','JAVA',2)
INSERT INTO MONHOC VALUES('004','PHP',1)
SELECT * FROM MONHOC
DELETE  FROM MONHOC

CREATE TABLE DIEM (
MaHS nchar(4) NOT NULL FOREIGN KEY REFERENCES DANHSACHHOCSINH(MaHs),
MaMH nchar(4) NOT NULL FOREIGN KEY REFERENCES MonHoc(MaMH),
DiemHS1 float,
DiemThi float,
TBKT float,
TBHK float,
HocKy int,
PRIMARY KEY(MaHS,MaMH,HocKy),
)
INSERT INTO DIEM VALUES ('001','001',10,8,7,8.5,1)
INSERT INTO DIEM VALUES ('001','002',9,6,8,9.5,2)
SELECT * FROM DIEM

CREATE TABLE PHANLOAI(
MaHS nchar(4) NOT NULL FOREIGN KEY REFERENCES DANHSACHHOCSINH(MaHs), 
HocLuc nchar(4),
HanhKiem nchar(4),
HocKy int,
PRIMARY KEY(MaHS,HocKy),
)

INSERT INTO PHANLOAI VALUES('001','KHA','TOT',1)
INSERT INTO PHANLOAI VALUES('002','TB','KHA',2)
INSERT INTO PHANLOAI VALUES('003','GIOI','TOT',1)
SELECT * FROM PHANLOAI

CREATE TABLE DANHSACHTHILAI(
NamHoc int NOT NULL,
MaHS nchar(4) NOT NULL FOREIGN KEY REFERENCES DANHSACHHOCSINH(MaHS),
TenMonThiLai nchar(50) NOT NULL,
DiemTL nchar(2)
PRIMARY KEY(NamHoc,MaHS,TenMonThiLai),
)

INSERT INTO DANHSACHTHILAI VALUES (2021,'002','JAVA','6')
--1.Hiển thị danh sách học sinh có địa chỉ tại Đà Nẵng.
SELECT * FROM DANHSACHHOCSINH WHERE DiaChi LIKE N'%Đà Nẵng%'

--2.Thêm một học sinh mới vào bảng DS_HOCSINH.
INSERT INTO DANHSACHHOCSINH VALUES ('L001','007',N'Nguyễn Văn G','2000-01-07','Da Nang',N'01 Núi Thành Đà Nẵng','Nam',N'Nguyễn Văn GG',N'Kỹ Sư',N'Nguyễn Thị GGG','2021','LT')
INSERT INTO DANHSACHHOCSINH VALUES ('L001','008',N'Nguyễn Văn H','2000-01-08','Da Nang',N'01 Phan Thanh Đà Nẵng','Nam',N'Nguyễn Văn HH',N'Kỹ Sư',N'Nguyễn Thị HHH','2010','LT')
INSERT INTO DANHSACHHOCSINH VALUES ('L001','009',N'Nguyễn Văn I','2000-01-08','Da Nang',N'01 Nguyễn Văn Linh Đà Nẵng','Nam',N'Nguyễn Văn II',N'Kỹ Sư',N'Nguyễn Thị III','2010','LT')

--3.Xóa những học sinh thuộc năm học 2010.
DELETE FROM DANHSACHHOCSINH WHERE NamHoc = 2010

--4.Liệt kê thông tin của những học sinh có địa chỉ tại Đà Nẵng và giới tính là nam.
SELECT * FROM DANHSACHHOCSINH WHERE DiaChi LIKE N'%Đà Nẵng%' AND GioiTinh = 'Nam'

--5.Hiển thị mã học sinh và điểm trung bình học kỳ của học sinh.
SELECT TBHK FROM DANHSACHHOCSINH JOIN DIEM ON DANHSACHHOCSINH.MaHS = DIEM.MaHS


--6.Hiển thị danh sách học sinh đang học môn học có tên ‘SQL’.
SELECT HoTenHS FROM DANHSACHHOCSINH LEFT JOIN DIEM ON DANHSACHHOCSINH.MaHS = DIEM.MaHS
LEFT JOIN MONHOC ON DIEM.MaMH = MONHOC.MaMH WHERE TenMH ='HTML'

SELECT * FROM DANHSACHHOCSINH JOIN DIEM ON 'MaLop.DANHSACHHOCSINH' = 'MaLop.DIEM' 
--7.Hiển thị tên của những học sinh có điểm trung bình học kỳ nhỏ hơn 5 và lớn hơn 8.
SELECT * FROM DANHSACHHOCSINH JOIN DIEM ON DANHSACHHOCSINH.MaHS = DIEM.MaHS WHERE TBHK > 5 OR TBHK < 8

--8.Hiển thị học lực, hạnh kiểm của những học sinh thuộc học kỳ 1.
SELECT HoTenHS,HocLuc,HanhKiem FROM DANHSACHHOCSINH JOIN PHANLOAI ON DANHSACHHOCSINH.MaHS = PHANLOAI.MaHS WHERE HocKy = 1 

--9.Hiển thị tên của những học sinh cùng với tên môn thi lại và điểm thi lại của môn đó.
SELECT HoTenHS,TenMonThiLai,DiemTL FROM DANHSACHHOCSINH JOIN DANHSACHTHILAI ON DANHSACHHOCSINH.MaHS = DANHSACHTHILAI.MaHS

--10.Hiển thị tên học sinh, tên môn học và điểm thi của những học sinh đó.
SELECT HoTenHS,TenMH,DiemThi FROM DANHSACHHOCSINH JOIN DIEM ON DANHSACHHOCSINH.MaHS = DIEM.MaHS JOIN MONHOC ON DIEM.MaMH = MONHOC.MaMH

