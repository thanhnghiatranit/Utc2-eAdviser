<%@page import="eCore.model.SinhVien"%>
<%@page import="eCore.modelDao.DAO_SinhVien"%>
<%@page import="eCore.util.Util_Date"%>
<%@page import="eCore.modelDao.DAO_HocKy"%>
<%@page import="eCore.model.HocKy"%>
<%@page import="eCore.modelDao.DAO_HocKy"%>
<%@page import="eCore.model.HocKy"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="eCore.modelDao.DAO_Lop"%>
<%@page import="eCore.model.Lop"%>
<%@page import="eCore.dao.ObjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "SinhVien";
	String tenTrang = "Quản lý Sinh Viên";
	String trangDanhSach = "index.jsp?p=eCore/pages/sinhviens.jsp";
	String[] tk_value = { "maSinhVien", "tenHocKy", "ngayBatDau", "ngayKetThuc", "namHoc" };
	String[] tk_show = { "Mã sinh viên", "Họ và tên", "Giới tính", "Ngày sinh", "Email", "Chuyên ngành" };
%>

<%@ include file="../../ePartial/code-header.jsp"%>

<%
	ObjectDAO<SinhVien> dao = new DAO_SinhVien();

	ArrayList<SinhVien> list = new ArrayList<SinhVien>();

	list = session.getAttribute("checkTimKiem") != null ? (ArrayList<SinhVien>) session.getAttribute("arr")
			: dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
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
			<table width="100%"
				class="table table-striped table-bordered table-hover"
				id="dataTables-example">
				<thead>
					<tr>
						<th>Mã sinh viên</th>
						<th>Họ và tên</th>
						<th>Giới tính</th>
						<th>Ngày sinh</th>
						<th>Email</th>
						<th>Chuyên ngành</th>
						<th>Xử lý</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (SinhVien obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaSinhVien();
							String tenDoiTuong = obj.getHoDem() + " " + obj.getTen();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaSinhVien()%></td>
						<td><%=(obj.getHoDem() + " " + obj.getTen()) != null ? (obj.getHoDem() + " " + obj.getTen()) : "" %></td>
						<td><%=obj.getGioiTinh() != null ? obj.getGioiTinh() : ""%></td>
						<td><%=obj.getNgaySinh() != null ? obj.getNgaySinh() : ""%></td>
						<td><%=obj.getEmail() != null ? obj.getEmail() : ""%></td>
						<td><%=obj.getTenNganhTrungTuyen() != null ? obj.getTenNganhTrungTuyen() :"" %>
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

<%
	session.removeAttribute("msg");
%>