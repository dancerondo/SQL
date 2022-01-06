create database thi
create table loaihang
(
	maloaihang nvarchar(20) primary key not null,
	tenloaihang nvarchar(120) null
	)
create table khachhang
(
	makhachhang nvarchar(20) primary key not null,
	tencongty nvarchar(120) null,
	tengiaodich nvarchar(120) null,
	diachi nvarchar(120) null,
	email nvarchar(120) null,
	dienthoai nvarchar(120) null,
	fax nvarchar(120) null
	)
create table nhacungcap
(
	macongty nvarchar(20) primary key not null,
	tencongty nvarchar(120) null,
	tengiaodich nvarchar(120) null,
	diachi nvarchar(120) null,
	email nvarchar(120) null,
	dienthoai nvarchar(120) null,
	fax nvarchar(120) null
	)
create table mathang
(
	mahang nvarchar(20) primary key not null,
	tenhang nvarchar(120) null,
	macongty nvarchar(20) foreign key references nhacungcap(macongty) null,
	maloaihang nvarchar(20) foreign key references loaihang(maloaihang) null,
	soluong int null,
	donvitinh nvarchar(50) null,
	giahang money null
	)
create table nhanvien
(
	manhanvien nvarchar(20) primary key not null,
	ho nvarchar(120) null,
	ten nvarchar(120) null,
	ngaysinh datetime null,
	ngaylamviec datetime null,
	diachi nvarchar(120) null,
	dienthoai nvarchar(120) null,
	luongcoban nvarchar(120) null,
	phucap nvarchar(120) null
	)
create table dondathang
(
	sohoadon nvarchar(20) primary key not null,
	makhachhang nvarchar(20) foreign key references khachhang(makhachhang) null,
	manhanvien nvarchar(20) foreign key references nhanvien(manhanvien) null,
	ngaydathang datetime null,
	ngaygiaohang datetime null,
	ngaychuyenhang datetime null,
	noigiaohang nvarchar(120) null
	)
create table chitietdathang
(
	sohoadon nvarchar(20) foreign key references dondathang(sohoadon) not null,
	mahang nvarchar(20) foreign key references mathang(mahang) not null,
	giaban nvarchar(120) null,
	soluong int null,
	mucgiamgia float null,
	primary key(sohoadon,mahang)
	)
insert into loaihang(maloaihang,tenloaihang)
values('1',N'rice'),
	  ('2',N'fish'),
	  ('3',N'beef')
insert into khachhang(makhachhang,tencongty,tengiaodich,diachi,email,dienthoai,fax)
values('1',N'Company 1',N'Name 1',N'Hải Châu','abc@gmail.com','111222','111223'),
	  ('2',N'Company 2',N'Name 2',N'Hải Châu','abcd@gmail.com','111333','111334'),
	  ('3',N'Company 3',N'Name 3',N'Liên Chiểu','abcde@gmail.com','111444','111445'),
	  ('4',N'Company 4',N'Name 4',N'Hòa Khánh','abced@gmail.com','111555','111556')
insert into nhanvien(manhanvien,ho,ten,ngaysinh,ngaylamviec,diachi,dienthoai,luongcoban,phucap)
values('1',N'ho 1',N'nv 1','12-2-1990','4-28-2003',N'Hòa Hải','111233','120.000','12.000'),
	  ('2',N'ho 2',N'nv 2','1-20-1990','6-25-2005',N'Hòa Bắc','111250','150.000','20.000'),
	  ('3',N'ho 3',N'nv 3','10-20-1990','4-29-2003',N'An Hải','111233','200.000','25.000')
insert into nhacungcap(macongty,tencongty,tengiaodich,diachi,email,fax)
values('1',N'com 1',N'com 1.1',N'Đà nẵng','cde@gmail.com','112345'),
	  ('2',N'com 2',N'com 2.1',N'Đà nẵng','crf@gmail.com','112456')
insert into dondathang(sohoadon,makhachhang,manhanvien,ngaydathang,ngaygiaohang,ngaychuyenhang,noigiaohang)
values('5','1','1','8-12-2016','8-15-2016','8-13-2016',N'Quang Nam'),
	  ('1','1','2','6-12-2016','8-20-2016','8-15-2016',N'Quang Nam'),
	  ('3','2','1','8-12-2016','8-15-2016','8-13-2016',N'Quang Nam'),
	  ('2','1','3','8-12-2016','8-15-2016','8-13-2016',N'Quang Nam')
insert into mathang(mahang,tenhang,macongty,maloaihang,soluong,donvitinh,giahang)
values('1',N'rice','1','1','2',N'Cái','12.000'),
	  ('2',N'fish','2','1','5',N'Con','15.000'),
	  ('3',N'rice 2','1','2','9',N'thùng','25.000')
	  
insert into chitietdathang(sohoadon,mahang,giaban,soluong,mucgiamgia)
values('1','1','12.000','7','0.2'),
	  ('2','2','30.000','3','0.1'),
	  ('3','3','20.000','9','0.3')

--cau 1--DONE
insert into loaihang(maloaihang,tenloaihang)
values('GD01',N'electronic rice cooker Sharp COM-18V')

select *from loaihang

--cau 2--DONE
update dondathang
set ngaygiaohang='4-12-2015'
where sohoadon='5'

--cau 3
 
--cau 4--DONE
select mathang.tenhang,nhacungcap.tencongty
from nhacungcap
join mathang
on nhacungcap.macongty=mathang.macongty

--cau 5--DONE
select nhacungcap.tencongty,nhacungcap.diachi
from nhacungcap
join mathang
on nhacungcap.macongty=mathang.macongty
join loaihang
on loaihang.maloaihang=mathang.maloaihang
group by nhacungcap.tencongty,nhacungcap.diachi

--cau 6
select 
from khachhang
join 
