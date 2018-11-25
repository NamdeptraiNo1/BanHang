package model.bean;

public class GioHang {
	
	private String idMH;
	private int soLuong;
	private int idTK;
	private int gia;
	
	public GioHang(String idMH, int soLuong, int idTK, int gia) {
		super();
		this.idMH = idMH;
		this.soLuong = soLuong;
		this.idTK = idTK;
		this.gia = gia;
	}
	
	public GioHang(String idMH, int soLuong, int gia) {
		super();
		this.idMH = idMH;
		this.soLuong = soLuong;
		this.gia = gia;
	}

	public GioHang() {
		super();
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
	public int getIdTK() {
		return idTK;
	}
	public void setIdTK(int idTK) {
		this.idTK = idTK;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	@Override
	public String toString() {
		return "GioHang [idMH=" + idMH + ", soLuong=" + soLuong  + ", idTK=" + idTK
				+ ", gia=" + gia + "]";
	}
	
	
	
	
	
	
	

}
