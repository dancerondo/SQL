create table HOCSINH(
	Malop varchar(10),
	MaHS varchar(10) not null,
	TenHS varchar(20),
	NgaySinh date,
	NoiSinh varchar(20),
	DiaChi varchar(20),
	GioiTinh varchar(20),
	HoTenBo varchar(20),
	NgheNghiepBo varchar(20),
	HoTenMe varchar(20),
	NgheNghiepMe varchar(20),
	NamHoc varchar(20),
	TenKhoi varchar(20),
	primary key (MaHS)
)
insert into HOCSINH values ('L01','HS01','Trinh Tien','1993-01-11','Quang Nam','Da Nang','Nu','Trinh Thanh V','Giao Su','Phan Thi H','Bac Si','2011','CNTT'),
('L01','HS02','Pham Hong Thai','1993-02-22','Quang Ngai','Da Nang','Nam','Pham Hung','Giao Vien','Ly Kieu Vi','Giao Vien','2011','CNTT'),
('L01','HS03','Trinh Thanh Thao','1992-04-01','Da Nang','Da Nang','Nu','Trinh Thinh','Nha si','Phan Dien','Giao Vien','2011','TOAN'),
('L01','HS04','Ngo Hoai An','1992-11-11','Quang Binh','Da Nang','Nam','Ngo Quyen','Nghe nong','Pham Kieu Hoa','Noi Tro','2012','VAN'),
('L01','HS05','Ly Van Chieu','1993-03-08','Quang Nam','Da Nang','Nam','Ly Thai Nam','Nghe nong','Nguyen Hoa','Cong Nhan','2013','VAN')