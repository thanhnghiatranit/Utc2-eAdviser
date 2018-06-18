<%@page import="eCore.modelDao.DAO_NhanVien"%>
<%@page import="eCore.model.NhanVien"%>
<%@page import="eCore.modelDao.DAO_DonVi"%>
<%@page import="eCore.model.DonVi"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="eCore.modelDao.DAO_Lop"%>
<%@page import="eCore.model.Lop"%>
<%@page import="eCore.dao.ObjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String tenLop = "NhanVien";
	String tenTrang = "Quản lý Nhân Viên";
	String[] tk_value = { "maNhanVien", "tenNhanVien", "gioiTinh", "queQuan", "danToc", "tonGiao", "chucVu",
			"soTruongCongTac", "soCMND", "soHoChieu", "email", "donVi" };
	String[] tk_show = { "Mã Nhân viên", "Tên Nhân viên", "Giới tính", "Quê quán", "Dân tộc", "Tôn giáo",
			"Chức vụ", "Sở trường công tác", "Số CMND", "Số hộ chiếu", "Email", "Đơn vị" };
%>

<%@ include file="../../ePartial/code-header.jsp"%>

<%
	ObjectDAO<NhanVien> dao = new DAO_NhanVien();

	ArrayList<NhanVien> list = new ArrayList<NhanVien>();

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof NhanVien) {
				list = (ArrayList<NhanVien>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<NhanVien>();
	} else {
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
			<table width="100%"
				class="table table-striped table-bordered table-hover"
				id="dataTables-example">
				<thead>
					<tr>
						<th>Đơn vị</th>
						<th>Mã nhân viên</th>
						<th>Tên nhân viên</th>
						<th>Email</th>
						<th>Số CMND</th>
						<th>Số điện thoại</th>
						<th>Xử lý</th>

					</tr>
				</thead>
				<tbody>
					<%
						for (NhanVien obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaNhanVien();
							String tenDoiTuong = obj.getTenNhanVien();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getDonVi() == null ? "" : obj.getDonVi().getTenDonVi()%></td>
						<td><%=obj.getMaNhanVien() != null ? obj.getMaNhanVien() : "" %></td>
						<td><%=obj.getTenNhanVien()%></td>
						<td><%=obj.getEmail() != null ? obj.getEmail() : ""%></td>
						<td><%=obj.getSoCMND() != null ? obj.getSoCMND() : ""%></td>
						<td><%=obj.getSoDienThoaiDiDong() != null ? obj.getSoDienThoaiDiDong() : ""%></td>
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