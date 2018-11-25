package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.NguoiDatHang;
import model.bo.NguoiDatHangBO;
import model.bo.TaiKhoanBO;

/**
 * Servlet implementation class DiaChiDatHangServlet
 */
@WebServlet("/DiaChiDatHangServlet")
public class DiaChiDatHangServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiaChiDatHangServlet() {
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
		NguoiDatHangBO b = new NguoiDatHangBO();
		TaiKhoanBO t = new TaiKhoanBO();
		String idTK = t.checkID((String)session.getAttribute("tenDangNhap"));
		
		if("THEMDIACHI".equals(request.getParameter("id"))) {
			String hoTen = request.getParameter("hoTen");
			String dienThoai = request.getParameter("dienThoai");
			String tinhThanhPho = request.getParameter("tinhThanhPho");
			String quanHuyen = request.getParameter("quanHuyen");
			String phuongXa = request.getParameter("phuongXa");
			String daiChi = request.getParameter("daiChi");
			b.themNDH(hoTen, daiChi+","+phuongXa+","+quanHuyen+","+tinhThanhPho, dienThoai, idTK);
		}
		
		if("XEMDIACHI".equals(request.getParameter("key"))) {
			NguoiDatHang a = b.nguoiDatHang(request.getParameter("idNDH"));
			String dc[] = a.getDiaChi().split(",");
			String tinhThanhPho = dc[dc.length-1];
			String quanHuyen = dc[dc.length-2];
			String phuongXa = dc[dc.length-3];
			String diaChi = "";
			for (int i = 0; i < dc.length-3; i++) {
				diaChi += dc[i]+" ";
			}
			request.setAttribute("hoTen", a.getTenNDH());
			request.setAttribute("dienThoai", a.getsDT());
			request.setAttribute("tinhThanhPho", tinhThanhPho);
			request.setAttribute("quanHuyen", quanHuyen);
			request.setAttribute("phuongXa", phuongXa);
			request.setAttribute("idNDH", a.getIdNDH());
			request.setAttribute("diaChi", diaChi);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/xemdiachidathang.jsp");
			rd.forward(request, response);
			return;
		}
		
		if("CAPNHAT".equals(request.getParameter("id"))) {
			String idNDH = request.getParameter("idNDH");
			String hoTen = request.getParameter("hoTen");
			String dienThoai = request.getParameter("dienThoai");
			String tinhThanhPho = request.getParameter("tinhThanhPho");
			String quanHuyen = request.getParameter("quanHuyen");
			String phuongXa = request.getParameter("phuongXa");
			String daiChi = request.getParameter("daiChi");
			b.updateNDH(idNDH, hoTen, daiChi+","+phuongXa+","+quanHuyen+","+tinhThanhPho, dienThoai);
		}
		
		
		if("XOA".equals(request.getParameter("key"))) {
			b.xoaNDH(request.getParameter("id"));
		}
		
		request.setAttribute("listNDH", b.getNDH(idTK));
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/diachimuahang.jsp");
		rd.forward(request, response);
		
		
	}

}
