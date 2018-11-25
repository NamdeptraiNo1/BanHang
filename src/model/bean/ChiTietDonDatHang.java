package model.bean;

public class ChiTietDonDatHang {
	private String idDDh;
	private String idMH;
	private int soLuong;
	private int gia;
	public ChiTietDonDatHang(String idDDh, String idMH, int soLuong, int gia) {
		super();
		this.idDDh = idDDh;
		this.idMH = idMH;
		this.soLuong = soLuong;
		this.gia = gia;
	}
	public String getIdDDh() {
		return idDDh;
	}
	public void setIdDDh(String idDDh) {
		this.idDDh = idDDh;
	}
	public String getIdMH() {
		return idMH;
	}
	public void setIdMH(String idMH) {
		this.idMH = idMH;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	@Override
	public String toString() {
		return "ChiTietDonDatHang [idDDh=" + idDDh + ", idMH=" + idMH + ", soLuong=" + soLuong + ", gia=" + gia + "]";
	}
	
	

}
