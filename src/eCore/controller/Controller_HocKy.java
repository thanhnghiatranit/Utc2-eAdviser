package eCore.controller;

import java.io.File;
import java.io.FileInputStream;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.struts2.ServletActionContext;

import eCore.dao.ObjectDAO;
import eCore.model.DonVi;
import eCore.model.HocKy;
import eCore.model.NamHoc;
import eCore.model.HocKy;
import eCore.modelDao.DAO_DonVi;
import eCore.modelDao.DAO_HocKy;
import eCore.modelDao.DAO_NamHoc;
import eCore.modelDao.DAO_HocKy;
import eCore.util.Util_Date;

public class Controller_HocKy extends HocKy implements ZEController {
	ObjectDAO dao = new DAO_HocKy();

	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "eCore/pages/hockys.jsp";
	String duongDanTrangView = "eCore/pages/hocky.jsp";
	String tenCotTimDoiTuong = "maHocKy";
	String maObj;
	String s_ngayBatDau;
	String s_ngayKetThuc;
	String s_thoiGianCapNhat;
	String maNamHoc;
	
	File excel_myFile;
	String excel_myFileContentType;
	String excel_myFileFileName;
	String excel_myFileName;
	String myFolder_eCore;

	String tenLop;

	public File getexcel_myFile() {
		return excel_myFile;
	}

	public void setexcel_myFile(File excel_myFile) {
		this.excel_myFile = excel_myFile;
	}

	public String getexcel_myFileContentType() {
		return excel_myFileContentType;
	}

	public void setexcel_myFileContentType(String excel_myFileContentType) {
		this.excel_myFileContentType = excel_myFileContentType;
	}

	public String getexcel_myFileFileName() {
		return excel_myFileFileName;
	}

	public void setexcel_myFileFileName(String excel_myFileFileName) {
		this.excel_myFileFileName = excel_myFileFileName;
	}

	public String getexcel_myFileName() {
		return excel_myFileName;
	}

	public void setexcel_myFileName(String excel_myFileName) {
		this.excel_myFileName = excel_myFileName;
	}

	public String getMyFolder_eCore() {
		return myFolder_eCore;
	}

	public void setMyFolder_eCore(String myFolder_eCore) {
		this.myFolder_eCore = myFolder_eCore;
	}

	public String getTenLop() {
		return tenLop;
	}

	public void setTenLop(String tenLop) {
		this.tenLop = tenLop;
	}

	public String getMaNamHoc() {
		return maNamHoc;
	}

	public void setMaNamHoc(String maNamHoc) {
		this.maNamHoc = maNamHoc;
	}

	public NamHoc getNamHoc() {
		ObjectDAO dao_NamHoc = new DAO_NamHoc();
		ArrayList<NamHoc> list_namHoc = dao_NamHoc.listByColumns("maNamHoc", getMaNamHoc());
		if(list_namHoc.size()>0)
			return list_namHoc.get(0);
		else
			return null;
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

	public String getS_ngayBatDau() {
		return s_ngayBatDau;
	}

	public void setS_ngayBatDau(String s_ngayBatDau) {
		this.s_ngayBatDau = s_ngayBatDau;
	}

	public String getS_ngayKetThuc() {
		return s_ngayKetThuc;
	}

	public void setS_ngayKetThuc(String s_ngayKetThuc) {
		this.s_ngayKetThuc = s_ngayKetThuc;
	}

	public String getS_thoiGianCapNhat() {
		return s_thoiGianCapNhat;
	}

	public void setS_thoiGianCapNhat(String s_thoiGianCapNhat) {
		this.s_thoiGianCapNhat = s_thoiGianCapNhat;
	}

	public Date getNgayBatDau() {
		return Util_Date.stringToDate(getS_ngayBatDau());
	}

	public Date getNgayKetThuc() {
		return Util_Date.stringToDate(getS_ngayKetThuc());
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

		ArrayList<HocKy> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<HocKy> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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

		HocKy obj = new HocKy();
		obj.maHocKy = getMaHocKy();
		obj.tenHocKy = getTenHocKy();
		obj.ngayBatDau = getNgayBatDau();
		obj.ngayKetThuc = getNgayKetThuc();
		obj.moTa = getMoTa();
		obj.ghiChu = getGhiChu();
		obj.thoiGianCapNhat = new Date();
		obj.namHoc = getNamHoc();
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
		HocKy obj = new HocKy();
		obj.setMaHocKy(maobj);
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
		ArrayList<HocKy> arr = dao.listByColumnLike(column, key);
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
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		try {
			String s = "";
			if (!excel_myFileName.equals("")) {
				if (excel_myFile != null) {
					excel_myFileName = getTenLop() + excel_myFileFileName.substring(excel_myFileFileName.lastIndexOf("."));
					System.out.println("123 " + excel_myFileName);
					File destFile = new File(myFolder_eCore, excel_myFileName);
					s = destFile.toString();
					FileUtils.copyFile(excel_myFile, destFile);
					System.out.println(destFile.toString());

				}
				FileInputStream inputStream = new FileInputStream(new File(s));
				// Ä�á»‘i tÆ°á»£ng workbook cho file XSL.
				HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
				// Láº¥y ra sheet Ä‘áº§u tiÃªn tá»« workbook
				HSSFSheet sheet = workbook.getSheetAt(0);
				DAO_HocKy objDAO = new DAO_HocKy();
				HocKy obj = new HocKy();

				String msg = "";
				String kq = "";

				for (int i = 1; i <= sheet.getLastRowNum(); i++) {
					Row r = sheet.getRow(i);

					Cell cell_maHocKy = r.getCell(0);
					String maHocKy = cell_maHocKy.toString() + " " + i;
					
					Cell cell_ghiChu = r.getCell(1);
					String ghiChu = "";
					if (cell_ghiChu != null)
						ghiChu = cell_ghiChu.toString();

					Cell cell_moTa = r.getCell(2);
					String moTa = "";
					if (cell_moTa != null)
						moTa = cell_moTa.toString();

					Cell cell_ngayBatDau = r.getCell(3);
					Date ngayBatDau = new Date();
					String excel_ngayBatDau = "";
					if (cell_ngayBatDau != null) {
						excel_ngayBatDau = Util_Date.dateToString(cell_ngayBatDau.getDateCellValue());
						ngayBatDau = Util_Date.stringToDate(excel_ngayBatDau);
					}

					Cell cell_ngayKetThuc = r.getCell(4);
					Date ngayKetThuc = new Date();
					String excel_ngayKetThuc = "";
					if (cell_ngayKetThuc != null) {
						excel_ngayKetThuc = Util_Date.dateToString(cell_ngayKetThuc.getDateCellValue());
						ngayKetThuc = Util_Date.stringToDate(excel_ngayKetThuc);
					}
					Cell cell_tenHocKy = r.getCell(5);
					String tenHocKy = "";
					if (cell_tenHocKy != null)
						tenHocKy = cell_tenHocKy.toString();
					
					Cell cell_namHoc = r.getCell(7);
					String maNamHoc = "";
					if (cell_namHoc != null)
						maNamHoc = cell_namHoc.toString();
					ObjectDAO<NamHoc> dao_namHoc = new DAO_NamHoc();
					ArrayList<NamHoc> list_nh = dao_namHoc.listByColumns("maNamHoc", maNamHoc);
					NamHoc namHoc = new NamHoc();
					if (list_nh.size() > 0)
						namHoc = list_nh.get(0);
					else
						namHoc = null;

					obj.setMaHocKy(maHocKy);
					obj.setTenHocKy(tenHocKy);
					obj.setNgayBatDau(ngayBatDau);
					obj.setGhiChu(ghiChu);
					obj.setMoTa(moTa);
					obj.setNgayKetThuc(ngayKetThuc);
					obj.setNamHoc(namHoc);

					if (objDAO.saveOrUpdate(obj)) {
						kq += "";
					} else {
						kq += "fail ";
					}
				}
				if (kq.equals(""))
					return "SUCCESS";
				else
					return "FAIL";
			} else
				System.out.println("ssssssssssssss");
		} catch (Exception e) {
			System.out.println(e.getMessage() + "ssssdsadasdasdas");
		}
		return "SUCCESS";
	}

	@Override
	public String exportData() {
		// TODO Auto-generated method stub
		return null;
	}

}
