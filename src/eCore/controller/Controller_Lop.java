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
import eCore.model.Lop;
import eCore.modelDao.DAO_DonVi;
import eCore.modelDao.DAO_Lop;

public class Controller_Lop extends Lop implements ZEController {
	ObjectDAO dao = new DAO_Lop();

	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "eCore/pages/lops.jsp";
	String duongDanTrangView = "eCore/pages/lop.jsp";
	String tenCotTimDoiTuong = "maLop";
	String maObj;
	String maDonVi;
	
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

	public String getMaObj() {
		return maObj;
	}

	public void setMaObj(String maObj) {
		this.maObj = maObj;
	}

	public String getMaDonVi() {
		return maDonVi;
	}

	public void setMaDonVi(String maDonVi) {
		this.maDonVi = maDonVi;
	}

	public DonVi getDonVi() {
		ObjectDAO objdao = new DAO_DonVi();
		ArrayList<DonVi> list = objdao.listByColumns("maDonVi", getMaDonVi());
		if (list.size() > 0)
			return list.get(0);
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

		ArrayList<Lop> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<Lop> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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

		Lop obj = new Lop();
		obj.maLop = getMaLop();
		obj.tenLop = getTenLop();
		obj.khoa = getKhoa();
		obj.nienKhoa = getNienKhoa();
		obj.moTa = getMoTa();
		obj.ghiChu = getGhiChu();
		obj.donVi = getDonVi();
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
		Lop obj = new Lop();
		obj.setMaLop(maobj);
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
		ArrayList<Lop> arr = dao.listByColumnLike(column, key);
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
					System.out.println("123 "+excel_myFileName);
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
				DAO_Lop objDAO = new DAO_Lop();
				Lop obj = new Lop();

				String msg = "";
				String kq = "";

				for (int i = 1; i <= sheet.getLastRowNum(); i++) {
					Row r = sheet.getRow(i);

					Cell cell_maLop = r.getCell(0);
					String maLop = cell_maLop.toString();
					Cell cell_ghiChu = r.getCell(1);
					String ghiChu = "";
					if (cell_ghiChu != null)
						ghiChu = cell_ghiChu.toString();

					Cell cell_khoa = r.getCell(2);
					String khoa = "";
					if (cell_khoa != null)
						khoa = cell_khoa.toString();

					Cell cell_moTa = r.getCell(3);
					String moTa = "";
					if (cell_moTa != null)
						moTa = cell_moTa.toString();

					Cell cell_nienKhoa = r.getCell(4);
					String nienKhoa = "";
					if (cell_nienKhoa != null)
						nienKhoa = cell_nienKhoa.toString();

					Cell cell_tenLop = r.getCell(5);
					String tenLop = "";
					if (cell_tenLop != null)
						tenLop = cell_tenLop.toString();

					Cell cell_maDonViCha = r.getCell(8);
					String maDonViCha = "";
					if (cell_maDonViCha != null)
						maDonViCha = cell_maDonViCha.toString();
					ObjectDAO<DonVi> dao_donViCha = new DAO_DonVi();
					ArrayList<DonVi> list_dv = dao_donViCha.listByColumns("maDonVi", maDonViCha);
					DonVi donViCha = new DonVi();
					if (list_dv.size() > 0)
						donViCha = list_dv.get(0);
					else
						donViCha = null;

					obj.setMaLop(maLop);
					obj.setKhoa(nienKhoa);
					obj.setNienKhoa(nienKhoa);
					obj.setGhiChu(ghiChu);
					obj.setMoTa(moTa);
					obj.setTenLop(tenLop);
					obj.setDonVi(donViCha);

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
