package eAdviser.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import eAdviser.model.CoVanHocTap;
import eAdviser.model.PhanCongCoVanHocTap;
import eAdviser.modelDao.DAO_CoVanHocTap;
import eAdviser.modelDao.DAO_PhanCongCoVanHocTap;
import eCore.controller.ZEController;
import eCore.dao.ObjectDAO;
import eCore.model.DonVi;
import eCore.model.NhanVien;
import eCore.modelDao.DAO_NhanVien;
import servlet.DownloadServlet;

public class Controller_CoVanHocTap extends CoVanHocTap implements ZEController,ServletRequestAware, ServletResponseAware {

	ObjectDAO dao = new DAO_CoVanHocTap();
	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "eAdviser/pages/covanhoctaps.jsp";
	String duongDanTrangView = "eAdviser/pages/covanhoctap.jsp";
	String tenCotTimDoiTuong = "maCoVanHocTap";
	String maObj;
	String maNhanVien;
	String maCoVanHocTap;


	File myFile;
	String myFileContentType;
	String myFileFileName;
	String myFileName;
	String myFolder_eAdviser;
	String tenLop;

	
	
	public String getTenLop() {
		return tenLop;
	}

	public void setTenLop(String tenLop) {
		this.tenLop = tenLop;
	}

	public File getMyFile() {
		return myFile;
	}

	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}

	public String getMyFileContentType() {
		return myFileContentType;
	}

	public void setMyFileContentType(String myFileContentType) {
		this.myFileContentType = myFileContentType;
	}

	public String getMyFileFileName() {
		return myFileFileName;
	}

	public void setMyFileFileName(String myFileFileName) {
		this.myFileFileName = myFileFileName;
	}

	public String getMyFileName() {
		return myFileName;
	}

	public void setMyFileName(String myFileName) {
		this.myFileName = myFileName;
	}


	public String getMyFolder_eAdviser() {
		return myFolder_eAdviser;
	}

	public void setMyFolder_eAdviser(String myFolder_eAdviser) {
		this.myFolder_eAdviser = myFolder_eAdviser;
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

	public String getMaNhanVien() {
		return maNhanVien;
	}

	public void setMaNhanVien(String maNhanVien) {
		this.maNhanVien = maNhanVien;
	}

	public NhanVien getNhanVien() {
		ObjectDAO dao_NhanVien = new DAO_NhanVien();
		ArrayList<NhanVien> list_nhanVien = dao_NhanVien.listByColumns("maNhanVien", getMaNhanVien());
		if (list_nhanVien.size() > 0)
			return list_nhanVien.get(0);
		else
			return null;
	}

	public String getMaCoVanHocTap() {
		return maCoVanHocTap;
	}

	public void setMaCoVanHocTap(String maCoVanHocTap) {
		this.maCoVanHocTap = maCoVanHocTap;
	}

	public CoVanHocTap getCoVanHocTap() {
		ObjectDAO dao_CoVanHocTap = new DAO_CoVanHocTap();
		ArrayList<CoVanHocTap> list_coVanHocTap = dao_CoVanHocTap.listByColumns("maCoVanHocTap", getMaCoVanHocTap());
		if (list_coVanHocTap.size() > 0)
			return list_coVanHocTap.get(0);
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

		ArrayList<CoVanHocTap> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<CoVanHocTap> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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

		CoVanHocTap obj = new CoVanHocTap();
		obj.maCoVanHocTap = getMaCoVanHocTap();
		obj.nhanVien = getNhanVien();
		obj.dienThoaiCoQuan = getDienThoaiCoQuan();
		obj.diaChiGuiThu = getDiaChiGuiThu();
		obj.diDong = getDiDong();
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
		CoVanHocTap obj = new CoVanHocTap();
		obj.setMaCoVanHocTap(maobj);
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
		ArrayList<CoVanHocTap> arr = dao.listByColumnLike(column, key);
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
			if (!myFileName.equals("")) {
				if (myFile != null) {
					myFileName = getTenLop() + myFileFileName.substring(myFileFileName.lastIndexOf("."));
					File destFile = new File(myFolder_eAdviser, myFileName);
					s = destFile.toString();
					FileUtils.copyFile(myFile, destFile);
					System.out.println(destFile.toString());

				}
				FileInputStream inputStream = new FileInputStream(new File(s));
				// Ä�á»‘i tÆ°á»£ng workbook cho file XSL.
				HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
				// Lấy ra sheet đầu tiên workbook
				HSSFSheet sheet = workbook.getSheetAt(0);
				DAO_CoVanHocTap objDAO = new DAO_CoVanHocTap();
				CoVanHocTap coVanHocTap = new CoVanHocTap();

				String msg = "";
				String kq = "";

				for (int i = 5; i <= sheet.getLastRowNum(); i++) {
					Row r = sheet.getRow(i);

					Cell cell_maCoVanHocTap = r.getCell(1);
					String maCoVanHocTap = "";
					if (cell_maCoVanHocTap != null)
						maCoVanHocTap = cell_maCoVanHocTap.toString();

					Cell cell_maNhanVien = r.getCell(2);
					String maNhanVien = "";
					NhanVien nhanVien = new NhanVien();
					if (cell_maNhanVien != null) {
						maNhanVien = cell_maNhanVien.toString();
						ObjectDAO<NhanVien> dao_NhanVien = new DAO_NhanVien();
						ArrayList<NhanVien> list_NhanVien = dao_NhanVien.listByColumns("maNhanVien", maNhanVien);
						if(list_NhanVien.size()>0) nhanVien = list_NhanVien.get(0);
					}

					Cell cell_diDong = r.getCell(4);
					String diDong = "";
					if (cell_diDong != null)
						diDong = cell_diDong.toString();

					

					Cell cell_diaChiGuiThu = r.getCell(5);
					String diaChiGuiThu = "";
					if (cell_diaChiGuiThu != null)
						diaChiGuiThu = cell_diaChiGuiThu.toString();

					Cell cell_dienThoaiCoQuan = r.getCell(6);
					String dienThoaiCoQuan = "";
					if (cell_dienThoaiCoQuan != null)
						dienThoaiCoQuan = cell_dienThoaiCoQuan.toString();
					
					Cell cell_ghiChu = r.getCell(7);
					String ghiChu = "";
					if (cell_ghiChu != null)
						ghiChu = cell_ghiChu.toString();

					coVanHocTap.setMaCoVanHocTap(maCoVanHocTap);
					coVanHocTap.setNhanVien(nhanVien);
					coVanHocTap.setDiDong(diDong);
					coVanHocTap.setDiaChiGuiThu(diaChiGuiThu);
					coVanHocTap.setDienThoaiCoQuan(dienThoaiCoQuan);
					coVanHocTap.setGhiChu(ghiChu);

					if (objDAO.saveOrUpdate(coVanHocTap)) {
						kq += "";
					} else {
						kq += "fail ";
					}
				}
				if (kq.equals(""))
					return "SUCCESS";
				else
					return "FAIL";
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "SUCCESS";
	}

	private HttpServletRequest servletRequest;
	private HttpServletResponse servletResponse;

	private static HSSFCellStyle createStyleForTitle(HSSFWorkbook workbook) {
		HSSFFont font = workbook.createFont();
		font.setBold(true);
		HSSFCellStyle style = workbook.createCellStyle();
		style.setFont(font);
		style.setAlignment(HorizontalAlignment.CENTER);
		return style;
	}

	@Override
	public String exportData() throws IOException {
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("Danh sách cố vấn học tập");
		//
		HSSFCellStyle style = createStyleForTitle(workbook);
		// merged cell
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 9));

		int rownum = 0;
		Cell cell;
		Row row;

		row = sheet.createRow(rownum);
		cell = row.createCell(0, CellType.STRING);
		cell.setCellValue("TRƯỜNG ĐẠI HỌC GIAO THÔNG VẬN TẢI");
		style.setAlignment(HorizontalAlignment.CENTER);
		cell.setCellStyle(style);

		rownum = rownum + 1;
		row = sheet.createRow(rownum);

		// merged cell
		sheet.addMergedRegion(new CellRangeAddress(rownum, rownum, 0, 9));
		cell = row.createCell(0, CellType.STRING);
		cell.setCellValue("PHÂN HIỆU TẠI TP. HỒ CHÍ  MINH");
		style.setAlignment(HorizontalAlignment.CENTER);
		cell.setCellStyle(style);

		rownum = rownum + 2;
		row = sheet.createRow(rownum);
		// merged cell
		sheet.addMergedRegion(new CellRangeAddress(rownum, rownum, 0, 9));
		cell = row.createCell(0, CellType.STRING);
		cell.setCellValue("DANH SÁCH CỐ VẤN HỌC TẬP");
		style.setAlignment(HorizontalAlignment.CENTER);
		cell.setCellStyle(style);

		rownum = rownum + 1;
		row = sheet.createRow(rownum);

		cell = row.createCell(0, CellType.STRING);
		cell.setCellValue("STT");
		cell.setCellStyle(style);

		cell = row.createCell(1, CellType.STRING);
		cell.setCellValue("Mã cố vấn học tập");
		cell.setCellStyle(style);
		
		cell = row.createCell(2, CellType.STRING);
		cell.setCellValue("Mã nhân viên");
		cell.setCellStyle(style);

		
		cell = row.createCell(3, CellType.STRING);
		cell.setCellValue("Nhân viên");
		cell.setCellStyle(style);

		cell = row.createCell(4, CellType.STRING);
		cell.setCellValue("Di động");
		cell.setCellStyle(style);

		cell = row.createCell(5, CellType.STRING);
		cell.setCellValue("Địa chỉ gửi thư");
		cell.setCellStyle(style);

		cell = row.createCell(6, CellType.STRING);
		cell.setCellValue("Điện thoại cơ quan");
		cell.setCellStyle(style);
		
		cell = row.createCell(7, CellType.STRING);
		cell.setCellValue("Ghi chú");
		cell.setCellStyle(style);

		// Data
		ObjectDAO<CoVanHocTap> dao_CoVanHocTap = new DAO_CoVanHocTap();
		ArrayList<CoVanHocTap> list_CoVanHocTap = dao_CoVanHocTap.listAll();
		
		

		int stt = 0;
		for (CoVanHocTap coVanHocTap : list_CoVanHocTap) {
			rownum++;
			stt++;
			row = sheet.createRow(rownum);

			cell = row.createCell(0, CellType.STRING);
			cell.setCellValue(stt);

			cell = row.createCell(1, CellType.STRING);
			cell.setCellValue(coVanHocTap.getMaCoVanHocTap());
			
			cell = row.createCell(2, CellType.STRING);
			cell.setCellValue(coVanHocTap.getNhanVien().getMaNhanVien());

			
			cell = row.createCell(3, CellType.STRING);
			cell.setCellValue(coVanHocTap.getNhanVien().getTenNhanVien());

			cell = row.createCell(4, CellType.STRING);
			cell.setCellValue(coVanHocTap.getDiDong());

			cell = row.createCell(5, CellType.STRING);
			cell.setCellValue(coVanHocTap.getDiaChiGuiThu());

			cell = row.createCell(6, CellType.STRING);
			cell.setCellValue(coVanHocTap.getDienThoaiCoQuan());

			cell = row.createCell(7, CellType.STRING);
			cell.setCellValue(coVanHocTap.getGhiChu());

		}
		System.out.println("rownum = " + rownum);
		// PropertyTemplate pt = new PropertyTemplate();
		// pt.drawBorders(new CellRangeAddress(4, 4, 0, 9), BorderStyle.THIN,
		// BorderExtent.ALL);
		//
		// pt.drawBorders(new CellRangeAddress(5, rownum, 0, 1), BorderStyle.THIN,
		// BorderExtent.LEFT);
		//
		// pt.drawBorders(new CellRangeAddress(5, rownum, 0, 2), BorderStyle.THIN,
		// BorderExtent.INSIDE_VERTICAL);
		//
		// pt.drawBorders(new CellRangeAddress(5, rownum, 3, 9), BorderStyle.THIN,
		// BorderExtent.INSIDE_VERTICAL);
		//
		// pt.drawBorders(new CellRangeAddress(5, rownum, 10, 10), BorderStyle.THIN,
		// BorderExtent.LEFT);
		//
		// pt.drawBorders(new CellRangeAddress(rownum + 1, rownum + 1, 0, 9),
		// BorderStyle.THIN, BorderExtent.TOP);
		//
		// pt.applyBorders(sheet);

		String fileName = "Danh sach co van hoc tap.xls";
		String filePath = servletRequest.getSession().getServletContext().getRealPath("/").concat("report") + "/"
				+ fileName;
		System.out.println("filePath = " + filePath);
		File file = new File(filePath);
		file.getParentFile().mkdirs();

		FileOutputStream outFile = new FileOutputStream(file);
		workbook.write(outFile);
		System.out.println("Created file: " + file.getAbsolutePath());

		////////////////////////////////////////////////////
		// DOWNLOAD FILE
		////////////////////////////////////////////////////
		DownloadServlet dl = new DownloadServlet();
		try {
			dl.doGet(servletRequest, servletResponse, filePath, fileName);

		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "SUCCESS";
	}

	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}

	public void setServletResponse(HttpServletResponse servletResponse) {
		this.servletResponse = servletResponse;
	}

	

}
