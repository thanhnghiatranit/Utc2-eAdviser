package eAdviser.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import eCore.model.NamHoc;
import eCore.model.SinhVien;

@Entity
public class ThongTinKhenThuongSinhVien implements Comparable<ThongTinKhenThuongSinhVien> {

	@Id
	public	String maThongTinKhenThuongSinhVien;
	@ManyToOne
	public	SinhVien sinhVien;
	public	String noiDungKhenThuong;
	public	Date thoiGianKhenThuong;
	public	String moTa;
	public	String ghiChu;
	public	Date thoiGianCapNhat;
	@ManyToOne
	public	SoCoVanHocTap soCoVanHocTap;

	@Override

	public int compareTo(ThongTinKhenThuongSinhVien o) {
		return this.maThongTinKhenThuongSinhVien.compareTo(o.maThongTinKhenThuongSinhVien);
	}

	public ThongTinKhenThuongSinhVien() {
	}

	public ThongTinKhenThuongSinhVien(String maThongTinKhenThuongSinhVien, SinhVien sinhVien, String noiDungKhenThuong,
			Date thoiGianKhenThuong, String moTa, String ghiChu, Date thoiGianCapNhat, SoCoVanHocTap soCoVanHocTap) {
		this.maThongTinKhenThuongSinhVien = maThongTinKhenThuongSinhVien;
		this.sinhVien = sinhVien;
		this.noiDungKhenThuong = noiDungKhenThuong;
		this.thoiGianKhenThuong = thoiGianKhenThuong;
		this.moTa = moTa;
		this.ghiChu = ghiChu;
		this.thoiGianCapNhat = thoiGianCapNhat;
		this.soCoVanHocTap = soCoVanHocTap;
	}

	public String getMaThongTinKhenThuongSinhVien() {
		return maThongTinKhenThuongSinhVien;
	}

	public void setMaThongTinKhenThuongSinhVien(String maThongTinKhenThuongSinhVien) {
		this.maThongTinKhenThuongSinhVien = maThongTinKhenThuongSinhVien;
	}

	public SinhVien getSinhVien() {
		return sinhVien;
	}

	public void setSinhVien(SinhVien sinhVien) {
		this.sinhVien = sinhVien;
	}

	public String getNoiDungKhenThuong() {
		return noiDungKhenThuong;
	}

	public void setNoiDungKhenThuong(String noiDungKhenThuong) {
		this.noiDungKhenThuong = noiDungKhenThuong;
	}

	public Date getThoiGianKhenThuong() {
		return thoiGianKhenThuong;
	}

	public void setThoiGianKhenThuong(Date thoiGianKhenThuong) {
		this.thoiGianKhenThuong = thoiGianKhenThuong;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public String getGhiChu() {
		return ghiChu;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}

	public Date getThoiGianCapNhat() {
		return thoiGianCapNhat;
	}

	public void setThoiGianCapNhat(Date thoiGianCapNhat) {
		this.thoiGianCapNhat = thoiGianCapNhat;
	}

	public SoCoVanHocTap getSoCoVanHocTap() {
		return soCoVanHocTap;
	}

	public void setSoCoVanHocTap(SoCoVanHocTap soCoVanHocTap) {
		this.soCoVanHocTap = soCoVanHocTap;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((ghiChu == null) ? 0 : ghiChu.hashCode());
		result = prime * result
				+ ((maThongTinKhenThuongSinhVien == null) ? 0 : maThongTinKhenThuongSinhVien.hashCode());
		result = prime * result + ((moTa == null) ? 0 : moTa.hashCode());
		result = prime * result + ((noiDungKhenThuong == null) ? 0 : noiDungKhenThuong.hashCode());
		result = prime * result + ((sinhVien == null) ? 0 : sinhVien.hashCode());
		result = prime * result + ((soCoVanHocTap == null) ? 0 : soCoVanHocTap.hashCode());
		result = prime * result + ((thoiGianCapNhat == null) ? 0 : thoiGianCapNhat.hashCode());
		result = prime * result + ((thoiGianKhenThuong == null) ? 0 : thoiGianKhenThuong.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ThongTinKhenThuongSinhVien other = (ThongTinKhenThuongSinhVien) obj;
		if (ghiChu == null) {
			if (other.ghiChu != null)
				return false;
		} else if (!ghiChu.equals(other.ghiChu))
			return false;
		if (maThongTinKhenThuongSinhVien == null) {
			if (other.maThongTinKhenThuongSinhVien != null)
				return false;
		} else if (!maThongTinKhenThuongSinhVien.equals(other.maThongTinKhenThuongSinhVien))
			return false;
		if (moTa == null) {
			if (other.moTa != null)
				return false;
		} else if (!moTa.equals(other.moTa))
			return false;
		if (noiDungKhenThuong == null) {
			if (other.noiDungKhenThuong != null)
				return false;
		} else if (!noiDungKhenThuong.equals(other.noiDungKhenThuong))
			return false;
		if (sinhVien == null) {
			if (other.sinhVien != null)
				return false;
		} else if (!sinhVien.equals(other.sinhVien))
			return false;
		if (soCoVanHocTap == null) {
			if (other.soCoVanHocTap != null)
				return false;
		} else if (!soCoVanHocTap.equals(other.soCoVanHocTap))
			return false;
		if (thoiGianCapNhat == null) {
			if (other.thoiGianCapNhat != null)
				return false;
		} else if (!thoiGianCapNhat.equals(other.thoiGianCapNhat))
			return false;
		if (thoiGianKhenThuong == null) {
			if (other.thoiGianKhenThuong != null)
				return false;
		} else if (!thoiGianKhenThuong.equals(other.thoiGianKhenThuong))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ThongTinKhenThuongSinhVien [maThongTinKhenThuongSinhVien=" + maThongTinKhenThuongSinhVien
				+ ", sinhVien=" + sinhVien + ", noiDungKhenThuong=" + noiDungKhenThuong + ", thoiGianKhenThuong="
				+ thoiGianKhenThuong + ", moTa=" + moTa + ", ghiChu=" + ghiChu + ", thoiGianCapNhat=" + thoiGianCapNhat
				+ ", soCoVanHocTap=" + soCoVanHocTap + "]";
	}

}
