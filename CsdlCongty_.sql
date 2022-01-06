drop database if exists CsdlCongty;
create database CsdlCongty;
use CsdlCongty;

create table NHANVIEN (
	HoNV	varchar(15),
	Tenlot	varchar(15),
	TenNV	varchar(15),
	MaNV	char(9),
	NgSinh	date,
	DChi	varchar(30),
	Phai	varchar(3),
	Luong	real,
	MaNQL	char(9),
	Phg	int,
	constraint NHANVIEN_PK	primary key (MaNV),
	constraint NHANVIEN_FK_NHANVIEN foreign key (MaNQL) references NHANVIEN (MaNV),
	constraint NHANVIEN_DM_Phai check (Phai in ('F', 'f', 'M', 'm'))
);

create table PHONGBAN (
	TenPhg	varchar(15),
	MaPhg	int,
	TrPhg	char(9),
	NgNhanChuc	date,
	constraint PHONGBAN_PK primary key (MaPhg),
	constraint PHONGBAN_FK_NHANVIEN foreign key (TrPhg) references NHANVIEN (MaNV)
);

alter table NHANVIEN
add constraint NHANVIEN_FK_PHONGBAN foreign key (Phg) references PHONGBAN (MaPhg);

create table DIADIEM_PHG (
	MaPhg	int,
	Diadiem	varchar(15),
	constraint DIADIEM_PHG_PK primary key (MaPhg, Diadiem),
	constraint DIADIEM_PHG_FK_PHONGBAN foreign key (MaPhg) references PHONGBAN (MaPhg)
);

create table DUAN (
	TenDA	varchar(15),
	MaDA	int,
	Diadiem	varchar(15),
	Phong	int,
	constraint DUAN_PK primary key (MaDA),
	constraint DUAN_FK_PHONGBAN foreign key (Phong) references PHONGBAN (MaPhg)
);

create table PHANCONG (
	MaNV	char(9),
	MaDA	int,
	Thoigian	decimal(6,1),
	constraint PHANCONG_PK primary key (MaNV, MaDA),
	constraint PHANCONG_FK_NHANVIEN foreign key (MaNV) references NHANVIEN (MaNV),
	constraint PHANCONG_FK_DUAN foreign key (MaDA) references DUAN (MaDA)
);

create table THANNHAN (
	MaNV	char(9),
	TenTN	varchar(15),
	Phai	varchar(3),
	NgSinh	date,
	Quanhe	varchar(8),
	constraint THANNHAN_PK primary key (MaNV, TenTN),
	constraint THANNHAN_FK_NHANVIEN foreign key (MaNV) references NHANVIEN (MaNV),
	constraint THANNHAN_DM_Phai check (Phai in ('M', 'm', 'F', 'f'))
);

-- chen du lieu PHONGBAN
insert into PHONGBAN values ('Nghien cuu',5,null,null);
insert into PHONGBAN values ('Dieu hanh',4,null,null);
insert into PHONGBAN values ('Quan ly',1,null,null);

-- chen du lieu NHANVIEN
insert into NHANVIEN values ('Le','Van','Bo','888665555','1937-11-10','450 Trung Vuong, Ha Noi','M',55000,null,1);
insert into NHANVIEN values ('Phan','Van','Nghia','333445555','1955-12-08','638 Nguyen Van Cu, Q5, TpHCM','M',40000,'888665555',5);
insert into NHANVIEN values ('Nguyen','Bao','Hung','123456789','1965-01-09','731 Tran Hung Dao, Q1, TpHCM','M',30000,'333445555',5);
insert into NHANVIEN values ('Tran',null,'Nam','666884444','1962-09-15','975 Ba Ria Vung Tau','M',38000,'333445555',5);
insert into NHANVIEN values ('Hoang','Kim','Yen','453453453','1972-07-31','543 Mai Thi Luu, Q1, TpHCM','F',25000,'333445555',5);
insert into NHANVIEN values ('Du','Thi','Hau','987654321','1951-06-20','291 Ho Van Hue, QPN, TpHCM','F',43000,'888665555',4);
insert into NHANVIEN values ('Au',null,'Vuong','999887777','1968-07-19','332 Nguyen Thai Hoc, Q1, TpHCM','F',25000,'987654321',4);
insert into NHANVIEN values ('Nguyen','Van','Giap','987987987','1969-03-09','980 Le Hong Phong, Q10, TpHCM','M',25000,'987654321',4);

-- chinh sua du lieu PHONGBAN
update PHONGBAN
set TrPhg='888665555',NgNhanChuc='1981-06-19'
where MaPhg=1;
update PHONGBAN
set TrPhg='987987987',NgNhanChuc='1995-01-01'
where MaPhg=4;
update PHONGBAN
set TrPhg='333445555',NgNhanChuc='1988-05-22'
where MaPhg=5;

-- chen du lieu DIADIEM_PHG
insert into DIADIEM_PHG values (1,'Phu Nhuan');
insert into DIADIEM_PHG values (4,'Go Vap');
insert into DIADIEM_PHG values (5,'Tan Binh');
insert into DIADIEM_PHG values (5,'Phu Nhuan');
insert into DIADIEM_PHG values (5,'Thu Duc');

-- chen du lieu DUAN
insert into DUAN values ('San pham X',1,'Tan Binh',5);
insert into DUAN values ('San pham Y',2,'Thu Duc',5);
insert into DUAN values ('San pham Z',3,'Phu Nhuan',5);
insert into DUAN values ('Tin hoc hoa',10,'Go Vap',4);
insert into DUAN values ('Tai to chuc',20,'Phu Nhuan',1);
insert into DUAN values ('Phuc loi',30,'Go Vap',4);

-- chen du lieu PHANCONG
insert into PHANCONG values ('123456789',1,32.5);
insert into PHANCONG values ('123456789',2,7.5);
insert into PHANCONG values ('666884444',3,40);
insert into PHANCONG values ('453453453',1,20);
insert into PHANCONG values ('453453453',2,20);
insert into PHANCONG values ('333445555',2,10);
insert into PHANCONG values ('333445555',3,10);
insert into PHANCONG values ('333445555',10,10);
insert into PHANCONG values ('333445555',20,10);
insert into PHANCONG values ('999887777',30,30);
insert into PHANCONG values ('999887777',10,10);
insert into PHANCONG values ('987987987',10,35);
insert into PHANCONG values ('987987987',30,5);
insert into PHANCONG values ('987654321',30,20);
insert into PHANCONG values ('987654321',20,15);
insert into PHANCONG values ('888665555',20,null);

SELECT * FROM PHANCONG

-- chen du lieu THANNHAN
insert into THANNHAN values ('333445555','Anh','F','1986-04-05','Con gai');
insert into THANNHAN values ('333445555','The','M','1983-10-25','Con trai');
insert into THANNHAN values ('333445555','Loi','F','1958-05-03','Vo');
insert into THANNHAN values ('987654321','An','M','1942-02-28','Chong');
insert into THANNHAN values ('123456789','Minh','M','1988-01-01','Con trai');
insert into THANNHAN values ('123456789','Anh','F','1988-12-30','Con gai');
insert into THANNHAN values ('123456789','Yen','F','1967-05-05','Vo');
 


 --7.Thực hiện các truy vấn:
--a)Cho biết tên những nhân viên phòng số 5 và có tham gia đề án “Sản phẩm X” với số giờ làm việc trên 10h

SELECT NV.HoNV + '' + NV.TenLot + '' + NV.TenNV 'Nhan Vien',NV.Phg 'Phong Ban',DA.TenDA 'Du An',PC.ThoiGian 'So Gio'
FROM NHANVIEN NV
INNER JOIN PHANCONG PC ON PC.MaNV = NV.MaNV
INNER JOIN DUAN DA ON DA.MaDA = PC.MaDA
WHERE NV.Phg = 5 AND DA.TenDA = N'San pham X' AND PC.ThoiGian > 10

--b)Cho biết danh sách những trưởng phòng có tối thiểu một thân nhân.

SELECT NV.TenNV 'TenNV',PB.TenPhg 'TenPhong',TN.TenTN 'Ten Than Nhan'
FROM NHANVIEN NV JOIN PHONGBAN PB 
ON NV.MaNV = PB.TrPhg JOIN THANNHAN TN ON NV.MaNV = TN.MaNV
WHERE TN.MaNV IN (SELECT THANNHAN.MaNV FROM THANNHAN)

--c)Cho biết danh sách những nhân viên không làm việc cho bất kỳ đề án nào.

SELECT NV.TenNV FROM NHANVIEN NV
WHERE NV.Phg NOT IN (SELECT DUAN.Phong FROM DUAN)

--d)Cho biết danh sách những nhân viên có trên 2 thân nhân.

SELECT NV.TenNV FROM NHANVIEN NV JOIN THANNHAN TN ON NV.MaNV = TN.MaNV
GROUP BY  NV.TenNV
HAVING COUNT(*) > 2

--e)Cho biết danh sách những nhân viên được Nguyễn Thanh Tùng phụ trách trực tiếp.

SELECT TenNV 
FROM NHANVIEN
WHERE MaNQL = (SELECT MaNV FROM NHANVIEN WHERE HoNV = N'Nguyễn' AND Tenlot = N'Thanh' AND TenNV = N'Tùng')

--f)Tăng mức lương thêm 10% cho những nhân viên có thân nhân.

UPDATE NHANVIEN SET luong = luong+luong*10/100
WHERE NHANVIEN.MaNV IN (SELECT THANNHAN.MaNV FROM THANNHAN)
SELECT * FROM NHANVIEN

--g)Tăng mức lương thêm 20% cho những nhân viên là trưởng phòng đồng thời có thân nhân.

UPDATE NHANVIEN SET luong = luong+luong*20/100
WHERE NHANVIEN.MaNV IN (SELECT PHONGBAN.TrPhg FROM PHONGBAN) AND NHANVIEN.MaNV IN(SELECT THANNHAN.MaNV FROM THANNHAN)
SELECT * FROM NHANVIEN

--h)Tăng mức lương thêm 30% cho những nhân viên là trưởng phòng và có tuổi trên 50.

UPDATE NHANVIEN SET luong = luong+luong*30/100
WHERE NHANVIEN.MaNV IN(SELECT PHONGBAN.TrPhg FROM PHONGBAN) AND (YEAR(GETDATE()) - YEAR(NHANVIEN.NgSinh) > 50)
SELECT * FROM NHANVIEN

--i)Với mỗi phòng ban liệt kê tên phòng ban và lương trung bình của những nhân viên làm việc trong phòng ban đó.

SELECT  PHONGBAN.MaPhg, AVG(NHANVIEN.luong) N'Lương Trung Bình'
FROM PHONGBAN JOIN NHANVIEN ON PHONGBAN.MaPhg = NHANVIEN.Phg  
GROUP BY PHONGBAN.MaPhg

--j)Với những phòng ban có mức lương trung bình trên 30000. Liệt kê phòng ban và số lượng nhân viên phòng ban đó.

SELECT PHONGBAN.TenPhg,COUNT(NHANVIEN.MaNV) N'Số Nhân Viên',AVG(NHANVIEN.luong) N'Lương Trung Bình'
FROM PHONGBAN JOIN NHANVIEN ON PHONGBAN.MaPhg = NHANVIEN.Phg
GROUP BY PHONGBAN.TenPhg
HAVING AVG(NHANVIEN.Luong) > 30000

--k)Cho biết 3 nhân viên lớn tuổi nhất công ty.

--a) Nhan vien lon tuoi nhat cong ty
SELECT NHANVIEN.MaNV,NHANVIEN.TenNV,NHANVIEN.NgSinh FROM NHANVIEN
GROUP BY NHANVIEN.NgSInh,NHANVIEN.TenNV,NHANVIEN.MaNV
HAVING  YEAR(GETDATE())-YEAR(NHANVIEN.NgSinh) = (SELECT MAX(YEAR(GETDATE())- YEAR(NHANVIEN.NgSinh))  FROM NHANVIEN)
--b) 3 Nhan vien lon tuoi nhat cong ty
SELECT TOP 3 NHANVIEN.MaNV,NHANVIEN.TenNV,NHANVIEN.NgSinh,YEAR(GETDATE())-YEAR(NHANVIEN.NgSinh) 'Tuoi' FROM NHANVIEN
ORDER BY Tuoi  DESC

Khai báo một biến số nguyên @phong nhận giá trị là 5, một biến @da có kiểu nvarchar nhận giá trị là ‘Sản phẩm X’,

một biến tham số @thoigian nhận giá trị là 10. Hiển thị những nhân viên phòng số @phong,
có tham gia đề án @da với số giờ làm việc trên @thoigian giờ trên 1 tuần.
