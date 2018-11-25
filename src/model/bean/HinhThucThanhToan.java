package model.bean;

public class HinhThucThanhToan {
	private int maHTTT;
	private String tenHTTT;

	

	public HinhThucThanhToan(int maHTTT, String tenHTTT) {
		super();
		this.maHTTT = maHTTT;
		this.tenHTTT = tenHTTT;
	}
	
	

	public int getMaHTTT() {
		return maHTTT;
	}



	public void setMaHTTT(int maHTTT) {
		this.maHTTT = maHTTT;
	}



	public String getTenHTTT() {
		return tenHTTT;
	}

	public void setTenHTTT(String tenHTTT) {
		this.tenHTTT = tenHTTT;
	}



	@Override
	public String toString() {
		return "HinhThucThanhToan [maHTTT=" + maHTTT + ", tenHTTT=" + tenHTTT + "]";
	}

	
	

}
