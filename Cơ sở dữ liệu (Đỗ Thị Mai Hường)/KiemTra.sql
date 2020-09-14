--Kiểm tra
--Đưa ra ds bảng điểm của môn học nào đó (viết thủ tục) Mã hp,tên hp, tên giáo viên, mã sv, tên sv, điểmcc, điểmtx, điểm thi,
--điểm hp
SELECT HP.MaHP,TenHP,TenGV,BD.MaSV,HoTen,DiemCC,DiemTX,DiemThi,DiemTong
FROM HocPhan HP,LopHocPhan LHP,BangDiem BD,SinhVien SV,GiaoVien_LopHocPhan GVLHP,GiaoVien GV
WHERE TenHP=N'Kỹ thuật lập trình' AND HP.MaHP=LHP.MaHP AND BD.MaLHP=LHP.MaLHP AND BD.MaSV=SV.MaSV AND GVLHP.MaLHP=LHP.MaLHP
AND GVLHP.MaGV=GV.MaGV
--Cập nhật điểm theo học phần
ALTER PROC CapNhatDiemTong (@TenHP NVARCHAR(50))
AS
BEGIN
	UPDATE BangDiem
	SET DiemTong=DiemCC*0.1+DiemTX*0.3+DiemThi*0.6
	FROM BangDiem BD,LopHocPhan LHP,HocPhan HP
	WHERE TenHP=@TenHP AND HP.MaHP=LHP.MaHP AND LHP.MaLHP=BD.MaLHP
END

EXEC CapNhatDiemTong @TenHP=N'Kỹ thuật lập trình'

CREATE PROC DanhSachBangDiemCuaMH (@TenHP NVARCHAR(50))
AS
BEGIN
	SELECT HP.MaHP,TenHP,TenGV,BD.MaSV,HoTen,DiemCC,DiemTX,DiemThi,DiemTong
	FROM HocPhan HP,LopHocPhan LHP,BangDiem BD,SinhVien SV,GiaoVien_LopHocPhan GVLHP,GiaoVien GV
	WHERE TenHP=@TenHP AND HP.MaHP=LHP.MaHP AND BD.MaLHP=LHP.MaLHP AND BD.MaSV=SV.MaSV AND GVLHP.MaLHP=LHP.MaLHP
	AND GVLHP.MaGV=GV.MaGV
END

EXEC DanhSachBangDiemCuaMH @TenHP=N'Ngôn ngữ lập trình'
--Tạo thủ tục đưa ra danh sách điểm tích lũy của 1 lớp nào đó 
CREATE PROC DanhSachDiemTichLuy (@TenLop NVARCHAR(50))
AS
BEGIN
	
END


CREATE FUNCTION TinhDiemTichLuy(@MaLop CHAR(6)) RETURNS FLOAT
AS
BEGIN 
	DECLARE @DiemTichLuy FLOAT,@TongSoTC INT
	SET @DiemTichLuy=0
	SET @TongSoTC=0
	WHILE (@MaLop IS NOT NULL) OR (@MaLop !='')
	BEGIN 
		SELECT @DiemTichLuy=@DiemTichLuy +(DiemTong*SoTC),@TongSoTC=@TongSoTC+SoTC
		FROM BangDiem BD,LopHocPhan LHP, HocPhan HP,SinhVien SV,Lop L
		WHERE L.MaLop=@MaLop AND BD.MaLHP=LHP.MaLHP AND LHP.MaHP=HP.MaHP AND SV.MaSV=BD.MaSV AND L.MaLop=SV.MaLop
	END
	RETURN (@DiemTichLuy/@TongSoTC)
END

SELECT SV.MaSV,HoTen,dbo.TinhDiemTichLuy(L.MaLop)
FROM Lop L,SinhVien SV, BangDiem BD,LopHocPhan LHP,HocPhan HP
WHERE TenLop=N'Công nghệ phần mềm' AND L.MaLop=SV.MaLop AND SV.MaSV=BD.MaSV AND BD.MaLHP=LHP.MaLHP AND LHP.MaHP=HP.MaHP