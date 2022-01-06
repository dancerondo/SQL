create database CUS_PROPERTY

create table Customer
(
	CNo varchar(10) primary key,
	CName varchar(50) NOT NULL,
	Tel varchar(12),
	CAddress varchar(150) 
)

create table Owners
(
	OwnerNo varchar(10) primary key,
	OName varchar(50) NOT NULL,
	OTel varchar(12),
	OAddress varchar(150) 
)

create table Property
(
	Property_No varchar(10) primary key,
	Paddress varchar(150) NOT NULL,
	RentPrice int check(RentPrice>=0) NOT NULL,
	OwnerNo varchar(10) references Owners(OwnerNo) NOT NULL
)

create table Rental
(
	CNo varchar(10)references Customer(CNo),
	Property_No varchar(10)references Property(Property_No),
	RentStart Datetime default(getDate()) NOT NULL,
	RentFinish Datetime,
	primary key(CNo,Property_No, RentStart),
	check(RentFinish>=RentStart) 
)

alter table Rental add constraint C_constraint check(RentFinish>=RentStart) 

insert into Customer values('K001','Bui Anh Tuan','01228168868','02 Tran Hung Dao street, 3 Dist, HCM City')
insert into Customer values('K002','Tieu Chau Nhu Quynh','0989123999','138 Nguyen Hue street, 1 Dist, HCM City')
insert into Customer values('K003','Le Pham Xuan Nghi','0903288988','33 Huynh Thuc Khang street, Ninh Kieu Dist, CanTho City')
insert into Customer values('K004','Phan Ngoc Luan','0918776677','89 Hoang Hoa Tham street, CaMau City')
insert into Customer values('K005','Nguyen Huong Tram','01228979678','10 Ly Thuong Kiet street, DaNang City')

insert into Owners values('W001','Nguyen Thu Minh','0909123555','15 Ly Tu Trong street, NinhKieu Dist, CanTho City')
insert into Owners values('W002','Tran Lap','0939555999','99 Vo Van Kiet street, 5 Dist, HCM City')
insert into Owners values('W003','Ho Ngoc Ha','0989272727','65 Nguyen Van Cu street, HaNoi City')
insert into Owners values('W004','Dam Vinh Long','0939168999','68 Dinh Tien Hoang street, DaNang City')

insert into Property values('P001','6 Nguyen Hue, HCM City',350,'W001')
insert into Property values('P002','7 Nguyen Hue, HCM City',250,'W001')
insert into Property values('P003','14 Nguyen Hue, HCM City',400,'W001')
insert into Property values('P004','5 Lac Long Quan, HCM City',450,'W002')
insert into Property values('P005','89 Nguyen Thai Hoc, CanTho City',300,'W002')
insert into Property values('P006','66 Nguyen Khuyen Quang Tri, DaNang City',400,'W003')
insert into Property values('P007','67 Tran Binh Trong Quang Ngai, DaNang City',300,'W003')
insert into Property values('P008','02 Hang Trong, HaNoi City',500,'W004')
insert into Property values('P009','05 Hang Dong, HaNoi City',450,'W004')
insert into Property values('P010','17 Hoa Binh, CanTho City',350,'W004')

insert into Rental values('K001','P001','09/20/2012','11/20/2012')
insert into Rental values('K001','P002','09/20/2012','11/20/2012')
insert into Rental values('K002','P003','02/10/2012','05/10/2012')
insert into Rental values('K002','P005','06/20/2012','10/20/2012')
insert into Rental values('K003','P004','01/01/2012','01/01/2013')
insert into Rental values('K003','P006','03/15/2012','07/20/2012')
insert into Rental values('K003','P005','10/30/2012','05/30/2013')
insert into Rental values('K004','P007','02/15/2012','08/15/2013')
insert into Rental values('K004','P009','12/20/2012','12/20/2013')
insert into Rental values('K005','P008','09/20/2012','11/20/2012')
insert into Rental values('K005','P003','06/15/2012','12/15/2013')

