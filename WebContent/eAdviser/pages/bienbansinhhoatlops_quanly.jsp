<%@page import="eAdviser.modelDao.DAO_SoCoVanHocTap"%>
<%@page import="eAdviser.model.SoCoVanHocTap"%>
<%@page import="eAdviser.modelDao.DAO_PhanCongCoVanHocTap"%>
<%@page import="eAdviser.model.PhanCongCoVanHocTap"%>
<%@page import="eCore.modelDao.DAO_TaiKhoanNhanVien"%>
<%@page import="eCore.model.TaiKhoanNhanVien"%>
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
	String tenLop = "BienBanSinhHoatLop_quanly";
	String tenTrang = "Quản lý Biên Bản Sinh Hoạt Lớp";
	String trangDanhSach = "index.jsp?p=eAdviser/pages/bienbansinhhoatlops_quanly.jsp";
	String[] tk_value = {"maBienBanSinhHoatLop", "tenBienBanSinhHoatLop", "chuTriCuocHop"};
	String[] tk_show = {"Mã biên bản sinh hoạt lớp", "Tên biên bản sinh hoạt lớp", "Chủ trì cuộc họp"};
%>

<%@ include file="../../ePartial/code-header.jsp"%>

<%
	ObjectDAO<BienBanSinhHoatLop> dao = new DAO_BienBanSinhHoatLop();

	ArrayList<BienBanSinhHoatLop> list = new ArrayList<BienBanSinhHoatLop>();

	// code nut loc
	String maSoCoVanHocTap = request.getParameter("maSoCoVanHocTap");
	maSoCoVanHocTap = (maSoCoVanHocTap == null || maSoCoVanHocTap.equals("null")) ? "all" : maSoCoVanHocTap;

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof BienBanSinhHoatLop) {
				list = (ArrayList<BienBanSinhHoatLop>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<BienBanSinhHoatLop>();
	} else {
		//list = dao.listByColumns("soCoVanHocTap", maSo);
		if (!maSoCoVanHocTap.equals("all"))
			list = dao.pagination("soCoVanHocTap = '" + maSoCoVanHocTap + "'", (long) recordPerPage,
					(long) Long.parseLong(pid) * recordPerPage);
		else
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

				<form class="form-inline pull-right"
					action="exportBienBanSinhHoatLop_quanly.action">
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
						<th>Mã biên bản sinh hoạt lớp</th>
						<th>Tên biên bản sinh hoạt lớp</th>
						<th>Chủ trì cuộc họp</th>
						<th>Thư ký cuộc họp</th>
						<th>Địa điểm</th>
						<th>Xử lý</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (BienBanSinhHoatLop obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaBienBanSinhHoatLop();
							String tenDoiTuong = obj.getMaBienBanSinhHoatLop();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getSoCoVanHocTap() != null && obj.getSoCoVanHocTap().getTenSoCoVanHocTap() != null
						? obj.getSoCoVanHocTap().getTenSoCoVanHocTap()
						: ""%></td>
						<td><%=obj.getMaBienBanSinhHoatLop()%></td>
						<td><%=obj.getTenBienBanSinhHoatLop()%></td>
						<td><%=obj.getChuTriCuocHop()%></td>
						<td><%=obj.getThuKyCuocHop()%></td>
						<td><%=obj.getDiaDiem()%></td>
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