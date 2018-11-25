package model.bean;

public class NhaCungCap {
	private String tenNCC;
	private String daiChiNCC;
	public NhaCungCap(String tenNCC, String daiChiNCC) {
		super();
		this.tenNCC = tenNCC;
		this.daiChiNCC = daiChiNCC;
	}
	public NhaCungCap() {
		super();
	}
	public String getTenNCC() {
		return tenNCC;
	}
	public void setTenNCC(String tenNCC) {
		this.tenNCC = tenNCC;
	}
	public String getDaiChiNCC() {
		return daiChiNCC;
	}
	public void setDaiChiNCC(String daiChiNCC) {
		this.daiChiNCC = daiChiNCC;
	}
	
	
}
