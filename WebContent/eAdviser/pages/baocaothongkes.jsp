<%@page import="eAdviser.modelDao.DAO_SoCoVanHocTap"%>
<%@page import="eAdviser.model.SoCoVanHocTap"%>
<%@page import="eAdviser.modelDao.DAO_PhanCongCoVanHocTap"%>
<%@page import="eAdviser.model.PhanCongCoVanHocTap"%>
<%@page import="eAdviser.model.CoVanHocTap"%>
<%@page import="eAdviser.modelDao.DAO_CoVanHocTap"%>
<%@page import="eCore.modelDao.DAO_TaiKhoanNhanVien"%>
<%@page import="eCore.model.TaiKhoanNhanVien"%>
<%@page import="java.util.Date"%>
<%@page import="eCore.util.Util_Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="eCore.dao.ObjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="panel panel-primary">
	<div class="panel-heading">Báo cáo thống kê thông tin khen thưởng</div>
	<div class="panel-body">
		<form class="form-group"
			action="exportThongTinKhenThuongSinhVien.action">
			<div class="col-md-2">
				<label class="control-label">Chọn ngày bắt đầu</label> <input
					type="date" name="s_ngayBatDau" class="form-control"
					value="<%=Util_Date.dateToString(new Date())%>">
			</div>

			<div class="col-md-2">
				<label class="control-label">Chọn ngày kết thúc</label> <input
					type="date" name="s_ngayKetThuc" class="form-control"
					value="<%=Util_Date.dateToString(new Date())%>">
			</div>

			<div class="col-md-4">
				<label class="control-label">Chọn sổ cố vấn học tập</label> <select  class="form-control" name="maSoCoVanHocTap">
					<%
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
						if (list_CoVanHocTap.size() > 0) {
							maCoVanHocTap = list_CoVanHocTap.get(0).getMaCoVanHocTap();
							ObjectDAO<PhanCongCoVanHocTap> dao_PhanCongCoVanHocTap = new DAO_PhanCongCoVanHocTap();
							ArrayList<PhanCongCoVanHocTap> list_PhanCongCoVanHocTap = dao_PhanCongCoVanHocTap
									.listByColumns("coVanHocTap", maCoVanHocTap);
							for (PhanCongCoVanHocTap soCoVanHocTap : list_PhanCongCoVanHocTap) {
					%>

					<option class="form-control"
						value="<%=soCoVanHocTap.getSoCoVanHocTap().getMaSoCoVanHocTap()%>"><%=soCoVanHocTap.getSoCoVanHocTap().getTenSoCoVanHocTap()%></option>
					<%
						}
						}else{ // nếu không là cố vấn học tập
							ObjectDAO<SoCoVanHocTap> dao_SoCoVanHocTap = new DAO_SoCoVanHocTap();
						ArrayList<SoCoVanHocTap> list_SoCoVanHocTap = dao_SoCoVanHocTap.listAll();
						for(SoCoVanHocTap soCoVanHocTap : list_SoCoVanHocTap){
							%>
							<option value="<%=soCoVanHocTap.getMaSoCoVanHocTap()%>"><%=soCoVanHocTap.getTenSoCoVanHocTap() %></option>
							<% 
						}
						}
						
					%>
				</select>
			</div>

			<div class="col-md-3">
				<label class="control-label"> &nbsp</label>
				<button type="submit" class="form-control btn btn-success" value="">
					<img alt="" src="content/images/excel-32.png" width="16px"
						height="16px"> Xuất danh sách excel
				</button>
			</div>
		</form>
	</div>
</div>