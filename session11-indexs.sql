use QUANLYDIEM
go
--Clustered index la chi muc chinh, khong trung duoc gan cho khoa chinh
create clustered index idxMASV
ON sinhvien(masv)
--Nonclustered
create nonclustered index ix_email 
on sinhvien(email desc)
drop index ix_email on sinhvien

create nonclustered index ix_monhoc on
MONHOC(
	tenmon asc,
	sotiet desc
)
go
-- Cau select nay se nhanh hon
select * from sinhvien where email like '%@gmail%'
-- rebuild
alter index ix_monhoc on monhoc rebuild
-- reorganize;
alter index ix_monhoc on monhoc reorganize
