package eAdviser.controller;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import eAdviser.model.BienBanSinhHoatLop;
import eAdviser.model.CoVanHocTap;
import eAdviser.model.SoCoVanHocTap;
import eAdviser.model.ThongTinSinhVien;
import eAdviser.model.ThongTinSinhVienKhoKhan;
import eAdviser.modelDao.DAO_BienBanSinhHoatLop;
import eAdviser.modelDao.DAO_SoCoVanHocTap;
import eAdviser.modelDao.DAO_ThongTinSinhVien;
import eAdviser.modelDao.DAO_ThongTinSinhVienKhoKhan;
import eCore.controller.ZEController;
import eCore.dao.ObjectDAO;
import eCore.model.DonVi;
import eCore.model.SinhVien;
import eCore.modelDao.DAO_SinhVien;
import eCore.util.Util_Date;
import servlet.DownloadServlet;

public class Controller_ThongTinSinhVienKhoKhan extends ThongTinSinhVienKhoKhan implements ZEController,ServletRequestAware,ServletResponseAware{

	ObjectDAO dao=new DAO_ThongTinSinhVienKhoKhan();
	
	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "eAdviser/pages/thongtinsinhvienkhokhans.jsp";
	String duongDanTrangView = "eAdviser/pages/thongtinsinhvienkhokhan.jsp";
	String tenCotTimDoiTuong = "maThongTinSinhVienKhoKhan";
	String maObj;
	String maSoCoVanHocTap;
	String maSinhVien;
	String s_thoiGianGhiNhan;
	
	
	public String getS_thoiGianGhiNhan() {
		return s_thoiGianGhiNhan;
	}

	public void setS_thoiGianGhiNhan(String s_thoiGianGhiNhan) {
		this.s_thoiGianGhiNhan = s_thoiGianGhiNhan;
	}

	public Date getThoiGianGhiNhan() {
		return Util_Date.stringToDate(getS_thoiGianGhiNhan());
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

		ArrayList<ThongTinSinhVienKhoKhan> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<ThongTinSinhVienKhoKhan> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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

		ThongTinSinhVienKhoKhan obj = new ThongTinSinhVienKhoKhan();
		obj.soCoVanHocTap=getSoCoVanHocTap();
		obj.sinhVien = getSinhVien();
		obj.maThongTinSinhVienKhoKhan = getMaThongTinSinhVienKhoKhan();
		obj.hoanCanhGiaDinh = getHoanCanhGiaDinh();
		obj.lyDo=getLyDo();
		obj.deXuat= getDeXuat();
		obj.thoiGianGhiNhan=getThoiGianGhiNhan();
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
		ThongTinSinhVienKhoKhan obj = new ThongTinSinhVienKhoKhan();
		obj.setMaThongTinSinhVienKhoKhan(maobj);
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
		ArrayList<ThongTinSinhVienKhoKhan> arr = dao.listByColumnLike(column, key);
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
		HSSFSheet sheet = workbook.createSheet("Danh sách thông tin sinh viên khó khăn");
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
		cell.setCellValue("DANH SÁCH THÔNG TIN SINH VIÊN KHÓ KHĂN");
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
		cell.setCellValue("Mã thông tin sinh viên khó khăn");
		cell.setCellStyle(style);

		// merged cell
		// sheet.addMergedRegion(new CellRangeAddress(rownum, rownum, 2, 3));
		cell = row.createCell(3, CellType.STRING);
		cell.setCellValue("Mã sinh viên");
		cell.setCellStyle(style);

		cell = row.createCell(4, CellType.STRING);
		cell.setCellValue("Lý do");
		cell.setCellStyle(style);

		cell = row.createCell(5, CellType.STRING);
		cell.setCellValue("Đề xuất");
		cell.setCellStyle(style);

		cell = row.createCell(6, CellType.STRING);
		cell.setCellValue("Thời gian ghi nhận");
		cell.setCellStyle(style);
		
		cell = row.createCell(7, CellType.STRING);
		cell.setCellValue("Ghi chú");
		cell.setCellStyle(style);

		// Data
		ObjectDAO<ThongTinSinhVienKhoKhan> dao_thongtinsinhvienkhokhan = new DAO_ThongTinSinhVienKhoKhan();
		ArrayList<ThongTinSinhVienKhoKhan> list_thongtinsinhvienkhokhan = new ArrayList<>();
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		String maSo=session.getAttribute("maSo").toString();
		if (maSo!=null && !maSo.isEmpty()) {
			list_thongtinsinhvienkhokhan = dao_thongtinsinhvienkhokhan.listByColumnLike("soCoVanHocTap", maSo);
		}
		else
		{
			list_thongtinsinhvienkhokhan = dao_thongtinsinhvienkhokhan.listAll();
		}


		int stt = 0;
		for (ThongTinSinhVienKhoKhan thongtinsinhvienkhokhan : list_thongtinsinhvienkhokhan) {
			rownum++;
			stt++;
			row = sheet.createRow(rownum);

			cell = row.createCell(0, CellType.STRING);
			cell.setCellValue(stt);

			cell = row.createCell(1, CellType.STRING);
			cell.setCellValue(thongtinsinhvienkhokhan.getSoCoVanHocTap().getMaSoCoVanHocTap());
			
			cell = row.createCell(2, CellType.STRING);
			cell.setCellValue(thongtinsinhvienkhokhan.getMaThongTinSinhVienKhoKhan());

			cell = row.createCell(3, CellType.STRING);
			cell.setCellValue(thongtinsinhvienkhokhan.getSinhVien().getMaSinhVien());


			cell = row.createCell(4, CellType.STRING);
			cell.setCellValue(thongtinsinhvienkhokhan.getLyDo());

			cell = row.createCell(5, CellType.STRING);
			cell.setCellValue(thongtinsinhvienkhokhan.getDeXuat());

			cell = row.createCell(6, CellType.STRING);
			cell.setCellValue(Util_Date.dateToString2(thongtinsinhvienkhokhan.thoiGianGhiNhan));

			cell = row.createCell(7, CellType.STRING);
			cell.setCellValue(thongtinsinhvienkhokhan.getGhiChu());

		}
		System.out.println("rownum = " + rownum);

		String fileName = "Danh sach thong tin sinh vien kho khan.xls";
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
