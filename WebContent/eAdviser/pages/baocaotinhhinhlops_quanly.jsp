<%@page import="eAdviser.modelDao.DAO_SoCoVanHocTap"%>
<%@page import="eAdviser.model.SoCoVanHocTap"%>
<%@page import="eCore.modelDao.DAO_NamHoc"%>
<%@page import="eCore.model.NamHoc"%>
<%@page import="eCore.modelDao.DAO_TaiKhoanNhanVien"%>
<%@page import="eCore.model.TaiKhoanNhanVien"%>
<%@page import="eAdviser.modelDao.DAO_BaoCaoTinhHinhLop"%>
<%@page import="eAdviser.model.BaoCaoTinhHinhLop"%>
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
	String tenLop = "BaoCaoTinhHinhLop_quanly";
	String tenTrang = "Quản lý Báo Cáo Tình Hình Lớp";
	String trangDanhSach = "index.jsp?p=eAdviser/pages/baocaotinhhinhlops_quanly.jsp";
	String[] tk_value = {"maBaoCaoTinhHinhLop", "tenBaoCaoTinhHinhLop", "hocKy", "namHoc"};
	String[] tk_show = {"Mã báo cáo tình hình lớp", "Tên báo cáo tình hình lớp", "Học kỳ", "Năm học"};
%>

<%@ include file="../../ePartial/code-header.jsp"%>

<%
	ObjectDAO<BaoCaoTinhHinhLop> dao = new DAO_BaoCaoTinhHinhLop();

	ArrayList<BaoCaoTinhHinhLop> list = new ArrayList<BaoCaoTinhHinhLop>();

	// //lấy mã cố vấn học tập
	// 	String maDangNhap1 = session.getAttribute("maDangNhap").toString();
	// 	ObjectDAO<TaiKhoanNhanVien> dao_TaiKhoanNhanVien = new DAO_TaiKhoanNhanVien();
	// 	ArrayList<TaiKhoanNhanVien> list_TaiKhoanNhanVien = dao_TaiKhoanNhanVien.listByColumns("maDangNhap",
	// 			maDangNhap1);
	// 	String maNhanVien = "";
	// 	if (list_TaiKhoanNhanVien.size() > 0)
	// 		maNhanVien = list_TaiKhoanNhanVien.get(0).getNhanVien().getMaNhanVien();

	// 	String maCoVanHocTap = "";
	// 	ObjectDAO<CoVanHocTap> dao_CoVanHocTap = new DAO_CoVanHocTap();
	// 	ArrayList<CoVanHocTap> list_CoVanHocTap = dao_CoVanHocTap.listByColumns("nhanVien", maNhanVien);
	// 	if (list_CoVanHocTap.size() > 0)
	// 		maCoVanHocTap = list_CoVanHocTap.get(0).getMaCoVanHocTap();
	// 	//kết thúc đoạn lấy mã cố vấn học tập

	// code nut loc
	String maSoCoVanHocTap = request.getParameter("maSoCoVanHocTap");
	maSoCoVanHocTap = (maSoCoVanHocTap == null || maSoCoVanHocTap.equals("null")) ? "all" : maSoCoVanHocTap;

	String maNamHoc = request.getParameter("maNamHoc");
	maNamHoc = (maNamHoc == null || maNamHoc.equals("null")) ? "all" : maNamHoc;

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof BaoCaoTinhHinhLop) {
				list = (ArrayList<BaoCaoTinhHinhLop>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<BaoCaoTinhHinhLop>();
	} else {
		if (!maNamHoc.equals("all") && !maSoCoVanHocTap.equals("all"))
			list = dao.pagination("namHoc = '" + maNamHoc + "' AND soCoVanHocTap = '" + maSoCoVanHocTap + "'",
					(long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
		if (!maNamHoc.equals("all") && maSoCoVanHocTap.equals("all"))
			list = dao.pagination("namHoc = '" + maNamHoc, (long) recordPerPage,
					(long) Long.parseLong(pid) * recordPerPage);
		if (maNamHoc.equals("all") && !maSoCoVanHocTap.equals("all"))
			list = dao.pagination("coVanHocTap = '" + maSoCoVanHocTap + "'", (long) recordPerPage,
					(long) Long.parseLong(pid) * recordPerPage);
		if (maNamHoc.equals("all") && maSoCoVanHocTap.equals("all"))
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
							var maDot = document.getElementById("maNamHoc").value;
							var maSoCoVanHocTap = document.getElementById("maSoCoVanHocTap").value;
							var recordPerPage = document.getElementById("recordPerPage").value;
							var p1 = document.getElementById("p1").value;
							window.location.href = p1 + "&maNamHoc=" + maDot + "&maSoCoVanHocTap=" + maSoCoVanHocTap + "&recordPerPage="+ recordPerPage;

						}
							
						</script>
					</form>

					<form class="form-inline pull-right"
						action="exportBaoCaoTinhHinhLop_quanly.action">
						<input hidden=""
							value="<%=request.getParameter("maSoCoVanHocTap") != null ? request.getParameter("maSoCoVanHocTap") : ""%>"
							name="maSoCoVanHocTap">
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
						<th>Sổ cố vấn học tập</th>
						<th>Cố vấn học tập</th>
						<th>Mã báo cáo tình hình lớp</th>
						<th>Tên báo cáo tình hình lớp</th>
						<th>Học kỳ</th>
						<th>Năm học</th>
						<th>Tình hình chung</th>
						<th>Xử lý</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (BaoCaoTinhHinhLop obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaBaoCaoTinhHinhLop();
							String tenDoiTuong = obj.getMaBaoCaoTinhHinhLop();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getSoCoVanHocTap() != null && obj.getSoCoVanHocTap().getTenSoCoVanHocTap() != null
						? obj.getSoCoVanHocTap().getTenSoCoVanHocTap()
						: ""%></td>
						<td><%=obj.getCoVanHocTap() != null && obj.getCoVanHocTap().getNhanVien().getTenNhanVien() != null
						? obj.getCoVanHocTap().getNhanVien().getTenNhanVien()
						: ""%></td>
						<td><%=obj.getMaBaoCaoTinhHinhLop()%></td>
						<td><%=obj.getTenBaoCaoTinhHinhLop()%></td>
						<td><%=obj.getHocKy()%></td>
						<td><%=obj.getNamHoc()%></td>
						<td><%=obj.getTinhHinhChung()%></td>
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
<%session.removeAttribute("msg"); %>

<script type="text/javascript">
document.getElementById("nutNhapLieuExcel").style.display = "none";
</script>
