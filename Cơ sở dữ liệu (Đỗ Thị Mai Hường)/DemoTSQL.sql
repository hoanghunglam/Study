DECLARE @LuongLN INT,@LuongNN INT,@TongLuong INT,@Test INT
SET @Test=1
SELECT @LuongLN=MAX(Luong),@LuongNN=MIN(Luong),@TongLuong=SUM(Luong)
FROM NhanVien
WHERE MaPB='PB0001'
PRINT N'Lương LN là ' + CONVERT(VARCHAR,@LuongLN)
PRINT N'Lương NN là ' + CONVERT(VARCHAR(10),@LuongNN)
PRINT N'Tổng lương là ' + CAST(@TongLuong AS VARCHAR)
PRINT @Test

INSERT INTO NhanVien(MaNV,HoTen,MaPB,MaNGS,GioiTinh,Luong)
SELECT MaNV,HoTen,MaPB,MaNGS, iff(GioiTinh = 1, 'Nam',N'Nữ'),Luong
FROM NhanVien
SELECT MaNV,HoTen,MaPB,MaNGS, (CASE WHEN GioiTinh = 1 THEN 'Nam' ELSE N'Nữ' END),Luong
FROM NhanVien

CREATE PROC ThemNhanVien(@MaNV CHAR(10),@HoTen NVARCHAR(50),@MaPB CHAR(10),@MaNGS CHAR(10),@GioiTinh BIT,@Luong INT)
AS
BEGIN
	INSERT INTO NhanVien(MaNV,HoTen,MaPB,MaNGS,GioiTinh,Luong)
	SELECT @MaNV,@HoTen,@MaPB,@MaNGS, (CASE WHEN GioiTinh = 1 THEN 'Nam' ELSE N'Nữ' END),@Luong
	FROM NhanVien
END 

CREATE PROCEDURE XemLuong_30
AS
	BEGIN
		DECLARE @LuongLN INT,@LuongNN INT,@TongLuong INT,@Test INT
		SELECT @LuongLN=MAX(Luong),@LuongNN=MIN(Luong),@TongLuong=SUM(Luong)
		FROM NhanVien
		WHERE MaPB='PB0002'
		PRINT N'Lương LN là ' + CONVERT(VARCHAR,@LuongLN)
		PRINT N'Lương NN là ' + CONVERT(VARCHAR(10),@LuongNN)
		PRINT N'Tổng lương là ' + CAST(@TongLuong AS VARCHAR)
	END

EXECUTE XemLuong_30
EXEC XemLuong_30
XemLuong_30

ALTER PROC XemLuong_30 (@Ma CHAR(6))
AS
	BEGIN
		DECLARE @LuongLN INT,@LuongNN INT,@TongLuong INT,@Test INT
		SELECT @LuongLN=MAX(Luong),@LuongNN=MIN(Luong),@TongLuong=SUM(Luong)
		FROM NhanVien
		WHERE MaPB = @Ma
		PRINT N'Lương LN là ' + CONVERT(VARCHAR,@LuongLN)
		PRINT N'Lương NN là ' + CONVERT(VARCHAR(10),@LuongNN)
		PRINT N'Tổng lương là ' + CAST(@TongLuong AS VARCHAR)
	END

EXECUTE XemLuong_30 'PB0003'
EXEC XemLuong_30 'PB0003'
XemLuong_30 'PB0005'
XemLuong_30 @Ma='PB0005' --Nếu thủ tục có nhiều tham số mà ko nhớ rõ thứ tự tham số

--Tạo thủ tục để xem lương của 1 phòng ban có tên là gì đấy?
CREATE PROC DemoXemLuongPB (@TenPB NVARCHAR(50))
AS
	BEGIN
		DECLARE @LuongLN INT,@LuongNN INT,@TongLuong INT,@Test INT
		SELECT @LuongLN=MAX(Luong),@LuongNN=MIN(Luong),@TongLuong=SUM(Luong)
		FROM NhanVien NV,PhongBan PB
		WHERE NV.MaPB = PB.MaPB AND TenPB = @TenPB
		PRINT N'Lương LN là ' + CONVERT(VARCHAR,@LuongLN)
		PRINT N'Lương NN là ' + CONVERT(VARCHAR(10),@LuongNN)
		PRINT N'Tổng lương là ' + CAST(@TongLuong AS VARCHAR)
	END

EXEC DemoXemLuongPB N'Phòng Ban Kinh Tế'
--Tạo thủ tục thêm dữ liệu cho bảng phòng ban
CREATE PROC ThemPB (@MaPB CHAR(6),@TenPB NVARCHAR(50),@MaTP CHAR(6),@NgayNhanChuc DATE)
AS
	BEGIN
		INSERT INTO PhongBan(MaPB,TenPB,TrPhong,NgayNhanChuc)
		VALUES (@MaPB,@TenPB,@MaTP,@NgayNhanChuc)
	END

EXEC ThemPB @MaPB='PB0012',@MaTP='NV0001',@TenPB=N'ABC',@NgayNhanChuc= '2018-07-30'
ThemPB @MaPB='PB0013',@MaTP='NV0001',@TenPB=N'ABC',@NgayNhanChuc= '2018-07-30'

--Sửa phòng ban
CREATE PROC SuaPB (@MaPB CHAR(6),@TenPB NVARCHAR(50),@MaTP CHAR(6),@NgayNhanChuc DATE)
AS
	BEGIN
		UPDATE PhongBan
		SET TenPB=@TenPB,TrPhong=@MaTP,NgayNhanChuc=@NgayNhanChuc
		WHERE MaPB = @MaPB
	END

EXEC SuaPB @MaPB='PB0012',@MaTP=NULL,@TenPB='ABC',@NgayNhanChuc=NULL
SuaPB @MaPB='PB0013',@MaTP='NV0005',@TenPB=N'New Room',@NgayNhanChuc= '2018-07-29'
-
--Tạo thủ tục liệt kê tổng số dự án của mỗi nhân viên tham gia cho 1 pb có tên là gì đấy?
CREATE PROC TongSoDA (@TenPB NVARCHAR(50))
AS
	BEGIN
		SELECT NV_DeAn.MaNV,COUNT(MaDA) TongSoDA
		FROM NV_DeAn,NhanVien NV,PhongBan PB
		WHERE TenPB=@TenPB AND NV.MaPB=PB.MaPB AND NV.MaNV=NV_DeAn.MaNV
		GROUP BY NV_DeAn.MaNV
	END 
EXEC TongSoDA N'Phòng Ban Kinh Tế' 
--Tạo thủ tục thêm 1 DA mới (MaDa,TenDA).  Cho tất cả các nhân viên thuộc phòng 'PB01' tham gia DA này
CREATE PROC ThemMoiDA (@MaDA CHAR(10),@TenDA NVARCHAR(50),@DD_DA NVARCHAR(100),@MaPB CHAR(6)) 
AS
	BEGIN
		INSERT INTO DeAn(MaDA,TenDA,DD_DA,MaPB)
		VALUES (@MaDA,@TenDA,@DD_DA,@MaPB)
		INSERT INTO NV_DeAn(MaNV,MaDA)
		SELECT MaNV,@MaDA
		FROM NhanVien
		WHERE MaPB='PB0001'		
	END
EXEC ThemMoiDA @MaDA='DA0022',@TenDA='A',@DD_DA=NULL,@MaPB='PB0001'
--Tạo thủ tục thêm 1 DA mới (MaDa,TenDA).  Cho tất cả các nhân viên thuộc phòng 'Triển khai DA' tham gia da này
CREATE PROC ThemMoiDATheoTenPB (@MaDA CHAR(10),@TenDA NVARCHAR(50),@DD_DA NVARCHAR(100),@MaPB CHAR(6)) 
AS
	BEGIN
		INSERT INTO DeAn(MaDA,TenDA,DD_DA,MaPB)
		VALUES (@MaDA,@TenDA,@DD_DA,@MaPB)
		INSERT INTO NV_DeAn(MaNV,MaDA)
		SELECT MaNV,@MaDA
		FROM NhanVien NV, PhongBan PB
		WHERE NV.MaPB=PB.MaPB AND TenPB=N'New Room'		
	END
EXEC ThemMoiDATheoTenPB @MaDA='DA0021',@TenDA='New Plan',@DD_DA=NULL,@MaPB='PB0013'

CREATE FUNCTION Thu(@ngay DATETIME) RETURNS NVARCHAR(10)
AS
BEGIN
DECLARE @st NVARCHAR(10)
SELECT @st=CASE DATEPART(DW,@ngay)
WHEN 1 THEN N'Chủ nhật'
WHEN 2 THEN N'Thứ hai'
WHEN 3 THEN N'Thứ ba'
WHEN 4 THEN N'Thứ tư'
WHEN 5 THEN N'Thứ năm'
WHEN 6 THEN N'Thứ sáu'
WHEN 7 THEN N'Thứ bảy'
ELSE N'Thứ không xác định' END
RETURN (@st)
END

SELECT MaNV,HoTen,NgaySinh,dbo.Thu(NgaySinh) Thu
FROM NhanVien
--
CREATE FUNCTION func_XemNV(@MaPhong CHAR(10)) RETURNS TABLE
AS
RETURN (SELECT MaNV,HoTen,NgaySinh,TenPB,TrPhong,NgayNhanChuc
		FROM NhanVien NV JOIN PhongBan PB
		ON NV.MaPB=PB.MaPB
		WHERE NV.MaPB=@MaPhong)

SELECT * FROM dbo.func_XemNV('PB0001')
--
CREATE FUNCTION func_TongNV(@MaPB CHAR(10))
RETURNS @bangthongke TABLE (MAPB CHAR(10), TongSoNV INT)
AS
BEGIN
	IF(@MaPB IS NULL) OR (@MaPB='')
	INSERT INTO @bangthongke
	SELECT MaPB,COUNT(MaNV)
	FROM NhanVien
	GROUP BY MaPB
	ELSE
	INSERT INTO @bangthongke
	SELECT MaPB,COUNT(MaNV)
	FROM NhanVien
	WHERE MaPB=@MaPB
	GROUP BY MaPB
	RETURN
END

SELECT * FROM dbo.func_TongNV('')

--Trigger sửa đổi dữ liệu
CREATE TRIGGER ThemNV ON NhanVien FOR INSERT
AS
DECLARE @Ma CHAR(10)
BEGIN
	SELECT @Ma=MaNV
	FROM INSERTED
	PRINT N'Mã nhân viên vừa thêm là ' + @Ma
END

INSERT INTO NhanVien(MaNV,HoTen)
VALUES('NV0021',N'Nguyễn Văn A')
--Đưa ra họ tên nhân viên trước và sau khi sửa
CREATE TRIGGER SuaNV ON NhanVien FOR UPDATE
AS
DECLARE @Ma CHAR(10), @TenNV NVARCHAR(50)
BEGIN
	SELECT @Ma=MaNV,@TenNV=HoTen
	FROM INSERTED
	PRINT N'Mã nhân viên và tên nhân viên vừa sửa là ' + @Ma+''+@TenNV
	SELECT @TenNV=HoTen
	FROM DELETED
	PRINT N'Mã nhân viên và tên nhân viên trước khi sửa là ' + @Ma+''+@TenNV
END

UPDATE NhanVien
SET HoTen=N'Nguyễn Văn A1'
WHERE MaNV='NV0021'

--Tạo trigger để cập nhật tự động số nhân viên của phòng ban khi thêm, sửa(nhân viên từ phòng này sang phòng khác), xóa nhân viên
--Insert
CREATE TRIGGER TuDongThemSLNV ON NhanVien FOR INSERT
AS
DECLARE @Ma CHAR(10)
BEGIN
	SELECT @Ma=MaPB
	FROM INSERTED

	UPDATE PhongBan
	SET SLNV = SLNV+1
	WHERE MaPB=@Ma
END

--
INSERT INTO NhanVien(MaNV,HoTen,MaPB)
VALUES ('NV0021','A','PB0001')
--Update
CREATE TRIGGER TuDongCapNhatSLNV ON NhanVien FOR UPDATE
AS
DECLARE @Ma CHAR(10),@MaPB CHAR(10)
BEGIN
	SELECT @Ma=MaPB
	FROM INSERTED
	SELECT @MaPB=MaPB
	FROM DELETED
	UPDATE PhongBan
	SET SLNV = SLNV-1
	WHERE MaPB=@MaPB
	UPDATE PhongBan
	SET SLNV = SLNV+1
	WHERE MaPB=@Ma
END
--
UPDATE NhanVien
SET MaPB='PB0002'
WHERE MaNV='NV0021'
--Delete
CREATE TRIGGER TuDongXoaSLNV ON NhanVien FOR DELETE
AS
DECLARE @Ma CHAR(10)
BEGIN
	SELECT @Ma=MaPB
	FROM DELETED

	UPDATE PhongBan
	SET SLNV = SLNV-1
	WHERE MaPB=@Ma
END
--
DELETE FROM NhanVien
WHERE MaNV='NV0021'

UPDATE PhongBan
SET SLNV=0

UPDATE PhongBan
SET SLNV = (SELECT COUNT(MaNV)
			FROM NhanVien
			GROUP BY MaPB
			HAVING MaPB=PhongBan.MaPB)

UPDATE PhongBan
SET SLNV = (SELECT COUNT(MaNV)
			FROM NhanVien
			WHERE MaPB=PhongBan.MaPB
			GROUP BY MaPB)

UPDATE PhongBan
SET SLNV = SoLuongNV FROM (	SELECT MaPB,COUNT(MaNV) SoLuongNV
							FROM NhanVien
							GROUP BY MaPB) NewTB
WHERE PhongBan.MaPB=NewTB.MaPB

--Con trỏ
DECLARE DemoCursor CURSOR SCROLL FOR 
SELECT * FROM NhanVien ORDER BY MaNV
OPEN DemoCursor
FETCH FIRST FROM DemoCursor
WHILE @@FETCH_STATUS = 0
BEGIN
	FETCH NEXT FROM DemoCursor
END

BEGIN
CREATE TABLE DanhSach(SoBD CHAR(10),MaNV CHAR(10),HoTen NVARCHAR(50),NgaySinh DATE)
DECLARE @ma CHAR(10), @ten NVARCHAR(50), @ns DATE, @i INT
SET @i=1
DECLARE cur_Tro CURSOR FORWARD_ONLY FOR SELECT MaNV,HoTen,NgaySinh FROM NhanVien
OPEN cur_Tro
WHILE @@FETCH_STATUS = 0
	BEGIN
	FETCH NEXT FROM cur_Tro
	INTO @ma,@ten,@ns
	IF @@FETCH_STATUS != 0
		BREAK
	INSERT INTO DanhSach 
	VALUES ('SBD'+CONVERT(CHAR(7),@i),@ma,@ten,@ns)
	SET @i=@i+1
	END
CLOSE cur_Tro
DEALLOCATE cur_Tro
END


SELECT *
FROM DanhSach
