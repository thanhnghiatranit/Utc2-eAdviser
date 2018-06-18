package eAdviser.controller;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.ssi.SSIExternalResolver;
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

import eAdviser.model.BaoCaoTinhHinhLop;
import eAdviser.model.BienBanSinhHoatLop;
import eAdviser.model.CoVanHocTap;
import eAdviser.model.SoCoVanHocTap;
import eAdviser.model.ThongTinSinhVien;
import eAdviser.modelDao.DAO_BaoCaoTinhHinhLop;
import eAdviser.modelDao.DAO_BienBanSinhHoatLop;
import eAdviser.modelDao.DAO_SoCoVanHocTap;
import eAdviser.modelDao.DAO_ThongTinSinhVien;
import eCore.controller.ZEController;
import eCore.dao.ObjectDAO;
import eCore.model.DonVi;
import eCore.model.SinhVien;
import eCore.modelDao.DAO_SinhVien;
import servlet.DownloadServlet;

public class Controller_ThongTinSinhVien extends ThongTinSinhVien implements ZEController,ServletRequestAware,ServletResponseAware{

	ObjectDAO dao=new DAO_ThongTinSinhVien();
	
	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "eAdviser/pages/thongtinsinhviens.jsp";
	String duongDanTrangView = "eAdviser/pages/thongtinsinhvien.jsp";
	String tenCotTimDoiTuong = "maThongTinSinhVien";
	String maObj;
	String maSoCoVanHocTap;
	String maSinhVien;
	
	
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

		ArrayList<ThongTinSinhVien> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<ThongTinSinhVien> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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

		ThongTinSinhVien obj = new ThongTinSinhVien();
		obj.soCoVanHocTap=getSoCoVanHocTap();
		obj.sinhVien = getSinhVien();
		obj.maThongTinSinhVien = getMaThongTinSinhVien();
		obj.canBoLop = getCanBoLop();
		obj.email=getEmail();
		obj.dienThoaiDiDong = getDienThoaiDiDong();
		obj.dienThoaiGiaDinh=getDienThoaiGiaDinh();
		obj.diaChiBaoTin=getDiaChiBaoTin();
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
		ThongTinSinhVien obj = new ThongTinSinhVien();
		obj.setMaThongTinSinhVien(maobj);
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
		ArrayList<ThongTinSinhVien> arr = dao.listByColumnLike(column, key);
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
				DAO_ThongTinSinhVien objDAO = new DAO_ThongTinSinhVien();
				ThongTinSinhVien thongTinSinhVien = new ThongTinSinhVien();

				String msg = "";
				String kq = "";

				for (int i = 5; i <= sheet.getLastRowNum(); i++) {
					Row r = sheet.getRow(i);

					Cell cell_maSoCoVanHocTap = r.getCell(1);
					String maSoCoVanHocTap= "";
					SoCoVanHocTap soCoVanHocTap = new SoCoVanHocTap();
					if (cell_maSoCoVanHocTap != null) {
						maSoCoVanHocTap = cell_maSoCoVanHocTap.toString();
						ObjectDAO<SoCoVanHocTap> dao_SoCoVanHocTap = new DAO_SoCoVanHocTap();
						ArrayList<SoCoVanHocTap> list_SoCoVanHocTap = dao_SoCoVanHocTap.listByColumns("maSoCoVanHocTap", maSoCoVanHocTap);
						if(list_SoCoVanHocTap.size()>0) soCoVanHocTap=list_SoCoVanHocTap.get(0);
						
					}
					
					

					Cell cell_maSinhVien = r.getCell(2);
					String maSinhVien= "";
					SinhVien sinhVien = new SinhVien();
					if (cell_maSinhVien != null) {
						maSinhVien = cell_maSinhVien.toString();
						ObjectDAO<SinhVien> dao_SinhVien = new DAO_SinhVien();
						ArrayList<SinhVien> list_SinhVien = dao_SinhVien.listByColumns("maSinhVien", maSinhVien);
						if(list_SinhVien.size()>0) sinhVien=list_SinhVien.get(0);
					}
					
					Cell cell_maThongTin = r.getCell(3);
					String maThongTin= "";
					if (cell_maThongTin != null)
						maThongTin = cell_maThongTin.toString();

					Cell cell_canBoLop = r.getCell(4);
					String canBoLop = "";
					if (cell_canBoLop != null)
						canBoLop = cell_canBoLop.toString();
					

					Cell cell_email = r.getCell(5);
					String email = "";
					if (cell_email != null)
						email = cell_email.toString();

					Cell cell_dienThoaiDiDong = r.getCell(6);
					String dienThoaiDiDong = "";
					if (cell_dienThoaiDiDong != null)
						dienThoaiDiDong = cell_dienThoaiDiDong.toString();
					
					Cell cell_dienThoaiGiaDinh = r.getCell(7);
					String dienThoaiGiaDinh = "";
					if (cell_dienThoaiGiaDinh != null)
						dienThoaiGiaDinh = cell_dienThoaiGiaDinh.toString();
					
					Cell cell_diaChiBaoTin = r.getCell(8);
					String diaChiBaoTin = "";
					if (cell_diaChiBaoTin != null)
						diaChiBaoTin = cell_diaChiBaoTin.toString();
					
					Cell cell_ghiChu = r.getCell(9);
					String ghiChu = "";
					if (cell_ghiChu != null)
						ghiChu = cell_ghiChu.toString();

					thongTinSinhVien.setSoCoVanHocTap(soCoVanHocTap);
					thongTinSinhVien.setSinhVien(sinhVien);;
					thongTinSinhVien.setMaThongTinSinhVien(maThongTin);;
					thongTinSinhVien.setCanBoLop(canBoLop);;
					thongTinSinhVien.setEmail(email);
					thongTinSinhVien.setDienThoaiDiDong(dienThoaiDiDong);
					thongTinSinhVien.setDienThoaiGiaDinh(dienThoaiGiaDinh);
					thongTinSinhVien.setDiaChiBaoTin(diaChiBaoTin);
					thongTinSinhVien.setGhiChu(ghiChu);

					if (objDAO.saveOrUpdate(thongTinSinhVien)) {
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

	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}

	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}

	public HttpServletResponse getServletResponse() {
		return servletResponse;
	}

	public void setServletResponse(HttpServletResponse servletResponse) {
		this.servletResponse = servletResponse;
	}

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
		HSSFSheet sheet = workbook.createSheet("Danh sách thông tin sinh viên");
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
		cell.setCellValue("DANH SÁCH THÔNG TIN SINH VIÊN");
		style.setAlignment(HorizontalAlignment.CENTER);
		cell.setCellStyle(style);

		rownum = rownum + 1;
		row = sheet.createRow(rownum);

		cell = row.createCell(0, CellType.STRING);
		cell.setCellValue("STT");
		cell.setCellStyle(style);

		cell = row.createCell(1, CellType.STRING);
		cell.setCellValue("Sổ cố vấn học tập");
		cell.setCellStyle(style);

		cell = row.createCell(2, CellType.STRING);
		cell.setCellValue("Mã sinh viên");
		cell.setCellStyle(style);

		// merged cell
		// sheet.addMergedRegion(new CellRangeAddress(rownum, rownum, 2, 3));
		cell = row.createCell(3, CellType.STRING);
		cell.setCellValue("Mã thông tin");
		cell.setCellStyle(style);

		cell = row.createCell(4, CellType.STRING);
		cell.setCellValue("Cán bộ lớp");
		cell.setCellStyle(style);

		cell = row.createCell(5, CellType.STRING);
		cell.setCellValue("Email");
		cell.setCellStyle(style);

		cell = row.createCell(6, CellType.STRING);
		cell.setCellValue("Điện thoại di động");
		cell.setCellStyle(style);
		
		cell = row.createCell(7, CellType.STRING);
		cell.setCellValue("Điện thoại gia đình");
		cell.setCellStyle(style);
		
		cell = row.createCell(8, CellType.STRING);
		cell.setCellValue("Địa chỉ báo tin");
		cell.setCellStyle(style);

		cell = row.createCell(9, CellType.STRING);
		cell.setCellValue("Ghi chú");
		cell.setCellStyle(style);

		// Data
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ObjectDAO<ThongTinSinhVien> dao_thongtinsinhvien = new DAO_ThongTinSinhVien();
		ArrayList<ThongTinSinhVien> list_thongtinsinhvien = new ArrayList<>();
		
		String maSo=session.getAttribute("maSo").toString();
		if (maSo!=null && !maSo.isEmpty()) {
			list_thongtinsinhvien = dao_thongtinsinhvien.listByColumnLike("soCoVanHocTap", maSo);
		}
		else
		{
			list_thongtinsinhvien = dao_thongtinsinhvien.listAll();
		}
		

		int stt = 0;
		for (ThongTinSinhVien thongtinsinhvien : list_thongtinsinhvien) {
			rownum++;
			stt++;
			row = sheet.createRow(rownum);

			cell = row.createCell(0, CellType.STRING);
			cell.setCellValue(stt);

			cell = row.createCell(1, CellType.STRING);
			cell.setCellValue(thongtinsinhvien.getSoCoVanHocTap().getMaSoCoVanHocTap());

			cell = row.createCell(2, CellType.STRING);
			cell.setCellValue(thongtinsinhvien.getSinhVien().getMaSinhVien());

			cell = row.createCell(3, CellType.STRING);
			cell.setCellValue(thongtinsinhvien.getMaThongTinSinhVien());

			cell = row.createCell(4, CellType.STRING);
			cell.setCellValue(thongtinsinhvien.getCanBoLop());

			cell = row.createCell(5, CellType.STRING);
			cell.setCellValue(thongtinsinhvien.getEmail());

			cell = row.createCell(6, CellType.STRING);
			cell.setCellValue(thongtinsinhvien.getDienThoaiDiDong());

			cell = row.createCell(7, CellType.STRING);
			cell.setCellValue(thongtinsinhvien.getDienThoaiGiaDinh());
			
			cell = row.createCell(8, CellType.STRING);
			cell.setCellValue(thongtinsinhvien.getDiaChiBaoTin());
			
			cell = row.createCell(9, CellType.STRING);
			cell.setCellValue(thongtinsinhvien.getGhiChu());

		}
		System.out.println("rownum = " + rownum);

		String fileName = "Danh sach thong tin sinh vien.xls";
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
	
}
