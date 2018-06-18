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
	String tenLop = "CoVanHocTap";
	String tenTrang = "Quản lý Thông tin Cố vấn học tập";
	String trangDanhSach = "index.jsp?p=eAdviser/pages/covanhoctaps.jsp";
	String[] tk_value = {"maCoVanHocTap", "dienThoaiCoQuan", "diaChiGuiThu", "diDong"};
	String[] tk_show = {"Mã Cố vấn học tập", "Điện thoại cơ quan", "Địa chỉ gửi thư", "Di động"};
%>

<%@ include file="../../ePartial/code-header.jsp"%>

<%
	ObjectDAO<CoVanHocTap> dao = new DAO_CoVanHocTap();

	ArrayList<CoVanHocTap> list = new ArrayList<CoVanHocTap>();
	
			
	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof CoVanHocTap) {
				list = (ArrayList<CoVanHocTap>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<CoVanHocTap>();
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
			<div id="danhchonguoiquanly">
				
				<form class="form-inline pull-right"
					action="exportCoVanHocTap.action">
					<input hidden=""
						value="<%=request.getParameter("maCoVanHocTap") != null ? request.getParameter("maCoVanHocTap") : ""%>"
						name="maCoVanHocTap">
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
						<th>Mã Cố vấn học tập</th>
						<th>Nhân viên</th>
						<th>Điện thoại cơ quan</th>
						<th>Địa chỉ gửi thư</th>
						<th>Di động</th>
						<th>Xử lý</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (CoVanHocTap obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaCoVanHocTap();
							String tenDoiTuong = obj.getMaCoVanHocTap();
							if (obj.getNhanVien() != null && obj.getNhanVien().getTenNhanVien() != null) {
								tenDoiTuong = obj.getNhanVien().getTenNhanVien();
							}
					%>
					<tr class="odd gradeX">
						<td><%=obj.getMaCoVanHocTap()%></td>
						<td><%=obj.getNhanVien() != null && obj.getNhanVien().getTenNhanVien() != null
						? obj.getNhanVien().getTenNhanVien()
						: ""%></td>
						<td><%=obj.getDienThoaiCoQuan() != null ? obj.getDienThoaiCoQuan() : ""%></td>
						<td><%=obj.getDiaChiGuiThu() != null ? obj.getDiaChiGuiThu() : ""%></td>
						<td><%=obj.getDiDong() != null ? obj.getDiDong() : ""%></td>
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

<!-- Modal nhập excel-->
<%@ include file="../../ePartial/nhapexcelModal.jsp"%>

<%session.removeAttribute("msg"); %>
