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


insert into monhoc(tenmonhoc,sosession,diemdat,diemtoida)
values(N'Toán','20','4.5','10.0'),
	  (N'Văn','40','5.0','9.0'),
	  (N'Ngoại ngữ','60','4.5','10.0')

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
	  go
	  --Câu 1
	  create procedure SP1
		as
		update monhoc
		set sosession=sosession+4
		exec SP1

		go
	  -- Câu 2:
	  go
	  Create proc SP2 (@tenmh nvarchar(50), @soss int)
	  as
	  update monhoc
	  set sosession = sosession + @soss
	  where tenmonhoc = @tenmh

	  execute SP2 N'Ngoại ngữ',5
	  go
	  --Câu 3:
	  create proc SP3
	  as
	  select top 1 hoten, diemthi
	  from hocsinh join bangthi on hocsinh.mahs = bangthi.mahs
	  where ngaythi = '2007-9-24' 
	  order by diemthi desc
	 
	  exec SP3
	  -- Câu 4
	  go
	  create proc SP4(@tenmh nvarchar(50))
	  as
	  select top 1 hoten, diemthi
	  from hocsinh join bangthi on hocsinh.mahs = bangthi.mahs
	  where monhoc like @tenmh
	  order by diemthi desc

	  exec SP4 N'Ngoại ngữ'
	  go
	  -- Câu 5:
	  create proc SP5 as
	  select Count(*) as 'So hoc sinh thi rot Toan'
	  from monhoc join bangthi on monhoc.tenmonhoc = bangthi.monhoc
	  where tenmonhoc like N'Toán' and diemthi < diemdat 
	  go
	  -- Câu 6:
	  create proc SP6 (@tenmh nvarchar(120)) as
	  select Count(*) as 'SoHSThiDau'
	  from monhoc join bangthi on monhoc.tenmonhoc = bangthi.monhoc
	  where tenmonhoc like @tenmh and diemthi >= diemdat 
	  go

	  exec SP6 N'Ngoại ngữ'
	  go
	  -- Câu 7: 
	  create proc SP7
	  as
	  select * from hocsinh where hoten like 'T%'
	  go
	  -- Câu 8
	  create proc SP8 
	  as
	  delete from bangthi
	  where ngaythi = '2008-12-05'


	  exec SP8