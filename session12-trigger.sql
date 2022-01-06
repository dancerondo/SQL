use QUANLYDIEM
go
create trigger check_mark_LT on diem
for insert as
if (select LYTHUYET from inserted) >20 or 
	(select LYTHUYET from inserted) < 0
begin
	print 'DIEM KHONG HOP LE'
	rollback
end
go
insert into DIEM values('CP001','PS',30,30)
-- Trigger update
go
create trigger tg_updateID on sinhvien
for update as
if UPDATE(MASV) -- neu du lieu update la masv
begin
	print 'Khong the update ma sinh vien'
	rollback transaction
end
--
update sinhvien set MASV='CP02' where MASV='CP001'
go
create trigger tg_update_mark on diem
for update as
if (select lythuyet from inserted) > 20 or
	(select lythuyet from inserted) < 0
begin
	print 'KHong the update diem khong hop le'
	rollback
end
update diem set LYTHUYET = 40 where MASV = 'CP001' 
			and MAMON = 'PC'
go
-- Delete trigger
drop trigger tg_delete_sinhvien 
go
create trigger tg_delete_sinhvien on sinhvien
for delete as
if  (select count(masv) from diem where masv IN (select MASV from deleted))>0
begin
	print 'du lieu sinh vien nay van con, khong the xoa'
	rollback
end
-- 
go
create trigger tgdelele_sinhvein on  sinhvien
for delete as
if 'CP009' in(select MASV from deleted)
begin
print 'Khong the xoa sinh vien nay'
rollback
end
delete from sinhvien where MASV = 'CP009'

select count(masv) from diem where masv IN ('CP009')