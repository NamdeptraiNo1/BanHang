package model.bo;

import java.util.ArrayList;

import model.bean.ChiTietDonDatHang;
import model.dao.ChiTietDonDatHangDAO;

public class ChiTietDonDatHangBO {
	ChiTietDonDatHangDAO c = new ChiTietDonDatHangDAO();
	
	public void themChiTietDonDatHang(String idDDH,String idMH,int soLuong,int gia) {
		c.themChiTietDonDatHang(idDDH, idMH, soLuong, gia);
	}
	public ArrayList<ChiTietDonDatHang> getChiTietDonDatHang(String idDDH) {
		return c.getChiTietDonDatHang(idDDH);
	}

}
