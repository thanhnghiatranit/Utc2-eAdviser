<%@page import="eCore.util.Util_Date"%>
<%@page import="eAdviser.modelDao.DAO_ThongTinKyLuatSinhVien"%>
<%@page import="eAdviser.model.ThongTinKyLuatSinhVien"%>
<%@page import="eAdviser.model.ThongTinKhenThuongSinhVien"%>
<%@page import="eAdviser.modelDao.DAO_ThongTinKhenThuongSinhVien"%>
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
	String tenLop = "ThongTinKyLuatSinhVien_quanly";
	String tenTrang = "Quản lý Thông Tin Kỷ Luật Sinh Viên";
	String trangDanhSach = "index.jsp?p=eAdviser/pages/thongtinkyluatsinhviens_quanly.jsp";
	String[] tk_value = { "maThongTinKyLuatSinhVien","thoiGianKyLuat" };
	String[] tk_show = { "Mã thông tin kỷ luật sinh viên", "Thời gian kỷ luật" };
%>

<%@ include file="../../ePartial/code-header.jsp"%>

<%
	ObjectDAO<ThongTinKyLuatSinhVien> dao = new DAO_ThongTinKyLuatSinhVien();

	ArrayList<ThongTinKyLuatSinhVien> list = new ArrayList<ThongTinKyLuatSinhVien>();

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof ThongTinKyLuatSinhVien) {
				list = (ArrayList<ThongTinKyLuatSinhVien>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<ThongTinKyLuatSinhVien>();
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
						<th>Sổ cố vấn học tập</th>
						<th>Sinh Viên</th>
						<th>Mã kỷ luật</th>
						<th>Nội dung kỷ luật</th>
						<th>Thời gian kỷ luật</th>
						<th>Xử lý</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (ThongTinKyLuatSinhVien obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaThongTinKyLuatSinhVien();
							String tenDoiTuong = obj.getMaThongTinKyLuatSinhVien();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getSoCoVanHocTap() != null && obj.getSoCoVanHocTap().getTenSoCoVanHocTap() != null
						? obj.getSoCoVanHocTap().getTenSoCoVanHocTap()
						: ""%></td>
						<td><%=obj.getSinhVien().getHoDem() + " " + obj.getSinhVien().getTen()%></td>
						<td><%=obj.getMaThongTinKyLuatSinhVien()%></td>
						<td><%=obj.getNoiDungKyLuat()%></td>
						<td><%=Util_Date.dateToString2(obj.getThoiGianKyLuat())%></td>
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