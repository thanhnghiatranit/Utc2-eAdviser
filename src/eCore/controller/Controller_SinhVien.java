package eCore.controller;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import eCore.dao.ObjectDAO;
import eCore.model.Lop;
import eCore.model.SinhVien;
import eCore.modelDao.DAO_Lop;
import eCore.modelDao.DAO_SinhVien;
import eCore.util.Util_Date;

public class Controller_SinhVien extends SinhVien implements ZEController<SinhVien> {
	ObjectDAO<SinhVien> dao = new DAO_SinhVien();
	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "eCore/pages/sinhviens.jsp";
	String duongDanTrangView = "eCore/pages/sinhvien.jsp";
	String tenCotTimDoiTuong = "maSinhVien";
	String maObj;
	String maLop;
	String s_thoiGianCapNhat;

	public String getTimKiemTheo() {
		return timKiemTheo;
	}

	public void setTimKiemTheo(String timKiemTheo) {
		this.timKiemTheo = timKiemTheo;
	}

	public String getTuKhoa() {
		return tuKhoa;
	}

	public void setTuKhoa(String tuKhoa) {
		this.tuKhoa = tuKhoa;
	}

	public String getDuongDanTrang() {
		return duongDanTrang;
	}

	public void setDuongDanTrang(String duongDanTrang) {
		this.duongDanTrang = duongDanTrang;
	}

	public String getDuongDanTrangView() {
		return duongDanTrangView;
	}

	public void setDuongDanTrangView(String duongDanTrangView) {
		this.duongDanTrangView = duongDanTrangView;
	}

	public String getTenCotTimDoiTuong() {
		return tenCotTimDoiTuong;
	}

	public void setTenCotTimDoiTuong(String tenCotTimDoiTuong) {
		this.tenCotTimDoiTuong = tenCotTimDoiTuong;
	}

	public String getMaObj() {
		return maObj;
	}

	public void setMaObj(String maObj) {
		this.maObj = maObj;
	}

	public String getMaLop() {
		return maLop;
	}

	public void setMaLop(String maLop) {
		this.maLop = maLop;
	}

	public String getS_thoiGianCapNhat() {
		return s_thoiGianCapNhat;
	}

	public void setS_thoiGianCapNhat(String s_thoiGianCapNhat) {
		this.s_thoiGianCapNhat = s_thoiGianCapNhat;
	}
	
	public Lop getLop() {
		ObjectDAO<Lop> dao_Lop = new DAO_Lop();
		ArrayList<Lop> list_Lop = dao_Lop.listByColumns("maLop", getMaLop());
		if (list_Lop.size() > 0) {
			return list_Lop.get(0);
		} else {
			return null;
		}
	}
	
	public Date getThoiGianCapNhat() {
		return Util_Date.stringToDate(getS_thoiGianCapNhat());
	}

	@Override
	public String addNew() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("mode", "addNew");
		session.setAttribute("p", duongDanTrangView);
		session.setAttribute("msg", null);
		session.setAttribute("obj", null);
		return "SUCCESS";
	}

	@Override
	public String viewDetail() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		String maobj = request.getParameter("maobj");

		session.setAttribute("mode", "viewDetail");

		ArrayList<SinhVien> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
		if (arr.size() > 0) {
			session.setAttribute("obj", arr.get(0));
			session.setAttribute("p", duongDanTrangView);
			return "SUCCESS";
		} else {
			return "FAIL";
		}
	}

	@Override
	public String viewDetailAndEdit() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("msg", null);

		String maobj = request.getParameter("maobj");
		session.setAttribute("mode", "viewDetailAndEdit");
		ArrayList<SinhVien> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
		if (arr.size() > 0) {
			session.setAttribute("obj", arr.get(0));
			session.setAttribute("p", duongDanTrangView);
			return "SUCCESS";
		} else {
			return "FAIL";
		}
	}

	@Override
	public String saveOrUpdate() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		SinhVien obj = new SinhVien();
		obj.maSinhVien = getMaSinhVien();  
		obj.ten = getTen();  
		obj.hoDem = getHoDem();
		obj.hoVaTen = getHoDem() + " " + getTen();
		obj.gioiTinh = getGioiTinh();  
		obj.soCMND = getSoCMND();  
		obj.ngayCap = getNgayCap();  
		obj.noiCap = getNoiCap();  
		obj.ngaySinh = getNgaySinh();  
		obj.noiSinh = getNoiSinh();  
		obj.doiTuong = getDoiTuong();  
		obj.khuVuc = getKhuVuc();  
		obj.namTotNghiepTHPT = getNamTotNghiepTHPT();  
		obj.totNghiepTaiTruongTHPT = getTotNghiepTaiTruongTHPT();  
		obj.xepLoaiVanHoa = getXepLoaiVanHoa();  
		obj.xepLoaiGiaoDuc = getXepLoaiGiaoDuc();
		obj.queQuan = getQueQuan();  
		obj.hoKhauThuongTru = getHoKhauThuongTru();  
		obj.maTinh = getMaTinh();  
		obj.maQuanHuyen = getMaQuanHuyen();  
		obj.maPhuongXa = getMaPhuongXa();  
		obj.maDanToc = getMaDanToc();  
		obj.maTonGiao = getMaTonGiao();  
		obj.maQuocTich = getMaQuocTich();  
		obj.maThanhPhanGiaDinh = getMaThanhPhanGiaDinh();  
		obj.dienThoaiDiDong = getDienThoaiDiDong();  
		obj.dienThoaiCoDinh = getDienThoaiCoDinh();  
		obj.dienThoaiGiaDinh = getDienThoaiGiaDinh();  
		obj.email = getEmail();  
		obj.thongTinBaoTin = getThongTinBaoTin();  
		obj.ngayVaoDoan = getNgayVaoDoan();  
		obj.ngayVaoDang = getNgayVaoDang();  
		obj.maSoHinhAnh = getMaSoHinhAnh();  
		obj.khiCanBaoTinChoAi = getKhiCanBaoTinChoAi();  
		obj.diaChiKhiCanBaoTinChoAi = getDiaChiKhiCanBaoTinChoAi();  
		obj.bhyt_maTinh = getBhyt_maTinh();  
		obj.bhyt_maBenhVien = getBhyt_maBenhVien();  
		obj.bhyt_tenBenhVien = getBhyt_tenBenhVien();  
		obj.bhtn_thamgia = getBhtn_thamgia();  
		obj.bthn_sothang = getBthn_sothang();  
		obj.soBaoDanh = getSoBaoDanh();  
		obj.diemMon1 = getDiemMon1();  
		obj.diemMon2 = getDiemMon2();  
		obj.diemMon3 = getDiemMon3();  
		obj.diemUuTien = getDiemUuTien();  
		obj.tongDiem = getTongDiem();  
		obj.ngheNghiepTruocKhiVaoTruong = getNgheNghiepTruocKhiVaoTruong();  
		obj.thanhPhanGiaDinh = getThanhPhanGiaDinh();  
		obj.thiTHPTNgay = getThiTHPTNgay();  
		obj.diaChiNhanThu = getDiaChiNhanThu();  
		obj.emailPhuHuynh = getEmailPhuHuynh();  
		obj.tenNganhTrungTuyen = getTenNganhTrungTuyen();  
		obj.daKhaiPhieuQuanLySinhVien = getDaKhaiPhieuQuanLySinhVien();  
		obj.daNhapHoc = getDaNhapHoc();  
		obj.maChuyenNganh1 = getMaChuyenNganh1();  
		obj.maChuyenNganh2 = getMaChuyenNganh2();  
		obj.lop = getLop();
		obj.moTa = getMoTa();
		obj.ghiChu = getGhiChu();
		obj.thoiGianCapNhat = new Date();
		if (dao.saveOrUpdate(obj)) {
			session.setAttribute("msg", "Cập nhật dữ liệu thành công");
			session.setAttribute("obj", obj);
			session.setAttribute("mode", "viewDetailAndEdit");
			session.setAttribute("p", duongDanTrangView);
			return "SUCCESS";
		} else {
			return "FAIL";
		}
	}

	@Override
	public String delete() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String maobj = request.getParameter("maobj");
		SinhVien obj = new SinhVien();
		obj.setMaSinhVien(maobj);
		if (dao.delete(obj)) {
			session.setAttribute("msg", "Xóa dữ liệu thành công");
			session.setAttribute("p", duongDanTrang);
			return "SUCCESS";
		} else {
			return "FAIL";
		}
	}

	@Override
	public String search() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String column = getTimKiemTheo();
		String key = getTuKhoa();
		ArrayList<SinhVien> arr = dao.listByColumnLike(column, key);
		session.setAttribute("arr", arr);
		session.setAttribute("checkTimKiem", "true");
		session.setAttribute("p", duongDanTrang);
		return "SUCCESS";
	}

	@Override
	public String refresh() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("arr", null);
		session.setAttribute("msg", null);
		session.setAttribute("checkTimKiem", null);
		session.setAttribute("p", duongDanTrang);
		return "SUCCESS";
	}

	@Override
	public String importData() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String exportData() {
		// TODO Auto-generated method stub
		return null;
	}

}
