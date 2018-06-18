<%@page import="eCore.modelDao.DAO_DonVi"%>
<%@page import="eCore.model.DonVi"%>
<%@page import="eAdviser.modelDao.DAO_SoCoVanHocTap"%>
<%@page import="eAdviser.model.SoCoVanHocTap"%>
<%@page import="eCore.model.SinhVien"%>
<%@page import="eAdviser.modelDao.DAO_ThongBaoKetQuaHocTapVaRenLuyen"%>
<%@page import="eAdviser.model.ThongBaoKetQuaHocTapVaRenLuyen"%>
<%@page import="eCore.util.Util_Date"%>
<%@page import="eAdviser.modelDao.DAO_PhanCongCoVanHocTap"%>
<%@page import="eAdviser.model.PhanCongCoVanHocTap"%>
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
	String tenLop = "ThongBaoKetQuaHocTapVaRenLuyen_quanly";
	String tenTrang = "Quản lý Thông Báo Kết Quả Học Tập Và Rèn Luyện";
	String trangDanhSach = "index.jsp?p=eAdviser/pages/thongbaoketquahoctapvarenluyens_quanly.jsp";
	String[] tk_value = {"maThongBaoKetQuaHocTapVaRenLuyen", "hocKy", "namHoc", "ketQuaHocTap", "xepLoaiHocTap",
			"ketQuaRenLuyen", "xepLoaiRenLuyen"};
	String[] tk_show = {"Mã thông báo kết quả học tập và rèn luyện", "Học kỳ", "Năm học", "Kết quả học tập",
			"Xếp loại học tập", "Kết quả rèn luyện", "Xếp loại rèn luyện"};
%>

<%@ include file="../../ePartial/code-header.jsp"%>

<%
	ObjectDAO<ThongBaoKetQuaHocTapVaRenLuyen> dao = new DAO_ThongBaoKetQuaHocTapVaRenLuyen();
	ArrayList<ThongBaoKetQuaHocTapVaRenLuyen> list = new ArrayList<ThongBaoKetQuaHocTapVaRenLuyen>();

	//nut loc
	String maLop = request.getParameter("maLop");
	maLop = (maLop == null || maLop.equals("null")) ? "all" : maLop;

	ObjectDAO<SoCoVanHocTap> dao_soCoVanHocTap = new DAO_SoCoVanHocTap();
	ArrayList<SoCoVanHocTap> list_soCoVanHocTap = new ArrayList<>();


	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof ThongBaoKetQuaHocTapVaRenLuyen) {
				list = (ArrayList<ThongBaoKetQuaHocTapVaRenLuyen>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.pagination((long) recordPerPage, (long) Long.parseLong(pid) * recordPerPage);
			}
		} else
			list = new ArrayList<ThongBaoKetQuaHocTapVaRenLuyen>();
	} else {
		if (!maLop.equals("all")) {
			list_soCoVanHocTap = dao_soCoVanHocTap.listByColumns("lop", maLop);
			for (int i = 0; i < list_soCoVanHocTap.size(); i++) {
				ThongBaoKetQuaHocTapVaRenLuyen tb = new ThongBaoKetQuaHocTapVaRenLuyen();
				if(list_soCoVanHocTap.contains(tb)){
					list.add(tb);
				}
			}
		} else
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
					<label>Chọn lớp</label> <select name="maLop"
						class="form-control" id="maLop" onchange="myFunction()">
						<%
							ObjectDAO<SoCoVanHocTap> dao_thongbao = new DAO_SoCoVanHocTap();
							ArrayList<SoCoVanHocTap> list_thongbao = dao_thongbao.listAll();
							
						%>
						<option value="all" <%if (maLop.equals("all")) {%>
							selected="selected" <%}%>>Tất cả</option>

						<%
							for (SoCoVanHocTap thongbao : list_thongbao) {
						%>
						<option value="<%=thongbao.getLop().getMaLop()%>"
							<%if (maLop.equals(thongbao.getLop().getMaLop())) {%>
							selected="selected" <%}%>><%=thongbao.getLop().getMaLop()%></option>
						<%
							}
						%>
					</select>
					<script type="text/javascript">
						function myFunction() {
							var maLop = document.getElementById("maLop").value;
							var recordPerPage = document
									.getElementById("recordPerPage").value;
							var p1 = document.getElementById("p1").value;
							window.location.href = p1 + "&maLop=" + maLop
									+ "&recordPerPage=" + recordPerPage;

						}
					</script>
				</form>

				<form class="form-inline pull-right"
					action="exportThongBaoKetQuaHocTapVaRenLuyen_quanly.action">
					<input hidden=""
						value="<%=request.getParameter("maSinhVien") != null ? request.getParameter("maSinhVien") : ""%>"
						name="maSinhVien">
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
						<th>Cố vấn học tập</th>
						<th>Sinh viên</th>
						<th>Mã thông báo</th>
						<th>Học kỳ</th>
						<th>Năm học</th>
						<th>Thông báo cụ thể</th>
						<th>Xử lý</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (ThongBaoKetQuaHocTapVaRenLuyen obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaThongBaoKetQuaHocTapVaRenLuyen();
							String tenDoiTuong = obj.getMaThongBaoKetQuaHocTapVaRenLuyen();
					%>
					<tr class="odd gradeX">
						<td><%=obj.getSoCoVanHocTap() != null && obj.getSoCoVanHocTap().getTenSoCoVanHocTap() != null
						? obj.getSoCoVanHocTap().getTenSoCoVanHocTap()
						: ""%></td>
						<td><%=obj.getCoVanHocTap() != null && obj.getCoVanHocTap().getNhanVien().getTenNhanVien() != null
						? obj.getCoVanHocTap().getNhanVien().getTenNhanVien()
						: ""%></td>
						<td><%=obj.getSinhVien() != null
						&& obj.getSinhVien().getHoDem() + " " + obj.getSinhVien().getTen() != null
								? obj.getSinhVien().getHoDem() + " " + obj.getSinhVien().getTen()
								: ""%></td>
						<td><%=obj.getMaThongBaoKetQuaHocTapVaRenLuyen()%></td>
						<td><%=obj.getHocKy()%></td>
						<td><%=obj.getNamHoc()%></td>
						<td><%=obj.getThongBaoCuThe()%></td>
						<td style="text-align: center;"><%@ include
								file="../../ePartial/menupullcuadoituong2.jsp"%></td>
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
<%
	session.removeAttribute("msg");
%>