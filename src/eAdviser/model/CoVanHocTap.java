package eAdviser.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import eCore.model.NhanVien;
import eCore.model.NhanVien;

@Entity
public class CoVanHocTap implements Comparable<CoVanHocTap> {

	@Id
	public	String maCoVanHocTap;
	@OneToOne
	public	NhanVien nhanVien;
	public	String dienThoaiCoQuan;
	public	String diaChiGuiThu;
	public	String diDong;
	public	String moTa;
	public	String ghiChu;
	public	Date thoiGianCapNhat;

	public CoVanHocTap() {
	}

	public CoVanHocTap(String maCoVanHocTap, NhanVien nhanVien, String dienThoaiCoQuan, String diaChiGuiThu,
			String diDong, String moTa, String ghiChu, Date thoiGianCapNhat) {
		super();
		this.maCoVanHocTap = maCoVanHocTap;
		this.nhanVien = nhanVien;
		this.dienThoaiCoQuan = dienThoaiCoQuan;
		this.diaChiGuiThu = diaChiGuiThu;
		this.diDong = diDong;
		this.moTa = moTa;
		this.ghiChu = ghiChu;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((diDong == null) ? 0 : diDong.hashCode());
		result = prime * result + ((diaChiGuiThu == null) ? 0 : diaChiGuiThu.hashCode());
		result = prime * result + ((dienThoaiCoQuan == null) ? 0 : dienThoaiCoQuan.hashCode());
		result = prime * result + ((ghiChu == null) ? 0 : ghiChu.hashCode());
		result = prime * result + ((maCoVanHocTap == null) ? 0 : maCoVanHocTap.hashCode());
		result = prime * result + ((moTa == null) ? 0 : moTa.hashCode());
		result = prime * result + ((nhanVien == null) ? 0 : nhanVien.hashCode());
		result = prime * result + ((thoiGianCapNhat == null) ? 0 : thoiGianCapNhat.hashCode());
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
		CoVanHocTap other = (CoVanHocTap) obj;
		if (diDong == null) {
			if (other.diDong != null)
				return false;
		} else if (!diDong.equals(other.diDong))
			return false;
		if (diaChiGuiThu == null) {
			if (other.diaChiGuiThu != null)
				return false;
		} else if (!diaChiGuiThu.equals(other.diaChiGuiThu))
			return false;
		if (dienThoaiCoQuan == null) {
			if (other.dienThoaiCoQuan != null)
				return false;
		} else if (!dienThoaiCoQuan.equals(other.dienThoaiCoQuan))
			return false;
		if (ghiChu == null) {
			if (other.ghiChu != null)
				return false;
		} else if (!ghiChu.equals(other.ghiChu))
			return false;
		if (maCoVanHocTap == null) {
			if (other.maCoVanHocTap != null)
				return false;
		} else if (!maCoVanHocTap.equals(other.maCoVanHocTap))
			return false;
		if (moTa == null) {
			if (other.moTa != null)
				return false;
		} else if (!moTa.equals(other.moTa))
			return false;
		if (nhanVien == null) {
			if (other.nhanVien != null)
				return false;
		} else if (!nhanVien.equals(other.nhanVien))
			return false;
		if (thoiGianCapNhat == null) {
			if (other.thoiGianCapNhat != null)
				return false;
		} else if (!thoiGianCapNhat.equals(other.thoiGianCapNhat))
			return false;
		return true;
	}

	public String getMaCoVanHocTap() {
		return maCoVanHocTap;
	}

	public void setMaCoVanHocTap(String maCoVanHocTap) {
		this.maCoVanHocTap = maCoVanHocTap;
	}

	public NhanVien getNhanVien() {
		return nhanVien;
	}

	public void setNhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}

	public String getDienThoaiCoQuan() {
		return dienThoaiCoQuan;
	}

	public void setDienThoaiCoQuan(String dienThoaiCoQuan) {
		this.dienThoaiCoQuan = dienThoaiCoQuan;
	}

	public String getDiaChiGuiThu() {
		return diaChiGuiThu;
	}

	public void setDiaChiGuiThu(String diaChiGuiThu) {
		this.diaChiGuiThu = diaChiGuiThu;
	}

	public String getDiDong() {
		return diDong;
	}

	public void setDiDong(String diDong) {
		this.diDong = diDong;
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

	@Override
	public String toString() {
		return "CoVanHocTap [maCoVanHocTap=" + maCoVanHocTap + ", nhanVien=" + nhanVien + ", dienThoaiCoQuan="
				+ dienThoaiCoQuan + ", diaChiGuiThu=" + diaChiGuiThu + ", diDong=" + diDong + ", moTa=" + moTa
				+ ", ghiChu=" + ghiChu + ", thoiGianCapNhat=" + thoiGianCapNhat + "]";
	}

	@Override
	public int compareTo(CoVanHocTap o) {
		return this.maCoVanHocTap.compareTo(o.maCoVanHocTap);
	}

}
