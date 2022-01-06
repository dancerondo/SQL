--TAO CSDL CUS_PROPERTY
CREATE DATABASE CUS_PROPERTY_DB
USE CUS_PROPERTY_DB
GO
--TAO BANG CUSTOMER
CREATE TABLE CUSTOMER(
CNo varchar(10) NOT NULL,
CName varchar(50) NOT NULL,
Tel varchar(12),
CAddress varchar(150)
CONSTRAINT CUSTOMER_PK_CUSTOMER PRIMARY KEY(CNo)
)
--TAO BANG OWNERS
CREATE TABLE OWNERS(
OwnerNo varchar(10) NOT NULL,
OName varchar(50) NOT NULL,
OTel varchar(12),
OAddress varchar(150)
CONSTRAINT OWNER_PK PRIMARY KEY(OwnerNo),
)
--TAO BANG PROPERTY
CREATE TABLE PROPERTY(
Property_No varchar(10) NOT NULL,
Paddress varchar(150) NOT NULL,
RentPrice int NOT NULL,
OwnerNo varchar(10) NOT NULL,
CONSTRAINT PROPERTY_PK PRIMARY KEY(Property_No),
CONSTRAINT PROPERTY_FK_OWNERS FOREIGN KEY(OwnerNo) REFERENCES OWNERS(OwnerNo),
)

--TAO BANG RENTAL
CREATE TABLE RENTAL(
CNo varchar(10) NOT NULL,
Property_No varchar(10) NOT NULL,
RentStart datetime NOT NULL,
RentFinish datetime NOT NULL,
CONSTRAINT RENTAL_PK PRIMARY KEY (CNo,Property_No,RentStart),
CONSTRAINT RENTAL_FK_CUSTOMER FOREIGN KEY (CNo) REFERENCES CUSTOMER(CNo),
CONSTRAINT RENTAL_FK_PROPERTY FOREIGN KEY (Property_No) REFERENCES PROPERTY(Property_No)
)

--CHEN DU LIEU VAO CAC BANG
-- CUSTOMER
insert into Customer values('K001','Bui Anh Tuan','01228168868','02 Tran Hung Dao street, 3 Dist, HCM City')
insert into Customer values('K002','Tieu Chau Nhu Quynh','0989123999','138 Nguyen Hue street, 1 Dist, HCM City')
insert into Customer values('K003','Le Pham Xuan Nghi','0903288988','33 Huynh Thuc Khang street, Ninh Kieu Dist, CanTho City')
insert into Customer values('K004','Phan Ngoc Luan','0918776677','89 Hoang Hoa Tham street, CaMau City')
insert into Customer values('K005','Nguyen Huong Tram','01228979678','10 Ly Thuong Kiet street, DaNang City')

--OWNERS
insert into Owners values('W001','Nguyen Thu Minh','0909123555','15 Ly Tu Trong street, NinhKieu Dist, CanTho City')
insert into Owners values('W002','Tran Lap','0939555999','99 Vo Van Kiet street, 5 Dist, HCM City')
insert into Owners values('W003','Ho Ngoc Ha','0989272727','65 Nguyen Van Cu street, HaNoi City')
insert into Owners values('W004','Dam Vinh Long','0939168999','68 Dinh Tien Hoang street, DaNang City')

--PROPERTY
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

--RENTAL
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

--a. Tạo View tên cus_rental_vw dựa trên thông tin từ bảng Customer và Rental. Bao gồm những thông tin trong View được đưa ra dưới đây:
--CNO, CName, Property_No, Rentstart, RentFinish:

CREATE VIEW CUS_RENTAL_VW 
AS
SELECT CUSTOMER.CNo,CUSTOMER.CName,RENTAL.Property_No,RENTAL.Rentstart,RENTAL.RentFinish
FROM CUSTOMER JOIN RENTAL ON CUSTOMER.CNo = RENTAL.CNo


--b. Hiển thị tất cả các dữ liệu trong View trên. Hiển thị chỉ top 3 trong View sắp xếp theo tên của khách hàng theo thứ tự bảng chữ cái.
SELECT * FROM CUS_RENTAL_VW
SELECT TOP 3 * 
FROM CUS_RENTAL_VW
ORDER BY CName 

--c. Thay đổi với yêu cầu rằng Property_No không còn có thể nhìn thấy trong View.
ALTER VIEW CUS_RENTAL_VW 
AS
SELECT CUSTOMER.CNo,CUSTOMER.CName,RENTAL.RentStart,RENTAL.RentFinish
FROM CUSTOMER JOIN RENTAL ON CUSTOMER.CNo = RENTAL.CNo

SELECT* FROM CUS_RENTAL_VW

--d. Cuối cùng, giả định rằng View không quản lý hữu ích và nhiều người đã không được sử dụng nó. Hãy xóa View trên.
DROP VIEW CUS_RENTAL_VW
SELECT * FROM CUS_RENTAL_VW

--e. Tạo View tên IX_Propertyinfo chứa PropertyNo, PAddress, Rentprice, OwnerNo cột của bảng tài sản. Xem toàn bộ dữ liệu View này.
CREATE VIEW IX_Propertyinfo 
AS
SELECT PROPERTY.Property_No,PROPERTY.PAddress,PROPERTY.Rentprice,OWNERS.OWnerNo
FROM PROPERTY JOIN OWNERS ON PROPERTY.OwnerNo = OWNERS.OwnerNo

SELECT * FROM IX_PROPERTYINFO
--g. Tạo view có tên property_vw, hiển thị tất cả tài sản Property mà có giá thuê  RentPrice trên 300.
--View sẽ cần phải kiểm tra tính toàn vẹn miền bằng cách sử dụng 'WITH CHECK OPTION'
CREATE VIEW Property_vw 
AS
SELECT *
FROM PROPERTY
WHERE PROPERTY.RentPrice > 300
WITH CHECK OPTION
SELECT * FROM Property_vw
DROP VIEW Property_vw
--h. Sửa đổi View product_vw như sau:
-- Chèn một tài sản Property vào View với giá thuê là 370 với thông tin như sau :
'P011', '15 Chau Van Liem street, 2 dist, HCM city', 370, 'W002' 
INSERT INTO Property_vw VALUES('P011','15 Chau Van Liem Street,2 dist,HCM city',370,'w002')
SELECT * FROM Property_vw
- Cập nhật giá cho thuê tài sản RentPrice với id 'P011' thành 250.
UPDATE Property_vw
SET RentPrice = 550
WHERE Property_No = 'P011'

