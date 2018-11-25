package model.bo;

import java.util.ArrayList;

import model.bean.MatHang;
import model.dao.MatHangDAO;

public class MatHangBO {
	MatHangDAO mhDAO = new MatHangDAO();
	
	public ArrayList<MatHang> getMatHang() {
		return mhDAO.getMatHang();
	}
	
	public byte[] getImageData(String id) {
		return mhDAO.getImageData(id);
	}
	
	public MatHang getSanPham(String id) {
		return mhDAO.getSanPham(id);
	}

}
