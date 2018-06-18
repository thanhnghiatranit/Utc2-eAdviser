<%@page import="java.util.Date"%>
<%@page import="eAdviser.model.ThongTinKyLuatSinhVien"%>
<%@page import="eAdviser.model.ThongTinKhenThuongSinhVien"%>
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
	String tenLop = "ThongTinKyLuatSinhVien_quanly";
	String tenTrang = "Quản lý Thông Tin Kỷ luật Sinh Viên";
	String trangDanhSach = "index.jsp?p=eAdviser/pages/thongtinkyluatsinhviens_quanly.jsp";
	String[] tk_value = { "soCoVanHocTap", "sinhVien", "maThongTinKyLuatSinhVien", "noiDungKyLuat",
			"thoiGianKyLuat" };
	String[] tk_show = { "Sổ cố vấn học tập", "Sinh viên", "Mã thông tin kỷ luật sinh viên", "Nội dung kỷ luật",
			"Thời gian kỷ luật" };
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

	ThongTinKyLuatSinhVien obj = null;
	if (session.getAttribute("obj") != null) {
		if (session.getAttribute("obj") instanceof ThongTinKyLuatSinhVien) {
			obj = (ThongTinKyLuatSinhVien) session.getAttribute("obj");
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
									<label>Mã thông tin kỷ luật sinh viên</label> <input
										class="form-control" name="maThongTinKyLuatSinhVien"
										value="<%=(obj != null ? obj.getMaThongTinKyLuatSinhVien() : "KL" + System.currentTimeMillis())%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label>Mã sinh viên</label> <input class="form-control"
										name="maSinhVien"
										value="<%=(obj != null ? obj.getSinhVien().getMaSinhVien() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Thời gian kỷ luật</label> <input type="date"
										class="form-control" name="s_thoiGianKyLuat"
										value="<%=(obj != null ? Util_Date.dateToString(obj.getThoiGianKyLuat())
					: Util_Date.dateToString(new Date()))%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<label>Nội dung kỷ luật</label>
									<textarea class="form-control" name="noiDungKyLuat"
										id="noiDung" <%=(modeView ? " disabled " : "")%>><%=(obj != null ? obj.getNoiDungKyLuat() : "")%></textarea>
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