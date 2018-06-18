package eAdviser.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.mail.Session;
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
import eCore.model.Lop;
import eCore.model.NamHoc;
import eCore.model.NhanVien;
import eCore.modelDao.DAO_Lop;
import eCore.modelDao.DAO_NamHoc;
import eCore.modelDao.DAO_NhanVien;
import eCore.util.Util_Date;
import servlet.DownloadServlet;

public class Controller_PhanCongCoVanHocTap extends PhanCongCoVanHocTap
		implements ZEController, ServletRequestAware, ServletResponseAware {

	ObjectDAO dao = new DAO_PhanCongCoVanHocTap();
	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "eAdviser/pages/phancongcovanhoctaps.jsp";
	String duongDanTrangView = "eAdviser/pages/phancongcovanhoctap.jsp";
	String tenCotTimDoiTuong = "maPhanCong";
	String maCoVanHocTap;
	String maSoCoVanHocTap;
	String maNamHoc;
	String s_thoiGianBatDau;
	String s_thoiGianKetThuc;

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

	public String getMaNamHoc() {
		return maNamHoc;
	}

	public void setMaNamHoc(String maNamHoc) {
		this.maNamHoc = maNamHoc;
	}

	public NamHoc getNamHoc() {
		ObjectDAO dao_NamHoc = new DAO_NamHoc();
		ArrayList<NamHoc> list_namHoc = dao_NamHoc.listByColumns("maNamHoc", getMaNamHoc());
		if (list_namHoc.size() > 0)
			return list_namHoc.get(0);
		else
			return null;
	}

	public String getS_thoiGianBatDau() {
		return s_thoiGianBatDau;
	}

	public void setS_thoiGianBatDau(String s_thoiGianBatDau) {
		this.s_thoiGianBatDau = s_thoiGianBatDau;
	}

	public Date getThoiGianBatDau() {
		return Util_Date.stringToDate(getS_thoiGianBatDau());
	}

	public String getS_thoiGianKetThuc() {
		return s_thoiGianKetThuc;
	}

	public void setS_thoiGianKetThuc(String s_thoiGianKetThuc) {
		this.s_thoiGianKetThuc = s_thoiGianKetThuc;
	}

	public Date getThoiGianKetThuc() {
		return Util_Date.stringToDate(getS_thoiGianKetThuc());
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

		ArrayList<PhanCongCoVanHocTap> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<PhanCongCoVanHocTap> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		System.out.println("vao roi ne bi");
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		PhanCongCoVanHocTap obj = new PhanCongCoVanHocTap();
		obj.coVanHocTap = getCoVanHocTap();
		obj.soCoVanHocTap = getSoCoVanHocTap();
		obj.namHoc = getNamHoc();
		obj.maPhanCong = getMaPhanCong();
		obj.thoiGianBatDau = getThoiGianBatDau();
		obj.thoiGianKetThuc = getThoiGianKetThuc();
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
		PhanCongCoVanHocTap obj = new PhanCongCoVanHocTap();
		obj.setMaPhanCong(maobj);
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
		ArrayList<PhanCongCoVanHocTap> arr = dao.listByColumnLike(column, key);
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
		HSSFSheet sheet = workbook.createSheet("Danh sách phân công cố vấn học tập");
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
		cell.setCellValue("DANH SÁCH PHÂN CÔNG CỐ VẤN HỌC TẬP");
		style.setAlignment(HorizontalAlignment.CENTER);
		cell.setCellStyle(style);

		rownum = rownum + 1;
		row = sheet.createRow(rownum);

		cell = row.createCell(0, CellType.STRING);
		cell.setCellValue("STT");
		cell.setCellStyle(style);

		cell = row.createCell(1, CellType.STRING);
		cell.setCellValue("Mã phân công");
		cell.setCellStyle(style);

		cell = row.createCell(2, CellType.STRING);
		cell.setCellValue("Mã nhân viên");
		cell.setCellStyle(style);

		cell = row.createCell(3, CellType.STRING);
		cell.setCellValue("Tên Nhân viên");
		cell.setCellStyle(style);

		cell = row.createCell(4, CellType.STRING);
		cell.setCellValue("Lớp");
		cell.setCellStyle(style);

		// Mã sổ
		cell = row.createCell(5, CellType.STRING);
		cell.setCellValue("Sổ cố vấn học tập");
		cell.setCellStyle(style);

		cell = row.createCell(6, CellType.STRING);
		cell.setCellValue("Thời gian bắt đầu");
		cell.setCellStyle(style);

		cell = row.createCell(7, CellType.STRING);
		cell.setCellValue("Thời gian kết thúc");
		cell.setCellStyle(style);

		cell = row.createCell(8, CellType.STRING);
		cell.setCellValue("Ghi chú");
		cell.setCellStyle(style);

		// Data
		ObjectDAO<PhanCongCoVanHocTap> dao_PhanCongCoVanHocTap = new DAO_PhanCongCoVanHocTap();
		ArrayList<PhanCongCoVanHocTap> list_PhanCongCoVanHocTap = dao_PhanCongCoVanHocTap.listByColumns("namHoc",
				getMaNamHoc());

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		System.out.println("ddddddddddddddđ: " + session.getAttribute("arr").toString());

		list_PhanCongCoVanHocTap = list_PhanCongCoVanHocTap.size() == 0
				? (ArrayList<PhanCongCoVanHocTap>) session.getAttribute("arr")
				: list_PhanCongCoVanHocTap;

		int stt = 0;
		for (PhanCongCoVanHocTap phanCongCoVanHocTap : list_PhanCongCoVanHocTap) {
			rownum++;
			stt++;
			row = sheet.createRow(rownum);

			cell = row.createCell(0, CellType.STRING);
			cell.setCellValue(stt);

			cell = row.createCell(1, CellType.STRING);
			cell.setCellValue(phanCongCoVanHocTap.getMaPhanCong());

			cell = row.createCell(2, CellType.STRING);
			cell.setCellValue(phanCongCoVanHocTap.getCoVanHocTap().getNhanVien().getMaNhanVien());

			cell = row.createCell(3, CellType.STRING);
			cell.setCellValue(phanCongCoVanHocTap.getCoVanHocTap().getNhanVien().getTenNhanVien());

			cell = row.createCell(4, CellType.STRING);
			cell.setCellValue(phanCongCoVanHocTap.getSoCoVanHocTap().getLop().getMaLop());

			cell = row.createCell(5, CellType.STRING);
			cell.setCellValue(phanCongCoVanHocTap.getSoCoVanHocTap().getTenSoCoVanHocTap());

			cell = row.createCell(6, CellType.STRING);
			cell.setCellValue(Util_Date.dateToString2(phanCongCoVanHocTap.getThoiGianBatDau()));

			cell = row.createCell(7, CellType.STRING);
			cell.setCellValue(Util_Date.dateToString2(phanCongCoVanHocTap.getThoiGianKetThuc()));

			cell = row.createCell(8, CellType.STRING);
			cell.setCellValue(phanCongCoVanHocTap.getGhiChu());

		}
		System.out.println("rownum = " + rownum);

		String fileName = "Danh sach phan cong co van hoc tap.xls";
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

	public String chonSo() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse respone = ServletActionContext.getResponse();
		HttpSession session = request.getSession();
		session.setAttribute("maSo", getMaSoCoVanHocTap());
		respone.sendRedirect("index.jsp?p=eAdviser/pages/congtaccovanhoctaps.jsp");
		return "SUCCESS";
	}

	public String boChonSo() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("maSo", null);
		return "SUCCESS";
	}

}
