<%@page import="eCore.model.SinhVien"%>
<%@page import="eCore.modelDao.DAO_SinhVien"%>
<%@page import="eAdviser.modelDao.DAO_SoCoVanHocTap"%>
<%@page import="eAdviser.model.ThongTinSinhVien"%>
<%@page import="eCore.util.Util_Date"%>
<%@page import="eAdviser.model.SoCoVanHocTap"%>
<%@page import="eCore.modelDao.DAO_Lop"%>
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
	String tenLop = "ThongTinSinhVien_quanly";
	String tenTrang = "Quản lý Thông Tin Sinh Viên";
	String trangDanhSach = "index.jsp?p=eAdviser/pages/thongtinsinhviens_quanly.jsp";
	String[] tk_value = { "soCoVanHocTap", "sinhVien", "maThongTinSinhVien", "doiTuongChinhSach", "canBoLop",
			"email", "dienThoaiDiDong", "dienThoaiGiaDinh", "diaChiBaoTin" };
	String[] tk_show = { "Sổ cố vấn học tập", "Sinh viên", "Mã thông tin sinh viên", "Đối tượng chính sách",
			"Cán bộ lớp", "Email", "Điện thoại di động", "Điện thoại gia đình", "Địa chỉ báo tin" };
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

	ThongTinSinhVien obj = null;
	if (session.getAttribute("obj") != null) {
		if (session.getAttribute("obj") instanceof ThongTinSinhVien) {
			obj = (ThongTinSinhVien) session.getAttribute("obj");
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
									<label>Thuộc Sổ cố vấn học tập</label>
									<select class="form-control" id="maSoCoVanHocTap" name="maSoCoVanHocTap" onchange="chonSoCoVanHocTap()" <%=(modeView ? " readonly " : "")%>>
									<option></option>
										<%
											ObjectDAO<SoCoVanHocTap> dao_SoCoVanHocTap = new DAO_SoCoVanHocTap();
											ArrayList<SoCoVanHocTap> list_SoCoVanHocTap = dao_SoCoVanHocTap.listAll();
											String maSo  = request.getParameter("maSoCoVanHocTap");
											for (SoCoVanHocTap soCoVanHocTap : list_SoCoVanHocTap) {
										%>
										<option value="<%=soCoVanHocTap.getMaSoCoVanHocTap()%>" <%=obj!=null && obj.getSoCoVanHocTap().getMaSoCoVanHocTap().equals(soCoVanHocTap.getMaSoCoVanHocTap())?"selected":"" %>><%=soCoVanHocTap.getTenSoCoVanHocTap()%></option>
										<%
											}
										%>
									</select>
								</div>
								<div class="form-group">
									<label>Mã thông tin sinh viên</label> <input readonly
										class="form-control" name="maThongTinSinhVien"
										value="<%=(obj != null ? obj.getMaThongTinSinhVien() : "TS" + System.currentTimeMillis())%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Mã sinh viên</label> <input class="form-control"
										name="maSinhVien"
										value="<%=(obj != null ? obj.getSinhVien().getMaSinhVien() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>

								<div class="form-group">
									<label>Đối tượng chính sách</label> <input class="form-control"
										name="doiTuongChinhSach"
										value="<%=((obj != null && obj.getDoiTuongChinhSach() != null) ? obj.getDoiTuongChinhSach() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Cán bộ lớp</label> <input class="form-control"
										name="canBoLop"
										value="<%=((obj != null && obj.getCanBoLop() != null) ? obj.getCanBoLop() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
							</div>

							<div class="col-lg-6">
								<div class="form-group">
									<label>Email</label> <input class="form-control" name="email"
										value="<%=(obj != null ? obj.getEmail() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Điện thoại di động</label> <input class="form-control"
										name="dienThoaiDiDong"
										value="<%=(obj != null ? obj.getDienThoaiDiDong() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Điện thoại gia đình</label> <input class="form-control"
										name="dienThoaiGiaDinh"
										value="<%=(obj != null ? obj.getDienThoaiGiaDinh() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Địa chỉ báo tin</label> <input class="form-control"
										name="diaChiBaoTin"
										value="<%=(obj != null ? obj.getDiaChiBaoTin() : "")%>"
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