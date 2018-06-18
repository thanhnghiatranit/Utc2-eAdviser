package eAdviser.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import eCore.model.Lop;
@Entity
public class SoCoVanHocTap implements Comparable<SoCoVanHocTap> {

	@Id
	public	String maSoCoVanHocTap;
	public	String tenSoCoVanHocTap;
	@OneToOne
	public	Lop lop;
	public	Date ngayBD;
	public	Date ngayKT;
	public	String moTa;
	public	String ghiChu;
	public	Date thoiGianCapNhat;


	public SoCoVanHocTap() {
	}

	public SoCoVanHocTap(String maSoCoVanHocTap, String tenSoCoVanHocTap, Lop lop, Date ngayBD, Date ngayKT,
			String moTa, String ghiChu, Date thoiGianCapNhat) {
		super();
		this.maSoCoVanHocTap = maSoCoVanHocTap;
		this.tenSoCoVanHocTap = tenSoCoVanHocTap;
		this.lop = lop;
		this.ngayBD = ngayBD;
		this.ngayKT = ngayKT;
		this.moTa = moTa;
		this.ghiChu = ghiChu;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}




	public String getMaSoCoVanHocTap() {
		return maSoCoVanHocTap;
	}




	public void setMaSoCoVanHocTap(String maSoCoVanHocTap) {
		this.maSoCoVanHocTap = maSoCoVanHocTap;
	}




	public String getTenSoCoVanHocTap() {
		return tenSoCoVanHocTap;
	}




	public void setTenSoCoVanHocTap(String tenSoCoVanHocTap) {
		this.tenSoCoVanHocTap = tenSoCoVanHocTap;
	}




	public Lop getLop() {
		return lop;
	}




	public void setLop(Lop lop) {
		this.lop = lop;
	}




	public Date getNgayBD() {
		return ngayBD;
	}




	public void setNgayBD(Date ngayBD) {
		this.ngayBD = ngayBD;
	}




	public Date getNgayKT() {
		return ngayKT;
	}




	public void setNgayKT(Date ngayKT) {
		this.ngayKT = ngayKT;
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
		result = prime * result + ((ghiChu == null) ? 0 : ghiChu.hashCode());
		result = prime * result + ((lop == null) ? 0 : lop.hashCode());
		result = prime * result + ((maSoCoVanHocTap == null) ? 0 : maSoCoVanHocTap.hashCode());
		result = prime * result + ((moTa == null) ? 0 : moTa.hashCode());
		result = prime * result + ((ngayBD == null) ? 0 : ngayBD.hashCode());
		result = prime * result + ((ngayKT == null) ? 0 : ngayKT.hashCode());
		result = prime * result + ((tenSoCoVanHocTap == null) ? 0 : tenSoCoVanHocTap.hashCode());
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
		SoCoVanHocTap other = (SoCoVanHocTap) obj;
		if (ghiChu == null) {
			if (other.ghiChu != null)
				return false;
		} else if (!ghiChu.equals(other.ghiChu))
			return false;
		if (lop == null) {
			if (other.lop != null)
				return false;
		} else if (!lop.equals(other.lop))
			return false;
		if (maSoCoVanHocTap == null) {
			if (other.maSoCoVanHocTap != null)
				return false;
		} else if (!maSoCoVanHocTap.equals(other.maSoCoVanHocTap))
			return false;
		if (moTa == null) {
			if (other.moTa != null)
				return false;
		} else if (!moTa.equals(other.moTa))
			return false;
		if (ngayBD == null) {
			if (other.ngayBD != null)
				return false;
		} else if (!ngayBD.equals(other.ngayBD))
			return false;
		if (ngayKT == null) {
			if (other.ngayKT != null)
				return false;
		} else if (!ngayKT.equals(other.ngayKT))
			return false;
		if (tenSoCoVanHocTap == null) {
			if (other.tenSoCoVanHocTap != null)
				return false;
		} else if (!tenSoCoVanHocTap.equals(other.tenSoCoVanHocTap))
			return false;
		if (thoiGianCapNhat == null) {
			if (other.thoiGianCapNhat != null)
				return false;
		} else if (!thoiGianCapNhat.equals(other.thoiGianCapNhat))
			return false;
		return true;
	}




	@Override
	public String toString() {
		return "SoCoVanHocTap [maSoCoVanHocTap=" + maSoCoVanHocTap + ", tenSoCoVanHocTap=" + tenSoCoVanHocTap + ", lop="
				+ lop + ", ngayBD=" + ngayBD + ", ngayKT=" + ngayKT + ", moTa=" + moTa + ", ghiChu=" + ghiChu
				+ ", thoiGianCapNhat=" + thoiGianCapNhat + "]";
	}




	@Override
	public int compareTo(SoCoVanHocTap o) {
		return this.maSoCoVanHocTap.compareTo(o.maSoCoVanHocTap);
	}
	
}
