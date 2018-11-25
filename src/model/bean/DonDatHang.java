package model.bean;

public class DonDatHang {
	private String idDDH;
	private String idNDH;
	private String ngayDat;
	private String tongTien;
	private String trangThai;
	private String idHTTT;
	public DonDatHang(String idDDH, String idNDH, String ngayDat, String tongTien, String trangThai, String idHTTT) {
		super();
		this.idDDH = idDDH;
		this.idNDH = idNDH;
		this.ngayDat = ngayDat;
		this.tongTien = tongTien;
		this.trangThai = trangThai;
		this.idHTTT = idHTTT;
	}
	public String getIdDDH() {
		return idDDH;
	}
	public void setIdDDH(String idDDH) {
		this.idDDH = idDDH;
	}
	public String getIdNDH() {
		return idNDH;
	}
	public void setIdNDH(String idNDH) {
		this.idNDH = idNDH;
	}
	public String getNgayDat() {
		return ngayDat;
	}
	public void setNgayDat(String ngayDat) {
		this.ngayDat = ngayDat;
	}
	public String getTongTien() {
		return tongTien;
	}
	public void setTongTien(String tongTien) {
		this.tongTien = tongTien;
	}
	public String getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}
	public String getIdHTTT() {
		return idHTTT;
	}
	public void setIdHTTT(String idHTTT) {
		this.idHTTT = idHTTT;
	}
	@Override
	public String toString() {
		return "DonDatHang [idDDH=" + idDDH + ", idNDH=" + idNDH + ", ngayDat=" + ngayDat + ", tongTien=" + tongTien
				+ ", trangThai=" + trangThai + ", idHTTT=" + idHTTT + "]";
	}
	
	
	

}
