CREATE DATABASE CSDL_HE_LENH
GO
USE CSDL_HE_LENH
--Tạo bảng
GO
CREATE TABLE PhongBan(
	MaPB CHAR(10) PRIMARY KEY,
	TenPB NVARCHAR(50) NOT NULL
)
GO
CREATE TABLE NhanVien(
	MaNV CHAR(10) PRIMARY KEY,
	HoTen NVARCHAR(50),
	NgaySinh DATE,
	GioiTinh NVARCHAR(10) CHECK (GioiTinh IN ('Nam',N'Nữ')),
	Luong INT DEFAULT 5000000,
	MaNGS CHAR(10),
	MaPB CHAR(10) REFERENCES PhongBan(MaPB)
)
GO
ALTER TABLE PhongBan
ADD TrPhong CHAR(10),
NgayNhanChuc Date
GO
ALTER TABLE NhanVien
ADD DiaChi NVARCHAR(100)
GO
ALTER TABLE PhongBan
ADD CONSTRAINT FK_PhongBan_NhanVien
FOREIGN KEY (TrPhong)
REFERENCES NhanVien(MaNV),
CONSTRAINT DF_NgayNhanChuc
DEFAULT (GETDATE()) FOR NgayNhanChuc
GO
CREATE TABLE DeAn(
	MaDA CHAR(10) PRIMARY KEY,
	TenDA NVARCHAR(50),
	DD_DA NVARCHAR(100),
	MaPB CHAR(10) 
	CONSTRAINT FK_DeAn_PhongBan
	FOREIGN KEY(MaPB)
	REFERENCES PhongBan(MaPB)
)
GO
CREATE TABLE ThanNhan(
	MaNV CHAR(10) REFERENCES NhanVien(MaNV),
	TenTN NVARCHAR(50),
	NgaySinh DATE,
	GioiTinh NVARCHAR(10) CHECK (GioiTinh IN ('Nam',N'Nữ')),
	QuanHe NVARCHAR(50)
	CONSTRAINT PK_ThanNhan
	PRIMARY KEY (MaNV,TenTN)
)
GO
CREATE TABLE NV_DeAn(
	MaNV CHAR(10) CONSTRAINT FK_NVDeAn_NhanVien REFERENCES NhanVien(MaNV),
	MaDA CHAR(10) CONSTRAINT FK_NVDeAn_DeAn REFERENCES DeAn(MaDA),
	SoGio INT
	CONSTRAINT PK_NV_DeAn
	PRIMARY KEY (MaNV,MaDA)
)
GO
CREATE TABLE PhongBan_DD(
	MaPB CHAR(10) PRIMARY KEY,
	DiaDiem NVARCHAR(100)
)
GO
ALTER TABLE PhongBan_DD
ADD CONSTRAINT FK_PhongBanDD_PhongBan 
FOREIGN KEY (MaPB) 
REFERENCES PhongBan(MaPB)
--Insert dữ liệu
GO
INSERT INTO PhongBan(MaPB,TenPB,TrPhong,NgayNhanChuc)
VALUES ('PB0001',N'Phòng Ban Kinh Tế',NULl,'10/16/2005'),
('PB0002',N'Phòng Ban Tài Chính',NULl,'02/03/2007'),
('PB0003',N'Phòng Ban Kế Toán',NULl,'12/21/2006'),
('PB0004',N'Phòng Ban Nghiên Cứu',NULl,'11/03/2010'),
('PB0005',N'Phòng Ban Thuế',NULl,'05/19/2006'),
('PB0006',N'Phòng Ban IT',NULl,'03/23/2007'),
('PB0007',N'Phòng Ban Thiết Kế',NULl,'08/27/2008'),
('PB0008',N'Phòng Ban Chăm Sóc Khách Hàng',NULl,'09/10/2009'),
('PB0009',N'Phòng Ban Marketing',NULl,'03/08/2012'),
('PB0010',N'Phòng Ban Đối Ngoại',NULl,'10/20/2015')
GO
INSERT INTO NhanVien(MaNV,HoTen,NgaySinh,GioiTinh,Luong,DiaChi,MaNGS,MaPB)
VALUES ('NV0001',N'Hoàng Hùng Lâm','10/16/1997','Nam','9000000',N'Phú Thọ',NUll,'PB0001'),
('NV0002',N'Hoàng Thị Huyền Chi','02/02/1996',N'Nữ','10000000',N'Phú Thọ','NV0001','PB0001'),
('NV0003',N'Phùng Hoài Phương','08/03/1986','Nam','10000000',N'Việt Trì',NUll,'PB0002'),
('NV0004',N'Nguyễn Thị Hồng','07/13/1990',N'Nữ','10000000',N'Hà Nội',NUll,'PB0003'),
('NV0005',N'Lê Mạnh Hùng','08/25/1993','Nam','8000000',N'Hà Nội','NV0006','PB0003'),
('NV0006',N'Đinh Anh Đức','01/13/1993','Nam','10000000',N'Bắc Ninh',NUll,'PB0004'),
('NV0007',N'Lê Tuấn Anh','07/30/1995','Nam','10000000',N'Bắc Giang',NUll,'PB0005'),
('NV0008',N'Hoàng Thanh Tùng','01/20/1990','Nam','80000000',N'Thái Nguyên','NV0009','PB0006'),
('NV0009',N'Cao Tất Thắng','11/23/1995','Nam','10000000',N'Hà Nội',NUll,'PB0006'),
('NV0010',N'Lê Duy Khôi','02/26/1994','Nam','10000000',N'Bắc Ninh',NUll,'PB0007'),
('NV0011',N'Phùng Đức Cường','04/04/1994','Nam','9000000',N'Phú Thọ','NV0010','PB0007'),
('NV0012',N'Cao Hoàng Quang','10/20/1995','Nam','8000000',N'Phú Thọ','NV0013','PB0008'),
('NV0013',N'Bùi Thu Hà','02/03/1993',N'Nữ','10000000',N'Thái Nguyên',NUll,'PB0008'),
('NV0014',N'Nguyễn Phương Dung','04/06/1992',N'Nữ','9000000',N'Hài Phòng','NV0015','PB0009'),
('NV0015',N'Đinh Quang Hưởng','06/27/1991','Nam','10000000',N'Bắc Giang',NUll,'PB0009'),
('NV0016',N'Hà Thùy Linh','05/22/1990',N'Nữ','10000000',N'Hài Phòng',NUll,'PB0010'),
('NV0017',N'Nhữ Thu Thảo','01/18/1997',N'Nữ','80000000',N'Nghệ An','NV0016','PB0010'),
('NV0018',N'Trần Cảnh Hà','06/01/1989','Nam','90000000',N'Việt Trì','NV0003','PB0002'),
('NV0019',N'Nguyễn Nam Anh','11/21/1989','Nam','90000000',N'Thái Nguyên',NUll,'PB0001'),
('NV0020',N'Nguyễn Đức Huy','12/08/1994','Nam','80000000',N'Thanh Hóa',NUll,'PB0001')
GO
UPDATE PhongBan
SET TrPhong='NV0002'
WHERE MaPB='PB0001'
GO
UPDATE PhongBan
SET TrPhong='NV0003'
WHERE MaPB='PB0002'
GO
UPDATE PhongBan
SET TrPhong='NV0004'
WHERE MaPB='PB0003'
GO
UPDATE PhongBan
SET TrPhong='NV0006'
WHERE MaPB='PB0004'
GO
UPDATE PhongBan
SET TrPhong='NV0007'
WHERE MaPB='PB0005'
GO
UPDATE PhongBan
SET TrPhong='NV0009'
WHERE MaPB='PB0006'
GO
UPDATE PhongBan
SET TrPhong='NV0010'
WHERE MaPB='PB0007'
GO
UPDATE PhongBan
SET TrPhong='NV0013'
WHERE MaPB='PB0008'
GO
UPDATE PhongBan
SET TrPhong='NV0015'
WHERE MaPB='PB0009'
GO
UPDATE PhongBan
SET TrPhong='NV0016'
WHERE MaPB='PB0010'
GO
INSERT INTO ThanNhan(MaNV,TenTN,NgaySinh,GioiTinh,QuanHe)
VALUES ('NV0003',N'Phùng Đức Mạnh','02/02/2001','Nam','Cha-Con'),
('NV0003',N'Phùng Thị Trang','10/03/2000',N'Nữ','Cha-Con'),
('NV0004',N'Nguyễn Thu Phương','05/19/2002',N'Nữ',N'Mẹ-Con')
INSERT INTO ThanNhan(MaNV,TenTN,NgaySinh,GioiTinh)
VALUES ('NV0005',N'Lê Mạnh Hào','08/25/1993','Nam'),
('NV0006',N'Đinh Đức Trung','01/13/1993','Nam'),
('NV0007',N'Lê Tuấn Cường','07/30/1995','Nam'),
('NV0008',N'Hoàng Hưu Huyên','01/20/1990','Nam'),
('NV0009',N'Cao Xuân Tuấn','11/23/1995','Nam'),
('NV0010',N'Lê Đức Trọng','02/26/1994','Nam'),
('NV0011',N'Phùng Đức Huy','04/04/1994','Nam'),
('NV0013',N'Bùi Thu Trang','02/03/1993',N'Nữ'),
('NV0014',N'Nguyễn Phương Thảo','04/06/1992',N'Nữ'),
('NV0015',N'Đinh Đức Phong','06/27/1991','Nam'),
('NV0016',N'Hà Thu Thủy','05/22/1990',N'Nữ'),
('NV0018',N'Trần Cảnh Nam','06/01/1989','Nam'),
('NV0019',N'Nguyễn Hoài Nam','11/21/1989','Nam'),
('NV0020',N'Nguyễn Duy Khánh','12/08/1994','Nam')
GO
INSERT INTO PhongBan_DD(MaPB,DiaDiem)
VALUES ('PB0001',N'TP.Hà Nội'),
('PB0002',N'TP.Hà Nội'),
('PB0003',N'TP.Hồ Chí Minh'),
('PB0004',N'TP.Hồ Chí Minh'),
('PB0005',N'TP.Hồ Chí Minh'),
('PB0006',N'TP.Hà Nội'),
('PB0007',N'TP.Đà Nẵng'),
('PB0008',N'TP.Hà Nội'),
('PB0009',N'TP.Hồ Chí Minh'),
('PB0010',N'TP.Đà Nẵng')
GO
INSERT INTO DeAn(MaDA,TenDA,DD_DA,MaPB)
VALUES ('DA0001',N'Thúc Đẩy Phát Triển Kinh Tế Tỉnh Phú Thọ',N'Phú Thọ','PB0001'),
('DA0002',N'Đổi Mới Nền Kinh Tế Thị Trường 2018',N'Phú Thọ','PB0001'),
('DA0003',N'Đề án số 3',N'Việt Trì','PB0002'),
('DA0004',N'Đề án số 4',N'Hà Nội','PB0003'),
('DA0005',N'Đề án số 5',N'Hà Nội','PB0003'),
('DA0006',N'Đề án số 6',N'Bắc Ninh','PB0004'),
('DA0007',N'Đề án số 7',N'Bắc Giang','PB0005'),
('DA0008',N'Đề án số 8',N'Thái Nguyên','PB0006'),
('DA0009',N'Đề án số 9',N'Hà Nội','PB0006'),
('DA0010',N'Đề án số 10',N'Bắc Ninh','PB0007'),
('DA0011',N'Đề án số 11',N'Phú Thọ','PB0007'),
('DA0012',N'Đề án số 12',N'Phú Thọ','PB0008'),
('DA0013',N'Đề án số 13',N'Thái Nguyên','PB0008'),
('DA0014',N'Đề án số 14',N'Hài Phòng','PB0009'),
('DA0015',N'Đề án số 15',N'Bắc Giang','PB0009'),
('DA0016',N'Đề án số 16',N'Hài Phòng','PB0010'),
('DA0017',N'Đề án số 17',N'Nghệ An','PB0010'),
('DA0018',N'Đề án số 18',N'Việt Trì','PB0002'),
('DA0019',N'Đề án số 19',N'Thái Nguyên','PB0001'),
('DA0020',N'Đề án số 20',N'Thanh Hóa','PB0001')
GO
INSERT INTO NV_DeAn(MaNV,MaDA,SoGio)
VALUES ('NV0001',N'DA0001',7),
('NV0001',N'DA0002',5),
('NV0001',N'DA0020',3),
('NV0002',N'DA0002',5),
('NV0002',N'DA0020',3),
('NV0003',N'DA0003',5),
('NV0004',N'DA0004',6),
('NV0005',N'DA0004',6),
('NV0006',N'DA0006',6),
('NV0008',N'DA0008',8),
('NV0008',N'DA0009',8),
('NV0009',N'DA0008',8),
('NV0009',N'DA0009',8),
('NV0010',N'DA0010',3),
('NV0010',N'DA0011',3),
('NV0011',N'DA0010',3),
('NV0011',N'DA0011',3),
('NV0012',N'DA0012',5),
('NV0013',N'DA0013',5),
('NV0015',N'DA0014',6),
('NV0015',N'DA0015',6),
('NV0016',N'DA0016',4),
('NV0017',N'DA0016',4),
('NV0016',N'DA0017',4),
('NV0017',N'DA0017',4),
('NV0019',N'DA0020',3),
('NV0020',N'DA0020',3)

--Truy vấn dữ liệu
--Đưa ra danh sách nv là trưởng phòng
SELECT MaNV,HoTen,NV.MaPB,TenPB,PB.MaPB
FROM NhanVien NV, PhongBan PB
WHERE PB.TrPhong=NV.MaNV
--Đưa ra nhân viên là người giám sát
SELECT DISTINCT NV2.MaNV Ma_NGS,NV2.HoTen HoTen_NGS,NV2.MaPB 
FROM NhanVien NV1, NhanVien NV2
WHERE NV1.MaNGS=NV2.MaNV
--LEFT RIGHT FULL JOIN
SELECT MaNV,HoTen,PB.MaPB,TenPB
FROM NhanVien NV LEFT JOIN PhongBan PB
ON NV.MaPB=PB.MaPB
 
SELECT MaNV,HoTen,PB.MaPB,TenPB
FROM NhanVien NV RIGHT JOIN PhongBan PB
ON NV.MaPB=PB.MaPB

SELECT MaNV,HoTen,PB.MaPB,TenPB
FROM NhanVien NV FULL JOIN PhongBan PB
ON NV.MaPB=PB.MaPB

--
SELECT MaNV,HoTen
FROM NhanVien
WHERE MaNV IN ( SELECT TrPhong
				FROM PhongBan)
--Đưa ra nhân viên là trưởng phòng có tham gia dự án.Thông tin đưa ra gồm mã nhân viên, họ tên
SELECT NV.MaNV,HoTen
FROM NhanVien NV,PhongBan PB
WHERE NV.MaNV IN (	SELECT DISTINCT MaNV
					FROM NV_DeAn) 
AND NV.MaNV=PB.TrPhong 
--Đưa ra nhân viên là người giám sát có tham gia dự án
SELECT DISTINCT NV2.HoTen
FROM NhanVien NV1,NhanVien NV2
WHERE NV2.MaNV IN (	SELECT DISTINCT MaNV
					FROM NV_DeAn) 
AND NV1.MaNGS=NV2.MaNV 
--Đưa ra những nhân viên có lương lớn hơn lương của tất cả các nhân viên của Phòng Ban Kinh Tế
SELECT HoTen
FROM NhanVien
WHERE Luong > All (	SELECT Luong
					FROM NhanVien NV,PhongBan PB
					WHERE NV.MaPB=PB.MaPB AND TenPB=N'Phòng Ban Kinh Tế')
--Đưa ra những nhân viên có ít hơn một người thân
SELECT HoTen
FROM NhanVien
WHERE MaNV NOT IN (	SELECT MaNV
					FROM ThanNhan)
SELECT HoTen
FROM NhanVien NV
WHERE NOT EXISTS (SELECT * FROM ThanNhan TN WHERE NV.MaNV= TN.MaNV)

SELECT MaPB,COUNT(MaNV) AS SoNV
FROM NhanVien
GROUP BY MaPB
HAVING COUNT(MaNV)>=3

--Đếm số lượng nhân viên theo từng phòng ban đưa ra MaPB,TenPB,SLNV
SELECT NV.MaPB,TenPB,COUNT(MaNV) SLNV
FROM NhanVien NV,PhongBan PB
WHERE NV.MaPB=PB.MaPB
GROUP BY NV.MaPB,TenPB
--Đếm số dự án tham gia theo từng nhân viên thông tin đưa ra manv,TenNV và SLDA
SELECT NVDA.MaNV,HoTen,COUNT(MaDA) SLDA
FROM NhanVien NV,NV_DeAn NVDA
WHERE NV.MaNV=NVDA.MaNV
GROUP BY NVDA.MaNV,HoTen
--Đưa ra nhân viên có lương lớn nhất theo từng phòng ban mapb,tenpb,manv,tennv,luong
SELECT NV.MaPB,TenPB,MaNV,HoTen,Luong
FROM PhongBan PB,NhanVien NV,(	SELECT MaPB,MAX(Luong) MAXLUONG
								FROM NhanVien NV
								GROUP BY MaPB	) B
WHERE PB.MaPB=NV.MaPB AND Luong = B.MAXLUONG AND NV.MaPB=B.MaPB

SELECT PB.MaPB,TenPB,NV.MaNV,HoTen,Luong
FROM NhanVien NV JOIN PhongBan PB ON NV.MaPB=PB.MaPB JOIN
( SELECT MaPB,MAX(Luong) LuongMax
	FROM NhanVien
	GROUP BY MaPB) NEWTB ON NEWTB.MaPB=NV.MaPB 
WHERE NV.Luong=NEWTB.LuongMax
--Đưa ra pb có đông nhân viên nhất
SELECT MaPB
FROM NhanVien
GROUP BY MaPB
HAVING COUNT(MaNV)= ALL(SELECT TOP(1) WITH TIES *
						FROM (	SELECT COUNT(MaNV) SLNV
								FROM NhanVien
								GROUP BY MaPB
								) NewTB
						ORDER BY SLNV DESC)
SELECT MaPB
FROM NhanVien
GROUP BY MaPB
HAVING COUNT(MaNV)= ALL(SELECT MAX(SLNV)
						FROM (	SELECT COUNT(MaNV) SLNV
								FROM NhanVien
								GROUP BY MaPB
								) NewTB)