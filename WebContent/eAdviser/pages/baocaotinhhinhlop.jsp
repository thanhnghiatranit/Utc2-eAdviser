<%@page import="eAdviser.modelDao.DAO_PhanCongCoVanHocTap"%>
<%@page import="eAdviser.model.PhanCongCoVanHocTap"%>
<%@page import="eCore.modelDao.DAO_TaiKhoanNhanVien"%>
<%@page import="eCore.model.TaiKhoanNhanVien"%>
<%@page import="eAdviser.model.BaoCaoTinhHinhLop"%>
<%@page import="eAdviser.modelDao.DAO_CoVanHocTap"%>
<%@page import="eAdviser.model.SoCoVanHocTap"%>
<%@page import="eAdviser.modelDao.DAO_SoCoVanHocTap"%>
<%@page import="eAdviser.modelDao.DAO_BienBanSinhHoatLop"%>
<%@page import="eAdviser.model.BienBanSinhHoatLop"%>
<%@page import="eCore.model.NhanVien"%>
<%@page import="eCore.modelDao.DAO_NhanVien"%>
<%@page import="eAdviser.model.CoVanHocTap"%>
<%@page import="eCore.model.Lop"%>
<%@page import="eCore.model.DonVi"%>
<%@page import="java.util.ArrayList"%>
<%@page import="eCore.modelDao.DAO_DonVi"%>
<%@page import="eCore.dao.ObjectDAO"%>
<%@page import="eCore.model.ChucNang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("maSo") == null) {
%>

<script type="text/javascript">
	alert("Bạn hãy chọn sổ cố vấn học tập.");
	window.location = "index.jsp?p=eAdviser/pages/chonsocovanhoctaps.jsp";
</script>
<%
	} else {
%>



<%
	String tenLop = "BaoCaoTinhHinhLop";
		String tenTrang = "Quản lý báo cáo tình hình lớp";
		String trangDanhSach = "index.jsp?p=eAdviser/pages/baocaotinhhinhlops.jsp";
		String[] tk_value = { "soCoVanHocTap", "coVanHocTap", "maBaoCaoTinhHinhLop", "tenBaoCaoTinhHinhLop",
				"hocKy", "namHoc", "soSinhVienTrongLop", "tinhHinhChung" };
		String[] tk_show = { "thuộc Sổ cố vấn học tập", "Cố vấn học tập", "Mã báo cáo tình hình lớp",
				"Tên báo cáo tình hình lớp", "Học kỳ", "Năm học", "Số sinh viên trong lớp", "Tình hình chung" };
%>
<%@ include file="../../ePartial/code-header.jsp"%>

<%
	String mode = session.getAttribute("mode") + "";
		String tenTrangChiTiet = "";
		tenTrangChiTiet = mode.equals("addNew") ? "Thêm mới" : tenTrangChiTiet;
		tenTrangChiTiet = mode.equals("viewDetail") ? "Xem thông tin chi tiết" : tenTrangChiTiet;
		tenTrangChiTiet = mode.equals("viewDetailAndEdit") ? "Chỉnh sửa thông tin" : tenTrangChiTiet;
		tenTrangChiTiet = mode.equals("null") ? "" : tenTrangChiTiet;

		boolean modeView = mode.equals("viewDetail");
		boolean modeEdit = mode.equals("viewDetailAndEdit");

		BaoCaoTinhHinhLop obj = null;
		if (session.getAttribute("obj") != null) {
			if (session.getAttribute("obj") instanceof BaoCaoTinhHinhLop) {
				obj = (BaoCaoTinhHinhLop) session.getAttribute("obj");
			}
		}
%>
<div class="row">
	<div class="col-lg-12">
		<h4 class="page-header"><%=tenTrang%>
			-
			<%=tenTrangChiTiet%>
		</h4>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<form action="luuDuLieu<%=tenLop%>.action" method="post">
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading" style="text-align: left;">
					<div class="row">
						<div class="col-md-5">
							<p style="color: red; display: inline;"><%=msg%></p>
						</div>
						<div class="col-md-7">
							<%@ include file="../../ePartial/processform.jsp"%>
						</div>
					</div>
				</div>
				<div class="panel-body">
					<div class="row" style="padding: 10px">
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group">
								<% %>
									<label>Thuộc Sổ cố vấn học tập</label> <input readonly
										class="form-control" name="maSoCoVanHocTap"
										value="<%=session.getAttribute("maSo").toString()%>">
								</div>
								<div class="form-group">
									<label>Cố vấn học tập</label>
									<%
										String maDangNhap1 = session.getAttribute("maDangNhap").toString();
											ObjectDAO<TaiKhoanNhanVien> dao_TaiKhoanNhanVien = new DAO_TaiKhoanNhanVien();
											ArrayList<TaiKhoanNhanVien> list_TaiKhoanNhanVien = dao_TaiKhoanNhanVien.listByColumns("maDangNhap",
													maDangNhap1);
											TaiKhoanNhanVien nv = new TaiKhoanNhanVien();
											if (list_TaiKhoanNhanVien.size() > 0)
												nv = list_TaiKhoanNhanVien.get(0);
											String maCoVanHocTap = "";
											ObjectDAO<CoVanHocTap> dao_CoVanHocTap = new DAO_CoVanHocTap();
											ArrayList<CoVanHocTap> list_CoVanHocTap = dao_CoVanHocTap.listByColumns("nhanVien",
													nv.getNhanVien().getMaNhanVien());
											if (list_CoVanHocTap.size() > 0) {
												maCoVanHocTap = list_CoVanHocTap.get(0).getMaCoVanHocTap();
												System.out.println(maCoVanHocTap);
									%>

									<!-- 									<input readonly class="form-control" name="maCoVanHocTap" -->
									<%-- 										<%=(modeView ? " disabled " : "")%> value="<%=maCoVanHocTap%>"> --%>
									<select name="maCoVanHocTap" class="form-control" readonly><option
											value="<%=maCoVanHocTap%>"><%=nv.getNhanVien().getTenNhanVien()%></option></select>
									<%
										} else { // đây là admin
											String maSo = session.getAttribute("maSo").toString();
										ObjectDAO<PhanCongCoVanHocTap> dao_PhanCong = new DAO_PhanCongCoVanHocTap();
										ArrayList<PhanCongCoVanHocTap> list_PhanCong = dao_PhanCong.listByColumns("soCoVanHocTap", maSo);
										String maCoVanHocTap1 = list_PhanCong.get(0).getCoVanHocTap().getMaCoVanHocTap();
										ObjectDAO<CoVanHocTap> dao_CoVanHocTap1 = new DAO_CoVanHocTap();
										ArrayList<CoVanHocTap> list_CoVanHocTap1 = dao_CoVanHocTap.listByColumns("maCoVanHocTap", maCoVanHocTap1);
										String maNhanVien1 = list_CoVanHocTap1.get(0).getNhanVien().getMaNhanVien();
										ObjectDAO<NhanVien> dao_NhanVien = new DAO_NhanVien();
										ArrayList<NhanVien> list_NhanVien = dao_NhanVien.listByColumns("maNhanVien", maNhanVien1);
										NhanVien nhanVien = list_NhanVien.get(0);
										
									%>
									<select name="maCoVanHocTap" class="form-control" readonly><option
											value="<%=list_CoVanHocTap1.get(0).getMaCoVanHocTap()%>"><%=nhanVien.getTenNhanVien()%></option></select>
									<%
										}
									%>

								</div>
								<div class="form-group">
									<label>Mã báo cáo tình hình lớp</label> <input
										class="form-control" name="maBaoCaoTinhHinhLop"
										value="<%=(obj != null ? obj.getMaBaoCaoTinhHinhLop() : "BC" + System.currentTimeMillis())%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>

								<div class="form-group">
									<label>Tên báo cáo tình hình lớp</label> <input
										class="form-control" name="tenBaoCaoTinhHinhLop"
										value="<%=(obj != null ? obj.getTenBaoCaoTinhHinhLop() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Học kỳ</label> <input class="form-control" name="hocKy"
										value="<%=(obj != null ? obj.getHocKy() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Năm học</label> <input class="form-control"
										name="namHoc"
										value="<%=(obj != null ? obj.getNamHoc() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>

							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label>Tình hình chung</label>
									<textarea class="form-control" name="tinhHinhChung" value=""
										<%=(modeView ? " disabled " : "")%>><%=(obj != null ? obj.getTinhHinhChung() : "")%></textarea>
								</div>
								<div class="form-group">
									<label>Tư tưởng chính trị</label> <input class="form-control"
										name="tuTuongChinhTri"
										value="<%=(obj != null ? obj.getTuTuongChinhTri() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Kết quả học tập</label>
									<textarea class="form-control" name="ketQuaHocTap" value=""
										<%=(modeView ? " disabled " : "")%>><%=(obj != null ? obj.getKetQuaHocTap() : "")%></textarea>
								</div>
								<div class="form-group">
									<label>Kết quả rèn luyện</label>
									<textarea class="form-control" name="ketQuaRenLuyen" value=""
										<%=(modeView ? " disabled " : "")%>><%=(obj != null ? obj.getKetQuaRenLuyen() : "")%></textarea>
								</div>
								<div class="form-group">
									<label>Kết quả các hoạt động khác</label> <input
										class="form-control" name="ketQuaCacHoatDongKhac"
										value="<%=(obj != null ? obj.getKetQuaCacHoatDongKhac() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<label>Kiến nghị đề xuất</label>
									<textarea class="form-control" name="kienNghiDeXuat"
										id="noiDung" <%=(modeView ? " disabled " : "")%>><%=(obj != null ? obj.getKienNghiDeXuat() : "")%></textarea>
								</div>
								<div class="form-group">
									<label>Mô tả</label>
									<textarea class="form-control" cols="80" id="editor1" rows="5"
										name="moTa" <%=(modeView ? " disabled " : "")%>><%=(obj != null ? obj.getMoTa() : "")%></textarea>
								</div>
								<div class="form-group">
									<label>Ghi chú</label>
									<textarea class="form-control" cols="80" id="editor2" rows="5"
										name="ghiChu" <%=(modeView ? " disabled " : "")%>><%=(obj != null ? obj.getGhiChu() : "")%></textarea>
								</div>
							</div>
						</div>
						<div class="panel-footer" style="text-align: left;">
							<div class="col-md-5"></div>
							<div class="col-md-7">
								<%@ include file="../../ePartial/processform.jsp"%>
							</div>
						</div>
						<!-- /.col-lg-6 (nested) -->
						<!-- /.col-lg-6 (nested) -->
					</div>
					<!-- /.row (nested) -->
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
</form>
<%session.removeAttribute("msg"); %>
<%
	}
%>