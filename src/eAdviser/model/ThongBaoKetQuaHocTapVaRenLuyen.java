package eAdviser.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Type;

import eCore.model.SinhVien;

@Entity
public class ThongBaoKetQuaHocTapVaRenLuyen implements Comparable<ThongBaoKetQuaHocTapVaRenLuyen> {
	@Id
	public	String maThongBaoKetQuaHocTapVaRenLuyen;
	public	String hocKy;
	public	String namHoc;
	public	String ketQuaHocTap;
	public	String xepLoaiHocTap;
	public	String ketQuaRenLuyen;
	public	String xepLoaiRenLuyen;
	public	String thongBaoCuThe;
	@Type(type = "text")
	public	String moTa;
	@Type(type = "text")
	public String ghiChu;
	@OneToOne
	public	SinhVien sinhVien;
	@ManyToOne
	public	CoVanHocTap coVanHocTap;
	@ManyToOne
	public	SoCoVanHocTap soCoVanHocTap;
	public	Date thoiGianCapNhat;

	public ThongBaoKetQuaHocTapVaRenLuyen() {
	}

	public ThongBaoKetQuaHocTapVaRenLuyen(String maThongBaoKetQuaHocTapVaRenLuyen, String hocKy, String namHoc,
			String ketQuaHocTap, String xepLoaiHocTap, String ketQuaRenLuyen, String xepLoaiRenLuyen,
			String thongBaoCuThe, String moTa, String ghiChu, SinhVien sinhVien, CoVanHocTap coVanHocTap,
			SoCoVanHocTap soCoVanHocTap, Date thoiGianCapNhat) {
		super();
		this.maThongBaoKetQuaHocTapVaRenLuyen = maThongBaoKetQuaHocTapVaRenLuyen;
		this.hocKy = hocKy;
		this.namHoc = namHoc;
		this.ketQuaHocTap = ketQuaHocTap;
		this.xepLoaiHocTap = xepLoaiHocTap;
		this.ketQuaRenLuyen = ketQuaRenLuyen;
		this.xepLoaiRenLuyen = xepLoaiRenLuyen;
		this.thongBaoCuThe = thongBaoCuThe;
		this.moTa = moTa;
		this.ghiChu = ghiChu;
		this.sinhVien = sinhVien;
		this.coVanHocTap = coVanHocTap;
		this.soCoVanHocTap = soCoVanHocTap;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}

	public String getMaThongBaoKetQuaHocTapVaRenLuyen() {
		return maThongBaoKetQuaHocTapVaRenLuyen;
	}

	public void setMaThongBaoKetQuaHocTapVaRenLuyen(String maThongBaoKetQuaHocTapVaRenLuyen) {
		this.maThongBaoKetQuaHocTapVaRenLuyen = maThongBaoKetQuaHocTapVaRenLuyen;
	}

	public String getHocKy() {
		return hocKy;
	}

	public void setHocKy(String hocKy) {
		this.hocKy = hocKy;
	}

	public String getNamHoc() {
		return namHoc;
	}

	public void setNamHoc(String namHoc) {
		this.namHoc = namHoc;
	}

	public String getKetQuaHocTap() {
		return ketQuaHocTap;
	}

	public void setKetQuaHocTap(String ketQuaHocTap) {
		this.ketQuaHocTap = ketQuaHocTap;
	}

	public String getXepLoaiHocTap() {
		return xepLoaiHocTap;
	}

	public void setXepLoaiHocTap(String xepLoaiHocTap) {
		this.xepLoaiHocTap = xepLoaiHocTap;
	}

	public String getKetQuaRenLuyen() {
		return ketQuaRenLuyen;
	}

	public void setKetQuaRenLuyen(String ketQuaRenLuyen) {
		this.ketQuaRenLuyen = ketQuaRenLuyen;
	}

	public String getXepLoaiRenLuyen() {
		return xepLoaiRenLuyen;
	}

	public void setXepLoaiRenLuyen(String xepLoaiRenLuyen) {
		this.xepLoaiRenLuyen = xepLoaiRenLuyen;
	}

	public String getThongBaoCuThe() {
		return thongBaoCuThe;
	}

	public void setThongBaoCuThe(String thongBaoCuThe) {
		this.thongBaoCuThe = thongBaoCuThe;
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

	public SinhVien getSinhVien() {
		return sinhVien;
	}

	public void setSinhVien(SinhVien sinhVien) {
		this.sinhVien = sinhVien;
	}

	public CoVanHocTap getCoVanHocTap() {
		return coVanHocTap;
	}

	public void setCoVanHocTap(CoVanHocTap coVanHocTap) {
		this.coVanHocTap = coVanHocTap;
	}

	public SoCoVanHocTap getSoCoVanHocTap() {
		return soCoVanHocTap;
	}

	public void setSoCoVanHocTap(SoCoVanHocTap soCoVanHocTap) {
		this.soCoVanHocTap = soCoVanHocTap;
	}

	public Date getThoiGianCapNhat() {
		return thoiGianCapNhat;
	}

	public void setThoiGianCapNhat(Date thoiGianCapNhat) {
		this.thoiGianCapNhat = thoiGianCapNhat;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((coVanHocTap == null) ? 0 : coVanHocTap.hashCode());
		result = prime * result + ((ghiChu == null) ? 0 : ghiChu.hashCode());
		result = prime * result + ((hocKy == null) ? 0 : hocKy.hashCode());
		result = prime * result + ((ketQuaHocTap == null) ? 0 : ketQuaHocTap.hashCode());
		result = prime * result + ((ketQuaRenLuyen == null) ? 0 : ketQuaRenLuyen.hashCode());
		result = prime * result
				+ ((maThongBaoKetQuaHocTapVaRenLuyen == null) ? 0 : maThongBaoKetQuaHocTapVaRenLuyen.hashCode());
		result = prime * result + ((moTa == null) ? 0 : moTa.hashCode());
		result = prime * result + ((namHoc == null) ? 0 : namHoc.hashCode());
		result = prime * result + ((sinhVien == null) ? 0 : sinhVien.hashCode());
		result = prime * result + ((soCoVanHocTap == null) ? 0 : soCoVanHocTap.hashCode());
		result = prime * result + ((thoiGianCapNhat == null) ? 0 : thoiGianCapNhat.hashCode());
		result = prime * result + ((thongBaoCuThe == null) ? 0 : thongBaoCuThe.hashCode());
		result = prime * result + ((xepLoaiHocTap == null) ? 0 : xepLoaiHocTap.hashCode());
		result = prime * result + ((xepLoaiRenLuyen == null) ? 0 : xepLoaiRenLuyen.hashCode());
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
		ThongBaoKetQuaHocTapVaRenLuyen other = (ThongBaoKetQuaHocTapVaRenLuyen) obj;
		if (coVanHocTap == null) {
			if (other.coVanHocTap != null)
				return false;
		} else if (!coVanHocTap.equals(other.coVanHocTap))
			return false;
		if (ghiChu == null) {
			if (other.ghiChu != null)
				return false;
		} else if (!ghiChu.equals(other.ghiChu))
			return false;
		if (hocKy == null) {
			if (other.hocKy != null)
				return false;
		} else if (!hocKy.equals(other.hocKy))
			return false;
		if (ketQuaHocTap == null) {
			if (other.ketQuaHocTap != null)
				return false;
		} else if (!ketQuaHocTap.equals(other.ketQuaHocTap))
			return false;
		if (ketQuaRenLuyen == null) {
			if (other.ketQuaRenLuyen != null)
				return false;
		} else if (!ketQuaRenLuyen.equals(other.ketQuaRenLuyen))
			return false;
		if (maThongBaoKetQuaHocTapVaRenLuyen == null) {
			if (other.maThongBaoKetQuaHocTapVaRenLuyen != null)
				return false;
		} else if (!maThongBaoKetQuaHocTapVaRenLuyen.equals(other.maThongBaoKetQuaHocTapVaRenLuyen))
			return false;
		if (moTa == null) {
			if (other.moTa != null)
				return false;
		} else if (!moTa.equals(other.moTa))
			return false;
		if (namHoc == null) {
			if (other.namHoc != null)
				return false;
		} else if (!namHoc.equals(other.namHoc))
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
		if (thongBaoCuThe == null) {
			if (other.thongBaoCuThe != null)
				return false;
		} else if (!thongBaoCuThe.equals(other.thongBaoCuThe))
			return false;
		if (xepLoaiHocTap == null) {
			if (other.xepLoaiHocTap != null)
				return false;
		} else if (!xepLoaiHocTap.equals(other.xepLoaiHocTap))
			return false;
		if (xepLoaiRenLuyen == null) {
			if (other.xepLoaiRenLuyen != null)
				return false;
		} else if (!xepLoaiRenLuyen.equals(other.xepLoaiRenLuyen))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ThongBaoKetQuaHocTapVaRenLuyen [maThongBaoKetQuaHocTapVaRenLuyen=" + maThongBaoKetQuaHocTapVaRenLuyen
				+ ", hocKy=" + hocKy + ", namHoc=" + namHoc + ", ketQuaHocTap=" + ketQuaHocTap + ", xepLoaiHocTap="
				+ xepLoaiHocTap + ", ketQuaRenLuyen=" + ketQuaRenLuyen + ", xepLoaiRenLuyen=" + xepLoaiRenLuyen
				+ ", thongBaoCuThe=" + thongBaoCuThe + ", moTa=" + moTa + ", ghiChu=" + ghiChu + ", sinhVien="
				+ sinhVien + ", coVanHocTap=" + coVanHocTap + ", soCoVanHocTap=" + soCoVanHocTap + ", thoiGianCapNhat="
				+ thoiGianCapNhat + "]";
	}

	@Override
	public int compareTo(ThongBaoKetQuaHocTapVaRenLuyen o) {
		return this.maThongBaoKetQuaHocTapVaRenLuyen.compareTo(o.maThongBaoKetQuaHocTapVaRenLuyen);
	}

}
