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
import eAdviser.model.SoCoVanHocTap;
import eAdviser.modelDao.DAO_CoVanHocTap;
import eAdviser.modelDao.DAO_PhanCongCoVanHocTap;
import eAdviser.modelDao.DAO_SoCoVanHocTap;
import eCore.controller.ZEController;
import eCore.dao.ObjectDAO;
import eCore.model.DonVi;
import eCore.model.Lop;
import eCore.model.NhanVien;
import eCore.modelDao.DAO_Lop;
import eCore.modelDao.DAO_NhanVien;
import eCore.util.Util_Date;
import servlet.DownloadServlet;

public class Controller_SoCoVanHocTap extends SoCoVanHocTap implements ZEController, ServletRequestAware, ServletResponseAware {

	ObjectDAO dao = new DAO_SoCoVanHocTap();
	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "eAdviser/pages/socovanhoctaps.jsp";
	String duongDanTrangView = "eAdviser/pages/socovanhoctap.jsp";
	String tenCotTimDoiTuong = "maSoCoVanHocTap";
	String maSoCoVanHocTap;
	String maLop;
	String s_ngayBD;
	String s_ngayKT;
	
	File myFile;
	String myFileContentType;
	String myFileFileName;
	String myFileName;
	String myFolder_eAdviser;
	String tenLop;

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

	public String getTenLop() {
		return tenLop;
	}

	public void setTenLop(String tenLop) {
		this.tenLop = tenLop;
	}

	public String getS_ngayBD() {
		return s_ngayBD;
	}

	public void setS_ngayBD(String s_ngayBD) {
		this.s_ngayBD = s_ngayBD;
	}

	public Date getNgayBatDau() {
		return Util_Date.stringToDate(getS_ngayBD());
	}

	public String getS_ngayKT() {
		return s_ngayKT;
	}

	public void setS_ngayKT(String s_ngayKT) {
		this.s_ngayKT = s_ngayKT;
	}

	public Date getNgayKetThuc() {
		return Util_Date.stringToDate(getS_ngayKT());
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

	public String getMaSoCoVanHocTap() {
		return maSoCoVanHocTap;
	}

	public void setMaSoCoVanHocTap(String maSoCoVanHocTap) {
		this.maSoCoVanHocTap = maSoCoVanHocTap;
	}

	public SoCoVanHocTap getSoCoVanHocTap() {
		ObjectDAO dao_SoCoVanHocTap = new DAO_SoCoVanHocTap();
		ArrayList<SoCoVanHocTap> list_soCoVanHocTap = dao_SoCoVanHocTap.listByColumns("maSoCoVanHocTap",
				getMaSoCoVanHocTap());
		if (list_soCoVanHocTap.size() > 0)
			return list_soCoVanHocTap.get(0);
		else
			return null;
	}

	public String getMaLop() {
		return maLop;
	}

	public void setMaLop(String maLop) {
		this.maLop = maLop;
	}

	public Lop getLop() {
		ObjectDAO dao_lop = new DAO_Lop();
		ArrayList<Lop> list_lop = dao_lop.listByColumns("maLop", getMaLop());
		if (list_lop.size() > 0)
			return list_lop.get(0);
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

		ArrayList<SoCoVanHocTap> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<SoCoVanHocTap> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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

		SoCoVanHocTap obj = new SoCoVanHocTap();
		obj.lop = getLop();
		obj.maSoCoVanHocTap = getMaSoCoVanHocTap();
		obj.tenSoCoVanHocTap = getTenSoCoVanHocTap();
		obj.ngayBD = getNgayBatDau();
		obj.ngayKT = getNgayKetThuc();
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
		SoCoVanHocTap obj = new SoCoVanHocTap();
		obj.setMaSoCoVanHocTap(maobj);
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
		ArrayList<SoCoVanHocTap> arr = dao.listByColumnLike(column, key);
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
				
				HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
				// Lấy ra sheet đầu tiên workbook
				HSSFSheet sheet = workbook.getSheetAt(0);
				DAO_SoCoVanHocTap objDAO = new DAO_SoCoVanHocTap();
				SoCoVanHocTap soCoVanHocTap = new SoCoVanHocTap();

				String msg = "";
				String kq = "";

				for (int i = 5; i <= sheet.getLastRowNum(); i++) {
					Row r = sheet.getRow(i);

					Cell cell_maLop = r.getCell(1);
					String maLop="";
					Lop lop = new Lop();
					if(cell_maLop != null) {
						maLop = cell_maLop.toString();
						ObjectDAO<Lop> dao_Lop = new DAO_Lop();
						ArrayList<Lop> list_Lop = dao_Lop.listByColumns("maLop", maLop);
						if(list_Lop.size()>0) lop = list_Lop.get(0);
					}
					
					Cell cell_tenLop = r.getCell(2);
					String tenLop = "";
					if (cell_tenLop != null)
						tenLop = cell_tenLop.toString();
					
					Cell cell_maSoCoVanHocTap = r.getCell(3);
					String maSoCoVanHocTap = "";
					if (cell_maSoCoVanHocTap != null)
						maSoCoVanHocTap = cell_maSoCoVanHocTap.toString();

					Cell cell_tenSoCoVanHocTap = r.getCell(4);
					String tenSoCoVanHocTap = "";
					if (cell_tenSoCoVanHocTap != null)
						tenSoCoVanHocTap = cell_tenSoCoVanHocTap.toString();
					
					Cell cell_ngayBD = r.getCell(5);
					String ngayBD = "";
					if (cell_ngayBD != null)
						ngayBD = cell_ngayBD.toString();

					Cell cell_ngayKT = r.getCell(6);
					String ngayKT = "";
					if (cell_ngayKT != null)
						ngayKT = cell_ngayKT.toString();

					Cell cell_ghiChu = r.getCell(7);
					String ghiChu = "";
					if (cell_ghiChu != null)
						ghiChu = cell_ghiChu.toString();

					System.out.println("ngayBD="+ngayBD);

					soCoVanHocTap.setLop(lop);
					soCoVanHocTap.setMaSoCoVanHocTap(maSoCoVanHocTap);
					soCoVanHocTap.setTenSoCoVanHocTap(tenSoCoVanHocTap);
					soCoVanHocTap.setNgayBD(Util_Date.stringToDate2(ngayBD));
					soCoVanHocTap.setNgayKT(Util_Date.stringToDate2(ngayKT));
					soCoVanHocTap.setGhiChu(ghiChu);

					if (objDAO.saveOrUpdate(soCoVanHocTap)) {
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
	public String exportData() throws IOException{
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("Danh sách sổ cố vấn học tập");
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
		cell.setCellValue("DANH SÁCH SỔ CỐ VẤN HỌC TẬP");
		style.setAlignment(HorizontalAlignment.CENTER);
		cell.setCellStyle(style);

		rownum = rownum + 1;
		row = sheet.createRow(rownum);

		cell = row.createCell(0, CellType.STRING);
		cell.setCellValue("STT");
		cell.setCellStyle(style);
		
		cell = row.createCell(1, CellType.STRING);
		cell.setCellValue("Mã lớp");
		cell.setCellStyle(style);

		cell = row.createCell(2, CellType.STRING);
		cell.setCellValue("Tên lớp");
		cell.setCellStyle(style);

		// merged cell
		//sheet.addMergedRegion(new CellRangeAddress(rownum, rownum, 2, 3));
		cell = row.createCell(3, CellType.STRING);
		cell.setCellValue("Mã sổ");
		cell.setCellStyle(style);

		cell = row.createCell(4, CellType.STRING);
		cell.setCellValue("Tên sổ");
		cell.setCellStyle(style);

		cell = row.createCell(5, CellType.STRING);
		cell.setCellValue("Ngày bắt đầu");
		cell.setCellStyle(style);

		cell = row.createCell(6, CellType.STRING);
		cell.setCellValue("Ngày kết thúc");
		cell.setCellStyle(style);
		
		cell = row.createCell(7, CellType.STRING);
		cell.setCellValue("Ghi chú");
		cell.setCellStyle(style);

		// Data
		ObjectDAO<SoCoVanHocTap> dao_SoCoVanHocTap = new DAO_SoCoVanHocTap();
		ArrayList<SoCoVanHocTap> list_SoCoVanHocTap = dao_SoCoVanHocTap.listByColumnLike("maSoCoVanHocTap",
				getMaSoCoVanHocTap());

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		list_SoCoVanHocTap = list_SoCoVanHocTap.size() == 0
				? (ArrayList<SoCoVanHocTap>) session.getAttribute("arr")
				: list_SoCoVanHocTap;

		int stt = 0;
		for (SoCoVanHocTap soCoVanHocTap : list_SoCoVanHocTap) {
			rownum++;
			stt++;
			row = sheet.createRow(rownum);

			cell = row.createCell(0, CellType.STRING);
			cell.setCellValue(stt);

			cell = row.createCell(1, CellType.STRING);
			cell.setCellValue(soCoVanHocTap.getLop().getMaLop());
			
			cell = row.createCell(2, CellType.STRING);
			cell.setCellValue(soCoVanHocTap.getLop().getTenLop());
			

			cell = row.createCell(3, CellType.STRING);
			cell.setCellValue(soCoVanHocTap.getMaSoCoVanHocTap());

			cell = row.createCell(4, CellType.STRING);
			cell.setCellValue(soCoVanHocTap.getTenSoCoVanHocTap());

			cell = row.createCell(5, CellType.STRING);
			if(soCoVanHocTap.getNgayBD() != null)
			cell.setCellValue(Util_Date.dateToString2(soCoVanHocTap.getNgayBD()));

			
			cell = row.createCell(6, CellType.STRING);
			if(soCoVanHocTap.getNgayKT() !=null )
			cell.setCellValue(Util_Date.dateToString2(soCoVanHocTap.getNgayKT()));

			cell = row.createCell(7, CellType.STRING);
			if(soCoVanHocTap.getGhiChu() !=null )
			cell.setCellValue(soCoVanHocTap.getGhiChu());

		}
		System.out.println("rownum = " + rownum);


		String fileName = "Danh sach so co van hoc tap.xls";
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
