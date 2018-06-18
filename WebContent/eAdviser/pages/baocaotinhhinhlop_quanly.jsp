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
	String tenLop = "BaoCaoTinhHinhLop_quanly";
	String tenTrang = "Quản lý Báo Cáo Tình Hình Lớp";
	String trangDanhSach = "index.jsp?p=eAdviser/pages/baocaotinhhinhlops_quanly.jsp";
	String[] tk_value = {"soCoVanHocTap", "coVanHocTap", "maBaoCaoTinhHinhLop", "tenBaoCaoTinhHinhLop", "hocKy",
			"namHoc", "soSinhVienTrongLop", "tinhHinhChung"};
	String[] tk_show = {"thuộc Sổ cố vấn học tập", "Cố vấn học tập", "Mã báo cáo tình hình lớp",
			"Tên báo cáo tình hình lớp", "Học kỳ", "Năm học", "Số sinh viên trong lớp", "Tình hình chung"};
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
									<label>Thuộc Sổ cố vấn học tập</label> <select
										class="form-control" id="maSoCoVanHocTap"
										name="maSoCoVanHocTap" onchange="chonSoCoVanHocTap()"
										<%=(modeView ? "readonly" : "")%>>
										<option></option>
										<%
											ObjectDAO<SoCoVanHocTap> dao_SoCoVanHocTap = new DAO_SoCoVanHocTap();
											ArrayList<SoCoVanHocTap> list_SoCoVanHocTap = dao_SoCoVanHocTap.listAll();
											String maSo = request.getParameter("maSoCoVanHocTap") != null
													? request.getParameter("maSoCoVanHocTap")
													: "";
											for (SoCoVanHocTap soCoVanHocTap : list_SoCoVanHocTap) {
										%>
										<option value="<%=soCoVanHocTap.getMaSoCoVanHocTap()%>"
											<%=( maSo.equals(soCoVanHocTap.getMaSoCoVanHocTap())) ? "selected" : ""%>><%=soCoVanHocTap.getTenSoCoVanHocTap()%></option>
										<%
											}
										%>
									</select>

									<script type="text/javascript">
										function chonSoCoVanHocTap() {
											var maSo = document
													.getElementById("maSoCoVanHocTap").value;
											window.location.href = "index.jsp?p=eAdviser/pages/baocaotinhhinhlop_quanly.jsp&maSoCoVanHocTap="
													+ maSo;

										}
									</script>
								</div>
								<div class="form-group">
									<label>Cố vấn học tập</label> <select class="form-control"
										name="maCoVanHocTap"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
										<%
											if (maSo.equals("")) {
												if (obj != null)
													maSo = obj.getSoCoVanHocTap().getMaSoCoVanHocTap();
											}
											ObjectDAO<PhanCongCoVanHocTap> dao_PhanCongCoVanHocTap = new DAO_PhanCongCoVanHocTap();
											ArrayList<PhanCongCoVanHocTap> list_PhanCongCoVanHocTap = dao_PhanCongCoVanHocTap
													.listByColumns("soCoVanHocTap", maSo);
											if (list_PhanCongCoVanHocTap.size() > 0) {
										%>
										<option
											value="<%=list_PhanCongCoVanHocTap.get(0).getCoVanHocTap().getMaCoVanHocTap()%>"><%=list_PhanCongCoVanHocTap.get(0).getCoVanHocTap().getNhanVien().getTenNhanVien()%></option>
										<%
											}
										%>
									</select>
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
										value="<%=(obj != null ? obj.getKetQuaRenLuyen() : "")%>"
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
<%-- <% --%>

<%-- %> --%>


<%session.removeAttribute("msg"); %>
<script type="text/javascript">
	document.getElementById("nutIn").style.display = "none";
</script>