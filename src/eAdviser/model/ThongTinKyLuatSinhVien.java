package eAdviser.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import eCore.model.NamHoc;
import eCore.model.SinhVien;

@Entity
public class ThongTinKyLuatSinhVien implements Comparable<ThongTinKyLuatSinhVien> {

	@Id
	public	String maThongTinKyLuatSinhVien;
	@ManyToOne
	public	SinhVien sinhVien;
	public	String noiDungKyLuat;
	public	Date thoiGianKyLuat;
	public	String moTa;
	public	String ghiChu;
	public	Date thoiGianCapNhat;
	@ManyToOne
	public	SoCoVanHocTap soCoVanHocTap;

	@Override

	public int compareTo(ThongTinKyLuatSinhVien o) {
		return this.maThongTinKyLuatSinhVien.compareTo(o.maThongTinKyLuatSinhVien);
	}

	public ThongTinKyLuatSinhVien() {
	}

	public ThongTinKyLuatSinhVien(String maThongTinKyLuatSinhVien, SinhVien sinhVien, String noiDungKyLuat,
			Date thoiGianKyLuat, String moTa, String ghiChu, Date thoiGianCapNhat, SoCoVanHocTap soCoVanHocTap) {
		this.maThongTinKyLuatSinhVien = maThongTinKyLuatSinhVien;
		this.sinhVien = sinhVien;
		this.noiDungKyLuat = noiDungKyLuat;
		this.thoiGianKyLuat = thoiGianKyLuat;
		this.moTa = moTa;
		this.ghiChu = ghiChu;
		this.thoiGianCapNhat = thoiGianCapNhat;
		this.soCoVanHocTap = soCoVanHocTap;
	}

	public String getMaThongTinKyLuatSinhVien() {
		return maThongTinKyLuatSinhVien;
	}

	public void setMaThongTinKyLuatSinhVien(String maThongTinKyLuatSinhVien) {
		this.maThongTinKyLuatSinhVien = maThongTinKyLuatSinhVien;
	}

	public SinhVien getSinhVien() {
		return sinhVien;
	}

	public void setSinhVien(SinhVien sinhVien) {
		this.sinhVien = sinhVien;
	}

	public String getNoiDungKyLuat() {
		return noiDungKyLuat;
	}

	public void setNoiDungKyLuat(String noiDungKyLuat) {
		this.noiDungKyLuat = noiDungKyLuat;
	}

	public Date getThoiGianKyLuat() {
		return thoiGianKyLuat;
	}

	public void setThoiGianKyLuat(Date thoiGianKyLuat) {
		this.thoiGianKyLuat = thoiGianKyLuat;
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
				+ ((maThongTinKyLuatSinhVien == null) ? 0 : maThongTinKyLuatSinhVien.hashCode());
		result = prime * result + ((moTa == null) ? 0 : moTa.hashCode());
		result = prime * result + ((noiDungKyLuat == null) ? 0 : noiDungKyLuat.hashCode());
		result = prime * result + ((sinhVien == null) ? 0 : sinhVien.hashCode());
		result = prime * result + ((soCoVanHocTap == null) ? 0 : soCoVanHocTap.hashCode());
		result = prime * result + ((thoiGianCapNhat == null) ? 0 : thoiGianCapNhat.hashCode());
		result = prime * result + ((thoiGianKyLuat == null) ? 0 : thoiGianKyLuat.hashCode());
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
		ThongTinKyLuatSinhVien other = (ThongTinKyLuatSinhVien) obj;
		if (ghiChu == null) {
			if (other.ghiChu != null)
				return false;
		} else if (!ghiChu.equals(other.ghiChu))
			return false;
		if (maThongTinKyLuatSinhVien == null) {
			if (other.maThongTinKyLuatSinhVien != null)
				return false;
		} else if (!maThongTinKyLuatSinhVien.equals(other.maThongTinKyLuatSinhVien))
			return false;
		if (moTa == null) {
			if (other.moTa != null)
				return false;
		} else if (!moTa.equals(other.moTa))
			return false;
		if (noiDungKyLuat == null) {
			if (other.noiDungKyLuat != null)
				return false;
		} else if (!noiDungKyLuat.equals(other.noiDungKyLuat))
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
		if (thoiGianKyLuat == null) {
			if (other.thoiGianKyLuat != null)
				return false;
		} else if (!thoiGianKyLuat.equals(other.thoiGianKyLuat))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ThongTinKyLuatSinhVien [maThongTinKyLuatSinhVien=" + maThongTinKyLuatSinhVien
				+ ", sinhVien=" + sinhVien + ", noiDungKyLuat=" + noiDungKyLuat + ", thoiGianKyLuat="
				+ thoiGianKyLuat + ", moTa=" + moTa + ", ghiChu=" + ghiChu + ", thoiGianCapNhat=" + thoiGianCapNhat
				+ ", soCoVanHocTap=" + soCoVanHocTap + "]";
	}

}
