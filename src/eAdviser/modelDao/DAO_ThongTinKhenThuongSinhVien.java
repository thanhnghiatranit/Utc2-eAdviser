package eAdviser.modelDao;

import eAdviser.model.SoCoVanHocTap;
import eAdviser.model.ThongTinKhenThuongSinhVien;
import eCore.dao.ObjectDAO;

public class DAO_ThongTinKhenThuongSinhVien extends ObjectDAO<ThongTinKhenThuongSinhVien> {
	public DAO_ThongTinKhenThuongSinhVien() {
		 this.table="ThongTinKhenThuongSinhVien";
	}
}
