package model.bean;

public class TaiKhoan {
	private String tenTK;
	private String matKhauTK;
	private int loaiTK;
	private String hoTen;
	public TaiKhoan(String tenTK, String matKhauTK, int loaiTK) {
		super();
		this.tenTK = tenTK;
		this.matKhauTK = matKhauTK;
		this.loaiTK = loaiTK;
	}
	
	
	public TaiKhoan(String tenTK, String matKhauTK, int loaiTK, String hoTen) {
		super();
		this.tenTK = tenTK;
		this.matKhauTK = matKhauTK;
		this.loaiTK = loaiTK;
		this.hoTen = hoTen;
	}


	public String getHoTen() {
		return hoTen;
	}


	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}


	public TaiKhoan() {
		super();
	}
	public String getTenTK() {
		return tenTK;
	}
	public void setTenTK(String tenTK) {
		this.tenTK = tenTK;
	}
	public String getMatKhauTK() {
		return matKhauTK;
	}
	public void setMatKhauTK(String matKhauTK) {
		this.matKhauTK = matKhauTK;
	}
	public int getLoaiTK() {
		return loaiTK;
	}
	public void setLoaiTK(int loaiTK) {
		this.loaiTK = loaiTK;
	}
	
	

}
