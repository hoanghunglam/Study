--1.In ra tất cả thông tin sinh viên
SELECT * FROM SinhVien
--2.Lấy ra thông tin các học phần đang học mà chưa có điểm của sinh viên có mã SV0001
SELECT HP.* 
FROM HocPhan HP,LopHocPhan LHP
WHERE HP.MaHP=LHP.MaHP AND LHP.MaLHP IN (
SELECT MaLHP
FROM BangDiem
WHERE MaSV='SV0001' AND DiemTong IS NULL)
--3.Lấy ra tên các sinh viên có quê quán ở Hà Nội
SELECT HoTen FROM SinhVien WHERE QueQuan=N'Hà Nội'
--4.Lấy ra thông tin các giáo viên có mã bộ môn là HTTT
SELECT * FROM GiaoVien WHERE MaBM='HTTT'
--5.Lấy ra tên những sinh viên thuộc lớp Công nghệ thông tin
SELECT HoTen
FROM SinhVien SV,Lop L
WHERE SV.MaLop=L.MaLop AND TenLop=N'Công nghệ thông tin'
--6.Lấy ra thông tin sinh viên làm lớp trưởng lớp Công nghệ thông tin
SELECT HoTen
FROM SinhVien SV,Lop L
WHERE SV.MaSV=L.MaLopTruong AND TenLop=N'Công nghệ thông tin'
--7.Lấy ra thông tin giáo viên làm chủ nhiệm bộ môn Hệ thống thông tin
SELECT GV.*
FROM GiaoVien GV,BoMon BM
WHERE GV.MaGV=BM.MaCNBM AND TenBM=N'Hệ thống thông tin'
--8.Lấy ra thông tin giáo viên vừa làm giáo viên chủ nhiệm vừa làm chủ nhiệm bộ môn
SELECT GV.*
FROM GiaoVien GV,BoMon BM,Lop L
WHERE GV.MaGV=BM.MaCNBM AND GV.MaGV=L.MaGVCN
--9.Lấy ra thông tin giáo viên vừa làm giáo viên chủ nhiệm vừa tham gia giảng dạy
SELECT GV.*
FROM GiaoVien GV,Lop L, GiaoVien_LopHocPhan GVLHP
WHERE GV.MaGV=L.MaGVCN AND GV.MaGV=GVLHP.MaGV
--10.Cho biết tên giáo viên và tên bộ môn của giáo viên đó
SELECT TenGV,TenBM
FROM GiaoVien GV,BoMon BM
WHERE GV.MaBM=BM.MaBM
--11.Cho biết tên các học phần được tổ chức vào học kỳ 3
SELECT DISTINCT TenHP 
FROM HocPhan HP,LopHocPhan LHP
WHERE LHP.HocKy=3 AND HP.MaHP=LHP.MaHP
--12.Tính điểm tổng trung bình của sinh viên có mã sinh viên là SV0001
SELECT AVG(DiemTong)
FROM BangDiem
WHERE MaSV='SV0001'
--13.Cho biết mã sinh viên có điểm tổng trung bình lớn nhất trong các sinh viên
SELECT MaSV
FROM BangDiem
GROUP BY MaSV
HAVING AVG(DiemTong) =
(SELECT MAX(DIEMTONG) DIEMTONGLONNHAT
FROM
(SELECT AVG(DiemTong) DIEMTONG
FROM BangDiem
GROUP BY MaSV) NEWTB
)
--14.Đếm số lượng giáo viên thuộc bộ môn An toàn thông tin
SELECT COUNT(MaGV) SLGV
FROM BoMon BM, GiaoVien GV
WHERE TenBM=N'An toàn thông tin' AND GV.MaBM=BM.MaBM
--15.Lấy ra tên những giáo viên làm chủ nhiệm bộ môn nhưng lại không làm giáo viên chủ nhiệm
SELECT TenGV
FROM GiaoVien GV,BoMon BM
WHERE GV.MaGV=BM.MaCNBM AND GV.MaGV NOT IN 
(SELECT MaGV 
FROM Lop L
WHERE L.MaGVCN=GV.MaGV)
--16.Cho biết thông tin những sinh viên có năm sinh nhỏ hơn 1997
SELECT *
FROM SinhVien
WHERE YEAR(NgaySinh)<1997
--17.Lấy ra tên những sinh viên có họ bắt đầu bằng Nguyễn
SELECT HoTen
FROM SinhVien
WHERE HoTen LIKE N'Nguyễn%'
--18.Lấy ra tên sinh viên của những sinh viên có ngày sinh trong khoảng 01/01/1997 đến 31/03/1997
SELECT HoTen
FROM SinhVien
WHERE NgaySinh BETWEEN '1997-01-01' AND '1997-03-31'
--19.Cho biết tên các giáo viên cùng bộ môn với giáo viên Nguyễn Văn Giang
SELECT TenGV
FROM GiaoVien
WHERE MaBM = (	SELECT MaBM
				FROM GiaoVien
				WHERE TenGV=N'Nguyễn Văn Giang'
) AND TenGV!=N'Nguyễn Văn Giang'
--20.Cho biết số lượng sinh viên tại lớp mạng máy tính
SELECT COUNT(MaSV) SLSV
FROM SinhVien SV,Lop L
WHERE TenLop=N'Mạng máy tính' AND SV.MaLop=L.MaLop
--21.Cho biết tên học phần có điểm tổng cao nhất của sinh viên có mã sinh viên là SV0001
SELECT TenHP
FROM HocPhan HP,LopHocPhan LHP
WHERE HP.MaHP=LHP.MaHP AND MaLHP IN 
(SELECT MaLHP
FROM BangDiem
WHERE DiemTong IN
(SELECT MAX(DiemTong)
FROM BangDiem
WHERE MaSV='SV0001')
AND MaSV='SV0001')
--22.Cho biết tổng số sinh viên học tại H9 vào học kỳ 4
SELECT SUM(SLSV) TongSoSV
FROM LopHocPhan
WHERE HocKy=4 AND DiaDiemTCHP LIKE N'H9%'
--23.Cho biết tên sinh viên có điểm trung bình cao nhất
SELECT HoTen
FROM SinhVien
WHERE MaSV = (	SELECT MaSV 
				FROM BangDiem
				GROUP BY MaSV
				HAVING AVG(DiemTong) =  (	SELECT MAX(DiemTB)
											FROM (	SELECT AVG(DiemTong) AS DiemTB
													FROM BangDiem
													GROUP BY MaSV ) B
										)
				)
--24.In ra thông tin giáo viên vừa làm giáo viên chủ nhiệm và số tiết dạy trên 30 tiết
SELECT GV.*
FROM GiaoVien GV,Lop L,GiaoVien_LopHocPhan GVLHP
WHERE GV.MaGV=L.MaGVCN AND GV.MaGV=GVLHP.MaGV AND SoTiet>30
--25.Cho biết thông tin của những sinh viên phải học lại
SELECT SV.*
FROM SinhVien SV,BangDiem BD
WHERE SV.MaSV=BD.MaSV AND GhiChu=N'Không Đạt'
--26.Cho biết thông tin của những sinh viên phải học lại học phần Ngôn ngữ lập trình
SELECT SV.*
FROM SinhVien SV,BangDiem BD
WHERE SV.MaSV=BD.MaSV AND GhiChu=N'Không Đạt' AND BD.MaLHP IN 
(
SELECT MaLHP
FROM HocPhan HP, LopHocPhan LHP
WHERE HP.MaHP=LHP.MaHP AND TenHP=N'Ngôn ngữ lập trình'
)
--27.Cho biết thông tin bộ môn của những giáo viên có tên là Dũng
SELECT BM.*
FROM BoMon BM,GiaoVien GV
WHERE BM.MaBM=GV.MaBM AND TenGV LIKE N'%Dũng'
--28.Cho biết những sinh viên có điểm tổng trên 7 môn kỹ thuật lập trình hoặc trên 6 đối với môn thực tập nhóm
SELECT DISTINCT HoTen
FROM SinhVien SV,BangDiem BD
WHERE (SV.MaSV=BD.MaSV AND BD.MaLHP IN 
(
	SELECT LHP.MaLHP
	FROM HocPhan HP,LopHocPhan LHP
	WHERE HP.MaHP=LHP.MaHP AND HP.TenHP=N'Kỹ thuật lập trình'
)
AND BD.DiemTong>7) OR (SV.MaSV=BD.MaSV AND BD.MaLHP IN 
(
	SELECT LHP.MaLHP
	FROM HocPhan HP,LopHocPhan LHP
	WHERE HP.MaHP=LHP.MaHP AND HP.TenHP=N'Thực tập nhóm'
) AND BD.DiemTong>6 )
--29.Cho biết mã bộ môn có đông giáo viên nhất 
SELECT MaBM
FROM GiaoVien
GROUP BY MaBM
HAVING COUNT(MaGV) = (	SELECT MAX(SLGV)
						FROM (	SELECT COUNT(MaGV) AS SLGV
								FROM GiaoVien
								GROUP BY MABM ) B
					 )
--30.Cho biết tên lớp có đông sinh viên nhất
SELECT TenLop
FROM Lop
WHERE MaLop IN (	SELECT MaLop
					FROM SinhVien
					GROUP BY MaLop
					HAVING COUNT(MaSV)= (	SELECT MAX(SLSV)
											FROM (	SELECT COUNT(MaSV) AS SLSV
													FROM SinhVien
													GROUP BY MaLop	) B
											)
					)
--T_SQL
--1.Tạo thủ tục thêm, sửa, xóa bảng sinh viên
--Thêm sinh viên
CREATE PROC ThemSinhVien(
@MaSV CHAR(6),@TenSV NVARCHAR(50),@NgaySinh DATE,@GioiTinh NVARCHAR(6),@QueQuan NVARCHAR(100),@SDT VARCHAR(50),@TenLop NVARCHAR(50)
)
AS
BEGIN
	INSERT INTO SinhVien(MaSV,HoTen,NgaySinh,GioiTinh,QueQuan,SDT,MaLop)
	SELECT DISTINCT @MaSV,@TenSV,@NgaySinh,(CASE WHEN @GioiTinh='Nam' THEN 1 ELSE 0 END),@QueQuan,@SDT,SV.MaLop
	FROM SinhVien SV, Lop L
	WHERE SV.MaLop=L.MaLop AND TenLop=@TenLop
END
--
EXEC ThemSinhVien @MaSV='SV0022',@TenSV=N'Nguyễn Thị B',@NgaySinh='2018-07-31',@GioiTinh=N'Nữ',
@QueQuan=N'Hà Nội',@SDT='0969460518',@TenLop=N'Công nghệ thông tin'
--Sửa sinh viên
CREATE PROC SuaSinhVien(
@MaSV CHAR(6),@TenSV NVARCHAR(50),@NgaySinh DATE,@GioiTinh NVARCHAR(6),@QueQuan NVARCHAR(100),@SDT VARCHAR(50),@TenLop NVARCHAR(50)
)
AS
BEGIN
	UPDATE SinhVien
	SET HoTen=@TenSV,NgaySinh=@NgaySinh,GioiTinh=(CASE WHEN @GioiTinh='Nam' THEN 1 ELSE 0 END),QueQuan=@QueQuan,SDT=@SDT,MaLop=(SELECT DISTINCT SV.MaLop
	FROM SinhVien SV, Lop L
	WHERE SV.MaLop=L.MaLop AND TenLop=@TenLop) 
	WHERE MaSV=@MaSV
END
--
EXEC SuaSinhVien @MaSV='SV0022',@TenSV=N'Nguyễn Thị B',@NgaySinh='2018-07-31',@GioiTinh=N'Nữ',
@QueQuan=N'Hà Nội',@SDT='0969460518',@TenLop=N'Công nghệ phần mềm'
--Xóa sinh viên
CREATE PROC XoaSinhVien(@MaSV CHAR(6))
AS
BEGIN
	DELETE SinhVien
	WHERE MaSV=@MaSV
END
--
EXEC XoaSinhVien 'SV0022'
--2.Tạo thủ tục thống kê
--Thống kê số lượng sinh viên theo từng lớp
CREATE PROC SoLuongSVTheoLop(@TenLop NVARCHAR(50))
AS
BEGIN
	SELECT COUNT(MaSV) SLSV
	FROM SinhVien SV,Lop L
	WHERE SV.MaLop=L.MaLop AND TenLop=@TenLop
	GROUP BY SV.MaLop
END
--
EXEC SoLuongSVTheoLop N'Công nghệ thông tin'
--Thống kê số lượng giáo viên theo bộ môn
CREATE PROC SoLuongGVTheoBM(@TenBM NVARCHAR(50))
AS
BEGIN
	SELECT COUNT(MaGV) SLGV
	FROM GiaoVien GV,BoMon BM
	WHERE GV.MaBM=BM.MaBM AND TenBM=@TenBM
	GROUP BY GV.MaBM
END
--
EXEC SoLuongGVTheoBM N'Hệ thống thông tin'
--Thống kê điểm tổng trung bình các học phần của từng sinh viên theo lớp
CREATE PROC DiemTBSVTheoLop(@TenLop NVARCHAR(50))
AS
BEGIN
	SELECT BD.MaSV,HoTen,AVG(DiemTong) DiemTB
	FROM BangDiem BD,SinhVien SV,Lop L
	WHERE BD.MaSV=SV.MaSV AND SV.MaLop=L.MaLop AND TenLop=@TenLop
	GROUP BY BD.MaSV,HoTen
END
--
EXEC DiemTBSVTheoLop N'Công nghệ thông tin'
--Tạo hàm tính điểm tổng học phần cho sinh viên
CREATE FUNCTION func_TinhDiemTong(@DiemCC FLOAT,@DiemTX FLOAT,@DiemThi FLOAT) RETURNS FLOAT
AS
BEGIN
	RETURN (ROUND(@DiemCC*0.1+@DiemTX*0.3+@DiemThi*0.6,2))
END
--
INSERT INTO BangDiem(MaSV,MaLHP,DiemCC,DiemTX,DiemThi,DiemTong,GhiChu)
VALUES ('SV0022' ,'LHP001',9,6,5,dbo.func_TinhDiemTong(9,6,5),CASE WHEN dbo.func_TinhDiemTong(9,6,5)>4 THEN N'Đạt' ELSE N'Không Đạt' END)
--Tạo trigger khi xóa một sinh viên -> xóa luôn bảng điểm của sinh viên đó
CREATE TRIGGER TuDongXoaDiemSV ON SinhVien INSTEAD OF DELETE
AS
DECLARE @Ma CHAR(6)
BEGIN
	SELECT @Ma=MaSV
	FROM DELETED
	DELETE FROM BangDiem
	WHERE MaSV=@Ma
	DELETE FROM SinhVien
	WHERE MaSV=@Ma
END
--
EXEC XoaSinhVien 'SV0022'
