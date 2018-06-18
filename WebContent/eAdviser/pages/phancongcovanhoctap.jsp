<%@page import="java.util.Date"%>
<%@page import="eCore.util.Util_Date"%>
<%@page import="eCore.model.NamHoc"%>
<%@page import="eCore.modelDao.DAO_NamHoc"%>
<%@page import="eAdviser.model.SoCoVanHocTap"%>
<%@page import="eAdviser.modelDao.DAO_SoCoVanHocTap"%>
<%@page import="eAdviser.modelDao.DAO_CoVanHocTap"%>
<%@page import="eAdviser.model.PhanCongCoVanHocTap"%>
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
	String tenLop = "PhanCongCoVanHocTap";
	String tenTrang = "Quản lý phân công cố vấn học tập";
	String trangDanhSach = "index.jsp?p=eAdviser/pages/phancongcovanhoctaps.jsp";
	String[] tk_value = { "coVanHocTap", "soCoVanHocTap", "namHoc", "maPhanCong", "thoiGianBatDau",
			"thoiGianKetThuc" };
	String[] tk_show = { "Cố vấn học tập", "Sổ cố vấn học tập", "Năm học", "Mã phân công", "Thời gian bắt đầu",
			"Thời gian kết thúc" };
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

	PhanCongCoVanHocTap obj = null;
	if (session.getAttribute("obj") != null) {
		if (session.getAttribute("obj") instanceof PhanCongCoVanHocTap) {
			obj = (PhanCongCoVanHocTap) session.getAttribute("obj");
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
									<label>Cố vấn học tập</label> <select class="form-control"
										name="maCoVanHocTap" <%=(modeView ? " disabled " : "")%>>
										<option></option>
										<%
											ObjectDAO objCoVanHocTap = new DAO_CoVanHocTap();
											ArrayList<CoVanHocTap> listCoVanHocTap = objCoVanHocTap.listAll();
											for (CoVanHocTap cvht : listCoVanHocTap) {
												if (obj != null && obj.getCoVanHocTap() != null && obj.getCoVanHocTap().getNhanVien().getMaNhanVien()
														.equals(cvht.getNhanVien().getMaNhanVien())) {
										%>
										
										<option value="<%=cvht.maCoVanHocTap%>" selected="selected"><%=cvht.getNhanVien().getTenNhanVien()%>
										</option>
										<%
											} else {
										%>
										<option value="<%=cvht.maCoVanHocTap%>"><%=cvht.getNhanVien().getTenNhanVien()%>
										</option>
										<%
											}
											}
										%>
									</select>
								</div>
								<div class="form-group">
									<label>Sổ cố vấn học tập</label> <select class="form-control"
										name="maSoCoVanHocTap" <%=(modeView ? " disabled " : "")%>><option></option>
										<%
											ObjectDAO objSoCoVanHocTap = new DAO_SoCoVanHocTap();
											ArrayList<SoCoVanHocTap> listSoCoVanHocTap = objSoCoVanHocTap.listAll();
											for (SoCoVanHocTap scvht : listSoCoVanHocTap) {
												if (obj != null && obj.getSoCoVanHocTap() != null
														&& obj.getSoCoVanHocTap().getMaSoCoVanHocTap().equals(scvht.getMaSoCoVanHocTap())) {
										%>
										
										<option value="<%=scvht.maSoCoVanHocTap%>" selected="selected"><%=scvht.getTenSoCoVanHocTap()%>
										</option>
										<%
											} else {
										%>
										<option value="<%=scvht.maSoCoVanHocTap%>"><%=scvht.getTenSoCoVanHocTap()%>
										</option>
										<%
											}
											}
										%>
									</select>
								</div>
								<div class="form-group">
									<label>Năm học</label> <select class="form-control"
										name="maNamHoc" <%=(modeView ? " disabled " : "")%>>
										<%
											ObjectDAO objNamHoc = new DAO_NamHoc();
											ArrayList<NamHoc> listNamHoc = objNamHoc.listAll();
											for (NamHoc nh : listNamHoc) {
												if (obj != null && obj.getNamHoc() != null && obj.getNamHoc().getMaNamHoc().equals(nh.getMaNamHoc())) {
										%>
										<option value="<%=nh.maNamHoc%>" selected="selected"><%=nh.getTenNamHoc()%>
										</option>
										<%
											} else {
										%>
										<option value="<%=nh.maNamHoc%>"><%=nh.getTenNamHoc()%>
										</option>
										<%
											}
											}
										%>
									</select>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label>Mã phân công</label> <input class="form-control"
										name="maPhanCong"
										value="<%=(obj != null ? obj.getMaPhanCong() : "PC"+ System.currentTimeMillis())%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Thời gian bắt đầu</label> <input type="date"
										class="form-control" name="s_thoiGianBatDau"
										value="<%=(obj != null ? Util_Date.dateToString(obj.getThoiGianBatDau()) : Util_Date.dateToString(new Date()))%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Thời gian kết thúc</label> <input type="date"
										class="form-control" name="s_thoiGianKetThuc"
										value="<%=(obj != null ? Util_Date.dateToString(obj.getThoiGianKetThuc()) : Util_Date.dateToString(new Date()))%>"
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