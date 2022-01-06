
--Tạo các bảng cho csdl quản lý nhân viên
CREATE DATABASE QUANLYNHANVIEN_DB_SS8
USE QUANLYNHANVIEN_DB_SS8
GO
CREATE TABLE NHANVIEN(
Honv nvarchar(50),
Tenlot nvarchar(50),
TenNV nvarchar(50),
Manv nchar(10) ,
Ngsinh date,
Dchi nvarchar(50),
Phai nchar(10),
Luong int,
Ma_nql nchar(10),
Phg nchar(10)
CONSTRAINT NHANVIEN_PK_	PRIMARY KEY (MaNV),
CONSTRAINT NHANVIEN_FK_NHANVIEN_ FOREIGN KEY (Ma_nql) REFERENCES NHANVIEN (Manv),
CONSTRAINT NHANVIEN_DM_Phai_ CHECK (Phai IN ('NAM', 'nam', 'NỮ', 'nữ'))
)

--TTao bang phong ban
CREATE TABLE PHONGBAN(
Tenphg nvarchar(50), 
Maphg nchar(10) , 
Trphg nchar(10),
Ngaynhanchuc date
CONSTRAINT PHONGBAN_PK PRIMARY KEY(Maphg),
CONSTRAINT PHONGBAN_FK_NHANVIEN FOREIGN KEY (Trphg) REFERENCES NHANVIEN(MaNV)
)
ALTER TABLE NHANVIEN
ADD CONSTRAINT NHANVIEN_FK_PHONGBAN FOREIGN KEY (Phg) REFERENCES PHONGBAN(Maphg)
--Tao bang dia diem phong

CREATE TABLE DIADIEM(
Maphg nchar(10), 
Diadiem nvarchar(50)
CONSTRAINT DIADIEM_FK_PHONGBAN FOREIGN KEY (MaPhg) REFERENCES PHONGBAN(MaPhg),
CONSTRAINT DIADIEM_PK PRIMARY KEY (Diadiem,Maphg)
)
--Tao bang du an

CREATE TABLE DEAN(
Tenda nvarchar(50),
Mada nchar(10),
Ddiem_DA nvarchar(50),
Phong nchar(10)
CONSTRAINT DEAN_PK PRIMARY KEY (Mada),
CONSTRAINT DEAN_FK_PHONBAN FOREIGN KEY (Phong) REFERENCES PHONGBAN(Maphg)
)
--Tao bang phan cong

CREATE TABLE PHANCONG(
Ma_nvien nchar(10),
Soda nchar(10), 
Thoigian int,
CONSTRAINT PHANCONG_FK_NHANVIEN FOREIGN KEY (Ma_nvien) REFERENCES NHANVIEN(MaNV),
CONSTRAINT PHANCONG_FK_DEAN FOREIGN KEY (Soda) REFERENCES DEAN(Mada),
CONSTRAINT PHANCONG_PK PRIMARY KEY (Ma_nvien,Soda)
)

--Tao bang than nhan
CREATE TABLE THANNHAN(
Ma_nvien nchar(10),
Tentn nvarchar(50), 
Phai nchar(10), 
Ngsinh date, 
Quanhe nvarchar(50)
CONSTRAINT THANNHAN_FK_NHANVIEN FOREIGN KEY (Ma_nvien) REFERENCES NHANVIEN(MaNV),
CONSTRAINT THANNHAN_PK PRIMARY KEY (Ma_nvien,Tentn)
)

-- chen du lieu vao cac bang
-- PHONG BAN
INSERT INTO PHONGBAN VALUES (N'Nghiên cứu','5',NULL,NULL)--'333445555','2008-05-22')
INSERT INTO PHONGBAN VALUES (N'Điều hành','4',NULL,NULL)--'987987987','2009-01-01')
INSERT INTO PHONGBAN VALUES (N'Quản lý','1',NULL,NULL)--'888665555','2001-06-19')
--NHAN VIEN
INSERT INTO NHANVIEN VALUES(N'Đinh',N'Bá',N'Tiến','123456789','1985-01-09',	N'731 Trần Hưng Đạo  Q1  TPHCM','Nam',3000000,'333445555','5')
INSERT INTO NHANVIEN VALUES(N'Nguyễn', N'Thanh', N'Tùng','333445555','1975-01-08',N'638 Nguyễn Văn Cừ Q5 TPHCM','Nam',	4000000,'888665555','5')
INSERT INTO NHANVIEN VALUES(N'Bùi', N'Thùy', N'Vũ','999887777','1988-07-19',N'332 Nguyễn Thái Học, Q1, TPHCM',N'Nữ',2500000,'987654321','4')
INSERT INTO NHANVIEN VALUES(N'Lê', N'Thị', N'Nhàn','987654321','1961-06-20',N'291 Hồ Văn Huê, QPN, TPHCM',N'Nữ',4300000,'888665555'	,'4')
INSERT INTO NHANVIEN VALUES(N'Nguyễn',N'Mạnh', N'Hùng','666884444','1982-09-15',N'975 Bà Rịa, Vũng Tàu','Nam',3800000,'333445555','5')
INSERT INTO NHANVIEN VALUES(N'Trần', N'Thanh', N'Tâm','453453453','1990-07-31',N'543 Mai Thị Lưu, Q1 TPHCM','Nam',2500000,'333445555','5')
INSERT INTO NHANVIEN VALUES(N'Trần', N'Hồng',N'Quang','987987987','1986-03-29',N'980 Lê Hồng Phong, Q10, TP HCM','Nam',2500000,'987654321','4')
INSERT INTO NHANVIEN VALUES(N'Vương',N'Ngọc',N'Quyên','888665555','1957-10-10',N'450 Trưng Vương Hà Nội',N'Nữ',5500000,NULL,'1')
INSERT INTO NHANVIEN VALUES(N'Vương',N'Ngọc',N'Hà','888667777','1957-10-11',N'450 Trưng Vương Hà Nội','Nữ',6500000,NULL,'1')

--CHINH SUA PHONG BAN
UPDATE  PHONGBAN
SET TrPhg = '333445555',Ngaynhanchuc = '2008-05-22'
WHERE Maphg = '5'

UPDATE PHONGBAN
SET Trphg = '987987987',Ngaynhanchuc = '2009-01-01'
WHERE Maphg = '4'

UPDATE PHONGBAN
SET Trphg = '888665555',Ngaynhanchuc = '2001-06-19'
WHERE Maphg = '1'
SELECT * FROM PHONGBAN
--DIA DIEM PHONG
INSERT INTO DIADIEM VALUES ('1',N'TP Hồ Chí Minh')
INSERT INTO DIADIEM VALUES ('4',N'Hà Nội')
INSERT INTO DIADIEM VALUES ('5',N'Vũng Tàu')
INSERT INTO DIADIEM VALUES ('5',N'Nha Trang')
INSERT INTO DIADIEM VALUES ('5',N'TP Hồ Chí Minh')
SELECT * FROM DIADIEM
--DEAN
INSERT INTO DEAN VALUES(N'Sản phẩm X','1',N'Vũng Tàu','5')
INSERT INTO DEAN VALUES(N'Sản phẩm Y','3',N'Nha Trang','5')
INSERT INTO DEAN VALUES(N'Sản phẩm Z','2',N'TP Hồ Chí Minh','5')
INSERT INTO DEAN VALUES(N'Tin học hóa','10',N'Hà Nội','4')
INSERT INTO DEAN VALUES(N'Cáp quang','20',N'TP Hồ Chí Minh','1')
INSERT INTO DEAN VALUES(N'Đào tạo','30',N'Hà Nội','4')
SELECT * FROM DEAN

--THANNHAN
INSERT INTO THANNHAN VALUES('333445555',N'Quang',N'Nữ','2006-04-05',N'Con gái')
INSERT INTO THANNHAN VALUES('333445555',N'Khang',N'Nam','2006-04-05',N'Con trai')
INSERT INTO THANNHAN VALUES('333445555',N'Dương',N'Nữ','2006-04-05',N'Vợ chồng')
INSERT INTO THANNHAN VALUES('333445555',N'Đăng',N'Nam','2006-04-05',N'Vợ chồng')
INSERT INTO THANNHAN VALUES('333445555',N'Duy	',N'Nam','2006-04-05',N'Con trai')
INSERT INTO THANNHAN VALUES('333445555',N'Châu',N'Nữ','2006-04-05',N'Con gái')
INSERT INTO THANNHAN VALUES('333445555',N'Phương',N'Nữ','2006-04-05',N'Vợ chồng')
SELECT * FROM THANNHAN
--PHAN CONG
INSERT INTO PHANCONG VALUES('123456789','1',32)
INSERT INTO PHANCONG VALUES('123456789','2',7)
INSERT INTO PHANCONG VALUES('666884444','3',40)
INSERT INTO PHANCONG VALUES('453453453','1',20)
INSERT INTO PHANCONG VALUES('453453453','2',20)
INSERT INTO PHANCONG VALUES('333445555','3',10)
INSERT INTO PHANCONG VALUES('333445555','10',10)
INSERT INTO PHANCONG VALUES('333445555','20',10)
INSERT INTO PHANCONG VALUES('999887777','30',30)
INSERT INTO PHANCONG VALUES('999887777','10',10)
INSERT INTO PHANCONG VALUES('987987987','10',35)
INSERT INTO PHANCONG VALUES('987987987','30',5)
INSERT INTO PHANCONG VALUES('987654321','30',20)
INSERT INTO PHANCONG VALUES('987654321','20',15)
INSERT INTO PHANCONG VALUES('888665555','20',NULL)
INSERT INTO PHANCONG VALUES('888665555','10',0)
SELECT * FROM PHANCONG

--3. Liệt kê danh sách nhân viên là phái nam làm việc ở phòng số 5. 
SELECT NHANVIEN.HoNV+''+NHANVIEN.Tenlot+''+NHANVIEN.Tennv
FROM NHANVIEN JOIN PHONGBAN ON NHANVIEN.Phg = PHONGBAN.MaPhg
WHERE NHANVIEN.Phai = 'Nam' AND PHONGBAN.MaPhg = '5' 

--4. Cho biết họ tên và địa chỉ các nhân viên sống ở TPHCM sắp xếp tăng dần theo tên, lót, họ.
SELECT HoNV+''+Tenlot+''+TenNV,Dchi
FROM NHANVIEN 
WHERE Dchi LIKE N'%TPHCM%'
ORDER BY TenNV,TenLot,HoNV

--5. Cho biết họ tên và mức lương của các nhân viên trên 40 tuổi sắp xếp tăng dần theo lương.
SELECT HoNV+''+Tenlot+''+TenNV,luong,YEAR(GETDATE())-YEAR(NgSinh) 'Tuoi'
FROM NHANVIEN
WHERE YEAR(GETDATE())-YEAR(NgSinh) > 40
ORDER BY luong

--6. Liệt kê danh sách những nhân viên (HoNV, TenNV) có cùng tên (TenNV) với người thân.
SELECT NHANVIEN.HoNV+''+NHANVIEN.TenNV,THANNHAN.TenTN
FROM NHANVIEN JOIN THANNHAN ON NHANVIEN.MaNV = THANNHAN.Ma_nvien
WHERE NHANVIEN.TenNV = THANNHAN.TenTN

--7. Với mọi đề án ở Hà Nội, liệt kê các mã số đề án, mã số phòng ban chủ trì đề án, họ tên trưởng phòng cũng như địa chỉ và ngày sinh của người ấy.
SELECT DEAN.Mada,DEAN.phong,NHANVIEN.HoNV+''+NHANVIEN.Tenlot+''+NHANVIEN.TenNV 'Ten Truong Phong',NHANVIEN.dchi
FROM DEAN JOIN PHONGBAN ON DEAN.phong = PHONGBAN.Maphg JOIN NHANVIEN ON PHONGBAN.Trphg = NHANVIEN.MaNV
WHERE DEAN.Ddiem_DA LIKE N'%Hà Nội%'

--8. Cho biết danh sách những nhân viên không có thân nhân nào.
SELECT NHANVIEN.MaNV + '' + NHANVIEN.Tenlot+''+NHANVIEN.Tennv
FROM NHANVIEN JOIN THANNHAN ON NHANVIEN.MaNV = THANNHAN.Ma_nvien
WHERE NHANVIEN.MaNv NOT IN (SELECT THANNHAN.Ma_nvien FROM THANNHAN) 

--9. Tìm tên và địa chỉ của tất cả nhân viên của phòng Nghiên cứu.
SELECT NHANVIEN.TenNV + ''+ NHANVIEN.Tenlot+''+NHANVIEN.Tennv,NHANVIEN.dchi,PHONGBAN.Tenphg
FROM NHANVIEN JOIN PHONGBAN ON NHANVIEN.phg = PHONGBAN.Maphg
WHERE PHONGBAN.Tenphg = N'Nghiên Cứu'

--10. Hãy loại bỏ những đề án có thời gian làm việc trên 30 giờ.(không xoá được dữ liệu vì liên quan khoá ngoại)
DELETE FROM DEAN JOIN PHANCONG ON DEAN.Mada = PHANCONG.Soda
WHERE  PHANCONG.thoigian > 30
--11. Hãy cập nhật lại những đề án có thời gian làm việc chưa xác định thành có thời gian mặc định là 5 giờ.
UPDATE PHANCONG
SET Thoigian = 5
WHERE Thoigian IS NULL
SELECT * FROM PHANCONG

--12. Cho biết 3 nhân viên mức lương cao nhất công ty.
SELECT TOP 3 HoNV +''+Tenlot +''+TenNV,Luong
FROM NHANVIEN
ORDER BY Luong DESC
--13. Cho biết danh sách những nhân viên và số lượng đề án mà họ làm.
SELECT NHANVIEN.HoNV + ''+NHANVIEN.TenLot+''+NHANVIEN.TenNV,COUNT(*) 'So Luong De An'
FROM NHANVIEN JOIN DEAN ON NHANVIEN.Phg = DEAN.Phong
GROUP BY NHANVIEN.HoNV + ''+NHANVIEN.TenLot+''+NHANVIEN.TenNV
--14. Danh sách nhân viên thuộc phòng Điều hành.
SELECT NHANVIEN.HoNV+''+NHANVIEN.TenLot+''+NHANVIEN.TenNV,PHONGBAN.Tenphg
FROM NHANVIEN JOIN PHONGBAN ON NHANVIEN.Phg = PHONGBAN.Maphg
WHERE PHONGBAN.Tenphg = N'Điều hành'



---SESSION 9 - ADVANCE QUERY AND JOIN
--15.Liệt kê thông tin của những nhân viên làm việc tại phòng số 4 sắp xếp theo mã nhân viên.
SELECT HoNv+''+Tenlot+''+TenNV,phg
FROM NHANVIEN
WHERE phg = '4'
ORDER BY MaNV
--16.Liệt kê những nhân viên ở TPHCM  không phải là phái nữ.
SELECT HoNV+''+Tenlot+''+Tennv,Phai,Dchi
FROM NHANVIEN
WHERE Dchi LIKE '%TPHCM%' AND Phai != 'Nữ'
--17.Liệt kê những nhân viên ở TPHCM  trên 22 tuổi.
SELECT TenNV+''+TenLot+''+TenNv,YEAR(GETDATE())-YEAR(Ngsinh) 'Tuoi'
FROM NHANVIEN
WHERE YEAR(GETDATE())-YEAR(Ngsinh) > 22
--18.Hiển thị những nhân viên có địa chỉ ở TPHCM  và Vũng Tàu
SELECT HoNV+''+Tenlot+''+TenNV,Dchi
FROM NHANVIEN
WHERE Dchi LIKE N'%TPHCM%' OR Dchi LIKE N'%Vũng Tàu%'
--19.Tính tổng lương của những nhân viên nhóm theo từng phòng.
SELECT Phg,SUM(luong) 'Tong Luong'
FROM NHANVIEN
GROUP BY Phg

--20.Tìm họ nhân viên, tên lót, tên nhân viên của nhân viên có tuổi lớn nhất trong công ty.
SELECT TOP 1 Honv+''+Tenlot+''+TenNV,YEAR(GETDATE()) - YEAR(NgSinh) 'Tuoi'
FROM NHANVIEN
GROUP BY TenNV,Tenlot,HoNV,NgSinh
ORDER BY Tuoi DESC
--C2
SELECT TOP 1 Honv+''+Tenlot+''+TenNV,YEAR(GETDATE()) - YEAR(NgSinh) 'Tuoi'
FROM NHANVIEN
GROUP BY TenNV,Tenlot,HoNV,NgSinh
ORDER BY Ngsinh


--21.Tìm họ nhân viên, tên lót, tên nhân viên của nhân viên có tuổi nhỏ nhất trong công ty.
SELECT TOP 1 Honv+''+Tenlot+''+Tennv,YEAR(GETDATE()) - YEAR(Ngsinh) 'Tuoi'
FROM NHANVIEN 
GROUP BY TenNv,Tenlot,Honv,Ngsinh
ORDER BY tuoi 



--22.Đếm số nhân viên có trong công ty theo tên nhân viên, loại trừ những nhân viên có tên nhân viên giống nhau.
SELECT COUNT(TenNV),TenNV
FROM (SELECT DISTINCT TenNV,MaNV FROM NHANVIEN) TOTAL
GROUP BY MaNv,TenNV

SELECT COUNT(TenNV) 'So NV',TenNV
FROM NHANVIEN
GROUP BY Tennv

SELECT TenNV,COUNT(TenNV)
FROM NHANVIEN
GROUP BY TenNV


--23.Hiển thị những nhân viên chưa tham gia đề án nào.
SELECT Honv+''+Tenlot+''+Tennv 'Ten nhan vien chua tham gia de an'
FROM NHANVIEN
WHERE NHANVIEN.phg NOT IN (SELECT phong FROM DEAN)
--24.Liệt kê thông tin nhân viên thuộc đề án ‘Tin học hóa’ loại trừ những nhân viên có mã nhân viên là 333445555 và 999887777
SELECT NHANVIEN.Honv+''+NHANVIEN.Tenlot+''+NHANVIEN.Tennv N'Nhan Vien Tham Gia De An Tin Hoc Hoa'
FROM NHANVIEN JOIN PHONGBAN ON NHANVIEN.Phg = PHONGBAN.Maphg JOIN DEAN ON PHONGBAN.Maphg = DEAN.Phong
WHERE DEAN.Tenda LIKE N'%Tin học hoá%' AND NHANVIEN.Manv NOT IN(333445555,999887777)
--25.Liệt kê thông tin về mã số, tên, phái, ngày sinh của nhân viên và thân nhân.
SELECT NHANVIEN.Honv+''+NHANVIEN.Tenlot+''+NHANVIEN.Tennv ,NHANVIEN.Manv,NHANVIEN.Phai,NHANVIEN.Ngsinh,THANNHAN.Tentn
FROM NHANVIEN JOIN THANNHAN ON NHANVIEN.Manv = THANNHAN.Ma_nvien


