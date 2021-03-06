<%@page import="eAdviser.modelDao.DAO_SoCoVanHocTap"%>
<%@page import="eAdviser.model.SoCoVanHocTap"%>
<%@page import="eCore.modelDao.DAO_SinhVien"%>
<%@page import="eCore.model.SinhVien"%>
<%@page import="eAdviser.modelDao.DAO_PhanCongCoVanHocTap"%>
<%@page import="eAdviser.model.PhanCongCoVanHocTap"%>
<%@page import="eCore.modelDao.DAO_TaiKhoanNhanVien"%>
<%@page import="eCore.model.TaiKhoanNhanVien"%>
<%@page import="eCore.util.Util_Date"%>
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
	String tenLop = "ThongTinKhenThuongSinhVien";
	String tenTrang = "Quản lý Thông tin khen thưởng sinh viên";
	String trangDanhSach = "index.jsp?p=eAdviser/pages/thongtinkhenthuongsinhviens.jsp";
	String[] tk_value = { "soCoVanHocTap","sinhVien", "maThongTinKhenThuongSinhVien", "noiDungKhenThuong", "thoiGianKhenThuong"	};
	String[] tk_show = { "Sổ cố vấn học tập","Sinh viên", "Mã thông tin khen thưởng sinh viên", "Nội dung khen thưởng",
			"Thời gian khen thưởng"};
%>

<%@ include file="../../ePartial/code-header.jsp"%>





<%
	ObjectDAO<ThongTinKhenThuongSinhVien> dao = new DAO_ThongTinKhenThuongSinhVien();
	ArrayList<ThongTinKhenThuongSinhVien> list = new ArrayList<ThongTinKhenThuongSinhVien>();
	
	//code loc
		String maSoCoVanHocTap = request.getParameter("maSoCoVanHocTap");
		maSoCoVanHocTap = (maSoCoVanHocTap == null || maSoCoVanHocTap.equals("null")) ? "all" : maSoCoVanHocTap;
		
		String maSinhVien = request.getParameter("maSinhVien");
		maSinhVien = (maSinhVien == null || maSinhVien.equals("null")) ? "all" : maSinhVien;

// 	ObjectDAO<TaiKhoanNhanVien> dao_TaiKhoanNhanVien = new DAO_TaiKhoanNhanVien();
// 	ArrayList<TaiKhoanNhanVien> list_TaiKhoanNhanVien = dao_TaiKhoanNhanVien.listByColumns("maDangNhap",
// 			maDangNhap1);
// 	String maNhanVien = "";
// 	if (list_TaiKhoanNhanVien.size() > 0)
// 		maNhanVien = list_TaiKhoanNhanVien.get(0).getNhanVien().getMaNhanVien();

// 	String maCoVanHocTap = "";
// 	ObjectDAO<CoVanHocTap> dao_CoVanHocTap = new DAO_CoVanHocTap();
// 	ArrayList<CoVanHocTap> list_CoVanHocTap = dao_CoVanHocTap.listByColumns("nhanVien", maNhanVien);
// 	ObjectDAO<PhanCongCoVanHocTap> dao_PhanCongCoVanHocTap = new DAO_PhanCongCoVanHocTap();
// 	ArrayList<PhanCongCoVanHocTap> list_PhanCongCoVanHocTap = new ArrayList();
// 	if (list_CoVanHocTap.size() > 0) {
// 		maCoVanHocTap = list_CoVanHocTap.get(0).getMaCoVanHocTap();
// 		list_PhanCongCoVanHocTap = dao_PhanCongCoVanHocTap.listByColumns("coVanHocTap", maCoVanHocTap);
// 	}

	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof ThongTinKhenThuongSinhVien) {
				list = (ArrayList<ThongTinKhenThuongSinhVien>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<ThongTinKhenThuongSinhVien>();
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
		<%@ include file="../../ePartial/panel-heading.jsp"%>
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
					action="exportThongTinKhenThuongSinhVien.action">
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
						<th>Mã khen thưởng</th>
						<th>Nội dung khen thưởng</th>
						<th>Thời gian khen thưởng</th>
						<th>Xử lý</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (ThongTinKhenThuongSinhVien obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaThongTinKhenThuongSinhVien();
							String tenDoiTuong = obj.getMaThongTinKhenThuongSinhVien();
							if (obj.getSoCoVanHocTap() != null && obj.getSoCoVanHocTap().getTenSoCoVanHocTap() != null) {
								tenDoiTuong = obj.getSoCoVanHocTap().getTenSoCoVanHocTap();
							}
					%>
					<tr class="odd gradeX">
						<td><%=obj.getSoCoVanHocTap() != null && obj.getSoCoVanHocTap().getTenSoCoVanHocTap() != null ? obj.getSoCoVanHocTap().getTenSoCoVanHocTap() : ""%></td>
						<td><%=(obj.getSinhVien().getHoDem()+" "+ obj.getSinhVien().getTen())!=null ? obj.getSinhVien().getHoDem()+" "+ obj.getSinhVien().getTen():""%></td>
						<td><%=obj.getMaThongTinKhenThuongSinhVien()%></td>
						<td><%=obj.getNoiDungKhenThuong()%></td>
						<td><%=Util_Date.dateToString2(obj.getThoiGianKhenThuong())%></td>
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