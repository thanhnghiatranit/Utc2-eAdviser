<%@page import="eAdviser.modelDao.DAO_SoCoVanHocTap"%>
<%@page import="eAdviser.model.SoCoVanHocTap"%>
<%@page import="eCore.modelDao.DAO_SinhVien"%>
<%@page import="eCore.model.SinhVien"%>
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
	String tenLop = "ThongTinSinhVienKhoKhan_quanly";
	String tenTrang = "Quản lý Thông Tin Sinh Viên Khó Khăn";
	String trangDanhSach = "index.jsp?p=eAdviser/pages/thongtinsinhvienkhokhans_quanly.jsp";
	String[] tk_value = {"maThongTinSinhVienKhoKhan", "hoanCanhGiaDinh"};
	String[] tk_show = { "Mã thông tin sinh viên khó khăn","Hoàn cảnh gia đình"};
%>

<%@ include file="../../ePartial/code-header.jsp"%>

<%
	ObjectDAO<ThongTinSinhVienKhoKhan> dao = new DAO_ThongTinSinhVienKhoKhan();

	ArrayList<ThongTinSinhVienKhoKhan> list = new ArrayList<ThongTinSinhVienKhoKhan>();
// 	String maSo = session.getAttribute("maSo").toString();

//code loc
	String maSoCoVanHocTap = request.getParameter("maSoCoVanHocTap");
	maSoCoVanHocTap = (maSoCoVanHocTap == null || maSoCoVanHocTap.equals("null")) ? "all" : maSoCoVanHocTap;
	
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
// 		list = dao.listByColumns("soCoVanHocTap", maSo);
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
					action="exportThongTinSinhVienKhoKhan_quanly.action">
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
							String tenDoiTuong = obj.getMaThongTinSinhVienKhoKhan();
						
					%>
					<tr class="odd gradeX">
						<td><%=obj.getSoCoVanHocTap() != null && obj.getSoCoVanHocTap().getTenSoCoVanHocTap() != null
						? obj.getSoCoVanHocTap().getTenSoCoVanHocTap()
						: ""%></td>
						<td><%=obj.getMaThongTinSinhVienKhoKhan()%></td>
						<td><%=obj.getSinhVien().getMaSinhVien()%></td>
						<td><%=obj.getLyDo()!=null?obj.getLyDo():""%></td>
						<td><%=obj.getDeXuat()!=null?obj.getDeXuat():""%></td>
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