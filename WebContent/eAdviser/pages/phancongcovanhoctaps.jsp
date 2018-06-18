<%@page import="eCore.modelDao.DAO_NamHoc"%>
<%@page import="eCore.model.NamHoc"%>
<%@page import="eCore.util.Util_Date"%>
<%@page import="eAdviser.modelDao.DAO_PhanCongCoVanHocTap"%>
<%@page import="eAdviser.model.PhanCongCoVanHocTap"%>
<%@page import="eAdviser.modelDao.DAO_CoVanHocTap"%>
<%@page import="eAdviser.model.CoVanHocTap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="eCore.modelDao.DAO_Lop"%>
<%@page import="eCore.model.Lop"%>
<%@page import="eCore.dao.ObjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "PhanCongCoVanHocTap";
	String tenTrang = "Quản lý phân công cố vấn học tập";
	String trangDanhSach = "index.jsp?p=eAdviser/pages/phancongcovanhoctaps.jsp";
	String[] tk_value = {"coVanHocTap", "soCoVanHocTap", "namHoc", "maPhanCong", "thoiGianBatDau",
			"thoiGianKetThuc"};
	String[] tk_show = {"Cố vấn học tập", "Sổ cố vấn học tập", "Năm học", "Mã phân công", "Thời gian bắt đầu",
			"Thời gian kết thúc"};
%>

<%@ include file="../../ePartial/code-header.jsp"%>

<%
	ObjectDAO<PhanCongCoVanHocTap> dao = new DAO_PhanCongCoVanHocTap();

	ArrayList<PhanCongCoVanHocTap> list = new ArrayList<PhanCongCoVanHocTap>();

	// code nut loc
	String maNamHoc = request.getParameter("maNamHoc");
	maNamHoc = (maNamHoc == null || maNamHoc.equals("null")) ? "all" : maNamHoc;
	
	String maCoVanHocTap = request.getParameter("maCoVanHocTap");
	maCoVanHocTap = (maCoVanHocTap == null || maCoVanHocTap.equals("null")) ? "all" : maCoVanHocTap;

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof PhanCongCoVanHocTap) {
				list = (ArrayList<PhanCongCoVanHocTap>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<PhanCongCoVanHocTap>();
	} else {
		//co nut loc
		if (!maNamHoc.equals("all") && !maCoVanHocTap.equals("all"))
			list = dao.pagination("namHoc = '" + maNamHoc + "' AND coVanHocTap = '" + maCoVanHocTap+"'", (long) recordPerPage,
					(long) Long.parseLong(pid) * recordPerPage);
		if (!maNamHoc.equals("all")&& maCoVanHocTap.equals("all"))
			list = dao.pagination("namHoc = '" + maNamHoc +"'", (long) recordPerPage,
					(long) Long.parseLong(pid) * recordPerPage);
		if (maNamHoc.equals("all")&& !maCoVanHocTap.equals("all"))
			list = dao.pagination("coVanHocTap = '" + maCoVanHocTap+"'", (long) recordPerPage,
					(long) Long.parseLong(pid) * recordPerPage);
		if (maNamHoc.equals("all")&& maCoVanHocTap.equals("all"))
			list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
	}

	// gán session arr để phục vụ việc xuất ra danh sách excel theo danh sách đã tìm
	session.setAttribute("arr", list);
%>


<div class="row">
	<div class="col-lg-12">
		<h4 class="page-header"><%=tenTrang%>
			<p style="color: red; display: inline;"><%=msg%></p>
		</h4>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<%@ include file="../../ePartial/panel-heading_quanly.jsp"%>
		<!-- /.panel-heading -->
		<div class="panel-body">


			<div id="danhchonguoiquanly" style="margin-bottom: 40px">
				<form class="form-inline pull-left">
					<label>Chọn năm học</label> <select name="maNamHoc"
						class="form-control" id="maNamHoc" onchange="myFunction()">
						<%
							ObjectDAO<NamHoc> dao_NamHoc = new DAO_NamHoc();
							ArrayList<NamHoc> list_NamHoc = dao_NamHoc.listAll();
						%>
						<option value="all" <%if (maNamHoc.equals("all")) {%>
							selected="selected" <%}%>>Tất cả</option>

						<%
							for (NamHoc namHoc : list_NamHoc) {
						%>
						<option value="<%=namHoc.getMaNamHoc()%>"
							<%if (maNamHoc.equals(namHoc.getMaNamHoc())) {%>
							selected="selected" <%}%>><%=namHoc.getTenNamHoc()%></option>
						<%
							}
						%>
					</select>
					<script type="text/javascript">
						function myFunction() {
							var maDot = document.getElementById("maNamHoc").value;
							var maCoVanHocTap = document.getElementById("maCoVanHocTap").value;
							var recordPerPage = document.getElementById("recordPerPage").value;
							var p1 = document.getElementById("p1").value;
							window.location.href = p1 + "&maNamHoc=" + maDot + "&maCoVanHocTap=" + maCoVanHocTap + "&recordPerPage="+ recordPerPage;

						}
					</script>
				</form>
				<form class="form-inline pull-right">
					<label>Chọn cố vấn học tập</label> <select name="maCoVanHocTap"
						class="form-control" id="maCoVanHocTap" onchange="myFunction()">
						<%
							ObjectDAO<CoVanHocTap> dao_coVanHocTap = new DAO_CoVanHocTap();
							ArrayList<CoVanHocTap> list_coVanHocTap = dao_coVanHocTap.listAll();
							
						%>
						<option value="all" <%if (maCoVanHocTap.equals("all")) {%>
							selected="selected" <%}%>>Tất cả</option>

						<%
							for (CoVanHocTap coVanHocTap : list_coVanHocTap) {
						%>
						<option value="<%=coVanHocTap.getMaCoVanHocTap()%>"
							<%if (maCoVanHocTap.equals(coVanHocTap.getMaCoVanHocTap())) {%>
							selected="selected" <%}%>><%=coVanHocTap.getNhanVien().getTenNhanVien()%></option>
						<%
							}
						%>
					</select>
					<form class="form-inline pull-right"
						action="exportPhanCongCoVanHocTap.action">
						<input hidden=""
							value="<%=request.getParameter("maNamHoc") != null ? request.getParameter("maNamHoc") : ""%>"
							name="maNamHoc">
						<button type="submit" class="form-control btn btn-success"
							value="">
							<img alt="" src="content/images/excel-32.png" width="16px"
								height="16px"> Xuất danh sách excel
						</button>
					</form>
			</div>



			<table width="100%"
				class="table table-striped table-bordered table-hover"
				id="dataTables-example">
				<thead>
					<tr>
						<th>Cố vấn học tập</th>
						<th>Sổ cố vấn học tập</th>
						<th>Năm học</th>
						<th>Mã phân công</th>
						<th>Thời gian bắt đầu</th>
						<th>Thời gian kết thúc</th>
						<th>Xử lý</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (PhanCongCoVanHocTap obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaPhanCong();
							String tenDoiTuong = obj.getMaPhanCong();
							if (obj.getCoVanHocTap() != null && obj.getCoVanHocTap().getNhanVien().getTenNhanVien() != null) {
								tenDoiTuong = obj.getCoVanHocTap().getNhanVien().getTenNhanVien();
							}
					%>
					<tr class="odd gradeX">
						<td><%=obj.getCoVanHocTap().getNhanVien().getTenNhanVien()%></td>
						<td><%=obj.getSoCoVanHocTap() != null && obj.getSoCoVanHocTap().getTenSoCoVanHocTap() != null
						? obj.getSoCoVanHocTap().getTenSoCoVanHocTap()
						: ""%></td>
						<td><%=obj.getNamHoc() != null && obj.getNamHoc().getTenNamHoc() != null
						? obj.getNamHoc().getTenNamHoc()
						: ""%></td>
						<td><%=obj.getMaPhanCong()%></td>
						<td><%=Util_Date.dateToString2(obj.getThoiGianBatDau())%></td>
						<td><%=Util_Date.dateToString2(obj.getThoiGianKetThuc())%></td>
						<td style="text-align: center;"><%@ include
								file="../../ePartial/menupullcuadoituong.jsp"%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<!-- /.table-responsive -->
			<!-- Phan trang -->
			<%@ include file="../../ePartial/phantrang.jsp"%>
			<!-- ket thuc phan trang -->
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
</div>
<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<!-- Modal Tìm kiếm-->
<%@ include file="../../ePartial/timkiemModel.jsp"%>
<script type="text/javascript">
document.getElementById("nutNhapLieuExcel").style.display = "none";
</script>

<%session.removeAttribute("msg"); %>
