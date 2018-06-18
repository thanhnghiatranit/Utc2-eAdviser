package eAdviser.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Type;

import eCore.model.NamHoc;

@Entity
public class BaoCaoTinhHinhLop implements Comparable<BaoCaoTinhHinhLop> {

	@Id
	public	String maBaoCaoTinhHinhLop;
	public	String tenBaoCaoTinhHinhLop;
	public	String hocKy;
	public	String namHoc;
	public	int soSinhVienTrongLop;
	@Type(type = "text")
	public	String tinhHinhChung;
	@Type(type = "text")
	public	String tuTuongChinhTri;
	@Type(type = "text")
	public	String ketQuaHocTap;
	@Type(type = "text")
	public	String ketQuaRenLuyen;
	@Type(type = "text")
	public String ketQuaCacHoatDongKhac;
	@Type(type = "text")
	public	String kienNghiDeXuat;
	@ManyToOne
	public	CoVanHocTap coVanHocTap;
	@ManyToOne
	public	SoCoVanHocTap soCoVanHocTap;
	@Type(type = "text")
	public	String moTa;
	@Type(type = "text")
	public	String ghiChu;
	public	Date thoiGianCapNhat;

	public BaoCaoTinhHinhLop() {
	}

	public String getMaBaoCaoTinhHinhLop() {
		return maBaoCaoTinhHinhLop;
	}

	public void setMaBaoCaoTinhHinhLop(String maBaoCaoTinhHinhLop) {
		this.maBaoCaoTinhHinhLop = maBaoCaoTinhHinhLop;
	}

	public String getTenBaoCaoTinhHinhLop() {
		return tenBaoCaoTinhHinhLop;
	}

	public void setTenBaoCaoTinhHinhLop(String tenBaoCaoTinhHinhLop) {
		this.tenBaoCaoTinhHinhLop = tenBaoCaoTinhHinhLop;
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

	public int getSoSinhVienTrongLop() {
		return soSinhVienTrongLop;
	}

	public void setSoSinhVienTrongLop(int soSinhVienTrongLop) {
		this.soSinhVienTrongLop = soSinhVienTrongLop;
	}

	public String getTinhHinhChung() {
		return tinhHinhChung;
	}

	public void setTinhHinhChung(String tinhHinhChung) {
		this.tinhHinhChung = tinhHinhChung;
	}

	public String getTuTuongChinhTri() {
		return tuTuongChinhTri;
	}

	public void setTuTuongChinhTri(String tuTuongChinhTri) {
		this.tuTuongChinhTri = tuTuongChinhTri;
	}

	public String getKetQuaHocTap() {
		return ketQuaHocTap;
	}

	public void setKetQuaHocTap(String ketQuaHocTap) {
		this.ketQuaHocTap = ketQuaHocTap;
	}

	public String getKetQuaRenLuyen() {
		return ketQuaRenLuyen;
	}

	public void setKetQuaRenLuyen(String ketQuaRenLuyen) {
		this.ketQuaRenLuyen = ketQuaRenLuyen;
	}

	public String getKetQuaCacHoatDongKhac() {
		return ketQuaCacHoatDongKhac;
	}

	public void setKetQuaCacHoatDongKhac(String ketQuaCacHoatDongKhac) {
		this.ketQuaCacHoatDongKhac = ketQuaCacHoatDongKhac;
	}

	public String getKienNghiDeXuat() {
		return kienNghiDeXuat;
	}

	public void setKienNghiDeXuat(String kienNghiDeXuat) {
		this.kienNghiDeXuat = kienNghiDeXuat;
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
		result = prime * result + ((hocKy == null) ? 0 : hocKy.hashCode());
		result = prime * result + ((ketQuaCacHoatDongKhac == null) ? 0 : ketQuaCacHoatDongKhac.hashCode());
		result = prime * result + ((ketQuaHocTap == null) ? 0 : ketQuaHocTap.hashCode());
		result = prime * result + ((ketQuaRenLuyen == null) ? 0 : ketQuaRenLuyen.hashCode());
		result = prime * result + ((kienNghiDeXuat == null) ? 0 : kienNghiDeXuat.hashCode());
		result = prime * result + ((maBaoCaoTinhHinhLop == null) ? 0 : maBaoCaoTinhHinhLop.hashCode());
		result = prime * result + ((moTa == null) ? 0 : moTa.hashCode());
		result = prime * result + ((namHoc == null) ? 0 : namHoc.hashCode());
		result = prime * result + ((soCoVanHocTap == null) ? 0 : soCoVanHocTap.hashCode());
		result = prime * result + soSinhVienTrongLop;
		result = prime * result + ((tenBaoCaoTinhHinhLop == null) ? 0 : tenBaoCaoTinhHinhLop.hashCode());
		result = prime * result + ((thoiGianCapNhat == null) ? 0 : thoiGianCapNhat.hashCode());
		result = prime * result + ((tinhHinhChung == null) ? 0 : tinhHinhChung.hashCode());
		result = prime * result + ((tuTuongChinhTri == null) ? 0 : tuTuongChinhTri.hashCode());
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
		BaoCaoTinhHinhLop other = (BaoCaoTinhHinhLop) obj;
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
		if (ketQuaCacHoatDongKhac == null) {
			if (other.ketQuaCacHoatDongKhac != null)
				return false;
		} else if (!ketQuaCacHoatDongKhac.equals(other.ketQuaCacHoatDongKhac))
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
		if (kienNghiDeXuat == null) {
			if (other.kienNghiDeXuat != null)
				return false;
		} else if (!kienNghiDeXuat.equals(other.kienNghiDeXuat))
			return false;
		if (maBaoCaoTinhHinhLop == null) {
			if (other.maBaoCaoTinhHinhLop != null)
				return false;
		} else if (!maBaoCaoTinhHinhLop.equals(other.maBaoCaoTinhHinhLop))
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
		if (soSinhVienTrongLop != other.soSinhVienTrongLop)
			return false;
		if (tenBaoCaoTinhHinhLop == null) {
			if (other.tenBaoCaoTinhHinhLop != null)
				return false;
		} else if (!tenBaoCaoTinhHinhLop.equals(other.tenBaoCaoTinhHinhLop))
			return false;
		if (thoiGianCapNhat == null) {
			if (other.thoiGianCapNhat != null)
				return false;
		} else if (!thoiGianCapNhat.equals(other.thoiGianCapNhat))
			return false;
		if (tinhHinhChung == null) {
			if (other.tinhHinhChung != null)
				return false;
		} else if (!tinhHinhChung.equals(other.tinhHinhChung))
			return false;
		if (tuTuongChinhTri == null) {
			if (other.tuTuongChinhTri != null)
				return false;
		} else if (!tuTuongChinhTri.equals(other.tuTuongChinhTri))
			return false;
		return true;
	}

	public BaoCaoTinhHinhLop(String maBaoCaoTinhHinhLop, String tenBaoCaoTinhHinhLop, String hocKy, String namHoc,
			int soSinhVienTrongLop, String tinhHinhChung, String tuTuongChinhTri, String ketQuaHocTap,
			String ketQuaRenLuyen, String ketQuaCacHoatDongKhac, String kienNghiDeXuat, CoVanHocTap coVanHocTap,
			SoCoVanHocTap soCoVanHocTap, String moTa, String ghiChu, Date thoiGianCapNhat) {
		super();
		this.maBaoCaoTinhHinhLop = maBaoCaoTinhHinhLop;
		this.tenBaoCaoTinhHinhLop = tenBaoCaoTinhHinhLop;
		this.hocKy = hocKy;
		this.namHoc = namHoc;
		this.soSinhVienTrongLop = soSinhVienTrongLop;
		this.tinhHinhChung = tinhHinhChung;
		this.tuTuongChinhTri = tuTuongChinhTri;
		this.ketQuaHocTap = ketQuaHocTap;
		this.ketQuaRenLuyen = ketQuaRenLuyen;
		this.ketQuaCacHoatDongKhac = ketQuaCacHoatDongKhac;
		this.kienNghiDeXuat = kienNghiDeXuat;
		this.coVanHocTap = coVanHocTap;
		this.soCoVanHocTap = soCoVanHocTap;
		this.moTa = moTa;
		this.ghiChu = ghiChu;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}

	@Override
	public int compareTo(BaoCaoTinhHinhLop o) {
		return this.maBaoCaoTinhHinhLop.compareTo(o.maBaoCaoTinhHinhLop);
	}

}
