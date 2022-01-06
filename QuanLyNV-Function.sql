use QuanLyNhanVien
go
-- Create Store Procedure
	create procedure SP_soLuongNV (@Phong varchar(20), @phai nvarchar(20)) 
	as
	select Count(*) as 'So Luong Nhan Vien Phong Ban'
	from NHANVIEN
	Where MaPhong = @Phong and Phai = @phai
	go

	--Execute
	exec SP_soLuongNV '4',N'Nữ'
	go
	select * from NHANVIEN where MaPhong = '4' and Phai = N'Nữ'
	go
-- Create Scalar Functions
	-- Hiển thị số lượng nhân viên ở mỗi phòng
	Create function fn_DemSoNV(@MaPhong varchar(20))
	returns int as
	begin 
		declare @ret int;
		select @ret = count(*) 
		from NHANVIEN
		where MaPhong = @MaPhong
		if (@ret is null)
			set @ret = 0;
	return @ret;
	end
	go
	--Excute
	select dbo.fn_DemSoNV('3') soluongNVPhongBan
	go
	--Hiển thị năm hiện tại của hệ thống trên máy Database server
	Create function dbo.getCurrentYear()
	Returns int 
	as
	begin
	return year(getdate())
	end 
	go
	--Excute
	select dbo.getCurrentYear()
	go

	--Hiển thị số ngày của tháng, năm do người dùng truyền vào tham số
	Create function dbo.numberDayInMonth(@thang int, @nam int)
	Returns int
	As
	Begin
		declare @ngay int
		if @thang = 2
		begin
			if((@nam % 4 = 0 and @nam % 10 <>0) or @nam % 400 = 0) 
				set @ngay = 29
			else set @ngay = 28
		end
		else 
		select @ngay = case @thang 
		when 1 then 31
		when 3 then 31
		when 5 then 31
		when 7 then 31
		when 8 then 31
		when 10 then 31
		when 12 then 31
		when 4 then 30
		when 6 then 30
		when 9 then 30
		when 11 then 30
		end
		return @ngay
	end
	go

	--Execute
	select dbo.numberDayInMonth (2,2016) 
	go
-- Create Table-Valued Functions
	--Hiển thị danh sách nhân viên ở mỗi phòng ban
	Create function fn_DanhsachNV(@MaPhong varchar(20))
	returns table as
	Return 
	(
		select * from NHANVIEN where MaPhong = @MaPhong
	)
	go
    --Excute
	select * from fn_DanhsachNV('5')
