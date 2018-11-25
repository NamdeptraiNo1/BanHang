package model.bo;

import java.util.ArrayList;

import model.bean.DonDatHang;
import model.dao.DonDatHangDAO;

public class DonDatHangBO {
	DonDatHangDAO d = new DonDatHangDAO();
	
	public void themDonDatHang(String idDDH,String idNDH,String ngayDat,int tongTien, String trangThai, String idHTTT) {
		d.themDonDatHang(idDDH, idNDH, ngayDat, tongTien, trangThai, idHTTT);
	}
	
	public ArrayList<DonDatHang> getDonDatHang(String idTK) {
		return d.getDonDatHang(idTK);
	}
	
	public DonDatHang donDatHang(String idDDH) {
		return d.donDatHang(idDDH);
	}
	
	public void updateTrangThai(String idDDH) {
		d.updateTrangThai(idDDH);
	}
	
}
