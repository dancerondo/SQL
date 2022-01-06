create database QuanLyNhaXe 
use QuanLyNhaXe

create table NHACUNGCAP (
MaNhaCC varchar(50) PRIMARY KEY,
TenNhaCC varchar(50),
DiaChi varchar(50),
SoDT int,
MaSoThue int
)

create table LOAIDICHVU (
MaLoaiDV varchar(50) PRIMARY KEY,
TenLoaiDV varchar(50)
)

create table MUCPHI (
MaMP varchar(50) PRIMARY KEY, 
DonGia money,
MoTa varchar(50)
)

create table DONGXE (
DongXe varchar(50) PRIMARY KEY,
HangXe varchar(50),
SoChoNgoi int
)

create table DANGKYCUNGCAP (
MaDKCC varchar(50) PRIMARY KEY,
MaNhaCC varchar(50) FOREIGN KEY REFERENCES NHACUNGCAP(MaNhaCC),
MaLoaiDV varchar(50) FOREIGN KEY REFERENCES LOAIDICHVU(MaLoaiDV),
DongXe varchar(50) FOREIGN KEY REFERENCES DONGXE(DongXe),
MaMp varchar(50) FOREIGN KEY REFERENCES MUCPHI(MaMP),
NgayBatDauCungCap date,
NgayKetThucCungCap date,
SoLuongXeDangKy int
)

insert into NHACUNGCAP values ('NCC001',N'Cty TNHH Toàn Pháp','Hai Chau',051113123,123123)
insert into NHACUNGCAP values ('NCC002',N'Cty Cổ Phần Đông Du','Lien Chieu',123123123,234234)
insert into NHACUNGCAP values ('NCC003',N'Ông Nguyễn Văn A','Hoa Thuan',234234234,345345)
insert into NHACUNGCAP values ('NCC004',N'Cty Cổ Phần Toàn Cầu Xanh','Hai Chau',345345345,456456)
insert into NHACUNGCAP values ('NCC005',N'Cty TNHH AMA','Thanh Khe',456456456,567567)
insert into NHACUNGCAP values ('NCC006',N'Bà Trần Thị Bích Vân','Lien Chieu',567567567,678678)
insert into NHACUNGCAP values ('NCC007',N'Cty TNHH Phan Thành','Thanh Khe',678678678,789789)
insert into NHACUNGCAP values ('NCC008',N'Ông Phan Đình Nam','Hoa Thuan',789789789,890890)
insert into NHACUNGCAP values ('NCC009',N'Tập đoàn Đông Nam Á','Lien Chieu',012012012,012012)
insert into NHACUNGCAP values ('NCC0010',N'Cty Cổ Phần Rạng đông','Lien Chieu',890890890,222222)

insert into LOAIDICHVU values ('DV01',N'Dịch vụ xe Taxi')
insert into LOAIDICHVU values ('DV02',N'Dịch vụ xe buýt công cộng theo tuyến cố định')
insert into LOAIDICHVU values ('DV03',N'Dịch vụ xe cho thuê theo hợp đồng')

insert into MUCPHI values ('MP01',10,N'Áp dụng từ 1/2015')
insert into MUCPHI values ('MP02',15,N'Áp dụng từ 2/2015')
insert into MUCPHI values ('MP03',20,N'Áp dụng từ 1/2010')
insert into MUCPHI values ('MP04',25,N'Áp dụng từ 2/2011')

insert into DONGXE values ('Hiace','Toyota',16)
insert into DONGXE values ('Vios','Toyota',5)
insert into DONGXE values ('Escape','Ford',5)
insert into DONGXE values ('Cerato','KIA',7)
insert into DONGXE values ('Forte','KIA',5)
insert into DONGXE values ('Starex','Huyndai',7)
insert into DONGXE values ('Grand-i10','Huyndai',7)

insert into DANGKYCUNGCAP values ('DK001','NCC001','DV01','Hiace','MP01','2015-11-20','2016-11-20',4)
insert into DANGKYCUNGCAP values ('DK002','NCC002','DV02','Vios','MP02','2015-11-20','2017-11-20',3)
insert into DANGKYCUNGCAP values ('DK003','NCC003','DV03','Escape','MP03','2017-11-20','2018-11-20',5)
insert into DANGKYCUNGCAP values ('DK004','NCC005','DV01','Cerato','MP04','2015-11-20','2019-11-20',7)
insert into DANGKYCUNGCAP values ('DK005','NCC002','DV02','Forte','MP03','2019-11-20','2020-11-20',1)
insert into DANGKYCUNGCAP values ('DK006','NCC004','DV03','Starex','MP04','2016-11-10','2021-11-20',2)
insert into DANGKYCUNGCAP values ('DK007','NCC005','DV01','Cerato','MP03','2015-11-30','2016-01-25',8)
insert into DANGKYCUNGCAP values ('DK008','NCC006','DV01','Vios','MP02','2016-12-28','2016-08-15',9)
insert into DANGKYCUNGCAP values ('DK009','NCC005','DV03','Grand-i10','MP02','2016-04-27','2017-04-30',10)
insert into DANGKYCUNGCAP values ('DK0010','NCC006','DV01','Forte','MP02','2015-11-21','2016-02-22',4)
insert into DANGKYCUNGCAP values ('DK0011','NCC007','DV01','Forte','MP01','2016-12-25','2017-02-20',5)
insert into DANGKYCUNGCAP values ('DK0012','NCC007','DV03','Cerato','MP01','2016-04-14','2017-12-20',6)
insert into DANGKYCUNGCAP values ('DK0013','NCC003','DV02','Cerato','MP01','2015-12-21','2016-12-21',8)
insert into DANGKYCUNGCAP values ('DK0014','NCC008','DV02','Cerato','MP01','2016-05-20','2016-12-30',1)
insert into DANGKYCUNGCAP values ('DK0015','NCC003','DV01','Hiace','MP02','2018-04-24','2019-11-20',6)
insert into DANGKYCUNGCAP values ('DK0016','NCC001','DV03','Grand-i10','MP02','2016-06-22','2016-12-21',8)
insert into DANGKYCUNGCAP values ('DK0017','NCC002','DV03','Cerato','MP03','2016-09-30','2019-09-30',4)
insert into DANGKYCUNGCAP values ('DK0018','NCC008','DV03','Escape','MP04','2017-12-13','2018-09-30',2)
insert into DANGKYCUNGCAP values ('DK0019','NCC003','DV03','Escape','MP03','2016-01-24','2016-12-30',8)
insert into DANGKYCUNGCAP values ('DK0020','NCC002','DV03','Cerato','MP04','2016-05-03','2017-10-21',7)
insert into DANGKYCUNGCAP values ('DK0021','NCC006','DV01','Forte','MP02','2015-01-31','2016-12-30',9)
insert into DANGKYCUNGCAP values ('DK0022','NCC002','DV02','Cerato','MP04','2016-07-25','2017-12-30',6)
insert into DANGKYCUNGCAP values ('DK0023','NCC002','DV01','Forte','MP03','2017-11-30','2018-05-20',5)
insert into DANGKYCUNGCAP values ('DK0024','NCC003','DV03','Forte','MP04','2017-12-23','2019-11-30',8)
insert into DANGKYCUNGCAP values ('DK0025','NCC003','DV03','Hiace','MP02','2016-08-24','2017-11-25',1)

