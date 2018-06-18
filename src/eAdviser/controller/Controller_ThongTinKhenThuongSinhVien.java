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
import org.apache.poi.ss.usermodel.BorderExtent;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.PropertyTemplate;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import eAdviser.model.BienBanSinhHoatLop;
import eAdviser.model.CoVanHocTap;
import eAdviser.model.SoCoVanHocTap;
import eAdviser.model.ThongTinKhenThuongSinhVien;
import eAdviser.model.ThongTinSinhVien;
import eAdviser.model.ThongTinSinhVienKhoKhan;
import eAdviser.modelDao.DAO_BienBanSinhHoatLop;
import eAdviser.modelDao.DAO_SoCoVanHocTap;
import eAdviser.modelDao.DAO_ThongTinKhenThuongSinhVien;
import eAdviser.modelDao.DAO_ThongTinSinhVien;
import eAdviser.modelDao.DAO_ThongTinSinhVienKhoKhan;
import eCore.controller.ZEController;
import eCore.dao.ObjectDAO;
import eCore.model.DonVi;
import eCore.model.SinhVien;
import eCore.modelDao.DAO_SinhVien;
import eCore.util.Util_Date;
import servlet.DownloadServlet;

public class Controller_ThongTinKhenThuongSinhVien extends ThongTinKhenThuongSinhVien
		implements ZEController, ServletRequestAware, ServletResponseAware {

	ObjectDAO dao = new DAO_ThongTinKhenThuongSinhVien();

	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "eAdviser/pages/thongtinkhenthuongsinhviens.jsp";
	String duongDanTrangView = "eAdviser/pages/thongtinkhenthuongsinhvien.jsp";
	String tenCotTimDoiTuong = "maThongTinKhenThuongSinhVien";
	String maObj;
	String maSoCoVanHocTap;
	String maSinhVien;
	String s_thoiGianKhenThuong;
	String s_ngayBatDau;
	String s_ngayKetThuc;

	public String getS_thoiGianKhenThuong() {
		return s_thoiGianKhenThuong;
	}

	public void setS_thoiGianKhenThuong(String s_thoiGianKhenThuong) {
		this.s_thoiGianKhenThuong = s_thoiGianKhenThuong;
	}

	public Date getThoiGianKhenThuong() {
		return Util_Date.stringToDate(getS_thoiGianKhenThuong());
	}

	public String getS_ngayBatDau() {
		return s_ngayBatDau;
	}

	public void setS_ngayBatDau(String s_ngayBatDau) {
		this.s_ngayBatDau = s_ngayBatDau;
	}

	public Date getNgayBatDau() {
		return Util_Date.stringToDate(getS_ngayBatDau());
	}

	public String getS_ngayKetThuc() {
		return s_ngayKetThuc;
	}

	public void setS_ngayKetThuc(String s_ngayKetThuc) {
		this.s_ngayKetThuc = s_ngayKetThuc;
	}

	public Date getNgayKetThuc() {
		return Util_Date.stringToDate(getS_ngayKetThuc());
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
		if (list.size() > 0)
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

	public SinhVien getSinhVien() {
		ObjectDAO dao_sinhVien = new DAO_SinhVien();
		ArrayList<SinhVien> list_sinhvien = dao_sinhVien.listByColumns("maSinhVien", getMaSinhVien());
		if (list_sinhvien.size() > 0)
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

		ArrayList<ThongTinKhenThuongSinhVien> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<ThongTinKhenThuongSinhVien> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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

		ThongTinKhenThuongSinhVien obj = new ThongTinKhenThuongSinhVien();
		obj.soCoVanHocTap = getSoCoVanHocTap();
		obj.sinhVien = getSinhVien();
		obj.maThongTinKhenThuongSinhVien = getMaThongTinKhenThuongSinhVien();
		obj.noiDungKhenThuong = getNoiDungKhenThuong();
		obj.thoiGianKhenThuong = getThoiGianKhenThuong();
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
		ThongTinKhenThuongSinhVien obj = new ThongTinKhenThuongSinhVien();
		obj.setMaThongTinKhenThuongSinhVien(maobj);
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
		ArrayList<ThongTinKhenThuongSinhVien> arr = dao.listByColumnLike(column, key);
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
		HSSFSheet sheet = workbook.createSheet("Danh sách khen thưởng");
		//
		HSSFCellStyle style = createStyleForTitle(workbook);
		// merged cell
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 8));

		int rownum = 0;
		Cell cell;
		Row row;

		row = sheet.createRow(rownum);
		cell = row.createCell(0, CellType.STRING);
		cell.setCellValue("Danh sách khen thưởng sinh viên ");
		cell.setCellStyle(style);

		rownum = rownum + 1;
		row = sheet.createRow(rownum);
		cell = row.createCell(0, CellType.STRING);
		cell.setCellValue("Mã sổ: " + getMaSoCoVanHocTap());
		rownum = rownum + 1;
		row = sheet.createRow(rownum);

		cell = row.createCell(0, CellType.STRING);
		cell.setCellValue("STT");
		cell.setCellStyle(style);

		cell = row.createCell(1, CellType.STRING);
		cell.setCellValue("Mã khen thưởng");
		cell.setCellStyle(style);

		// merged cell
		sheet.addMergedRegion(new CellRangeAddress(1, 1, 2, 3));
		cell = row.createCell(2, CellType.STRING);
		cell.setCellValue("Mã sinh viên");
		cell.setCellStyle(style);

		cell = row.createCell(3, CellType.STRING);
		cell.setCellValue("Họ đệm");
		cell.setCellStyle(style);

		cell = row.createCell(4, CellType.STRING);
		cell.setCellValue("Tên");
		cell.setCellStyle(style);

		cell = row.createCell(5, CellType.STRING);
		cell.setCellValue("Nội dung khen thưởng");
		cell.setCellStyle(style);

		cell = row.createCell(6, CellType.STRING);
		cell.setCellValue("Thời gian khen thưởng");
		cell.setCellStyle(style);

		cell = row.createCell(7, CellType.STRING);
		cell.setCellValue("Ghi chú");
		cell.setCellStyle(style);

		
		// Data
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				
				ObjectDAO<ThongTinKhenThuongSinhVien> dao_thongtinkhenthuong = new DAO_ThongTinKhenThuongSinhVien();
				ArrayList<ThongTinKhenThuongSinhVien> list_thongtinkhenthuong = new ArrayList<>();
				
				if (!getMaSoCoVanHocTap().equals("all") && !getMaSoCoVanHocTap().isEmpty())
					list_thongtinkhenthuong = dao_thongtinkhenthuong.listByColumnLike("soCoVanHocTap", getMaSoCoVanHocTap());
				else
					list_thongtinkhenthuong = dao_thongtinkhenthuong.listAll(); 
				
				
		int stt = 0;
		for (ThongTinKhenThuongSinhVien thongTinKhenThuongSinhVien : list_thongtinkhenthuong) {
			rownum++;
			stt++;
			row = sheet.createRow(rownum);

			cell = row.createCell(0, CellType.STRING);
			cell.setCellValue(stt);

			cell = row.createCell(1, CellType.STRING);
			cell.setCellValue(thongTinKhenThuongSinhVien.getMaThongTinKhenThuongSinhVien());

			cell = row.createCell(2, CellType.STRING);
			cell.setCellValue(thongTinKhenThuongSinhVien.getSinhVien().getMaSinhVien());

			 cell = row.createCell(3, CellType.STRING);
			 cell.setCellValue(thongTinKhenThuongSinhVien.getSinhVien().getHoDem());
			
			 cell = row.createCell(4, CellType.STRING);
			 cell.setCellValue(thongTinKhenThuongSinhVien.getSinhVien().getTen());

			cell = row.createCell(5, CellType.STRING);
			cell.setCellValue(thongTinKhenThuongSinhVien.getNoiDungKhenThuong());

			cell = row.createCell(6, CellType.STRING);
			cell.setCellValue(Util_Date.dateToString2(thongTinKhenThuongSinhVien.getThoiGianKhenThuong()));

			cell = row.createCell(7, CellType.STRING);
			cell.setCellValue(thongTinKhenThuongSinhVien.getGhiChu());
		}
		System.out.println("rownum = " + rownum);
		PropertyTemplate pt = new PropertyTemplate();
		pt.drawBorders(new CellRangeAddress(2, 2, 0, 7), BorderStyle.THIN, BorderExtent.ALL);

		pt.drawBorders(new CellRangeAddress(2, rownum, 0, 8), BorderStyle.THIN, BorderExtent.LEFT);

		pt.drawBorders(new CellRangeAddress(2, rownum, 0, 2), BorderStyle.THIN, BorderExtent.INSIDE_VERTICAL);

		pt.drawBorders(new CellRangeAddress(2, rownum, 3, 8), BorderStyle.THIN, BorderExtent.INSIDE_VERTICAL);

		pt.drawBorders(new CellRangeAddress(rownum + 1, rownum + 1, 0, 7), BorderStyle.THIN, BorderExtent.TOP);

		pt.applyBorders(sheet);

		String fileName = "Danh sach khen thuong sinh vien.xls";
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
