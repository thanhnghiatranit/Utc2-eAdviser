package eAdviser.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Type;

import eCore.model.SinhVien;

@Entity
public class ThongTinSinhVien implements Comparable<ThongTinSinhVien>{
	@Id
	public	String maThongTinSinhVien;
	public	String doiTuongChinhSach;
	public	String canBoLop;
	public	String email;
	public	String dienThoaiDiDong;
	public	String dienThoaiGiaDinh;
	public	String diaChiBaoTin;
	@Type(type="text")
	public	String moTa;
	@Type(type="text")
	public	String ghiChu;
	@OneToOne
	public	SinhVien sinhVien;
	@ManyToOne
	public	SoCoVanHocTap soCoVanHocTap;
	public	Date thoiGianCapNhat;

	public ThongTinSinhVien() {
	}

	
	public ThongTinSinhVien(String maThongTinSinhVien, String doiTuongChinhSach, String canBoLop, String email,
			String dienThoaiDiDong, String dienThoaiGiaDinh, String diaChiBaoTin, String moTa, String ghiChu,
			SinhVien sinhVien, SoCoVanHocTap soCoVanHocTap, Date thoiGianCapNhat) {
		this.maThongTinSinhVien = maThongTinSinhVien;
		this.doiTuongChinhSach = doiTuongChinhSach;
		this.canBoLop = canBoLop;
		this.email = email;
		this.dienThoaiDiDong = dienThoaiDiDong;
		this.dienThoaiGiaDinh = dienThoaiGiaDinh;
		this.diaChiBaoTin = diaChiBaoTin;
		this.moTa = moTa;
		this.ghiChu = ghiChu;
		this.sinhVien = sinhVien;
		this.soCoVanHocTap = soCoVanHocTap;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}


	public String getMaThongTinSinhVien() {
		return maThongTinSinhVien;
	}


	public void setMaThongTinSinhVien(String maThongTinSinhVien) {
		this.maThongTinSinhVien = maThongTinSinhVien;
	}


	public String getDoiTuongChinhSach() {
		return doiTuongChinhSach;
	}


	public void setDoiTuongChinhSach(String doiTuongChinhSach) {
		this.doiTuongChinhSach = doiTuongChinhSach;
	}


	public String getCanBoLop() {
		return canBoLop;
	}


	public void setCanBoLop(String canBoLop) {
		this.canBoLop = canBoLop;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getDienThoaiDiDong() {
		return dienThoaiDiDong;
	}


	public void setDienThoaiDiDong(String dienThoaiDiDong) {
		this.dienThoaiDiDong = dienThoaiDiDong;
	}


	public String getDienThoaiGiaDinh() {
		return dienThoaiGiaDinh;
	}


	public void setDienThoaiGiaDinh(String dienThoaiGiaDinh) {
		this.dienThoaiGiaDinh = dienThoaiGiaDinh;
	}


	public String getDiaChiBaoTin() {
		return diaChiBaoTin;
	}


	public void setDiaChiBaoTin(String diaChiBaoTin) {
		this.diaChiBaoTin = diaChiBaoTin;
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
		result = prime * result + ((canBoLop == null) ? 0 : canBoLop.hashCode());
		result = prime * result + ((diaChiBaoTin == null) ? 0 : diaChiBaoTin.hashCode());
		result = prime * result + ((dienThoaiDiDong == null) ? 0 : dienThoaiDiDong.hashCode());
		result = prime * result + ((dienThoaiGiaDinh == null) ? 0 : dienThoaiGiaDinh.hashCode());
		result = prime * result + ((doiTuongChinhSach == null) ? 0 : doiTuongChinhSach.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((ghiChu == null) ? 0 : ghiChu.hashCode());
		result = prime * result + ((maThongTinSinhVien == null) ? 0 : maThongTinSinhVien.hashCode());
		result = prime * result + ((moTa == null) ? 0 : moTa.hashCode());
		result = prime * result + ((sinhVien == null) ? 0 : sinhVien.hashCode());
		result = prime * result + ((soCoVanHocTap == null) ? 0 : soCoVanHocTap.hashCode());
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
		ThongTinSinhVien other = (ThongTinSinhVien) obj;
		if (canBoLop == null) {
			if (other.canBoLop != null)
				return false;
		} else if (!canBoLop.equals(other.canBoLop))
			return false;
		if (diaChiBaoTin == null) {
			if (other.diaChiBaoTin != null)
				return false;
		} else if (!diaChiBaoTin.equals(other.diaChiBaoTin))
			return false;
		if (dienThoaiDiDong == null) {
			if (other.dienThoaiDiDong != null)
				return false;
		} else if (!dienThoaiDiDong.equals(other.dienThoaiDiDong))
			return false;
		if (dienThoaiGiaDinh == null) {
			if (other.dienThoaiGiaDinh != null)
				return false;
		} else if (!dienThoaiGiaDinh.equals(other.dienThoaiGiaDinh))
			return false;
		if (doiTuongChinhSach == null) {
			if (other.doiTuongChinhSach != null)
				return false;
		} else if (!doiTuongChinhSach.equals(other.doiTuongChinhSach))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (ghiChu == null) {
			if (other.ghiChu != null)
				return false;
		} else if (!ghiChu.equals(other.ghiChu))
			return false;
		if (maThongTinSinhVien == null) {
			if (other.maThongTinSinhVien != null)
				return false;
		} else if (!maThongTinSinhVien.equals(other.maThongTinSinhVien))
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
		return true;
	}


	@Override
	public String toString() {
		return "ThongTinSinhVien [maThongTinSinhVien=" + maThongTinSinhVien + ", doiTuongChinhSach=" + doiTuongChinhSach
				+ ", canBoLop=" + canBoLop + ", email=" + email + ", dienThoaiDiDong=" + dienThoaiDiDong
				+ ", dienThoaiGiaDinh=" + dienThoaiGiaDinh + ", diaChiBaoTin=" + diaChiBaoTin + ", moTa=" + moTa
				+ ", ghiChu=" + ghiChu + ", sinhVien=" + sinhVien + ", soCoVanHocTap=" + soCoVanHocTap
				+ ", thoiGianCapNhat=" + thoiGianCapNhat + "]";
	}


	@Override
	public int compareTo(ThongTinSinhVien o) {
		return this.maThongTinSinhVien.compareTo(o.maThongTinSinhVien);
	}
	
}
