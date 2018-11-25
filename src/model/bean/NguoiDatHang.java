package model.bean;

public class NguoiDatHang {
	private int idNDH;
	private String tenNDH;
	private String diaChi;
	private String sDT;
	
	public NguoiDatHang(int idNDH, String tenNDH, String diaChi, String sDT) {
		super();
		this.idNDH = idNDH;
		this.tenNDH = tenNDH;
		this.diaChi = diaChi;
		this.sDT = sDT;
	}
	public NguoiDatHang() {
		super();
	}
	public int getIdNDH() {
		return idNDH;
	}
	public void setIdNDH(int idNDH) {
		this.idNDH = idNDH;
	}
	public String getTenNDH() {
		return tenNDH;
	}
	public void setTenNDH(String tenNDH) {
		this.tenNDH = tenNDH;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String getsDT() {
		return sDT;
	}
	public void setsDT(String sDT) {
		this.sDT = sDT;
	}
	@Override
	public String toString() {
		return "NguoiDatHang [idNDH=" + idNDH + ", tenNDH=" + tenNDH + ", diaChi=" + diaChi + ", sDT=" + sDT + "]";
	}
	
	
	
	

}
