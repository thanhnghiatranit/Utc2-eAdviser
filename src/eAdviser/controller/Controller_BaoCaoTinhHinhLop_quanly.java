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

import eAdviser.model.BaoCaoTinhHinhLop;
import eAdviser.model.BienBanSinhHoatLop;
import eAdviser.model.CoVanHocTap;
import eAdviser.model.SoCoVanHocTap;
import eAdviser.modelDao.DAO_BaoCaoTinhHinhLop;
import eAdviser.modelDao.DAO_BienBanSinhHoatLop;
import eAdviser.modelDao.DAO_CoVanHocTap;
import eAdviser.modelDao.DAO_SoCoVanHocTap;
import eCore.controller.ZEController;
import eCore.dao.ObjectDAO;
import servlet.DownloadServlet;

public class Controller_BaoCaoTinhHinhLop_quanly extends BaoCaoTinhHinhLop implements ZEController,ServletRequestAware, ServletResponseAware {

	ObjectDAO dao = new DAO_BaoCaoTinhHinhLop();
	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "eAdviser/pages/baocaotinhhinhlops_quanly.jsp";
	String duongDanTrangView = "eAdviser/pages/baocaotinhhinhlop_quanly.jsp";
	String tenCotTimDoiTuong = "maBaoCaoTinhHinhLop";
	String maObj;
	String maCoVanHocTap;
	String maSoCoVanHocTap;

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

	public String getMaCoVanHocTap() {
		return maCoVanHocTap;
	}

	public void setMaCoVanHocTap(String maCoVanHocTap) {
		this.maCoVanHocTap = maCoVanHocTap;
	}

	public CoVanHocTap getCoVanHocTap() {
		ObjectDAO<CoVanHocTap> objdao_covanhoctap = new DAO_CoVanHocTap();
		ArrayList<CoVanHocTap> list = objdao_covanhoctap.listByColumns("maCoVanHocTap", getMaCoVanHocTap());
		if (list.size() > 0)
			return list.get(0);
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
		ObjectDAO<SoCoVanHocTap> objdao_socovanhoctap = new DAO_SoCoVanHocTap();
		ArrayList<SoCoVanHocTap> list_SoCoVanHocTap = objdao_socovanhoctap.listByColumns("maSoCoVanHocTap",
				getMaSoCoVanHocTap());
		if (list_SoCoVanHocTap.size() > 0)
			return list_SoCoVanHocTap.get(0);
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

		ArrayList<BaoCaoTinhHinhLop> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<BaoCaoTinhHinhLop> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		if (!getMaSoCoVanHocTap().equals("null") && !getMaSoCoVanHocTap().equals("")) {
			BaoCaoTinhHinhLop obj = new BaoCaoTinhHinhLop();
			obj.soCoVanHocTap = getSoCoVanHocTap();
			obj.coVanHocTap = getCoVanHocTap();
			obj.maBaoCaoTinhHinhLop = getMaBaoCaoTinhHinhLop();
			obj.tenBaoCaoTinhHinhLop = getTenBaoCaoTinhHinhLop();
			obj.hocKy = getHocKy();
			obj.namHoc = getNamHoc();
			obj.soSinhVienTrongLop = getSoSinhVienTrongLop();
			obj.tinhHinhChung = getTinhHinhChung();
			obj.tuTuongChinhTri = getTuTuongChinhTri();
			obj.ketQuaHocTap = getKetQuaHocTap();
			obj.ketQuaRenLuyen = getKetQuaRenLuyen();
			obj.ketQuaCacHoatDongKhac = getKetQuaCacHoatDongKhac();
			obj.kienNghiDeXuat = getKienNghiDeXuat();
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
		return "FAIL";
	}

	@Override
	public String delete() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String maobj = request.getParameter("maobj");
		BaoCaoTinhHinhLop obj = new BaoCaoTinhHinhLop();
		obj.setMaBaoCaoTinhHinhLop(maobj);
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
		ArrayList<BaoCaoTinhHinhLop> arr = dao.listByColumnLike(column, key);
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
		HSSFSheet sheet = workbook.createSheet("Danh sách báo cáo tình hình lớp");
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
		cell.setCellValue("DANH SÁCH BÁO CÁO TÌNH HÌNH LỚP");
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
		cell.setCellValue("Cố vấn học tập");
		cell.setCellStyle(style);

		cell = row.createCell(3, CellType.STRING);
		cell.setCellValue("Mã báo cáo");
		cell.setCellStyle(style);

		// merged cell
		// sheet.addMergedRegion(new CellRangeAddress(rownum, rownum, 2, 3));
		cell = row.createCell(4, CellType.STRING);
		cell.setCellValue("Tên báo cáo");
		cell.setCellStyle(style);

		cell = row.createCell(4, CellType.STRING);
		cell.setCellValue("Học kỳ");
		cell.setCellStyle(style);

		cell = row.createCell(5, CellType.STRING);
		cell.setCellValue("Năm học");
		cell.setCellStyle(style);

		cell = row.createCell(6, CellType.STRING);
		cell.setCellValue("Tình hình chung");
		cell.setCellStyle(style);

		cell = row.createCell(7, CellType.STRING);
		cell.setCellValue("Ghi chú");
		cell.setCellStyle(style);

		// Data
		ObjectDAO<BaoCaoTinhHinhLop> dao_baocao = new DAO_BaoCaoTinhHinhLop();
		ArrayList<BaoCaoTinhHinhLop> list_baocao = new ArrayList<>();
		if (!getMaSoCoVanHocTap().equals("all") && !getMaSoCoVanHocTap().isEmpty())
			list_baocao = dao_baocao.listByColumnLike("soCoVanHocTap", getMaSoCoVanHocTap());
		else
			list_baocao = dao_baocao.listAll();

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();


		int stt = 0;
		for (BaoCaoTinhHinhLop baocao : list_baocao) {
			rownum++;
			stt++;
			row = sheet.createRow(rownum);

			cell = row.createCell(0, CellType.STRING);
			cell.setCellValue(stt);

			cell = row.createCell(1, CellType.STRING);
			cell.setCellValue(baocao.getSoCoVanHocTap().getMaSoCoVanHocTap());

			cell = row.createCell(2, CellType.STRING);
			cell.setCellValue(baocao.getCoVanHocTap().getNhanVien().getTenNhanVien());

			cell = row.createCell(3, CellType.STRING);
			cell.setCellValue(baocao.getMaBaoCaoTinhHinhLop());

			cell = row.createCell(4, CellType.STRING);
			cell.setCellValue(baocao.getTenBaoCaoTinhHinhLop());

			cell = row.createCell(5, CellType.STRING);
			cell.setCellValue(baocao.getHocKy());

			cell = row.createCell(6, CellType.STRING);
			cell.setCellValue(baocao.getNamHoc());

			cell = row.createCell(7, CellType.STRING);
			cell.setCellValue(baocao.getGhiChu());

		}
		System.out.println("rownum = " + rownum);

		String fileName = "Danh sach bao cao tinh hinh lop.xls";
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
