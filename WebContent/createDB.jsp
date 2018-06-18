<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="eCore.modelDao.DAO_ChucNang"%>
<%@page import="eCore.model.ChucNang"%>
<%@page import="eCore.modelDao.DAO_NhomPhanQuyen"%>
<%@page import="eCore.model.NhomPhanQuyen"%>
<%@page import="eCore.util.Util_MD5"%>
<%@page import="eCore.modelDao.DAO_TaiKhoan"%>
<%@page import="eCore.model.TaiKhoanNhanVien"%>
<%@page import="eCore.model.TaiKhoan"%>
<%@page import="eCore.modelDao.DAO_NhanVien"%>
<%@page import="eCore.modelDao.DAO_DonVi"%>
<%@page import="eCore.dao.ObjectDAO"%>
<%@page import="eCore.model.DonVi"%>
<%@page import="eCore.model.NhanVien"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		DonVi dv = new DonVi();
		dv.setMaDonVi("DV01");
		dv.setTenDonVi("Bo mon CNTT");
		dv.setDonViCha(null);
		ObjectDAO dao1 = new DAO_DonVi();
		dao1.saveOrUpdate(dv);

		NhanVien nv = new NhanVien();
		nv.setMaNhanVien("001");
		nv.setTenNhanVien("Le Nhat Tung");
		nv.setEmail("tungit07@gmail.com");
		nv.setDonVi(dv);
		ObjectDAO dao2 = new DAO_NhanVien();
		dao2.saveOrUpdate(nv);

		Set<ChucNang> chs = new HashSet<ChucNang>();
		ObjectDAO daochucnang = new DAO_ChucNang();
		for (int i = 0; i < 3; i++) {
			ChucNang cn = new ChucNang();
			cn.setMaChucNang("CN" + i);
			cn.setTenHienThi("Chức năng " + i);
			cn.setDuongDan("google.com");
			daochucnang.saveOrUpdate(cn);
			if (i % 3 == 0)
				chs.add(cn);
			for (int j = 0; j < 3; j++) {
				ChucNang cn2 = new ChucNang();
				cn2.setMaChucNang("CN" + i + " " + j);
				cn2.setTenHienThi("Chức năng " + i + " - " + j);
				cn2.setDuongDan("google.com");
				cn2.setChucNangCha(cn);
				daochucnang.saveOrUpdate(cn2);
				if (i % 3 == 0 || j % 5 == 0)
					chs.add(cn2);
			}
		}

		NhomPhanQuyen nhomPhanQuyen1 = new NhomPhanQuyen();
		nhomPhanQuyen1.setMaNhomPhanQuyen("giangvien");
		nhomPhanQuyen1.setTenNhomPhanQuyen("Giảng viên");
		nhomPhanQuyen1.setChucNangs(chs);
		ObjectDAO daonpq = new DAO_NhomPhanQuyen();
		daonpq.saveOrUpdate(nhomPhanQuyen1);

		TaiKhoanNhanVien tk = new TaiKhoanNhanVien();
		tk.setMaDangNhap(nv.getEmail());
		tk.setEmail(nv.getEmail());
		tk.setMatKhau(Util_MD5.md5("123456"));
		tk.setNhanVien(nv);
		tk.setNhomPhanQuyen(nhomPhanQuyen1);
		ObjectDAO dao3 = new DAO_TaiKhoan();
		dao3.saveOrUpdate(tk);
	%>

</body>
</html>