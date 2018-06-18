<%@page import="eCore.modelDao.DAO_TaiKhoanNhanVien"%>
<%@page import="eCore.model.TaiKhoanNhanVien"%>
<%@page import="eCore.modelDao.DAO_NhanVien"%>
<%@page import="eCore.model.NhanVien"%>
<%@page import="eAdviser.modelDao.DAO_PhanCongCoVanHocTap"%>
<%@page import="eAdviser.model.PhanCongCoVanHocTap"%>
<%@page import="eCore.util.Util_Date"%>
<%@page import="eAdviser.modelDao.DAO_SoCoVanHocTap"%>
<%@page import="eAdviser.model.SoCoVanHocTap"%>
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
	String tenLop = "PhanCongCoVanHocTap";
	String tenTrang = "Chọn sổ cố vấn học tập";
	String trangDanhSach = "index.jsp?p=eAdviser/pages/chonsocovanhoctaps.jsp";
	String[] tk_value = {"coVanHocTap", "soCoVanHocTap", "namHoc", "maPhanCong", "thoiGianBatDau",
			"thoiGianKetThuc"};
	String[] tk_show = {"Cố vấn học tập", "Sổ cố vấn học tập", "Năm học", "Mã phân công", "Thời gian bắt đầu",
			"Thời gian kết thúc"};
%>

<%@ include file="../../ePartial/code-header.jsp"%>

<%
	ObjectDAO<PhanCongCoVanHocTap> dao = new DAO_PhanCongCoVanHocTap();

	ArrayList<PhanCongCoVanHocTap> list = new ArrayList<PhanCongCoVanHocTap>();

	String maDangNhap1 = session.getAttribute("maDangNhap").toString();

	ObjectDAO<TaiKhoanNhanVien> dao_TaiKhoanNhanVien = new DAO_TaiKhoanNhanVien();
	ArrayList<TaiKhoanNhanVien> list_TaiKhoanNhanVien = dao_TaiKhoanNhanVien.listByColumns("maDangNhap",
			maDangNhap1);
	String maNhanVien = "";
	if (list_TaiKhoanNhanVien.size() > 0)
		maNhanVien = list_TaiKhoanNhanVien.get(0).getNhanVien().getMaNhanVien();

	String maCoVanHocTap = "";
	ObjectDAO<CoVanHocTap> dao_CoVanHocTap = new DAO_CoVanHocTap();
	ArrayList<CoVanHocTap> list_CoVanHocTap = dao_CoVanHocTap.listByColumns("nhanVien", maNhanVien);
	
	
	
	if (list_CoVanHocTap.size() > 0)
		maCoVanHocTap = list_CoVanHocTap.get(0).getMaCoVanHocTap();

	// 	

	// 	ObjectDAO<PhanCongCoVanHocTap> dao_PhanCongCoVanHocTap = new DAO_PhanCongCoVanHocTap();
	// 	ArrayList<PhanCongCoVanHocTap> list_PhanCongCoVanHocTap = dao_PhanCongCoVanHocTap.listByColumns(tenColumn, value);
	if (session.getAttribute("checkTimKiem") != null) {
		ArrayList listTemp = (ArrayList) session.getAttribute("arr");
		if (listTemp.size() > 0) {
			if (listTemp.get(0) instanceof PhanCongCoVanHocTap) {
				list = (ArrayList<PhanCongCoVanHocTap>) listTemp;
			} else {
				session.setAttribute("checkTimKiem", null);
				list = dao.listByColumns("coVanHocTap", list_CoVanHocTap.get(0).getMaCoVanHocTap());
			}
		} else
			list = new ArrayList<PhanCongCoVanHocTap>();
	} else {
		// nếu là CVHT
		if (list_CoVanHocTap.size() > 0)
			list = dao.listByColumns("coVanHocTap", list_CoVanHocTap.get(0).getMaCoVanHocTap());
		else
			list = dao.listAll();
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
						<th>Cố vấn học tập</th>
						<th>Sổ cố vấn học tập</th>
						<th>Năm học</th>
						<th>Xử lý</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (PhanCongCoVanHocTap obj : list) {
							//Bat buoc co de bo vao doan code xem chi tiet, chinh sua va xoa
							String maDoiTuong = obj.getMaPhanCong();
							String tenDoiTuong = obj.getMaPhanCong();
							if (obj.getCoVanHocTap() != null && obj.getCoVanHocTap().getNhanVien().getTenNhanVien() != null) {
								tenDoiTuong = obj.getCoVanHocTap().getNhanVien().getTenNhanVien();
							}
					%>
					<tr class="odd gradeX">
						<td><%=obj.getCoVanHocTap().getNhanVien().getTenNhanVien()%></td>
						<td><%=obj.getSoCoVanHocTap() != null && obj.getSoCoVanHocTap().getTenSoCoVanHocTap() != null
						? obj.getSoCoVanHocTap().getTenSoCoVanHocTap()
						: ""%></td>
						<td><%=obj.getNamHoc() != null && obj.getNamHoc().getTenNamHoc() != null
						? obj.getNamHoc().getTenNamHoc()
						: ""%></td>
						<td style="text-align: center;">
							<!-- 							<form action="chonSoCoVanHocTap.action"> --> <!-- 								<button class="btn btn-default" onclick="chon(this)" -->
							<%-- 									id=<%=obj.getSoCoVanHocTap().getMaSoCoVanHocTap()%>>Chọn</button> --%>
							<!-- 							</form> --> <!-- 							<form> --> <!-- 								<button class="btn btn-default" onclick="bochon(this)" -->
							<%-- 									id=<%=obj.getSoCoVanHocTap().getMaSoCoVanHocTap()%>>Bỏ --%>
							<!-- 									chọn</button> --> <!-- 							</form> -->



							<form class="pull-left" action="chonSoCoVanHocTap.action">
								<input name="maSoCoVanHocTap" hidden=""
									value="<%=obj.getSoCoVanHocTap().getMaSoCoVanHocTap()%>">
								<button class="btn btn-default" type="submit"
									onclick="chonSo(this)"
									id="<%=obj.getSoCoVanHocTap().getMaSoCoVanHocTap()%>">Chọn</button>
							</form>
							<form class="pull-left" action="boChonSoCoVanHocTap.action">
								<input name="maSoCoVanHocTap" hidden=""
									value="<%=obj.getSoCoVanHocTap().getMaSoCoVanHocTap()%>">
								<button class="btn btn-default" type="submit"
									onclick="boChonSo(this)"
									id="<%=obj.getSoCoVanHocTap().getMaSoCoVanHocTap()%>">Bỏ
									chọn</button>
							</form>
						</td>
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


<script>
	document.getElementById("nutThemMoi").style.display = "none";
	document.getElementById("nutNhapLieuExcel").style.display = "none";

	function chonSo(that) {
		alert("Bạn đã chọn sổ " + that.id);
	}
	function boChonSo(that) {
		alert("Bạn đã hủy chọn sổ " + that.id);
	}
</script>

<!-- Modal Tìm kiếm-->
<%@ include file="../../ePartial/timkiemModel.jsp"%>



