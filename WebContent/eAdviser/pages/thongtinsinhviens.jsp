<%@page import="eCore.modelDao.DAO_SinhVien"%>
<%@page import="eCore.model.SinhVien"%>
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
	String tenLop = "ThongTinSinhVien";
	String tenTrang = "Quản lý thông tin sinh viên";
	String trangDanhSach = "index.jsp?p=eAdviser/pages/thongtinsinhviens.jsp";
	String[] tk_value = { "maThongTinSinhVien", "doiTuongChinhSach", "canBoLop",
			"email", "dienThoaiDiDong", "dienThoaiGiaDinh", "diaChiBaoTin"};
	String[] tk_show = { "Mã thông tin sinh viên", "Đối tượng chính sách",
			"Cán bộ lớp", "Email", "Điện thoại di động", "Điện thoại gia đình", "Địa chỉ báo tin"};
%>

<%@ include file="../../ePartial/code-header.jsp"%>

<%
	ObjectDAO<ThongTinSinhVien> dao = new DAO_ThongTinSinhVien();
	ArrayList<ThongTinSinhVien> list = new ArrayList<ThongTinSinhVien>();

	String maSo = session.getAttribute("maSo").toString();

	//nut loc
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
		list = dao.listByColumns("soCoVanHocTap", maSo);
		if (!maSinhVien.equals("all"))
			list = dao.pagination("sinhVien = '" + maSinhVien + "' AND soCoVanHocTap='" + maSo + "'",
					(long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
		if (maSinhVien.equals("all"))
			list = dao.pagination("soCoVanHocTap='" + maSo + "'", (long) recordPerPage,
					(long) Long.parseLong(pid) * recordPerPage);
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
		<%@ include file="../../ePartial/panel-heading.jsp"%>
		<!-- /.panel-heading -->
		<div class="panel-body">

			<div id="" style="margin-bottom: 40px">
				<form class="form-inline pull-left">
					<label>Chọn sinh viên</label> <select name="maSinhVien"
						class="form-control" id="maSinhVien" onchange="myFunction()">
						<%
							ObjectDAO<ThongTinSinhVien> dao_thongtin = new DAO_ThongTinSinhVien();
							ArrayList<ThongTinSinhVien> list_thongtin = dao_thongtin.listByColumns("soCoVanHocTap", maSo);
						%>
						<option value="all" <%if (maSinhVien.equals("all")) {%>
							selected="selected" <%}%>>Tất cả</option>

						<%
							for (ThongTinSinhVien thongtin : list_thongtin) {
						%>
						<option value="<%=thongtin.getSinhVien().getMaSinhVien()%>"
							<%if (maSinhVien.equals(thongtin.getSinhVien().getMaSinhVien())) {%>
							selected="selected" <%}%>><%=thongtin.getSinhVien().getHoDem() + "" + thongtin.getSinhVien().getTen()%></option>
						<%
							}
						%>
					</select>
				</form>

				<script type="text/javascript">
					function myFunction() {
						var maSinhVien = document
								.getElementById("maSinhVien").value;
						var recordPerPage = document
								.getElementById("recordPerPage").value;
						var p1 = document.getElementById("p1").value;
						window.location.href = p1 + "&maSinhVien="
								+ maSinhVien + "&recordPerPage="
								+ recordPerPage;

					}
				</script>

				<form class="form-inline pull-right"
					action="exportThongTinSinhVien.action">
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
							if (obj.getSoCoVanHocTap() != null && obj.getSoCoVanHocTap().getTenSoCoVanHocTap() != null) {
								tenDoiTuong = obj.getSoCoVanHocTap().getTenSoCoVanHocTap();
							}
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
						<td><%=obj.getDiaChiBaoTin() !=null ? obj.getDiaChiBaoTin():"" %></td>
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