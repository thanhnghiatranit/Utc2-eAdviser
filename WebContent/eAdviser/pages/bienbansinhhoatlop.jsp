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
	String tenLop = "BienBanSinhHoatLop";
	String tenTrang = "Quản lý biên bản sinh hoạt lớp";
	String trangDanhSach = "index.jsp?p=eAdviser/pages/bienbansinhhoatlops.jsp";
	String[] tk_value = { "maBienBanSinhHoatLop", "tenBienBanSinhHoatLop", "chuTriCuocHop", "thuKyCuocHop",
			"diaDiem", "thoiGian", "soLuongThamGia", "soLuongVang", "danhSachVangMat", "noiDung", "deXuat",
			"soCoVanHocTap" };
	String[] tk_show = { "Mã biên bản sinh hoạt lớp", "Tên biên bản sinh hoạt lớp", "Chủ trì cuộc họp",
			"Thư ký cuộc họp", "Địa điểm", "Thời gian", "Số lượng tham gia", "Số lượng vắng",
			"Danh sách vắng mắt", "Nội dung", "Đề xuất", "Sổ cố vấn học tập" };
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

	BienBanSinhHoatLop obj = null;
	if (session.getAttribute("obj") != null) {
		if (session.getAttribute("obj") instanceof BienBanSinhHoatLop) {
			obj = (BienBanSinhHoatLop) session.getAttribute("obj");
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
									<label>Thuộc Sổ cố vấn học tập</label> <input readonly
										class="form-control" name="maSoCoVanHocTap"
										value="<%=session.getAttribute("maSo").toString()%>">
								</div>
								<div class="form-group">
									<label>Mã biên bản sinh hoạt lớp</label> <input
										class="form-control" name="maBienBanSinhHoatLop"
										value="<%=(obj != null ? obj.getMaBienBanSinhHoatLop() : "B" + System.currentTimeMillis())%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>

								<div class="form-group">
									<label>Tên biên bản sinh hoạt lớp</label> <input
										class="form-control" name="tenBienBanSinhHoatLop"
										value="<%=(obj != null ? obj.getTenBienBanSinhHoatLop() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Chủ trì cuộc họp</label> <input class="form-control"
										name="chuTriCuocHop"
										value="<%=(obj != null ? obj.getChuTriCuocHop() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Thư ký cuộc họp</label> <input class="form-control"
										name="thuKyCuocHop"
										value="<%=(obj != null ? obj.getThuKyCuocHop() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Địa điểm</label> <input class="form-control"
										name="diaDiem"
										value="<%=(obj != null ? obj.getDiaDiem() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
							</div>
							<div class="col-lg-6">

								<div class="form-group">
									<label>Thời gian</label> <input class="form-control"
										name="thoiGian"
										value="<%=(obj != null ? obj.getThoiGian() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Số lượng tham gia</label> <input class="form-control"
										name="soLuongThamGia"
										value="<%=(obj != null ? obj.getSoLuongThamGia() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Số lượng vắng</label> <input class="form-control"
										name="soLuongVang"
										value="<%=(obj != null ? obj.getSoLuongVang() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Danh sách vắng mặt</label>
									<textarea class="form-control" name="danhSachVangMat"
										<%=(modeView ? " disabled " : "")%>>
										<%=(obj != null ? obj.getDanhSachVangMat() : "")%></textarea>
								</div>
								<div class="form-group">
									<label>Đề xuất</label> <input class="form-control"
										name="deXuat"
										value="<%=(obj != null ? obj.getDeXuat() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<label>Nội Dung</label>
									<textarea class="form-control" name="noiDung" id="noiDung"
										<%=(modeView ? " disabled " : "")%>>
										<%=(obj != null ? obj.getNoiDung() : "")%></textarea>
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
<%}%>
<%session.removeAttribute("msg"); %>