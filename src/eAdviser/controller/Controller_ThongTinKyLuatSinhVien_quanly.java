package eAdviser.controller;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import eAdviser.model.BienBanSinhHoatLop;
import eAdviser.model.CoVanHocTap;
import eAdviser.model.SoCoVanHocTap;
import eAdviser.model.ThongTinKhenThuongSinhVien;
import eAdviser.model.ThongTinKyLuatSinhVien;
import eAdviser.model.ThongTinSinhVien;
import eAdviser.model.ThongTinSinhVienKhoKhan;
import eAdviser.modelDao.DAO_BienBanSinhHoatLop;
import eAdviser.modelDao.DAO_SoCoVanHocTap;
import eAdviser.modelDao.DAO_ThongTinKhenThuongSinhVien;
import eAdviser.modelDao.DAO_ThongTinKyLuatSinhVien;
import eAdviser.modelDao.DAO_ThongTinSinhVien;
import eAdviser.modelDao.DAO_ThongTinSinhVienKhoKhan;
import eCore.controller.ZEController;
import eCore.dao.ObjectDAO;
import eCore.model.DonVi;
import eCore.model.SinhVien;
import eCore.modelDao.DAO_SinhVien;
import eCore.util.Util_Date;

public class Controller_ThongTinKyLuatSinhVien_quanly extends ThongTinKyLuatSinhVien implements ZEController{

	ObjectDAO dao=new DAO_ThongTinKyLuatSinhVien();
	
	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "eAdviser/pages/thongtinkyluatsinhviens_quanly.jsp";
	String duongDanTrangView = "eAdviser/pages/thongtinkyluatsinhvien_quanly.jsp";
	String tenCotTimDoiTuong = "maThongTinKyLuatSinhVien";
	String maObj;
	String maSoCoVanHocTap;
	String maSinhVien;
	String s_thoiGianKyLuat;
	
	


	public String getS_thoiGianKyLuat() {
		return s_thoiGianKyLuat;
	}

	public void setS_thoiGianKyLuat(String s_thoiGianKyLuat) {
		this.s_thoiGianKyLuat = s_thoiGianKyLuat;
	}

	public Date getThoiGianKyLuat() {
		return Util_Date.stringToDate(getS_thoiGianKyLuat());
	}
	
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

	public String getMaSoCoVanHocTap() {
		return maSoCoVanHocTap;
	}

	public void setMaSoCoVanHocTap(String maSoCoVanHocTap) {
		this.maSoCoVanHocTap = maSoCoVanHocTap;
	}
	public SoCoVanHocTap getSoCoVanHocTap() {
		ObjectDAO dao_soCoVanHocTap = new DAO_SoCoVanHocTap();
		ArrayList<SoCoVanHocTap> list = dao_soCoVanHocTap.listByColumns("maSoCoVanHocTap", getMaSoCoVanHocTap());
		if(list.size()>0)
			return list.get(0);
		else
			return null;
	}

	public String getMaSinhVien() {
		return maSinhVien;
	}

	public void setMaSinhVien(String maSinhVien) {
		this.maSinhVien = maSinhVien;
	}

	public SinhVien getSinhVien(){
		ObjectDAO dao_sinhVien = new DAO_SinhVien();
		ArrayList<SinhVien> list_sinhvien = dao_sinhVien.listByColumns("maSinhVien", getMaSinhVien());
		if(list_sinhvien.size()>0)
			return list_sinhvien.get(0);
		else
			return null;
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

		ArrayList<ThongTinKyLuatSinhVien> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<ThongTinKyLuatSinhVien> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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

		ThongTinKyLuatSinhVien obj = new ThongTinKyLuatSinhVien();
		obj.soCoVanHocTap=getSoCoVanHocTap();
		obj.sinhVien = getSinhVien();
		obj.maThongTinKyLuatSinhVien = getMaThongTinKyLuatSinhVien();
		obj.noiDungKyLuat = getNoiDungKyLuat();
		obj.thoiGianKyLuat=getThoiGianKyLuat();
		obj.moTa=getMoTa();
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
		ThongTinKyLuatSinhVien obj = new ThongTinKyLuatSinhVien();
		obj.setMaThongTinKyLuatSinhVien(maobj);
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
		ArrayList<ThongTinKyLuatSinhVien> arr = dao.listByColumnLike(column, key);
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
