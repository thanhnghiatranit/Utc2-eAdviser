<%@page import="eAdviser.modelDao.DAO_PhanCongCoVanHocTap"%>
<%@page import="eCore.modelDao.DAO_TaiKhoanNhanVien"%>
<%@page import="eCore.model.TaiKhoanNhanVien"%>
<%@page import="eAdviser.model.ThongBaoKetQuaHocTapVaRenLuyen"%>
<%@page import="eCore.model.SinhVien"%>
<%@page import="eCore.modelDao.DAO_SinhVien"%>
<%@page import="eCore.util.Util_Date"%>
<%@page import="eCore.model.NamHoc"%>
<%@page import="eCore.modelDao.DAO_NamHoc"%>
<%@page import="eAdviser.model.SoCoVanHocTap"%>
<%@page import="eAdviser.modelDao.DAO_SoCoVanHocTap"%>
<%@page import="eAdviser.modelDao.DAO_CoVanHocTap"%>
<%@page import="eAdviser.model.PhanCongCoVanHocTap"%>
<%@page import="eCore.model.NhanVien"%>
<%@page import="eCore.modelDao.DAO_NhanVien"%>
<%@page import="eAdviser.model.CoVanHocTap"%>
<%@page import="eCore.model.Lop"%>
<%@page import="eCore.model.DonVi"%>
<%@page import="java.util.ArrayList"%>
<%@page import="eCore.modelDao.DAO_DonVi"%>
<%@page import="eCore.dao.ObjectDAO"%>
<%@page import="eCore.model.ChucNang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%
	String tenLop = "ThongBaoKetQuaHocTapVaRenLuyen";
		String tenTrang = "Quản lý thông báo kết quả và rèn luyện";
		String trangDanhSach = "index.jsp?p=eAdviser/pages/thongbaoketquahoctapvarenluyens.jsp";
		String[] tk_value = { "coVanHocTap", "soCoVanHocTap", "sinhVien", "maThongBaoKetQuaHocTapVaRenLuyen",
				"hocKy", "namHoc", "ketQuaHocTap", "xepLoaiHocTap", "ketQuaRenLuyen", "xepLoaiRenLuyen",
				"thongBaoCuThe" };
		String[] tk_show = { "Cố vấn học tập", "Sổ cố vấn học tập", "Sinh viên",
				"Mã thông báo kết quả học tập và rèn luyện", "Học kỳ", "Năm học", "Kết quả học tập",
				"Xếp loại học tập", "Kết quả rèn luyện", "Xếp loại rèn luyện", "Thông báo cụ thể" };
%>
<%@ include file="../../ePartial/code-header.jsp"%>

<%
	String mode = session.getAttribute("mode") + "";
		String tenTrangChiTiet = "";
		tenTrangChiTiet = mode.equals("addNew") ? "Thêm mới" : tenTrangChiTiet;
		tenTrangChiTiet = mode.equals("viewDetail") ? "Xem thông tin chi tiết" : tenTrangChiTiet;
		tenTrangChiTiet = mode.equals("viewDetailAndEdit") ? "Chỉnh sửa thông tin" : tenTrangChiTiet;
		tenTrangChiTiet = mode.equals("null") ? "" : tenTrangChiTiet;

		boolean modeView = mode.equals("viewDetail");
		boolean modeEdit = mode.equals("viewDetailAndEdit");

		ThongBaoKetQuaHocTapVaRenLuyen obj = null;
		if (session.getAttribute("obj") != null) {
			if (session.getAttribute("obj") instanceof ThongBaoKetQuaHocTapVaRenLuyen) {
				obj = (ThongBaoKetQuaHocTapVaRenLuyen) session.getAttribute("obj");
			}
		}
%>
<div class="row">
	<div class="col-lg-12">
		<h4 class="page-header"><%=tenTrang%>
			-
			<%=tenTrangChiTiet%>
		</h4>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<form action="luuDuLieu<%=tenLop%>.action" method="post">
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading" style="text-align: left;">
					<div class="row">
						<div class="col-md-5">
							<p style="color: red; display: inline;"><%=msg%></p>
						</div>
						<div class="col-md-7">
							<%@ include file="../../ePartial/processform.jsp"%>
						</div>
					</div>
				</div>
				<div class="panel-body">
					<div class="row" style="padding: 10px">
						<div class="row">
							<div class="col-lg-6">
								<div class="form-group">
									<label>Thuộc Sổ cố vấn học tập</label> <input readonly
										class="form-control" name="maSoCoVanHocTap"
										value="<%=session.getAttribute("maSo").toString()%>">
								</div>
								<div class="form-group">
									<label>Cố vấn học tập</label>
									<%
										String maDangNhap1 = session.getAttribute("maDangNhap").toString();
											ObjectDAO<TaiKhoanNhanVien> dao_TaiKhoanNhanVien = new DAO_TaiKhoanNhanVien();
											ArrayList<TaiKhoanNhanVien> list_TaiKhoanNhanVien = dao_TaiKhoanNhanVien.listByColumns("maDangNhap",
													maDangNhap1);
											TaiKhoanNhanVien nv = new TaiKhoanNhanVien();
											if (list_TaiKhoanNhanVien.size() > 0)
												nv = list_TaiKhoanNhanVien.get(0);
											String maCoVanHocTap = "";
											ObjectDAO<CoVanHocTap> dao_CoVanHocTap = new DAO_CoVanHocTap();
											ArrayList<CoVanHocTap> list_CoVanHocTap = dao_CoVanHocTap.listByColumns("nhanVien",
													nv.getNhanVien().getMaNhanVien());
											if (list_CoVanHocTap.size() > 0) {
												maCoVanHocTap = list_CoVanHocTap.get(0).getMaCoVanHocTap();
												System.out.println(maCoVanHocTap);
									%>

									<!-- 									<input readonly class="form-control" name="maCoVanHocTap" -->
									<%-- 										<%=(modeView ? " disabled " : "")%> value="<%=maCoVanHocTap%>"> --%>
									<select name="maCoVanHocTap" class="form-control" ><option
											value="<%=maCoVanHocTap%>"><%=nv.getNhanVien().getTenNhanVien()%></option></select>
									<%
										} else { // đây là admin
												String maSo = session.getAttribute("maSo").toString();
												ObjectDAO<PhanCongCoVanHocTap> dao_PhanCong = new DAO_PhanCongCoVanHocTap();
												ArrayList<PhanCongCoVanHocTap> list_PhanCong = dao_PhanCong.listByColumns("soCoVanHocTap", maSo);
												String maCoVanHocTap1 = list_PhanCong.get(0).getCoVanHocTap().getMaCoVanHocTap();
												ObjectDAO<CoVanHocTap> dao_CoVanHocTap1 = new DAO_CoVanHocTap();
												ArrayList<CoVanHocTap> list_CoVanHocTap1 = dao_CoVanHocTap.listByColumns("maCoVanHocTap",
														maCoVanHocTap1);
												String maNhanVien1 = list_CoVanHocTap1.get(0).getNhanVien().getMaNhanVien();
												ObjectDAO<NhanVien> dao_NhanVien = new DAO_NhanVien();
												ArrayList<NhanVien> list_NhanVien = dao_NhanVien.listByColumns("maNhanVien", maNhanVien1);
												NhanVien nhanVien = list_NhanVien.get(0);
									%>
									<select name="maCoVanHocTap" class="form-control" readonly ><option
											value="<%=list_CoVanHocTap1.get(0).getMaCoVanHocTap()%>"><%=nhanVien.getTenNhanVien()%></option></select>
									<%
										}
									%>

								</div>
								<div class="form-group">
									<label>Mã sinh viên</label> <input class="form-control"
										name="maSinhVien"
										value="<%=(obj != null ? obj.getSinhVien().getMaSinhVien() : "")%>"
										<%=(modeView || modeEdit ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Mã thông báo kết quả học tập và rèn luyện</label> <input
										class="form-control" name="maThongBaoKetQuaHocTapVaRenLuyen"
										value="<%=(obj != null ? obj.maThongBaoKetQuaHocTapVaRenLuyen : "KQ" + System.currentTimeMillis())%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Học kỳ</label> <input class="form-control" name="hocKy"
										value="<%=(obj != null ? obj.getHocKy() : "")%>"
										<%=(modeView ? " readonly " : "")%>>
								</div>
								<div class="form-group">
									<label>Năm học</label> <input class="form-control"
										name="namHoc"
										value="<%=(obj != null ? obj.getNamHoc() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="form-group">
									<label>Kết quả học tập</label> <input class="form-control"
										name="ketQuaHocTap"
										value="<%=(obj != null ? obj.getKetQuaHocTap() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Xếp loại học tập</label> <input class="form-control"
										name="xepLoaiHocTap"
										value="<%=(obj != null ? obj.getXepLoaiHocTap() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Kết quả rèn luyện</label> <input class="form-control"
										name="ketQuaRenLuyen"
										value="<%=(obj != null ? obj.getKetQuaRenLuyen() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Xếp loại rèn luyện</label> <input class="form-control"
										name="xepLoaiRenLuyen"
										value="<%=(obj != null ? obj.getKetQuaRenLuyen() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
								<div class="form-group">
									<label>Thông báo cụ thể</label> <input class="form-control"
										name="thongBaoCuThe"
										value="<%=(obj != null ? obj.getThongBaoCuThe() : "")%>"
										<%=(modeView ? " disabled " : "")%>>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<label>Mô tả</label>
									<textarea class="form-control" cols="80" id="editor1" rows="5"
										name="moTa" <%=(modeView ? " disabled " : "")%>><%=(obj != null ? obj.getMoTa() : "")%></textarea>
								</div>
								<div class="form-group">
									<label>Ghi chú</label>
									<textarea class="form-control" cols="80" id="editor2" rows="5"
										name="ghiChu" <%=(modeView ? " disabled " : "")%>><%=(obj != null ? obj.getGhiChu() : "")%></textarea>
								</div>
							</div>
						</div>
						<div class="panel-footer" style="text-align: left;">
							<div class="col-md-5"></div>
							<div class="col-md-7">
								<%@ include file="../../ePartial/processform.jsp"%>
							</div>
						</div>
						<!-- /.col-lg-6 (nested) -->
						<!-- /.col-lg-6 (nested) -->
					</div>
					<!-- /.row (nested) -->
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
</form>
<%session.removeAttribute("msg"); %>