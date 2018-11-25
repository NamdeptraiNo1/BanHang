package model.bo;

import java.util.ArrayList;

import model.bean.GioHang;
import model.dao.GioHangDAO;

public class GioHangBO {
	GioHangDAO g = new GioHangDAO();
	
	public ArrayList<GioHang> getGioHang(String id) {
		return g.getGioHang(id);
	}
	public void themGioHang(String idmh,int SoLuong,int idTK,int Gia) {
		g.themGioHang(idmh, SoLuong, idTK, Gia);
	}
	
	public void xoaGioHang(String idMH, String idTK) {
		g.xoaGioHang(idMH, idTK);
	}
	
	public boolean chekGioHang(String idMH, String idTK) {
		return g.chekGioHang(idMH, idTK);
	}
	
	public int soLuongGH(String idTK) {
		return g.soLuongGH(idTK);
	}
	
	public void updateSL(String idMH, int soLuong ,int gia ) {
		g.updateSL(idMH, soLuong, gia);
	}
	
	/*public boolean ktGioHang(String maMH) {
		return g.ktGioHang(maMH);
	}*/
}
