package eAdviser.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Type;

import eCore.model.NamHoc;
@Entity
public class BienBanSinhHoatLop implements Comparable<BienBanSinhHoatLop> {

	@Id
	public	String maBienBanSinhHoatLop;
	public	String tenBienBanSinhHoatLop;
	public	String chuTriCuocHop;
	public	String thuKyCuocHop;
	public	String diaDiem;
	public	String thoiGian;
	public	String soLuongThamGia;
	public	String soLuongVang;
	@Type(type="text")
	public	String danhSachVangMat;
	@Type(type="text")
	public	String noiDung;
	@Type(type="text")
	public	String deXuat;
	public	String moTa;
	public	String ghiChu;
	public	Date thoiGianCapNhat;
	@ManyToOne
	public	SoCoVanHocTap soCoVanHocTap;
	

	
	
	
	public BienBanSinhHoatLop() {
	}

	

	public BienBanSinhHoatLop(String maBienBanSinhHoatLop, String tenBienBanSinhHoatLop, String chuTriCuocHop,
			String thuKyCuocHop, String diaDiem, String thoiGian, String soLuongThamGia, String soLuongVang,
			String danhSachVangMat, String noiDung, String deXuat, String moTa, String ghiChu, Date thoiGianCapNhat,
			SoCoVanHocTap soCoVanHocTap) {
		super();
		this.maBienBanSinhHoatLop = maBienBanSinhHoatLop;
		this.tenBienBanSinhHoatLop = tenBienBanSinhHoatLop;
		this.chuTriCuocHop = chuTriCuocHop;
		this.thuKyCuocHop = thuKyCuocHop;
		this.diaDiem = diaDiem;
		this.thoiGian = thoiGian;
		this.soLuongThamGia = soLuongThamGia;
		this.soLuongVang = soLuongVang;
		this.danhSachVangMat = danhSachVangMat;
		this.noiDung = noiDung;
		this.deXuat = deXuat;
		this.moTa = moTa;
		this.ghiChu = ghiChu;
		this.thoiGianCapNhat = thoiGianCapNhat;
		this.soCoVanHocTap = soCoVanHocTap;
	}


	public String getMaBienBanSinhHoatLop() {
		return maBienBanSinhHoatLop;
	}



	public void setMaBienBanSinhHoatLop(String maBienBanSinhHoatLop) {
		this.maBienBanSinhHoatLop = maBienBanSinhHoatLop;
	}



	public String getTenBienBanSinhHoatLop() {
		return tenBienBanSinhHoatLop;
	}



	public void setTenBienBanSinhHoatLop(String tenBienBanSinhHoatLop) {
		this.tenBienBanSinhHoatLop = tenBienBanSinhHoatLop;
	}



	public String getChuTriCuocHop() {
		return chuTriCuocHop;
	}



	public void setChuTriCuocHop(String chuTriCuocHop) {
		this.chuTriCuocHop = chuTriCuocHop;
	}



	public String getThuKyCuocHop() {
		return thuKyCuocHop;
	}



	public void setThuKyCuocHop(String thuKyCuocHop) {
		this.thuKyCuocHop = thuKyCuocHop;
	}



	public String getDiaDiem() {
		return diaDiem;
	}



	public void setDiaDiem(String diaDiem) {
		this.diaDiem = diaDiem;
	}



	public String getThoiGian() {
		return thoiGian;
	}



	public void setThoiGian(String thoiGian) {
		this.thoiGian = thoiGian;
	}



	public String getSoLuongThamGia() {
		return soLuongThamGia;
	}



	public void setSoLuongThamGia(String soLuongThamGia) {
		this.soLuongThamGia = soLuongThamGia;
	}



	public String getSoLuongVang() {
		return soLuongVang;
	}



	public void setSoLuongVang(String soLuongVang) {
		this.soLuongVang = soLuongVang;
	}



	public String getDanhSachVangMat() {
		return danhSachVangMat;
	}



	public void setDanhSachVangMat(String danhSachVangMat) {
		this.danhSachVangMat = danhSachVangMat;
	}



	public String getNoiDung() {
		return noiDung;
	}



	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}



	public String getDeXuat() {
		return deXuat;
	}



	public void setDeXuat(String deXuat) {
		this.deXuat = deXuat;
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
		result = prime * result + ((chuTriCuocHop == null) ? 0 : chuTriCuocHop.hashCode());
		result = prime * result + ((danhSachVangMat == null) ? 0 : danhSachVangMat.hashCode());
		result = prime * result + ((deXuat == null) ? 0 : deXuat.hashCode());
		result = prime * result + ((diaDiem == null) ? 0 : diaDiem.hashCode());
		result = prime * result + ((ghiChu == null) ? 0 : ghiChu.hashCode());
		result = prime * result + ((maBienBanSinhHoatLop == null) ? 0 : maBienBanSinhHoatLop.hashCode());
		result = prime * result + ((moTa == null) ? 0 : moTa.hashCode());
		result = prime * result + ((noiDung == null) ? 0 : noiDung.hashCode());
		result = prime * result + ((soCoVanHocTap == null) ? 0 : soCoVanHocTap.hashCode());
		result = prime * result + ((soLuongThamGia == null) ? 0 : soLuongThamGia.hashCode());
		result = prime * result + ((soLuongVang == null) ? 0 : soLuongVang.hashCode());
		result = prime * result + ((tenBienBanSinhHoatLop == null) ? 0 : tenBienBanSinhHoatLop.hashCode());
		result = prime * result + ((thoiGian == null) ? 0 : thoiGian.hashCode());
		result = prime * result + ((thoiGianCapNhat == null) ? 0 : thoiGianCapNhat.hashCode());
		result = prime * result + ((thuKyCuocHop == null) ? 0 : thuKyCuocHop.hashCode());
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
		BienBanSinhHoatLop other = (BienBanSinhHoatLop) obj;
		if (chuTriCuocHop == null) {
			if (other.chuTriCuocHop != null)
				return false;
		} else if (!chuTriCuocHop.equals(other.chuTriCuocHop))
			return false;
		if (danhSachVangMat == null) {
			if (other.danhSachVangMat != null)
				return false;
		} else if (!danhSachVangMat.equals(other.danhSachVangMat))
			return false;
		if (deXuat == null) {
			if (other.deXuat != null)
				return false;
		} else if (!deXuat.equals(other.deXuat))
			return false;
		if (diaDiem == null) {
			if (other.diaDiem != null)
				return false;
		} else if (!diaDiem.equals(other.diaDiem))
			return false;
		if (ghiChu == null) {
			if (other.ghiChu != null)
				return false;
		} else if (!ghiChu.equals(other.ghiChu))
			return false;
		if (maBienBanSinhHoatLop == null) {
			if (other.maBienBanSinhHoatLop != null)
				return false;
		} else if (!maBienBanSinhHoatLop.equals(other.maBienBanSinhHoatLop))
			return false;
		if (moTa == null) {
			if (other.moTa != null)
				return false;
		} else if (!moTa.equals(other.moTa))
			return false;
		if (noiDung == null) {
			if (other.noiDung != null)
				return false;
		} else if (!noiDung.equals(other.noiDung))
			return false;
		if (soCoVanHocTap == null) {
			if (other.soCoVanHocTap != null)
				return false;
		} else if (!soCoVanHocTap.equals(other.soCoVanHocTap))
			return false;
		if (soLuongThamGia == null) {
			if (other.soLuongThamGia != null)
				return false;
		} else if (!soLuongThamGia.equals(other.soLuongThamGia))
			return false;
		if (soLuongVang == null) {
			if (other.soLuongVang != null)
				return false;
		} else if (!soLuongVang.equals(other.soLuongVang))
			return false;
		if (tenBienBanSinhHoatLop == null) {
			if (other.tenBienBanSinhHoatLop != null)
				return false;
		} else if (!tenBienBanSinhHoatLop.equals(other.tenBienBanSinhHoatLop))
			return false;
		if (thoiGian == null) {
			if (other.thoiGian != null)
				return false;
		} else if (!thoiGian.equals(other.thoiGian))
			return false;
		if (thoiGianCapNhat == null) {
			if (other.thoiGianCapNhat != null)
				return false;
		} else if (!thoiGianCapNhat.equals(other.thoiGianCapNhat))
			return false;
		if (thuKyCuocHop == null) {
			if (other.thuKyCuocHop != null)
				return false;
		} else if (!thuKyCuocHop.equals(other.thuKyCuocHop))
			return false;
		return true;
	}



	@Override
	public String toString() {
		return "BienBanSinhHoatLop [maBienBanSinhHoatLop=" + maBienBanSinhHoatLop + ", tenBienBanSinhHoatLop="
				+ tenBienBanSinhHoatLop + ", chuTriCuocHop=" + chuTriCuocHop + ", thuKyCuocHop=" + thuKyCuocHop
				+ ", diaDiem=" + diaDiem + ", thoiGian=" + thoiGian + ", soLuongThamGia=" + soLuongThamGia
				+ ", soLuongVang=" + soLuongVang + ", danhSachVangMat=" + danhSachVangMat + ", noiDung=" + noiDung
				+ ", deXuat=" + deXuat + ", moTa=" + moTa + ", ghiChu=" + ghiChu + ", thoiGianCapNhat="
				+ thoiGianCapNhat + ", soCoVanHocTap=" + soCoVanHocTap + "]";
	}



	@Override
	public int compareTo(BienBanSinhHoatLop o) {
		return this.maBienBanSinhHoatLop.compareTo(o.maBienBanSinhHoatLop);
	}
	
	
}
