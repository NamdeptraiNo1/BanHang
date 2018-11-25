package controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.GioHang;
import model.bean.MatHang;
import model.bo.ChiTietDonDatHangBO;
import model.bo.DonDatHangBO;
import model.bo.GioHangBO;
import model.bo.HinhThucThanhToanBO;
import model.bo.MatHangBO;
import model.bo.NguoiDatHangBO;
import model.bo.TaiKhoanBO;

/**
 * Servlet implementation class ThanhToanVaDatMuaServlet
 */
@WebServlet("/ThanhToanVaDatMuaServlet")
public class ThanhToanVaDatMuaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThanhToanVaDatMuaServlet() {
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
		NguoiDatHangBO n = new NguoiDatHangBO();
		MatHangBO m = new MatHangBO();
		GioHangBO b = new GioHangBO();
		HttpSession session = request.getSession();
		String idTK = new TaiKhoanBO().checkID((String)session.getAttribute("tenDangNhap"));
		ArrayList<GioHang> listGH = b.getGioHang(idTK);
		if("TAOTHANHTOAN".equals(request.getParameter("key"))) {
			HinhThucThanhToanBO h = new HinhThucThanhToanBO();
			String idNDH = request.getParameter("id");
			ArrayList<MatHang> listMH = new ArrayList<>();
			for (GioHang gioHang : listGH) {
				listMH.add(m.getSanPham(gioHang.getIdMH()));
			}
			request.setAttribute("hTTT", h.getHTTT());
			request.setAttribute("nguoiDatHang", n.nguoiDatHang(idNDH));
			request.setAttribute("listGH", listGH);//list mặt hàng không có tên
			request.setAttribute("tenMH", listMH);//để lấy tên mặt hàng
		}
		
		if("Đặt Mua".equals(request.getParameter("datMua"))) {
			ChiTietDonDatHangBO c = new ChiTietDonDatHangBO();
			String idHTTT = request.getParameter("hTTT");
			String idNDH = request.getParameter("idNDH");
			Date now = new Date();
			DateFormat df = new SimpleDateFormat("mmddHHyyssMM");
			String idDDH = df.format(now);
			DateFormat dfNgayThang = new SimpleDateFormat("MM-dd-yyyy");// HH:mm:ss.SSS
			String ngayDat= dfNgayThang.format(now);
			System.out.println(ngayDat);
			int tongTien = 0;
			for (GioHang gioHang : listGH) {
				tongTien += gioHang.getGia();
			}
			//thêm đơn đặt hàng
			new DonDatHangBO().themDonDatHang(idDDH, idNDH, ngayDat, tongTien, "0", idHTTT);
			//thêm vào chi tiết đơn đạt hàng và xáo khỏi giỏ hàng
			for (GioHang gioHang : listGH) {
				c.themChiTietDonDatHang(idDDH, gioHang.getIdMH(), gioHang.getSoLuong(), gioHang.getGia());
				b.xoaGioHang(gioHang.getIdMH(), idTK);
			}
			request.setAttribute("idDDH", idDDH);
			//refesh lại số lượng giỏ hàng
			session.setAttribute("soLuongGH", new GioHangBO().soLuongGH(idTK));
			System.out.println("thành công");
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/thanhtoanvadatmua.jsp");
		rd.forward(request, response);
	}

}
