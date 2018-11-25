package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.ChiTietDonDatHang;
import model.bean.DonDatHang;
import model.bean.MatHang;
import model.bo.ChiTietDonDatHangBO;
import model.bo.DonDatHangBO;
import model.bo.MatHangBO;
import model.bo.NguoiDatHangBO;
import model.bo.TaiKhoanBO;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		TaiKhoanBO t = new TaiKhoanBO();
		String idTK = t.checkID((String)session.getAttribute("tenDangNhap"));
		//xem đơn đặt hàng
		if("QLDH".equals(request.getParameter("key"))) {
			DonDatHangBO d = new DonDatHangBO();
			request.setAttribute("listDH",  d.getDonDatHang(idTK));
			
		}
		//xem chi tiết đơn hàng
		if(request.getParameter("idDDH") != null) {
			DonDatHangBO d = new DonDatHangBO();
			MatHangBO m = new MatHangBO();
			if("HUY".equals(request.getParameter("key"))) {
				d.updateTrangThai(request.getParameter("idDDH"));
			}
			DonDatHang dDH = d.donDatHang(request.getParameter("idDDH"));
			ArrayList<ChiTietDonDatHang> cTDH =  new ChiTietDonDatHangBO().getChiTietDonDatHang(dDH.getIdDDH());
			ArrayList<MatHang> listMH = new ArrayList<>();
			
			for (ChiTietDonDatHang a : cTDH) {
				listMH.add(m.getSanPham(a.getIdMH()));
			}
			request.setAttribute("tMH", listMH);
			request.setAttribute("idDDH", dDH.getIdDDH());
			request.setAttribute("cTDH",cTDH);
			request.setAttribute("tH", dDH.getTrangThai());
			request.setAttribute("nDH", new NguoiDatHangBO().nguoiDatHang(dDH.getIdNDH()));
		}
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/user_donhangcuatoi.jsp");
		rd.forward(request, response);
		
	}

}
