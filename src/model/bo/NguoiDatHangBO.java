package model.bo;

import java.util.ArrayList;

import model.bean.NguoiDatHang;
import model.dao.NguoiDatHangDAO;

public class NguoiDatHangBO {
	NguoiDatHangDAO n = new NguoiDatHangDAO();
	
	public ArrayList<NguoiDatHang> getNDH(String idTK) {
		return n.getNDH(idTK);
	}
	
	public void themNDH(String hoTen, String daiChi, String sDT, String idTK) {
		n.themNDH(hoTen, daiChi, sDT, idTK);
	}
	
	public NguoiDatHang nguoiDatHang(String idNDH) {
		return n.nguoiDatHang(idNDH);
	}
	
	public void xoaNDH(String idNDH) {
		n.xoaNDH(idNDH);
	}
	
	public void updateNDH(String idNDH ,String hoTen, String daiChi, String sDT) {
		n.updateNDH(idNDH, hoTen, daiChi, sDT);
	}

}
