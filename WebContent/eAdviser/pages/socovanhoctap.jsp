<%@page import="java.util.Date"%>
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
	String tenLop = "SoCoVanHocTap";
	String tenTrang = "Quản lý Sổ cố vấn học tập";
	String trangDanhSach = "index.jsp?p=eAdviser/pages/socovanhoctaps.jsp";
	String[] tk_value = {"lop", "maSoCoVanHocTap", "tenSoCoVanHocTap", "ngayBD", "ngayKT"};
	String[] tk_show = {"Lớp", "Mã sổ cố vấn học tập", "Tên sổ cố vấn học tập", "Ngày bắt đầu",
			"Ngày kết thúc"};
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

	SoCoVanHocTap obj = null;
	if (session.getAttribute("obj") != null) {
		if (session.getAttribute("obj") instanceof SoCoVanHocTap) {
			obj = (SoCoVanHocTap) session.getAttribute("obj");
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
									<label>Lớp</label> <select id="maLop" onchange="chonLop()"
										class="form-control" name="maLop" 
										>
										<option></option>
										<% String maLop=request.getParameter("maLop") != null ? request.getParameter("maLop") :"";%>
										<%
											ObjectDAO objdaoLop = new DAO_Lop();
											ArrayList<Lop> listLop = objdaoLop.listAll();
											for (Lop l : listLop) {
												
										%>
										<option value="<%=l.maLop%>"
											<%= (obj !=null && obj.getLop().getMaLop().equals(l.maLop)) || (maLop.equals(l.maLop)) ? "selected" : ""%>><%=l.getTenLop()%>
										</option>
										
										
										<%
											}
											
										%>
									</select>
								</div>
								<div class="form-group">
									<%
										String maSo = request.getParameter("maLop") != null ? "S" + request.getParameter("maLop") : "";
									%>
									<label>Mã sổ cố vấn học tập</label> <input class="form-control"
										name="maSoCoVanHocTap"
										value="<%=(obj != null ? obj.getMaSoCoVanHocTap() : maSo)%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Tên sổ cố vấn học tập</label> <input
										class="form-control" name="tenSoCoVanHocTap"
										value="<%=(obj != null &&obj.getTenSoCoVanHocTap()!=null? obj.getTenSoCoVanHocTap() : "")%>"
										<%=(modeView ? " disabled " : "")%>>

									<script type="text/javascript">
										function chonLop() {
											var maLop = document
													.getElementById("maLop").value;
											window.location.href = "index.jsp?p=eAdviser/pages/socovanhoctap.jsp&maLop="
													+ maLop;
										}
									</script>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label>Ngày bắt đầu</label> <input type="date"
										class="form-control" name="s_ngayBD"
										value="<%=(obj != null ? Util_Date.dateToString(obj.getNgayBD()) : Util_Date.dateToString(new Date()))%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Ngày kết thúc</label> <input type="date"
										class="form-control" name="s_ngayKT"
										value="<%=(obj != null ? Util_Date.dateToString(obj.getNgayKT()) : Util_Date.dateToString(new Date()))%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>

							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<label>Mô tả</label>
									<textarea class="form-control" cols="80" id="editor1" rows="5"
										name="moTa" <%=(modeView ? " disabled " : "")%>><%=(obj != null && obj.getMoTa()!=null ? obj.getMoTa() : "")%></textarea>
								</div>
								<div class="form-group">
									<label>Ghi chú</label>
									<textarea class="form-control" cols="80" id="editor2" rows="5"
										name="ghiChu" <%=(modeView ? " disabled " : "")%>><%=(obj != null && obj.getGhiChu()!=null? obj.getGhiChu() : "")%></textarea>
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