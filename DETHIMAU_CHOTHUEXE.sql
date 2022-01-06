CREATE DATABASE CHOTHUEXE_DB
USE CHOTHUEXE_DB
GO
--TAO BANG NHA CUNG CAP
CREATE TABLE NHACUNGCAP(
MaNhaCC nvarchar(10),
TenNhaCC nvarchar(50),
DiaChi nvarchar(50),
SoDT  nvarchar(20),
MaSoThue nvarchar(20),
CONSTRAINT NHACUNGCAP_PK PRIMARY KEY(MaNhaCC),
)
--TAO BANG LOAIDICHVU
CREATE TABLE LOAIDICHVU(
MaLoaiDV nvarchar(10),
TenLoaiDV nvarchar(50)
CONSTRAINT LOAIDICHVU_PK PRIMARY KEY(MaLoaiDV),
)
--TAO BANG MUCPHI
CREATE TABLE MUCPHI(
MaMP nvarchar(10),
Dongia int,
Mota nvarchar(50),
CONSTRAINT MUCPHI_PK PRIMARY KEY(MaMP)
)
--TAO BANG DONG XE
CREATE TABLE DONGXE(
DongXe nvarchar(50),
HangXe nvarchar(50),
SoChoNgoi int,
CONSTRAINT DONGXE_PK PRIMARY KEY(DongXe)
)
--TAO BANG DANG KY CUNG CAP
CREATE TABLE DANGKYCUNGCAP(
MaDKCC nvarchar(10),
MaNhaCC nvarchar(10),
MaLoaiDV nvarchar(10),
DongXe nvarchar(50),
MaMP nvarchar(10),
NgayBatDauCungCap date,
NgayKetThucCungCap date,
SoLuongXeDangKy int,
CONSTRAINT DANGKYCUNGCAP_PK PRIMARY KEY(MaDKCC),
CONSTRAINT DANGKYCUNGCAP_FK_NHACUNGCAP FOREIGN KEY (MaNhaCC) REFERENCES NHACUNGCAP(MaNhaCC),
CONSTRAINT DANGKYCUNGCAP_FK_LOAIDICHVU FOREIGN KEY (MaLoaiDV) REFERENCES LOAIDICHVU(MaLoaiDV),
CONSTRAINT DANGKYCUNGCAP_FK_MUCPHI FOREIGN KEY (MaMP) REFERENCES MUCPHI(MaMP),
CONSTRAINT DANGKYCUNGCAP_FK_DONGXE FOREIGN KEY (DongXe) REFERENCES DONGXE(DongXe),
)
--CHEN DU LIEU VAO CAC BANG
--BANG NHA CUNG CAP
INSERT INTO NHACUNGCAP VALUES('NCC001',N'Công ty TNHH Toàn Pháp','Hai Chau','05113999888','568941')
INSERT INTO NHACUNGCAP VALUES('NCC002',N'Công ty Cổ Phần Đông Du','Lien Chieu','05113999889','456789')
INSERT INTO NHACUNGCAP VALUES('NCC003',N'Ông Nguyễn Văn A','Hoa Thuan','05113658945','321456')
INSERT INTO NHACUNGCAP VALUES('NCC004',N'Công ty Cổ Phần Toàn Cầu Xanh','Hai Chau','05113875466','513364')
INSERT INTO NHACUNGCAP VALUES('NCC005',N'Công ty TNHH AMA','Thanh Khe','05113587469','546546')
INSERT INTO NHACUNGCAP VALUES('NCC006',N'Bà Trần Thị Bích Vân','Lien Chieu','05113987456','524545')
INSERT INTO NHACUNGCAP VALUES('NCC007',N'Công ty TNHH Phan Thành','Thanh Khe','05113532456','113021')
INSERT INTO NHACUNGCAP VALUES('NCC008',N'Ông Phan Đình Nam','Hoa Thuan','05113987121','121230')
INSERT INTO NHACUNGCAP VALUES('NCC009',N'Tập Đoàn Đông Nam Á','Lien Chieu','05113569654','533654')
INSERT INTO NHACUNGCAP VALUES('NCC010',N'Công ty Cổ Phần Rạng Đông','Lien Chieu','05113123456','187864')

--BANG LOAI DICH VU
INSERT INTO LOAIDICHVU VALUES('DV01',N'Dịch Vụ Xe Taxi')
INSERT INTO LOAIDICHVU VALUES('DV02',N'Dịch XE Buýt công cộng theo tuyến cố định')
INSERT INTO LOAIDICHVU VALUES('DV03',N'Dịch Vụ cho thuê xe theo hợp đồng')
--BANG MUC PHI
INSERT INTO MUCPHI VALUES('MP01',10000,N'Áp dụng từ 1/2015')
INSERT INTO MUCPHI VALUES('MP02',15000,N'Áp dụng từ 2/2015')
INSERT INTO MUCPHI VALUES('MP03',20000,N'Áp dụng từ 1/2010')
INSERT INTO MUCPHI VALUES('MP04',25000,N'Áp dụng từ 2/2011')
select * from mucphi
--BANG DONG XE
INSERT INTO DONGXE VALUES('Hiace','Toyota',16)
INSERT INTO DONGXE VALUES('Vios','Toyota',5)
INSERT INTO DONGXE VALUES('Escape','Ford',5)
INSERT INTO DONGXE VALUES('Cerato','Kia',7)
INSERT INTO DONGXE VALUES('Forte','Kia',5)
INSERT INTO DONGXE VALUES('Starex','Huyndai',7)
INSERT INTO DONGXE VALUES('Grand-i10','Huyndai',7)

--BANG DANGKYCUNGCAP
INSERT INTO DANGKYCUNGCAP VALUES('DK001','NCC001','DV01','Hiace','MP01','2015-11-20','2016-11-20',4)
INSERT INTO DANGKYCUNGCAP VALUES('DK002','NCC002','DV02','Vios','MP02','2015-11-20','2017-11-20',3)
INSERT INTO DANGKYCUNGCAP VALUES('DK003','NCC003','DV03','Escape','MP03','2017-11-20','2018-11-20',5)
INSERT INTO DANGKYCUNGCAP VALUES('DK004','NCC005','DV01','Cerato','MP04','2015-11-20','2019-11-20',7)
INSERT INTO DANGKYCUNGCAP VALUES('DK005','NCC002','DV02','Forte','MP03','2019-11-20','2020-11-20',1)


--Câu 1: Tạo đầy đủ lược đồ cơ sở dữ liệu quan hệ như mô tả ở trên. Sinh viên tự định nghĩa kiểu dữ liệu cho các cột (0.5 điểm)

--Câu 2: Chèn toàn bộ dữ liệu mẫu đã được minh họa ở trên vào tất cả các bảng (0.5 điểm)

--***** Lưu ý: Nếu không hoàn thành yêu cầu của câu 1 và câu 2 thì sẽ không được chấm và tính điểm cho các yêu cầu tiếp theo *****

--Câu 3: Liệt kê những dòng xe có số chỗ ngồi trên 5 chỗ (0.5 điểm)
SELECT Dongxe,SoChoNgoi
FROM DONGXE
WHERE SoChoNgoi = 5

--Câu 4: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp những dòng xe thuộc hãng xe "Toyota" với mức phí có đơn giá là 15.000 VNĐ/km hoặc những dòng xe thuộc hãng xe "KIA" với mức phí có đơn giá là 20.000 VNĐ/km (0.5 điểm)
SELECT NHACUNGCAP.MaNhaCC,NHACUNGCAP.TenNhaCC,NHACUNGCAP.DiaChi,NHACUNGCAP.SoDT,NHACUNGCAP.MaSoThue
FROM NHACUNGCAP JOIN DANGKYCUNGCAP ON NHACUNGCAP.MaNhaCC = DANGKYCUNGCAP.MaNhaCC JOIN MUCPHI ON DANGKYCUNGCAP.MaMP = MUCPHI.MaMP
WHERE (DANGKYCUNGCAP.DongXe = N'Toyota' AND MUCPHI.Dongia = 15000) OR (DANGKYCUNGCAP.DongXe = N'KIA' AND MUCPHI.Dongia = 20000) 

--Câu 5: Liệt kê thông tin của các dòng xe thuộc hãng xe có tên bắt đầu là ký tự "T" và có độ dài là 5 ký tự (0.5 điểm)

--Câu 6: Liệt kê thông tin toàn bộ nhà cung cấp được sắp xếp tăng dần theo tên nhà cung cấp và giảm dần theo mã số thuế (0.5 điểm)
SELECT * FROM NHACUNGCAP
ORDER BY TenNhaCC

SELECT * FROM NHACUNGCAP 
ORDER BY MaSoThue DESC

--Câu 7: Đếm số lần đăng ký cung cấp phương tiện tương ứng cho từng nhà cung cấp với yêu cầu chỉ đếm cho những nhà cung cấp thực hiện đăng ký cung cấp có ngày bắt đầu cung cấp là "20/11/2015" (0.5 điểm)
SELECT COUNT(ManhaCC) 'So lan dang ky phuong tien',NgayBatDauCungCap,MaNhaCC
FROM DANGKYCUNGCAP
WHERE NgayBatDauCungCap = '2015-11-20'
GROUP BY ManhaCC,NgayBatDauCungCap


--Câu 8: Liệt kê tên của toàn bộ các hãng xe có trong cơ sở dữ liệu với yêu cầu mỗi hãng xe chỉ được liệt kê một lần (0.5 điểm)
SELECT DISTINCT HangXe
FROM 
DONGXE

--Câu 9: Liệt kê MaDKCC, TenLoaiDV, TenNhaCC, DonGia, DongXe, HangXe, NgayBatDauCC, NgayKetThucCC, SoLuongXeDangKy của tất cả các lần đăng ký cung cấp phương tiện (0.5 điểm)
SELECT * 
FROM DANGKYCUNGCAP

--Câu 10: Liệt kê MaDKCC, MaNhaCC, TenNhaCC, DiaChi, MaSoThue, TenLoaiDV, DonGia, HangXe, NgayBatDauCC, NgayKetThucCC của tất cả các lần đăng ký cung cấp phương tiện với yêu cầu những nhà cung cấp nào chưa từng thực hiện đăng ký cung cấp phương tiện thì cũng liệt kê thông tin những nhà cung cấp đó ra (0.5 điểm)
SELECT * 
FROM DANGKYCUNGCAP LEFT JOIN NHACUNGCAP ON DANGKYCUNGCAP.MaNhaCC = NHACUNGCAP.MaNhaCC
--Câu 11: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp phương tiện thuộc dòng xe "Hiace" hoặc từng đăng ký cung cấp phương tiện thuộc dòng xe "Cerato" (0.5 điểm)
SELECT * 
FROM NHACUNGCAP JOIN DANGKYCUNGCAP ON NHACUNGCAP.ManhaCC = DANGKYCUNGCAP.MaNhaCC
WHERE DANGKYCUNGCAP.DongXe = N'Hiace' OR DANGKYCUNGCAP.Dongxe = 'Cerato'

--Câu 12: Liệt kê thông tin của các nhà cung cấp chưa từng thực hiện đăng ký cung cấp phương tiện lần nào cả (0.5 điểm)
SELECT *
FROM NHACUNGCAP JOIN DANGKYCUNGCAP ON NHACUNGCAP.MaNhaCC = DANGKYCUNGCAP.MaNhaCC
WHERE NHACUNGCAP.MaNhaCC NOT IN (SELECT MaNhaCC FROM DANGKYCUNGCAP)

--Câu 13: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp phương tiện thuộc dòng xe "Hiace" và chưa từng đăng ký cung cấp phương tiện thuộc dòng xe "Cerato" (0.5 điểm)
SELECT * 
FROM NHACUNGCAP JOIN DANGKYCUNGCAP ON NHACUNGCAP.MaNhaCC = DANGKYCUNGCAP.MaNhaCC
WHERE DANGKYCUNGCAP.DongXe = N'Hiace' AND DANGKYCUNGCAP.DongXe != 'Cerato'

--Câu 14: Liệt kê thông tin của những dòng xe chưa được nhà cung cấp nào đăng ký cho thuê vào năm "2015" nhưng đã từng được đăng ký cho thuê vào năm "2016" (0.5 điểm)
SELECT * 
FROM DANGKYCUNGCAP
WHERE YEAR(NgayBatDauCungCap) != 2015 AND YEAR(NgayBatDauCungCap) =2016 

--Câu 15: Hiển thị thông tin của những dòng xe có số lần được đăng ký cho thuê nhiều nhất tính từ đầu năm 2016 đến hết năm 2019 (0.5 điểm)
SELECT *
FROM DONGXE JOIN DANGKYCUNGCAP ON DONGXE.DongXe = DANGKYCUNGCAP.Dongxe
WHERE YEAR(NgayBatDauCungCap) = 2016 AND YEAR(NgayKetThucCungCap) = 2019 AND DANGKYCUNGCAP.DongXe 

SELECT COUNT(DongXe) 'SoLanDangKy',DongXe
FROM DANGKYCUNGCAP 
WHERE DongXe IN (SELECT TOP 1 DongXe FROM DANGKYCUNGCAP GROUP BY DongXe ORDER BY COUNT(DongXe) DESC)
GROUP BY DongXe




--Câu 16: Tính tổng số lượng xe đã được đăng ký cho thuê tương ứng với từng dòng xe với yêu cầu chỉ thực hiện tính đối với những lần đăng ký cho thuê có mức phí với đơn giá là 20.000 VNĐ trên 1 km (0.5 điểm)
SELECT COUNT(DongXe) 'SoLanDangKyChoThue',MUCPHI.DonGia,DANGKYCUNGCAP.DongXe
FROM DANGKYCUNGCAP JOIN MUCPHI ON DANGKYCUNGCAP.MaMP = MUCPHI.MaMP
WHERE MUCPHI.DonGia = 20000
GROUP BY DongXe,DonGia


--Câu 17: Liệt kê MaNCC, SoLuongXeDangKy với yêu cầu chỉ liệt kê những nhà cung cấp có địa chỉ là "Hai Chau" và chỉ mới thực hiện đăng ký cho thuê một lần duy nhất, kết quả được sắp xếp tăng dần theo số lượng xe đăng ký (0.5 điểm)
SELECT DANGKYCUNGCAP.MaNhaCC,DANGKYCUNGCAP.SoLuongXeDangKy,NHACUNGCAP.DiaChi
FROM DANGKYCUNGCAP JOIN NHACUNGCAP ON DANGKYCUNGCAP.MaNhaCC = NHACUNGCAP.MaNhaCC
WHERE NHACUNGCAP.DiaChi = N'Hai Chau'  AND (COUNT(DANGKYCUNGCAP.MaNhaCC) = 1)

--Câu 18: Cập nhật cột SoLuongXeDangKy trong bảng DANGKYCUNGCAP thành giá trị 20 đối với những dòng xe thuộc hãng "Toyota" và có NgayKetThucCungCap trước ngày 30/12/2016 (0.5 điểm)
UPDATE DANGKYCUNGCAP
SET SoLuongXeDangKy = 20
WHERE DongXe = N'Toyota' AND NgayKetThucCungCap < '2016-12-31'
--Câu 19: Cập nhật cột MoTa trong bảng MUCPHI thành giá trị "Được sử dụng nhiều" cho những mức phí được sử dụng để đăng ký cung cấp cho thuê phương tiện từ 5 lần trở lên trong năm 2016 (0.5 điểm)
ALTER TABLE MUCPHI
ADD DuocSuDungNhieu nvarchar(50)
ALTER TABLE MUCPHI
DROP COLUMN DuocSuDungNhieu
Câu 20: Xóa những lần đăng ký cung cấp cho thuê phương tiện có ngày bắt đầu cung cấp sau ngày 10/11/2015 và đăng ký cho thuê dòng xe "Vios" (0.5 điểm)
