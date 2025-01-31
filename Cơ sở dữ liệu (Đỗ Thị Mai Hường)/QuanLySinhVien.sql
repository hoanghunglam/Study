﻿CREATE DATABASE QuanLySinhVien
GO
USE QuanLySinhVien
--Tạo Bảng
GO
CREATE TABLE SinhVien(
	MaSV CHAR(6) CONSTRAINT PK_SinhVien PRIMARY KEY,
	HoTen NVARCHAR(50) NOT NULL,
	NgaySinh DATE,
	GioiTinh BIT,
	QueQuan NVARCHAR(100),
	SDT VARCHAR(50),
	MaLop CHAR(6)
)
GO
CREATE TABLE GiaoVien(
	MaGV CHAR(6) CONSTRAINT PK_GiaoVien PRIMARY KEY,
	TenGV NVARCHAR(60) NOT NULL,
	SDT VARCHAR(50),
	MaBM CHAR(6)
)
GO
CREATE TABLE Lop(
	MaLop CHAR(6) CONSTRAINT PK_Lop PRIMARY KEY,
	TenLop NVARCHAR(50) NOT NULL,
	MaLopTruong CHAR(6) CONSTRAINT FK_Lop_SinhVien REFERENCES SinhVien(MaSV),
	MaGVCN CHAR(6) CONSTRAINT FK_Lop_GiaoVien REFERENCES GiaoVien(MaGV)
)
GO
CREATE TABLE BoMon(
	MaBM CHAR(6) CONSTRAINT PK_BoMon PRIMARY KEY,
	TenBM NVARCHAR(50) NOT NULL,
	MaCNBM CHAR(6) CONSTRAINT FK_BoMon_GiaoVien REFERENCES GiaoVien(MaGV)
)
GO
CREATE TABLE HocPhan(
	MaHP CHAR(6) CONSTRAINT PK_HocPhan PRIMARY KEY,
	TenHP NVARCHAR(50) NOT NULL,
	SoTC INT,
	MaBM CHAR(6) CONSTRAINT FK_HocPhan_BoMon REFERENCES BoMon(MaBM)
)
GO
CREATE TABLE LopHocPhan(
	MaLHP CHAR(6) CONSTRAINT PK_LopHocPhan PRIMARY KEY,
	DiaDiemTCHP NVARCHAR(50),
	HocKy INT,
	SLSV INT,
	MaHP CHAR(6) CONSTRAINT FK_LopHocPhan_HocPhan REFERENCES HocPhan(MaHP)
)
GO
ALTER TABLE LopHocPhan
ADD NamHoc INT
GO
CREATE TABLE BangDiem(
	MaSV CHAR(6) CONSTRAINT FK_BangDiem_SinhVien REFERENCES SinhVien(MaSV),
	MaLHP CHAR(6) CONSTRAINT FK_BangDiem_LopHocPhan REFERENCES LopHocPhan(MaLHP),
	DiemTX FLOAT,
	DiemCC FLOAT,
	DiemThi FLOAT,
	DiemTong FLOAT,
	GhiChu NVARCHAR(50),
	CONSTRAINT PK_BangDiem
	PRIMARY KEY (MaSV,MaLHP)
)
GO
CREATE TABLE GiaoVien_LopHocPhan(
	MaGV CHAR(6) CONSTRAINT FK_GV_LHP REFERENCES GiaoVien(MaGV),
	MaLHP CHAR(6) CONSTRAINT FK_LHP_GV REFERENCES LopHocPhan(MaLHP),
	SoTiet INT,
	CONSTRAINT PK_GV_LHP
	PRIMARY KEY (MaGV,MaLHP)
)
GO
ALTER TABLE SinhVien
ADD CONSTRAINT FK_SinhVien_Lop
FOREIGN KEY (MaLop)
REFERENCES Lop(MaLop)
GO
ALTER TABLE GiaoVien
ADD CONSTRAINT FK_GiaoVien_BoMon
FOREIGN KEY (MaBM)
REFERENCES BoMon(MaBM)
--Thêm Dữ Liệu Vào Bảng
GO
INSERT INTO Lop(MaLop,TenLop)
VALUES ('CNPM',N'Công nghệ phần mềm'),
('CNTT',N'Công nghệ thông tin'),
('HTTT',N'Hệ thống thông tin'),
('MMT',N'Mạng máy tính')
GO
INSERT INTO BoMon(MaBM,TenBM)
VALUES ('ATTT',N'An toàn thông tin'),
('CNM',N'Công nghệ mạng'),
('CNPM',N'Công nghệ phần mềm'),
('HTTT',N'Hệ thống thông tin'),
('KHMT',N'Khoa học máy tính')
GO 
INSERT INTO SinhVien(MaSV,HoTen,NgaySinh,GioiTinh,QueQuan,SDT,MaLop)
VALUES ('SV0001',N'Hoàng Hùng Lâm','1997-10-16','1',N'Phú Thọ','0981790836','MMT'),
('SV0002',N'Nguyễn Phương Dung','1997-03-22','0',N'Bắc Giang','0981123456','CNTT'),
('SV0003',N'Phùng Đức Cường','1997-05-25','1',N'Hà Nội','0981456789','HTTT'),
('SV0004',N'Nguyễn Mạnh Hùng','1997-10-20','1',N'Thái Nguyên','0987456789','HTTT'),
('SV0005',N'Bùi Thị Thu Hà','1997-02-02','0',N'Phú Thọ','0987654000','CNPM'),
('SV0006',N'Vũ Công Minh','1996-02-02','1',N'Thanh Hóa','0987654001','CNTT'),
('SV0007',N'Phạm Huy Tùng','1997-10-21','1',N'Thái Nguyên','0987654002','CNTT'),
('SV0008',N'Phan Văn Hải','1993-10-21','1',N'Bắc Ninh','0987654003','CNTT'),
('SV0009',N'Nguyễn Tuấn Anh','1994-10-21','1',N'Thanh Hóa','0987654004','HTTT'),
('SV0010',N'Nguyễn Thị Lan','1997-01-21','0',N'Thái Nguyên','0981790835','HTTT'),
('SV0011',N'Phạm Tiến Thành','1995-10-22','1',N'Bắc Giang','0981790834','CNPM'),
('SV0012',N'Lê Mạnh Hùng','1995-08-22','1',N'Hà Nội','0981790833','CNPM'),
('SV0013',N'Nguyễn Mỹ Hạnh','1995-10-30','0',N'Nghệ An','0981456788','CNPM'),
('SV0014',N'Lê Duy Khôi','1997-04-22','1',N'Hà Nội','0981456777','MMT'),
('SV0015',N'Phùng Thị Trang','1997-06-06','0',N'Thái Nguyên','0981456767','MMT'),
('SV0016',N'Nguyễn Tùng Lâm','1997-04-04','1',N'Hà Nội','0981456757','MMT'),
('SV0017',N'Lê Thị Trang','1997-04-20','0',N'Bắc Ninh','0981456759','HTTT'),
('SV0018',N'Lê Thị Hải Yến','1997-05-21','0',N'Hà Nội','0981123454','CNPM'),
('SV0019',N'Nguyễn Quốc Tuấn','1997-05-01','1',N'Nghệ An','0981123453','CNTT'),
('SV0020',N'Hà Thị Thu Hương','1997-07-15','0',N'Hải Phòng','0981123452','MMT')
GO
INSERT INTO GiaoVien(MaGV,TenGV,SDT,MaBM)
VALUES ('GV0001',N'Nguyễn Văn Giang','0987654321','HTTT'),
('GV0002',N'Trần Hồng Quang','0987123456','ATTT'),
('GV0003',N'Ngô Hữu Phúc','0987654123','KHMT'),
('GV0004',N'Phan Nguyên Hải','0987321456','CNPM'),
('GV0005',N'Lưu Hồng Dũng','0123456789','CNM'),
('GV0006',N'Tạ Minh Thanh','0123987654','CNM'),
('GV0007',N'Nguyễn Việt Dũng','0123987456','ATTT'),
('GV0008',N'Hoa Tất Thắng','0123456987','HTTT'),
('GV0009',N'Nguyễn Thùy Linh','0987654126','KHMT'),
('GV0010',N'Nguyễn Văn Việt','0964321456','HTTT'),
('GV0011',N'Tạ Quang Bửu','0123456789','HTTT'),
('GV0012',N'Lý Thường Kiệt','0123456788','ATTT'),
('GV0013',N'Hoàng Hoa Thám','0123456787','ATTT'),
('GV0014',N'Lê Đức Cảnh','0123456786','KHMT'),
('GV0015',N'Trần Cung','0123456785','KHMT'),
('GV0016',N'Hoàng Quốc Việt','0123456784','CNM'),
('GV0017',N'Nguyễn Chí Thanh','0123456783','CNM'),
('GV0018',N'Nguyễn Khánh Toàn','0123456782','CNPM'),
('GV0019',N'Trần Đại Nghĩa','0123456798','CNPM'),
('GV0020',N'Đại Cồ Việt','0986916196','CNPM')
GO
INSERT INTO HocPhan(MaHP,TenHP,SoTC,MaBM)
VALUES ('HP0001',N'Kỹ thuật lập trình',3,'HTTT'),
('HP0002',N'Ngôn ngữ lập trình',3,'KHMT'),
('HP0003',N'Xây dựng, quản trị và bảo trì hệ thống',3,'ATTT'),
('HP0004',N'Lý thuyết thông tin',3,'CNM'),
('HP0005',N'Thực tập nhóm',4,'CNPM'),
('HP0006',N'Lập trình cơ bản',2,'HTTT'),
('HP0007',N'Công nghệ phần mềm',3,'CNPM'),
('HP0008',N'Đảm bảo an toàn thông tin',4,'ATTT'),
('HP0009',N'Thực tập cơ sở dữ liệu',3,'KHMT'),
('HP0010',N'Lý thuyết hệ điều hành',3,'KHMT'),
('HP0011',N'Kinh tế công nghiệp',2,'KHMT'),
('HP0012',N'Lập trình assembly',2,'HTTT'),
('HP0013',N'Mạng viễn thông',3,'CNM'),
('HP0014',N'Mạng máy tính',4,'CNM'),
('HP0015',N'Công nghệ web',3,'KHMT'),
('HP0016',N'Phân tích và thiết kế giải thuật',3,'HTTT'),
('HP0017',N'Cơ sở dữ liệu',4,'KHMT'),
('HP0018',N'Thực tập kỹ thuật lập trình',3,'HTTT'),
('HP0019',N'Công nghệ lập trình tích hợp',2,'CNM'),
('HP0020',N'An ninh mạng',3,'ATTT')
GO
INSERT INTO LopHocPhan(MaLHP,DiaDiemTCHP,HocKy,MaHP)
VALUES ('LHP001','H9301',3,'HP0001'),
('LHP002','H9303',3,'HP0001'),
('LHP003','H5202',3,'HP0002'),
('LHP004','H9201',6,'HP0003'),
('LHP005','H9202',6,'HP0003'),
('LHP006','H9303',5,'HP0004'),
('LHP007','H9401',6,'HP0005'),
('LHP008','H9402',6,'HP0005'),
('LHP009','H9403',6,'HP0005'),
('LHP010','H5201',2,'HP0006'),
('LHP011','H5202',2,'HP0006'),
('LHP012','H5203',3,'HP0007'),
('LHP013','H5403',6,'HP0008'),
('LHP014','H5503',4,'HP0009'),
('LHP015','H5502',4,'HP0009'),
('LHP016','H9303',5,'HP0010'),
('LHP017','H9301',5,'HP0010'),
('LHP018','H5203',3,'HP0011'),
('LHP019','H9401',5,'HP0012'),
('LHP020','H9403',5,'HP0012'),
('LHP021','H9303',6,'HP0013'),
('LHP022','H9203',4,'HP0014'),
('LHP023','H5507',4,'HP0015'),
('LHP024','H5508',4,'HP0015'),
('LHP025','H5309',5,'HP0015'),
('LHP026','H9501',5,'HP0016'),
('LHP027','H5202',4,'HP0017'),
('LHP028','H9502',3,'HP0018'),
('LHP029','H9503',6,'HP0019'),
('LHP030','H5507',7,'HP0020')
GO
INSERT INTO BangDiem(MaSV,MaLHP,DiemTX,DiemCC,DiemThi,DiemTong,GhiChu)
VALUES ('SV0001','LHP001',8,8,8,8,N'Đạt'),
('SV0001','LHP003',8,7,9,8.5,N'Đạt'),
('SV0001','LHP004',7,7,6,6.4,N'Đạt'),
('SV0001','LHP006',7,7,3.5,4.9,N'Không Đạt'),
('SV0001','LHP007',8,5,6,6,N'Đạt'),
('SV0002','LHP002',7,7,5,5.6,N'Đạt'),
('SV0002','LHP003',8,7,9,8.5,N'Đạt'),
('SV0002','LHP005',7,7,6,6.4,N'Đạt'),
('SV0002','LHP008',7,7,6.5,6.7,N'Đạt'),
('SV0003','LHP001',8,8,8.5,8.3,N'Đạt'),
('SV0003','LHP003',8,7,6,6.4,N'Đạt'),
('SV0003','LHP004',6,7,6,6.3,N'Đạt'),
('SV0003','LHP007',7,7,4,5.2,N'Đạt'),
('SV0004','LHP002',8,8,8,8,N'Đạt'),
('SV0004','LHP003',8,4,3,3.8,N'Không Đạt'),
('SV0004','LHP005',7,7,7,7,N'Đạt'),
('SV0004','LHP008',6,7,8.5,7.8,N'Đạt'),
('SV0005','LHP001',4,4,5.5,4.9,N'Đạt'),
('SV0005','LHP003',6,5,6,5.7,N'Đạt'),
('SV0005','LHP005',5,6,6.5,6.2,N'Đạt'),
('SV0005','LHP009',8,7.5,9.5,8.75,N'Đạt'),
('SV0006','LHP003',9,10,7.5,8.4,N'Đạt'),
('SV0007','LHP003',7,8.4,5,5,N'Đạt'),
('SV0008','LHP002',7,7,6.5,6.7,N'Đạt'),
('SV0009','LHP005',10,10,9,9.4,N'Đạt'),
('SV0010','LHP002',8,8,8,8,N'Đạt'),
('SV0011','LHP003',8,4,3,3,N'Không Đạt'),
('SV0012','LHP007',9,6,5,5.7,N'Đạt'),
('SV0013','LHP006',8,5,6,6,N'Đạt'),
('SV0014','LHP003',10,0,4,3.8,N'Không Đạt'),
('SV0015','LHP001',8,5,7,6.5,N'Đạt'),
('SV0016','LHP001',6,6,5,5.4,N'Đạt'),
('SV0017','LHP003',7,6,4.5,5.2,N'Đạt'),
('SV0018','LHP007',7,7,6,6.4,N'Đạt'),
('SV0019','LHP006',9,9,8,8.4,N'Đạt'),
('SV0020','LHP002',9,6,5,5.7,N'Đạt')
GO
INSERT INTO GiaoVien_LopHocPhan(MaGV,MaLHP,SoTiet)
VALUES ('','',15)
--Cập nhật dữ liệu cho 2 bảng Lop và BoMon
GO
UPDATE Lop
SET MaLopTruong='SV0005',MaGVCN='GV0004'
WHERE MaLop='CNPM'
GO
UPDATE Lop
SET MaLopTruong='SV0002',MaGVCN='GV0007'
WHERE MaLop='CNTT'
GO
UPDATE Lop
SET MaLopTruong='SV0003',MaGVCN='GV0001'
WHERE MaLop='HTTT'
GO
UPDATE Lop
SET MaLopTruong='SV0001',MaGVCN='GV0005'
WHERE MaLop='MMT'
GO
UPDATE BoMon
SET MaCNBM='GV0007'
WHERE MaBM='ATTT'
GO
UPDATE BoMon
SET MaCNBM='GV0006'
WHERE MaBM='CNM'
GO
UPDATE BoMon
SET MaCNBM='GV0004'
WHERE MaBM='CNPM'
GO
UPDATE BoMon
SET MaCNBM='GV0008'
WHERE MaBM='HTTT'
GO
UPDATE BoMon
SET MaCNBM='GV0003'
WHERE MaBM='KHMT'
--Cập nhật số lượng sinh viên cho lớp học phần
GO
CREATE PROC UpdateSLSVChoLHP(@MaLHP CHAR(6),@SLSV INT)
AS
	BEGIN
		UPDATE LopHocPhan
		SET SLSV=@SLSV
		WHERE MaLHP=@MaLHP
	END
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP001',@SLSV=75
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP002',@SLSV=80
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP003',@SLSV=80
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP004',@SLSV=60
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP005',@SLSV=65
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP006',@SLSV=90
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP007',@SLSV=81
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP008',@SLSV=75
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP009',@SLSV=85
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP010',@SLSV=110
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP011',@SLSV=92
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP012',@SLSV=75
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP013',@SLSV=80
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP014',@SLSV=62
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP015',@SLSV=45
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP016',@SLSV=58
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP017',@SLSV=42
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP018',@SLSV=45
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP019',@SLSV=56
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP020',@SLSV=60
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP021',@SLSV=60
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP022',@SLSV=80
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP023',@SLSV=90
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP024',@SLSV=88
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP025',@SLSV=76
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP026',@SLSV=70
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP027',@SLSV=65
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP028',@SLSV=69
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP029',@SLSV=95
GO
EXEC UpdateSLSVChoLHP @MaLHP='LHP030',@SLSV=115