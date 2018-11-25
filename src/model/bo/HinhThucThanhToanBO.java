package model.bo;

import java.util.ArrayList;

import model.bean.HinhThucThanhToan;
import model.dao.HinhThucThanhToanDAO;

public class HinhThucThanhToanBO {
	HinhThucThanhToanDAO h = new HinhThucThanhToanDAO();
	
	public ArrayList<HinhThucThanhToan> getHTTT() {
		return h.getHTTT();
	}
}
