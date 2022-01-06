create database QL_hocsinh
use QL_hocsinh
create table hocsinh
(
	mahs char(6) primary key not null,
	hoten nvarchar(120) null,
	ngaysinh datetime not null,
	dienthoai int null
	)

create table monhoc
(
	tenmonhoc nvarchar(120) primary key not null,
	sosession int not null,
	diemdat float not null,
	diemtoida float not null
	)
SELECT * FROM MONHOC
create table bangthi
(
	mahs char(6) foreign key references hocsinh(mahs) not null,
	monhoc nvarchar(120) foreign key references monhoc(tenmonhoc) not null,
	diemthi float null,
	ngaythi datetime null,
	lanthi int null,
	primary key(mahs,monhoc)
	)
insert into hocsinh(mahs,hoten,ngaysinh,dienthoai)
values('M001',N'Nguyễn Quốc Oai','07-29-1995','117654'),
	  ('M002',N'Trần Thanh','04-12-1996','548932'),
	  ('M003',N'Phạm Văn Dương','09-21-1990','347690')
	  
SELECT * FROM MONHOC
insert into monhoc(tenmonhoc,sosession,diemdat,diemtoida)
values(N'Toán','20','4.5','10.0'),
	  (N'Văn','40','5.0','9.0'),
	  (N'Ngoại ngữ','60','4.5','10.0')
	  SELECT * FROM monhoc
insert into bangthi(mahs,monhoc,diemthi,ngaythi,lanthi)
values('M001',N'Toán','4','9/24/2007','1'),
	  ('M001',N'Ngoại ngữ','8','9/29/2007','1'),
	  ('M002',N'Văn','6.5','9/25/2007','1'),
	  ('M003',N'Toán','9.5','9/24/2007','1'),
	  ('M001',N'Văn','8','9/25/2007','2'),
	  ('M003',N'Ngoại ngữ','7.5','9/29/2007','1'),
	  ('M002',N'Toán','8.5','9/24/2007','1'),
	  ('M002',N'Ngoại ngữ','10','9/29/2007','2'),
	  ('M003',N'Văn','3.5','12/05/2008','2')

--SU DUNG PROCEDURE DE THAO TAC DU LIEU
--1. Tạo một thủ tục lưu trữ có tên sp1, dùng để cập nhật số session của tất cả các môn học tăng lên  4 tiết.
--a) tạo procedure cập nhật số session tăng lên 4 tiết cho từng môn.
CREATE PROC SP1 (@TenMH nvarchar(120))
AS 
UPDATE MONHOC
SET sosession = sosession + 4
WHERE tenmonhoc = @TenMH
DROP PROC SP1
EXEC SP1 N'Toán'
SELECT * FROM MONHOC
EXEC SP1 N'Ngoại Ngữ'

--b) Tạo procedure cập nhật số session tăng lên tất cả các môn 4 tiết.
CREATE PROC SP2
AS
UPDATE MONHOC
SET sosession = sosession+4
EXEC SP2
SELECT * FROM MONHOC

--2. Tạo một thủ tục lưu trữ có tên sp3, dùng để cập nhật số sesion của một môn học (tên môn học được truyền vào như 1 tham số) và tăng với số lượng được truyền vào.
CREATE PROC SP3(@TenMH nvarchar(120),@sosession int)
AS
UPDATE MONHOC
SET sosession = sosession + @sosession
WHERE tenmonhoc = @TenMH
EXEC SP3 N'Toán', 10
SELECT * FROM MONHOC


--3. Tạo một thủ tục lưu trữ có tên sp4, dùng để xuất ra tên của học viên có điểm thi cao nhất trong ngày thi ‘24/9/2007’.
CREATE PROC SP4
AS
SELECT TOP 1 HOCSINH.hoten
FROM HOCSINH JOIN BANGTHI ON HOCSINH.MaHS = BANGTHI.MaHS
WHERE BANGTHI.NgayThi = 2007-09-24
ORDER BY BANGTHI.diemthi DESC
EXEC SP4
SELECT * FROM BANGTHI

--4. Tạo một thủ tục lưu trữ có tên sp5, dùng để xuất ra tên của học viên có điểm thi cao nhất trong môn học mà tên môn học được truyền vào như 1 tham số.
CREATE PROC SP5(@TenMH nvarchar(120))
AS
SELECT HOCSINH.hoten
FROM HOCSINH JOIN BANGTHI ON HOCSINH.mahs = BANGTHI.mahs JOIN MONHOC ON BANGTHI.monhoc = MONHOC.tenmonhoc
WHERE BANGTHI.diemthi IN (SELECT TOP 1 BANGTHI.diemthi FROM BANGTHI WHERE BANGTHI.monhoc = @TenMH ORDER BY diemthi DESC)
EXEC SP5 N'Toán'

--5. Tạo một thủ tục lưu trữ có tên sp6, dùng để đếm xem có bao nhiêu học sinh thi rớt môn “Toán”.
CREATE PROC SP6
AS
SELECT COUNT(*) 'Sohocsinh thi rot mon toan',BANGTHI.monhoc
FROM BANGTHI JOIN MONHOC ON BANGTHI.monhoc = MONHOC.Tenmonhoc
WHERE BANGTHI.monhoc = N'Toán' AND BANGTHI.diemthi < MONHOC.diemdat
GROUP BY BANGTHI.monhoc
EXEC SP6

--6. Tạo một thủ tục lưu trữ có tên sp7, dùng để đếm xem có bao nhiêu học sinh thi đậu môn học, mà tên môn học được truyền vào như 1 tham số.
CREATE PROC SP7(@TenMH nvarchar(120))
AS
SELECT COUNT(*),MONHOC.tenmonhoc
FROM BANGTHI JOIN MONHOC ON BANGTHI.monhoc = MONHOC.tenmonhoc
WHERE BANGTHI.monhoc = @TenMH AND BANGTHI.diemthi >= MONHOC.diemdat
GROUP BY MONHOC.tenmonhoc
EXEC SP7 N'Ngoại ngữ'

--7. Tạo một thủ tục lưu trữ có tên sp8,  dùng để tìm kiếm thông tin của các học sinh, với họ tên của học sinh bắt đầu bằng kí tự ‘T’.
CREATE PROC SP8
AS
SELECT * 
FROM HOCSINH
WHERE hoten LIKE N'T%'

--8. Tạo một thủ tục lưu trữ có tên sp9, dùng để xóa các bản ghi trong bangthi có ngày thi ‘12/5/2008’
CREATE PROC SP9
AS
DELETE FROM BANGTHI 
WHERE ngaythi = 2008-05-12
EXEC SP9
