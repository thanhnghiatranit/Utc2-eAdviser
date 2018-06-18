package eCore.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Type;

@Entity
public class ChucNang implements Comparable<ChucNang> {
	@Id
	public String maChucNang; // NOT Auto => System.getCrrent...
	public String tenHienThi;
	public String duongDan;
	public String hinhAnh;
	@Type(type = "text")
	public String moTa;
	@Type(type = "text")
	public String ghiChu;
	@ManyToOne(fetch = FetchType.EAGER)
	public ChucNang ChucNangCha;
	public Date thoiGianCapNhat;

	@ManyToMany(mappedBy = "chucNangs", fetch = FetchType.EAGER)
	public Set<NhomPhanQuyen> nhomPhanQuyens = new HashSet<>();

	public ChucNang() {
	}

	public ChucNang(String maChucNang, String tenHienThi, String duongDan, String hinhAnh, String moTa, String ghiChu,
			ChucNang ChucNangCha, Date thoiGianCapNhat) {
		this.maChucNang = maChucNang;
		this.tenHienThi = tenHienThi;
		this.duongDan = duongDan;
		this.hinhAnh = hinhAnh;
		this.moTa = moTa;
		this.ghiChu = ghiChu;
		this.ChucNangCha = ChucNangCha;
		this.thoiGianCapNhat = thoiGianCapNhat;
	}

	public String getMaChucNang() {
		return maChucNang;
	}

	public void setMaChucNang(String maChucNang) {
		this.maChucNang = maChucNang;
	}

	public String getTenHienThi() {
		return tenHienThi;
	}

	public void setTenHienThi(String tenHienThi) {
		this.tenHienThi = tenHienThi;
	}

	public String getDuongDan() {
		return duongDan;
	}

	public void setDuongDan(String duongDan) {
		this.duongDan = duongDan;
	}

	public String getHinhAnh() {
		return hinhAnh;
	}

	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
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

	public ChucNang getChucNangCha() {
		return ChucNangCha;
	}

	public void setChucNangCha(ChucNang ChucNangCha) {
		this.ChucNangCha = ChucNangCha;
	}

	public Date getThoiGianCapNhat() {
		return thoiGianCapNhat;
	}

	public void setThoiGianCapNhat(Date thoiGianCapNhat) {
		this.thoiGianCapNhat = thoiGianCapNhat;
	}

	

	@Override
	public String toString() {
		return "ChucNang [maChucNang=" + maChucNang + ", tenHienThi=" + tenHienThi + ", duongDan=" + duongDan
				+ ", hinhAnh=" + hinhAnh + ", moTa=" + moTa + ", ghiChu=" + ghiChu + ", ChucNangCha=" + ChucNangCha
				+ ", thoiGianCapNhat=" + thoiGianCapNhat + "]";
	}

	@Override
	public int compareTo(ChucNang o) {
		return this.maChucNang.compareTo(o.maChucNang);
	}

}
