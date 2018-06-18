package eAdviser.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import eCore.model.NamHoc;

@Entity
public class PhanCongCoVanHocTap implements Comparable<PhanCongCoVanHocTap> {
	@Id
	public	String maPhanCong;
	@OneToOne
	public	CoVanHocTap coVanHocTap;
	@OneToOne
	public	SoCoVanHocTap soCoVanHocTap;
	@ManyToOne
	public	NamHoc namHoc;
	public	Date thoiGianBatDau;
	public	Date thoiGianKetThuc;
	public	String moTa;
	public	String ghiChu;
	public	Date thoiGianCapNhat;

	public PhanCongCoVanHocTap() {
	}

	

	public PhanCongCoVanHocTap(String maPhanCong, CoVanHocTap coVanHocTap, SoCoVanHocTap soCoVanHocTap, NamHoc namHoc,
			Date thoiGianBatDau, Date thoiGianKetThuc, String moTa, String ghiChu, Date thoiGianCapNhat) {
		super();
		this.maPhanCong = maPhanCong;
		this.coVanHocTap = coVanHocTap;
		this.soCoVanHocTap = soCoVanHocTap;
		this.namHoc = namHoc;
		this.thoiGianBatDau = thoiGianBatDau;
		this.thoiGianKetThuc = thoiGianKetThuc;
		this.moTa = moTa;
		this.ghiChu = ghiChu;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}



	public String getMaPhanCong() {
		return maPhanCong;
	}

	public void setMaPhanCong(String maPhanCong) {
		this.maPhanCong = maPhanCong;
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

	public NamHoc getNamHoc() {
		return namHoc;
	}

	public void setNamHoc(NamHoc namHoc) {
		this.namHoc = namHoc;
	}

	public Date getThoiGianBatDau() {
		return thoiGianBatDau;
	}

	public void setThoiGianBatDau(Date thoiGianBatDau) {
		this.thoiGianBatDau = thoiGianBatDau;
	}

	public Date getThoiGianKetThuc() {
		return thoiGianKetThuc;
	}

	public void setThoiGianKetThuc(Date thoiGianKetThuc) {
		this.thoiGianKetThuc = thoiGianKetThuc;
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
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((coVanHocTap == null) ? 0 : coVanHocTap.hashCode());
		result = prime * result + ((ghiChu == null) ? 0 : ghiChu.hashCode());
		result = prime * result + ((maPhanCong == null) ? 0 : maPhanCong.hashCode());
		result = prime * result + ((moTa == null) ? 0 : moTa.hashCode());
		result = prime * result + ((namHoc == null) ? 0 : namHoc.hashCode());
		result = prime * result + ((soCoVanHocTap == null) ? 0 : soCoVanHocTap.hashCode());
		result = prime * result + ((thoiGianBatDau == null) ? 0 : thoiGianBatDau.hashCode());
		result = prime * result + ((thoiGianCapNhat == null) ? 0 : thoiGianCapNhat.hashCode());
		result = prime * result + ((thoiGianKetThuc == null) ? 0 : thoiGianKetThuc.hashCode());
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
		PhanCongCoVanHocTap other = (PhanCongCoVanHocTap) obj;
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
		if (maPhanCong == null) {
			if (other.maPhanCong != null)
				return false;
		} else if (!maPhanCong.equals(other.maPhanCong))
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
		if (soCoVanHocTap == null) {
			if (other.soCoVanHocTap != null)
				return false;
		} else if (!soCoVanHocTap.equals(other.soCoVanHocTap))
			return false;
		if (thoiGianBatDau == null) {
			if (other.thoiGianBatDau != null)
				return false;
		} else if (!thoiGianBatDau.equals(other.thoiGianBatDau))
			return false;
		if (thoiGianCapNhat == null) {
			if (other.thoiGianCapNhat != null)
				return false;
		} else if (!thoiGianCapNhat.equals(other.thoiGianCapNhat))
			return false;
		if (thoiGianKetThuc == null) {
			if (other.thoiGianKetThuc != null)
				return false;
		} else if (!thoiGianKetThuc.equals(other.thoiGianKetThuc))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "PhanCongCoVanHocTap [maPhanCong=" + maPhanCong + ", coVanHocTap=" + coVanHocTap + ", soCoVanHocTap="
				+ soCoVanHocTap + ", namHoc=" + namHoc + ", thoiGianBatDau=" + thoiGianBatDau + ", thoiGianKetThuc="
				+ thoiGianKetThuc + ", moTa=" + moTa + ", ghiChu=" + ghiChu + ", thoiGianCapNhat=" + thoiGianCapNhat
				+ "]";
	}



	@Override
	public int compareTo(PhanCongCoVanHocTap o) {
		return this.maPhanCong.compareTo(o.maPhanCong);
	}

}
