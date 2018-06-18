package eAdviser.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import eCore.model.NamHoc;
import eCore.model.SinhVien;

@Entity
public class ThongTinSinhVienKhoKhan implements Comparable<ThongTinSinhVienKhoKhan> {

	@Id
	public	String maThongTinSinhVienKhoKhan;
	
	public	String hoanCanhGiaDinh;
	public	String lyDo;
	public String deXuat;
	public Date thoiGianGhiNhan;
	public	String moTa;
	public	String ghiChu;
	public	Date thoiGianCapNhat;
	@ManyToOne
	public	SoCoVanHocTap soCoVanHocTap;
	@ManyToOne
	public	SinhVien sinhVien;
	public ThongTinSinhVienKhoKhan() {
	}

	public ThongTinSinhVienKhoKhan(String maThongTinSinhVienKhoKhan, SinhVien sinhVien, String hoanCanhGiaDinh,
			String lyDo, String deXuat, Date thoiGianGhiNhan, String moTa, String ghiChu, Date thoiGianCapNhat,
			SoCoVanHocTap soCoVanHocTap) {
		this.maThongTinSinhVienKhoKhan = maThongTinSinhVienKhoKhan;
		this.sinhVien = sinhVien;
		this.hoanCanhGiaDinh = hoanCanhGiaDinh;
		this.lyDo = lyDo;
		this.deXuat = deXuat;
		this.thoiGianGhiNhan = thoiGianGhiNhan;
		this.moTa = moTa;
		this.ghiChu = ghiChu;
		this.thoiGianCapNhat = thoiGianCapNhat;
		this.soCoVanHocTap = soCoVanHocTap;
	}

	public String getMaThongTinSinhVienKhoKhan() {
		return maThongTinSinhVienKhoKhan;
	}

	public void setMaThongTinSinhVienKhoKhan(String maThongTinSinhVienKhoKhan) {
		this.maThongTinSinhVienKhoKhan = maThongTinSinhVienKhoKhan;
	}

	public SinhVien getSinhVien() {
		return sinhVien;
	}

	public void setSinhVien(SinhVien sinhVien) {
		this.sinhVien = sinhVien;
	}

	public String getHoanCanhGiaDinh() {
		return hoanCanhGiaDinh;
	}

	public void setHoanCanhGiaDinh(String hoanCanhGiaDinh) {
		this.hoanCanhGiaDinh = hoanCanhGiaDinh;
	}

	public String getLyDo() {
		return lyDo;
	}

	public void setLyDo(String lyDo) {
		this.lyDo = lyDo;
	}

	public String getDeXuat() {
		return deXuat;
	}

	public void setDeXuat(String deXuat) {
		this.deXuat = deXuat;
	}

	public Date getThoiGianGhiNhan() {
		return thoiGianGhiNhan;
	}

	public void setThoiGianGhiNhan(Date thoiGianGhiNhan) {
		this.thoiGianGhiNhan = thoiGianGhiNhan;
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
		result = prime * result + ((deXuat == null) ? 0 : deXuat.hashCode());
		result = prime * result + ((ghiChu == null) ? 0 : ghiChu.hashCode());
		result = prime * result + ((hoanCanhGiaDinh == null) ? 0 : hoanCanhGiaDinh.hashCode());
		result = prime * result + ((lyDo == null) ? 0 : lyDo.hashCode());
		result = prime * result + ((maThongTinSinhVienKhoKhan == null) ? 0 : maThongTinSinhVienKhoKhan.hashCode());
		result = prime * result + ((moTa == null) ? 0 : moTa.hashCode());
		result = prime * result + ((sinhVien == null) ? 0 : sinhVien.hashCode());
		result = prime * result + ((soCoVanHocTap == null) ? 0 : soCoVanHocTap.hashCode());
		result = prime * result + ((thoiGianCapNhat == null) ? 0 : thoiGianCapNhat.hashCode());
		result = prime * result + ((thoiGianGhiNhan == null) ? 0 : thoiGianGhiNhan.hashCode());
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
		ThongTinSinhVienKhoKhan other = (ThongTinSinhVienKhoKhan) obj;
		if (deXuat == null) {
			if (other.deXuat != null)
				return false;
		} else if (!deXuat.equals(other.deXuat))
			return false;
		if (ghiChu == null) {
			if (other.ghiChu != null)
				return false;
		} else if (!ghiChu.equals(other.ghiChu))
			return false;
		if (hoanCanhGiaDinh == null) {
			if (other.hoanCanhGiaDinh != null)
				return false;
		} else if (!hoanCanhGiaDinh.equals(other.hoanCanhGiaDinh))
			return false;
		if (lyDo == null) {
			if (other.lyDo != null)
				return false;
		} else if (!lyDo.equals(other.lyDo))
			return false;
		if (maThongTinSinhVienKhoKhan == null) {
			if (other.maThongTinSinhVienKhoKhan != null)
				return false;
		} else if (!maThongTinSinhVienKhoKhan.equals(other.maThongTinSinhVienKhoKhan))
			return false;
		if (moTa == null) {
			if (other.moTa != null)
				return false;
		} else if (!moTa.equals(other.moTa))
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
		if (thoiGianGhiNhan == null) {
			if (other.thoiGianGhiNhan != null)
				return false;
		} else if (!thoiGianGhiNhan.equals(other.thoiGianGhiNhan))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ThongTinSinhVienKhoKhan [maThongTinSinhVienKhoKhan=" + maThongTinSinhVienKhoKhan + ", sinhVien="
				+ sinhVien + ", hoanCanhGiaDinh=" + hoanCanhGiaDinh + ", lyDo=" + lyDo + ", deXuat=" + deXuat
				+ ", thoiGianGhiNhan=" + thoiGianGhiNhan + ", moTa=" + moTa + ", ghiChu=" + ghiChu
				+ ", thoiGianCapNhat=" + thoiGianCapNhat + ", soCoVanHocTap=" + soCoVanHocTap + "]";
	}

	@Override
	public int compareTo(ThongTinSinhVienKhoKhan o) {
		return this.maThongTinSinhVienKhoKhan.compareTo(o.maThongTinSinhVienKhoKhan);
	}

	
}
