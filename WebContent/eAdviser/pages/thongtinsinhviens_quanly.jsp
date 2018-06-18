<%@page import="eCore.modelDao.DAO_SinhVien"%>
<%@page import="eCore.model.SinhVien"%>
<%@page import="eAdviser.modelDao.DAO_SoCoVanHocTap"%>
<%@page import="eAdviser.model.SoCoVanHocTap"%>
<%@page import="eAdviser.modelDao.DAO_ThongTinSinhVien"%>
<%@page import="eAdviser.model.ThongTinSinhVien"%>
<%@page import="eAdviser.modelDao.DAO_BienBanSinhHoatLop"%>
<%@page import="eAdviser.model.BienBanSinhHoatLop"%>
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
	String tenLop = "ThongTinSinhVien_quanly";
	String tenTrang = "Quản lý Thông Tin Sinh Viên";
	String trangDanhSach = "index.jsp?p=eAdviser/pages/thongtinsinhviens_quanly.jsp";
	String[] tk_value = { "maThongTinSinhVien", "doiTuongChinhSach", "canBoLop", "email", "dienThoaiDiDong" };
	String[] tk_show = { "Mã thông tin sinh viên", "Đối tượng chính sách", "Cán bộ lớp", "Email",
			"Điện thoại di động" };
%>

<%@ include file="../../ePartial/code-header.jsp"%>

<%
	ObjectDAO<ThongTinSinhVien> dao = new DAO_ThongTinSinhVien();
	ArrayList<ThongTinSinhVien> list = new ArrayList<ThongTinSinhVien>();
	// 		String maSo = session.getAttribute("maSo").toString();

	//code loc
	String maSoCoVanHocTap = request.getParameter("maSoCoVanHocTap");
	maSoCoVanHocTap = (maSoCoVanHocTap == null || maSoCoVanHocTap.equals("null")) ? "all" : maSoCoVanHocTap;
	
	String maSinhVien = request.getParameter("maSinhVien");
	maSinhVien = (maSinhVien == null || maSinhVien.equals("null")) ? "all" : maSinhVien;

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof ThongTinSinhVien) {
				list = (ArrayList<ThongTinSinhVien>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<ThongTinSinhVien>();
	} else {
		//co nut loc
				if (!maSinhVien.equals("all") && !maSoCoVanHocTap.equals("all"))
					list = dao.pagination("maSinhVien = '" + maSinhVien + "' AND soCoVanHocTap = '" + maSoCoVanHocTap+"'", (long) recordPerPage,
							(long) Long.parseLong(pid) * recordPerPage);
				if (!maSinhVien.equals("all")&& maSoCoVanHocTap.equals("all"))
					list = dao.pagination("maSinhVien = '" + maSinhVien, (long) recordPerPage,
							(long) Long.parseLong(pid) * recordPerPage);
				if (maSinhVien.equals("all")&& !maSoCoVanHocTap.equals("all"))
					list = dao.pagination("soCoVanHocTap = '" + maSoCoVanHocTap+"'", (long) recordPerPage,
							(long) Long.parseLong(pid) * recordPerPage);
				if (maSinhVien.equals("all")&& maSoCoVanHocTap.equals("all"))
					list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
	}
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
					<label>Chọn sổ</label> <select name="maSoCoVanHocTap"
						class="form-control" id="maSoCoVanHocTap" onchange="myFunction()">
						<%
							ObjectDAO<SoCoVanHocTap> dao_SoCoVanHocTap = new DAO_SoCoVanHocTap();
							ArrayList<SoCoVanHocTap> list_SoCoVanHocTap = dao_SoCoVanHocTap.listAll();
						%>
						<option value="all" <%if (maSoCoVanHocTap.equals("all")) {%>
							selected="selected" <%}%>>Tất cả</option>

						<%
							for (SoCoVanHocTap soCoVanHocTap : list_SoCoVanHocTap) {
						%>
						<option value="<%=soCoVanHocTap.getMaSoCoVanHocTap()%>"
							<%if (maSoCoVanHocTap.equals(soCoVanHocTap.getMaSoCoVanHocTap())) {%>
							selected="selected" <%}%>><%=soCoVanHocTap.getTenSoCoVanHocTap()%></option>
						<%
							}
						%>
					</select>
					<script type="text/javascript">
						function myFunction() {
							var maSoCoVanHocTap = document
									.getElementById("maSoCoVanHocTap").value;
							var recordPerPage = document
									.getElementById("recordPerPage").value;
							var p1 = document.getElementById("p1").value;
							window.location.href = p1 + "&maSoCoVanHocTap="
									+ maSoCoVanHocTap + "&recordPerPage="
									+ recordPerPage;

						}
					</script>
				</form>
				
				<form class="form-inline pull-left">
					<label>Chọn sinh viên</label> <select name="maSinhVien"
						class="form-control" id="maSinhVien" onchange="myFunction()">
						<%
							ObjectDAO<SinhVien> dao_SinhVien = new DAO_SinhVien();
							ArrayList<SinhVien> list_SinhVien = dao_SinhVien.listAll();
						%>
						<option value="all" <%if (maSinhVien.equals("all")) {%>
							selected="selected" <%}%>>Tất cả</option>

						<%
							for (SinhVien sinhVien : list_SinhVien) {
						%>
						<option value="<%=sinhVien.getMaSinhVien()%>"
							<%if (maSinhVien.equals(sinhVien.getMaSinhVien())) {%>
							selected="selected" <%}%>><%=sinhVien.getHoDem()+ "" + sinhVien.getTen()%></option>
						<%
							}
						%>
					</select>
				</form>

				<form class="form-inline pull-right"
					action="exportThongTinSinhVien_quanly.action">
					<input hidden=""
						value="<%=request.getParameter("maSoCoVanHocTap") != null ? request.getParameter("maSoCoVanHocTap") : ""%>"
						name="maSoCoVanHocTap">
					<button type="submit" class="form-control btn btn-success" value="">
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
						<th>Sổ cố vấn học tập</th>
						<th>Sinh Viên</th>
						<th>Mã thông tin sinh viên</th>
						<th>Cán bộ lớp</th>
						<th>Email</th>
						<th>Điện thoại di động</th>
						<th>Điện thoại gia đình</th>
						<th>Địa chỉ báo tin</th>
						<th>Xử lý</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (ThongTinSinhVien obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaThongTinSinhVien();
							String tenDoiTuong = "";
					%>
					<tr class="odd gradeX">
						<td><%=obj.getSoCoVanHocTap() != null && obj.getSoCoVanHocTap().getTenSoCoVanHocTap() != null
						? obj.getSoCoVanHocTap().getTenSoCoVanHocTap()
						: ""%></td>
						<td><%=(obj.getSinhVien().getHoDem() + " " + obj.getSinhVien().getTen()) !=null ? (obj.getSinhVien().getHoDem() + " " + obj.getSinhVien().getTen()) :""%></td>
						<td><%=obj.getMaThongTinSinhVien()!=null ? obj.getMaThongTinSinhVien() :""%></td>
						<td><%=obj.getCanBoLop() !=null ?obj.getCanBoLop() :""%></td>
						<td><%=obj.getEmail() !=null ?obj.getEmail() :""%></td>
						<td><%=obj.getDienThoaiDiDong() !=null ? obj.getDienThoaiDiDong():""%></td>
						<td><%=obj.getDienThoaiGiaDinh() !=null ? obj.getDienThoaiGiaDinh():""%></td>
						<td><%=obj.getDiaChiBaoTin() !=null ? obj.getDiaChiBaoTin():"" %></td>						<td style="text-align: center;"><%@ include
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

<%@ include file="../../ePartial/nhapexcelModal.jsp"%>
<!-- <script type="text/javascript"> -->
<!--  document.getElementById("nutNhapLieuExcel").style.display = "none"; -->
<!-- </script> -->
<%session.removeAttribute("msg"); %>