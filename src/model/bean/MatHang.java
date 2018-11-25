package model.bean;

public class MatHang {
	
	
	private String idMH;
	private String tenMH;
	private int soLuong;
	private int giaBan;
	private int giamGia;
	private String moTa;
	
	
	
	public MatHang(String idMH, String tenMH, int soLuong, int giaBan, int giamGia, String moTa) {
		super();
		this.idMH = idMH;
		this.tenMH = tenMH;
		this.soLuong = soLuong;
		this.giaBan = giaBan;
		this.giamGia = giamGia;
		this.moTa = moTa;
	}
	
	
	
	
	public MatHang(String idMH, String tenMH, int giaBan, int giamGia) {
		super();
		this.idMH = idMH;
		this.tenMH = tenMH;
		this.giaBan = giaBan;
		this.giamGia = giamGia;
	}






	public String getMoTa() {
		return moTa;
	}


	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}


	public String getIdMH() {
		return idMH;
	}
	public void setIdMH(String idMH) {
		this.idMH = idMH;
	}
	public MatHang() {
		super();
	}
	public String getTenMH() {
		return tenMH;
	}
	public void setTenMH(String tenMH) {
		this.tenMH = tenMH;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public int getGiaBan() {
		return giaBan;
	}
	public void setGiaBan(int giaBan) {
		this.giaBan = giaBan;
	}
	public int getGiamGia() {
		return giamGia;
	}
	public void setGiamGia(int giamGia) {
		this.giamGia = giamGia;
	}


	@Override
	public String toString() {
		return "MatHang [idMH=" + idMH + ", tenMH=" + tenMH + ", soLuong=" + soLuong + ", giaBan=" + giaBan
				+ ", giamGia=" + giamGia  + ", moTa=" + moTa + "]";
	}
	
	

}
