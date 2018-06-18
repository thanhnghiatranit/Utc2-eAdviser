<%@page import="eCore.util.Util_Date"%>
<%@page import="eAdviser.modelDao.DAO_ThongTinSinhVienKhoKhan"%>
<%@page import="eAdviser.model.ThongTinSinhVienKhoKhan"%>
<%@page import="eAdviser.model.ThongTinKhenThuongSinhVien"%>
<%@page import="eAdviser.modelDao.DAO_ThongTinKhenThuongSinhVien"%>
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
	String tenLop = "ThongTinSinhVienKhoKhan";
	String tenTrang = "Quản lý thông tin  sinh viên khó khăn";
	String trangDanhSach = "index.jsp?p=eAdviser/pages/thongtinsinhvienkhokhans.jsp";
	String[] tk_value = { "soCoVanHocTap", "sinhVien", "maThongTinSinhVienKhoKhan", "hoanCanhGiaDinh", "lyDo",
			"deXuat", "thoiGianGhiNhan" };
	String[] tk_show = { "Sổ cố vấn học tập", "Sinh viên", "Mã thông tin sinh viên khó khăn",
			"Hoàn cảnh gia đình", "Lý do", "Đề xuất", "Thời gian ghi nhận" };
%>

<%@ include file="../../ePartial/code-header.jsp"%>

<%
	ObjectDAO<ThongTinSinhVienKhoKhan> dao = new DAO_ThongTinSinhVienKhoKhan();
	ArrayList<ThongTinSinhVienKhoKhan> list = new ArrayList<ThongTinSinhVienKhoKhan>();
	
	//lưu session theo mã sổ
	String maSo = session.getAttribute("maSo").toString();
	
	//nut loc
		String maSinhVien = request.getParameter("maSinhVien");
		maSinhVien = (maSinhVien == null || maSinhVien.equals("null")) ? "all" : maSinhVien;
		
		
	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof ThongTinSinhVienKhoKhan) {
				list = (ArrayList<ThongTinSinhVienKhoKhan>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<ThongTinSinhVienKhoKhan>();
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
							ObjectDAO<ThongTinSinhVienKhoKhan> dao_thongtinkhokhan = new DAO_ThongTinSinhVienKhoKhan();
							ArrayList<ThongTinSinhVienKhoKhan> list_thongtinkhokhan = dao_thongtinkhokhan.listByColumns("soCoVanHocTap", maSo);
						%>
						<option value="all" <%if (maSinhVien.equals("all")) {%>
							selected="selected" <%}%>>Tất cả</option>

						<%
							for (ThongTinSinhVienKhoKhan thongtinkhokhan : list_thongtinkhokhan) {
						%>
						<option value="<%=thongtinkhokhan.getSinhVien().getMaSinhVien()%>"
							<%if (maSinhVien.equals(thongtinkhokhan.getSinhVien().getMaSinhVien())) {%>
							selected="selected" <%}%>><%=thongtinkhokhan.getSinhVien().getHoDem() + "" + thongtinkhokhan.getSinhVien().getTen()%></option>
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
					action="exportThongTinSinhVienKhoKhan.action">
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
						<th>Mã thông tin sinh viên khó khăn</th>
						<th>Mã sinh viên</th>
						<th>Lý do</th>
						<th>Đề xuất</th>
						<th>Thời gian ghi nhận</th>
						<th>Xử lý</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (ThongTinSinhVienKhoKhan obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaThongTinSinhVienKhoKhan();
							String tenDoiTuong = "";
							if (obj.getSoCoVanHocTap() != null && obj.getSoCoVanHocTap().getTenSoCoVanHocTap() != null) {
								tenDoiTuong = obj.getSoCoVanHocTap().getTenSoCoVanHocTap();
							}
					%>
					<tr class="odd gradeX">
						<td><%=obj.getSoCoVanHocTap() != null && obj.getSoCoVanHocTap().getTenSoCoVanHocTap() != null
						? obj.getSoCoVanHocTap().getTenSoCoVanHocTap()
						: ""%></td>
						<td><%=obj.getMaThongTinSinhVienKhoKhan()%></td>
						<td><%=obj.getSinhVien().getMaSinhVien()%></td>
						<td><%=obj.getLyDo()%></td>
						<td><%=obj.getDeXuat()%></td>
						<td><%=Util_Date.dateToString2(obj.thoiGianGhiNhan)%></td>
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