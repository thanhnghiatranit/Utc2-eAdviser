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
	String tenLop = "CoVanHocTap";
	String tenTrang = "Quản lý Cố vấn học tập";
	String trangDanhSach = "index.jsp?p=eAdviser/pages/covanhoctaps.jsp";
	String[] tk_value = { "maCoVanHocTap", "nhanVien", "dienThoaiCoQuan", "diaChiGuiThu", "diDong" };
	String[] tk_show = { "Mã Cố vấn học tập", "Nhân viên", "Điện thoại cơ quan", "Địa chỉ gửi thư", "Di động" };
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

	CoVanHocTap obj = null;
	if (session.getAttribute("obj") != null) {
		if (session.getAttribute("obj") instanceof CoVanHocTap) {
			obj = (CoVanHocTap) session.getAttribute("obj");
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
									<label>Mã Cố vấn học tập</label> <input class="form-control"
										name="maCoVanHocTap"
										value="<%=(obj != null ? obj.getMaCoVanHocTap() : "C"+ System.currentTimeMillis())%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Nhân viên</label> <select class="form-control"
										name="maNhanVien" <%=(modeView ? " disabled " : "")%>>
										<%
											ObjectDAO objdao = new DAO_NhanVien();
											ArrayList<NhanVien> listNhanVien = objdao.listAll();
											for (NhanVien nv : listNhanVien) {
												if (obj != null && obj.getNhanVien() != null
														&& obj.getNhanVien().getMaNhanVien().equals(nv.getMaNhanVien())) {
										%>
										<option value="<%=nv.maNhanVien%>" selected="selected"><%=nv.getTenNhanVien()%>
										</option>
										<%
											} else {
										%>
										<option value="<%=nv.maNhanVien%>"><%=nv.getTenNhanVien()%>
										</option>
										<%
											}
											}
										%>
									</select>
								</div>
								<div class="form-group">
									<label>Điện thoại cơ quan</label> <input class="form-control"
										name="dienThoaiCoQuan"
										value="<%=(obj != null && obj.getDienThoaiCoQuan() !=null ? obj.getDienThoaiCoQuan() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label>Địa chỉ gửi thư</label> <input class="form-control"
										name="diaChiGuiThu"
										value="<%=(obj != null && obj.getDiaChiGuiThu() !=null ? obj.getDiaChiGuiThu() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Di động</label> <input class="form-control"
										name="diDong"
										value="<%=(obj != null ? obj.getDiDong() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>

							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
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