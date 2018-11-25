package model.bo;

import model.dao.TaiKhoanDAO;

public class TaiKhoanBO {
	TaiKhoanDAO t = new TaiKhoanDAO();
	
	public boolean checkLogin(String tenDangNhap, String matKhau) {
		return t.checkLogin(tenDangNhap, matKhau);
	}
	
	public String checkID(String tenDangNhap) {
		return t.checkID(tenDangNhap);
	}
	
	public String checkName(String tenDangNhap) {
		return t.checkName(tenDangNhap);
	}
}
