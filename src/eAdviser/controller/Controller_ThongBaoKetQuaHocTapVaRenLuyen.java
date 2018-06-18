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

import eAdviser.model.BaoCaoTinhHinhLop;
import eAdviser.model.CoVanHocTap;
import eAdviser.model.PhanCongCoVanHocTap;
import eAdviser.model.SoCoVanHocTap;
import eAdviser.model.ThongBaoKetQuaHocTapVaRenLuyen;
import eAdviser.model.ThongTinKyLuatSinhVien;
import eAdviser.modelDao.DAO_BaoCaoTinhHinhLop;
import eAdviser.modelDao.DAO_CoVanHocTap;
import eAdviser.modelDao.DAO_PhanCongCoVanHocTap;
import eAdviser.modelDao.DAO_SoCoVanHocTap;
import eAdviser.modelDao.DAO_ThongBaoKetQuaHocTapVaRenLuyen;
import eAdviser.modelDao.DAO_ThongTinKyLuatSinhVien;
import eCore.controller.ZEController;
import eCore.dao.ObjectDAO;
import eCore.model.DonVi;
import eCore.model.Lop;
import eCore.model.NhanVien;
import eCore.model.SinhVien;
import eCore.modelDao.DAO_DonVi;
import eCore.modelDao.DAO_Lop;
import eCore.modelDao.DAO_NhanVien;
import eCore.modelDao.DAO_SinhVien;
import eCore.util.Util_Date;
import servlet.DownloadServlet;

public class Controller_ThongBaoKetQuaHocTapVaRenLuyen extends ThongBaoKetQuaHocTapVaRenLuyen implements ZEController,ServletRequestAware,ServletResponseAware {

	ObjectDAO dao = new DAO_ThongBaoKetQuaHocTapVaRenLuyen();
	String timKiemTheo;
	String tuKhoa;
	String duongDanTrang = "eAdviser/pages/thongbaoketquahoctapvarenluyens.jsp";
	String duongDanTrangView = "eAdviser/pages/thongbaoketquahoctapvarenluyen.jsp";
	String tenCotTimDoiTuong = "maThongBaoKetQuaHocTapVaRenLuyen";
	String maObj;
	String maCoVanHocTap;
	String maSoCoVanHocTap;
	String maSinhVien;
	String maThongBaoKetQuaHocTapVaRenLuyen;

	public String getMaThongBaoKetQuaHocTapVaRenLuyen() {
		return maThongBaoKetQuaHocTapVaRenLuyen;
	}

	public void setMaThongBaoKetQuaHocTapVaRenLuyen(String maThongBaoKetQuaHocTapVaRenLuyen) {
		this.maThongBaoKetQuaHocTapVaRenLuyen = maThongBaoKetQuaHocTapVaRenLuyen;
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

	public String getMaCoVanHocTap() {
		return maCoVanHocTap;
	}

	public void setMaCoVanHocTap(String maCoVanHocTap) {
		this.maCoVanHocTap = maCoVanHocTap;
	}

	public CoVanHocTap getCoVanHocTap() {
		ObjectDAO<CoVanHocTap> dao_CoVanHocTap = new DAO_CoVanHocTap();
		ArrayList<CoVanHocTap> list_coVanHocTap = dao_CoVanHocTap.listByColumns("maCoVanHocTap", getMaCoVanHocTap());
		System.out.println(list_coVanHocTap.size());
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

		ArrayList<ThongBaoKetQuaHocTapVaRenLuyen> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		ArrayList<ThongBaoKetQuaHocTapVaRenLuyen> arr = dao.listByColumnLike(tenCotTimDoiTuong, maobj);
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
		
		String btn = request.getParameter("btn") + "";
		if (btn != null && btn.equals("in")) {
			ObjectDAO<ThongBaoKetQuaHocTapVaRenLuyen> dao = new DAO_ThongBaoKetQuaHocTapVaRenLuyen();
			ArrayList<ThongBaoKetQuaHocTapVaRenLuyen> list = dao.listByColumns("maThongBaoKetQuaHocTapVaRenLuyen",
					getMaThongBaoKetQuaHocTapVaRenLuyen());
			ThongBaoKetQuaHocTapVaRenLuyen thongBao = list.get(0);
			session.setAttribute("hocKy", thongBao.getHocKy() != null ? thongBao.getHocKy() : "");
			session.setAttribute("namHoc", thongBao.getNamHoc() != null ? thongBao.getNamHoc() : "");

			ObjectDAO<SinhVien> dao_sinhVien = new DAO_SinhVien();
			ArrayList<SinhVien> list_sinhVien = dao_sinhVien.listByColumns("maSinhVien",
					thongBao.getSinhVien().getMaSinhVien());
			SinhVien sv = new SinhVien();
			sv = list_sinhVien.get(0);
			session.setAttribute("tenPhuHuynh", sv.getKhiCanBaoTinChoAi() != null ? sv.getKhiCanBaoTinChoAi() : "");
			session.setAttribute("tenSV",
					sv.getHoDem() != null && sv.getTen() != null ? sv.getHoDem() + " " + sv.getTen() : "");

			ObjectDAO<Lop> dao_lop = new DAO_Lop();
			ArrayList<Lop> list_lop = dao_lop.listByColumns("maLop", thongBao.getSinhVien().getLop().getMaLop());
			Lop lop = list_lop.get(0);
			session.setAttribute("tenLop", lop.getTenLop());
			session.setAttribute("khoa", lop.getKhoa());

			session.setAttribute("ketQuaRenLuyen",
					thongBao.getKetQuaRenLuyen() != null ? thongBao.getKetQuaRenLuyen() : "");
			session.setAttribute("xepLoaiRenLuyen",
					thongBao.getXepLoaiRenLuyen() != null ? thongBao.getXepLoaiRenLuyen() : "");
			session.setAttribute("thongBaoCuThe", thongBao.getThongBaoCuThe());

			ObjectDAO<CoVanHocTap> dao_coVanHocTap = new DAO_CoVanHocTap();
			ArrayList<CoVanHocTap> list_coVanHocTap = dao_coVanHocTap.listByColumns("maCoVanHocTap",
					thongBao.getCoVanHocTap().getMaCoVanHocTap());
			CoVanHocTap cvht = list_coVanHocTap.get(0);

			ObjectDAO<NhanVien> dao_nhanVien = new DAO_NhanVien();
			ArrayList<NhanVien> list_nhanVien = dao_nhanVien.listByColumns("maNhanVien",
					cvht.getNhanVien().getMaNhanVien());
			NhanVien nv = list_nhanVien.get(0);
			session.setAttribute("tenCVHT", nv.getTenNhanVien());
			session.setAttribute("dienThoaiCoQuan", nv.getSoDienThoaiCoQuan() != null ? nv.getSoDienThoaiCoQuan() : "");
			session.setAttribute("dienThoaiDiDong", nv.getSoDienThoaiDiDong() != null ? nv.getSoDienThoaiDiDong() : "");
			session.setAttribute("diaChiGuiThu", nv.getDiaChiBaoTin());
			
			session.setAttribute("tenDonVi", thongBao.getSinhVien().getLop().getDonVi().getTenDonVi());

			return "PRINT";
		}

		ThongBaoKetQuaHocTapVaRenLuyen obj = new ThongBaoKetQuaHocTapVaRenLuyen();
		obj.coVanHocTap = getCoVanHocTap();
		obj.soCoVanHocTap = getSoCoVanHocTap();
		obj.sinhVien = getSinhVien();
		obj.maThongBaoKetQuaHocTapVaRenLuyen = getMaThongBaoKetQuaHocTapVaRenLuyen();
		obj.hocKy = getHocKy();
		obj.namHoc = getNamHoc();
		obj.ketQuaHocTap = getKetQuaHocTap();
		obj.xepLoaiHocTap = getXepLoaiHocTap();
		obj.ketQuaRenLuyen = getKetQuaRenLuyen();
		obj.xepLoaiRenLuyen = getXepLoaiRenLuyen();
		obj.thongBaoCuThe = getThongBaoCuThe();
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
		ThongBaoKetQuaHocTapVaRenLuyen obj = new ThongBaoKetQuaHocTapVaRenLuyen();
		obj.setMaThongBaoKetQuaHocTapVaRenLuyen(maobj);
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
		ArrayList<ThongBaoKetQuaHocTapVaRenLuyen> arr = dao.listByColumnLike(column, key);
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
	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}

	public void setServletResponse(HttpServletResponse servletResponse) {
		this.servletResponse = servletResponse;
	}
	
	@Override
	public String exportData() throws IOException {
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("Danh sách thông báo kết quả học tập và rèn luyện");
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
		cell.setCellValue("DANH SÁCH THÔNG BÁO KẾT QUẢ HỌC TẬP VÀ RÈN LUYỆN");
		style.setAlignment(HorizontalAlignment.CENTER);
		cell.setCellStyle(style);

		rownum = rownum + 1;
		row = sheet.createRow(rownum);

		cell = row.createCell(0, CellType.STRING);
		cell.setCellValue("STT");
		cell.setCellStyle(style);

		cell = row.createCell(1, CellType.STRING);
		cell.setCellValue("Mã thông báo");
		cell.setCellStyle(style);

		cell = row.createCell(2, CellType.STRING);
		cell.setCellValue("Sổ cố vấn học tập");
		cell.setCellStyle(style);
		
		cell = row.createCell(3, CellType.STRING);
		cell.setCellValue("Cố vấn học tập");
		cell.setCellStyle(style);

		cell = row.createCell(4, CellType.STRING);
		cell.setCellValue("Mã sinh viên");
		cell.setCellStyle(style);


		// merged cell
		// sheet.addMergedRegion(new CellRangeAddress(rownum, rownum, 2, 3));
		cell = row.createCell(5, CellType.STRING);
		cell.setCellValue("Học kỳ");
		cell.setCellStyle(style);

		cell = row.createCell(6, CellType.STRING);
		cell.setCellValue("Năm học");
		cell.setCellStyle(style);

		cell = row.createCell(7, CellType.STRING);
		cell.setCellValue("Thông báo cụ thể");
		cell.setCellStyle(style);

		
		cell = row.createCell(8, CellType.STRING);
		cell.setCellValue("Ghi chú");
		cell.setCellStyle(style);

		// Data
		ObjectDAO<ThongBaoKetQuaHocTapVaRenLuyen> dao_thongbao = new DAO_ThongBaoKetQuaHocTapVaRenLuyen();
		ArrayList<ThongBaoKetQuaHocTapVaRenLuyen> list_thongbao = new ArrayList<>();
		if (!getMaSoCoVanHocTap().equals("all") && !getMaSoCoVanHocTap().isEmpty())
			list_thongbao = dao_thongbao.listByColumnLike("soCoVanHocTap", getMaSoCoVanHocTap());
		else
			list_thongbao = dao_thongbao.listAll();

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();


		int stt = 0;
		for (ThongBaoKetQuaHocTapVaRenLuyen thongbao : list_thongbao) {
			rownum++;
			stt++;
			row = sheet.createRow(rownum);

			cell = row.createCell(0, CellType.STRING);
			cell.setCellValue(stt);

			cell = row.createCell(1, CellType.STRING);
			cell.setCellValue(thongbao.getMaThongBaoKetQuaHocTapVaRenLuyen());

			cell = row.createCell(2, CellType.STRING);
			cell.setCellValue(thongbao.getSoCoVanHocTap().getMaSoCoVanHocTap());
			
			cell = row.createCell(3, CellType.STRING);
			cell.setCellValue(thongbao.getCoVanHocTap().getNhanVien().getTenNhanVien());

			cell = row.createCell(4, CellType.STRING);
			cell.setCellValue(thongbao.getSinhVien().getMaSinhVien());

			cell = row.createCell(5, CellType.STRING);
			cell.setCellValue(thongbao.getHocKy());

			cell = row.createCell(6, CellType.STRING);
			cell.setCellValue(thongbao.getNamHoc());

			cell = row.createCell(7, CellType.STRING);
			cell.setCellValue(thongbao.getThongBaoCuThe());
			
			cell = row.createCell(8, CellType.STRING);
			cell.setCellValue(thongbao.getGhiChu());

		}
		System.out.println("rownum = " + rownum);

		String fileName = "Danh sach thong bao ket qua hoc tap va ren luyen.xls";
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
	

//	public String inPhieu() {
//		HttpServletRequest request = ServletActionContext.getRequest();
//		HttpSession session = request.getSession();
//
//		ObjectDAO<ThongBaoKetQuaHocTapVaRenLuyen> dao = new DAO_ThongBaoKetQuaHocTapVaRenLuyen();
//		ArrayList<ThongBaoKetQuaHocTapVaRenLuyen> list = dao.listAll();
//
//		SinhVien sv = new SinhVien();
//
//		int i = 0;
//
//		for (ThongBaoKetQuaHocTapVaRenLuyen obj : list) {
//
//			i++;
//
//			session.setAttribute("hocKy" + i, obj.getHocKy() != null ? obj.getHocKy() : "");
//			session.setAttribute("namHoc" + i, obj.getNamHoc() != null ? obj.getNamHoc() : "");
//
//			ObjectDAO<SinhVien> dao_sinhVien = new DAO_SinhVien();
//			ArrayList<SinhVien> list_sinhVien = dao_sinhVien.listByColumns("maSinhVien",
//					obj.getSinhVien().getMaSinhVien());
//			sv = list_sinhVien.get(0);
//			session.setAttribute("tenPhuHuynh" + i, sv.getKhiCanBaoTinChoAi() != null ? sv.getKhiCanBaoTinChoAi() : "");
//			session.setAttribute("hoten" + i,
//					sv.getHoDem() != null && sv.getTen() != null ? sv.getHoDem() + " " + sv.getTen() : "");
//
//			ObjectDAO<Lop> dao_lop = new DAO_Lop();
//			ArrayList<Lop> list_lop = dao_lop.listByColumns("maLop", obj.getSinhVien().getLop().getMaLop());
//			Lop lop = list_lop.get(0);
//			session.setAttribute("tenLop" + i, lop.getTenLop());
//			session.setAttribute("khoa" + i, lop.getKhoa());
//
//			session.setAttribute("ketQuaRenLuyen" + i, obj.getKetQuaRenLuyen() != null ? obj.getKetQuaRenLuyen() : "");
//			session.setAttribute("xepLoaiRenLuyen" + i,
//					obj.getXepLoaiRenLuyen() != null ? obj.getXepLoaiRenLuyen() : "");
//
//		}
//
//		return null;
//	}
	
	public String in() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		String maobj=  request.getParameter("maobj")+"";
		
		ObjectDAO<ThongBaoKetQuaHocTapVaRenLuyen> dao = new DAO_ThongBaoKetQuaHocTapVaRenLuyen();
		ArrayList<ThongBaoKetQuaHocTapVaRenLuyen> list = dao.listByColumns("maThongBaoKetQuaHocTapVaRenLuyen",
				maobj);
		System.out.println("ma obj "+ maobj);
		ThongBaoKetQuaHocTapVaRenLuyen thongBao = list.get(0);
		session.setAttribute("hocKy", thongBao.getHocKy() != null ? thongBao.getHocKy() : "");
		session.setAttribute("namHoc", thongBao.getNamHoc() != null ? thongBao.getNamHoc() : "");

		ObjectDAO<SinhVien> dao_sinhVien = new DAO_SinhVien();
		ArrayList<SinhVien> list_sinhVien = dao_sinhVien.listByColumns("maSinhVien",
				thongBao.getSinhVien().getMaSinhVien());
		SinhVien sv = new SinhVien();
		sv = list_sinhVien.get(0);
		session.setAttribute("tenPhuHuynh", sv.getKhiCanBaoTinChoAi() != null ? sv.getKhiCanBaoTinChoAi() : "");
		session.setAttribute("tenSV",
				sv.getHoDem() != null && sv.getTen() != null ? sv.getHoDem() + " " + sv.getTen() : "");

		ObjectDAO<Lop> dao_lop = new DAO_Lop();
		ArrayList<Lop> list_lop = dao_lop.listByColumns("maLop", thongBao.getSinhVien().getLop().getMaLop());
		Lop lop = list_lop.get(0);
		session.setAttribute("tenLop", lop.getTenLop());
		session.setAttribute("khoa", lop.getKhoa());

		session.setAttribute("ketQuaRenLuyen",
				thongBao.getKetQuaRenLuyen() != null ? thongBao.getKetQuaRenLuyen() : "");
		session.setAttribute("xepLoaiRenLuyen",
				thongBao.getXepLoaiRenLuyen() != null ? thongBao.getXepLoaiRenLuyen() : "");
		session.setAttribute("thongBaoCuThe", thongBao.getThongBaoCuThe());

		ObjectDAO<CoVanHocTap> dao_coVanHocTap = new DAO_CoVanHocTap();
		ArrayList<CoVanHocTap> list_coVanHocTap = dao_coVanHocTap.listByColumns("maCoVanHocTap",
				thongBao.getCoVanHocTap().getMaCoVanHocTap());
		CoVanHocTap cvht = list_coVanHocTap.get(0);

		ObjectDAO<NhanVien> dao_nhanVien = new DAO_NhanVien();
		ArrayList<NhanVien> list_nhanVien = dao_nhanVien.listByColumns("maNhanVien",
				cvht.getNhanVien().getMaNhanVien());
		NhanVien nv = list_nhanVien.get(0);
		session.setAttribute("tenCVHT", nv.getTenNhanVien());
		session.setAttribute("dienThoaiCoQuan", nv.getSoDienThoaiCoQuan() != null ? nv.getSoDienThoaiCoQuan() : "");
		session.setAttribute("dienThoaiDiDong", nv.getSoDienThoaiDiDong() != null ? nv.getSoDienThoaiDiDong() : "");
		session.setAttribute("diaChiGuiThu", nv.getDiaChiBaoTin());

		session.setAttribute("tenDonVi", thongBao.getSinhVien().getLop().getDonVi().getTenDonVi());

		return "SUCCESS";
	}
}
