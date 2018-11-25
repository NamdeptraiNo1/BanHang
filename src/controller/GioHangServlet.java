package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import model.bean.GioHang;
import model.bean.MatHang;
import model.bo.GioHangBO;
import model.bo.MatHangBO;
import model.bo.TaiKhoanBO;

/**
 * Servlet implementation class GioHangServlet
 */
@WebServlet("/GioHangServlet")
public class GioHangServlet extends HttpServlet {
	
	/*private GioHangBO b = new GioHangBO();
	private TaiKhoanBO t = new TaiKhoanBO();
	private MatHangBO m = new MatHangBO();
	private HttpSession session = null;*/
	/*private ArrayList<GioHang> listGioHang = new ArrayList<>();*/
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GioHangServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String key = request.getParameter("key");
		switch (key) {
		case "ADD":
			addCart(request, response, session);
			break;
		case "DELETE":
			deleteCart(request, response, session);
			break;
		case "SHOW":
			showCart(request, response, session);
			break;
		case "EDIT":
			editCart(request, response, session);
			break;
		default:
			
			break;
		}
	}
	
	@SuppressWarnings("unchecked")
	private void showCart(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		MatHangBO m = new MatHangBO();
		TaiKhoanBO t = new TaiKhoanBO();
		GioHangBO b = new GioHangBO();
		String tenTK = (String) session.getAttribute("tenDangNhap");
		ArrayList<MatHang> listMH = new ArrayList<>();
		
		ArrayList<MatHang> listDAXEM = null;
		Cookie cookies[]= request.getCookies();
		if(cookies != null) {
			listDAXEM = new ArrayList<>();
			for (int i = 0; i < cookies.length; i++) {
				if(m.getSanPham(cookies[i].getValue()) != null) {
					listDAXEM.add(m.getSanPham(cookies[i].getValue()));
				}	
			}
		} 
		//CartNotUser
		if (tenTK == null && session.getAttribute("cartNotUser") != null) {
			for (GioHang a : (ArrayList<GioHang>)session.getAttribute("cartNotUser")) {
				listMH.add(m.getSanPham(a.getIdMH()));
			}
			request.setAttribute("listDAXEM", listDAXEM);
			request.setAttribute("tenMH", listMH); // Tên mặt hàng
			request.setAttribute("gioHang", session.getAttribute("cartNotUser"));// MÃ, số lượng giá mặt hàng trong giỏ hàng
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/giohang.jsp");
			rd.forward(request, response);
		}
		//CartInUser
		else {
			ArrayList<GioHang> listGH = new ArrayList<>();
			listGH = b.getGioHang(t.checkID(tenTK));
			for (int i = 0; i < listGH.size(); i++) {
				listMH.add(m.getSanPham(listGH.get(i).getIdMH()));
			}
			request.setAttribute("listDAXEM", listDAXEM);
			request.setAttribute("tenMH", listMH); // Tên mặt hàng
			request.setAttribute("gioHang", listGH);// MÃ, số lượng giá mặt hàng trong giỏ hàng
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/giohang.jsp");
			rd.forward(request, response);
		}
	}
	
	
	@SuppressWarnings("unchecked")
	private void addCart(HttpServletRequest request, HttpServletResponse response , HttpSession session)
			throws ServletException, IOException {
		MatHangBO m = new MatHangBO();
		TaiKhoanBO t = new TaiKhoanBO();
		GioHangBO b = new GioHangBO();
		String tenTK = (String) session.getAttribute("tenDangNhap");
		
		String idMH = request.getParameter("idMH");
		String soLuong = request.getParameter("soLuong");
		MatHang matHang = m.getSanPham(idMH);
		
		//addCartNotUser & session == null
		if (tenTK == null && session.getAttribute("cartNotUser") == null) {
			ArrayList<GioHang> listGioHang = new ArrayList<>();
			int gia = (matHang.getGiaBan() - ((matHang.getGiaBan() * matHang.getGiamGia()) / 100))
					* Integer.parseInt(soLuong);
			
			listGioHang.add(new GioHang(idMH, Integer.parseInt(soLuong), gia));
			session.setAttribute("cartNotUser", listGioHang);
			session.setAttribute("soLuongGH", soLuongGH(listGioHang));
			String json = new Gson().toJson("Bạn đã thêm vào giỏ hàng thành công !");
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
			return;
		}
		//addCartNotUser & session != null
		if (tenTK == null && session.getAttribute("cartNotUser") != null) {
			ArrayList<GioHang> listGioHang = (ArrayList<GioHang>) session.getAttribute("cartNotUser");
			int gia = (matHang.getGiaBan() - ((matHang.getGiaBan() * matHang.getGiamGia()) / 100))
					* Integer.parseInt(soLuong);
			
			boolean kt = false;
			for (GioHang gioHang : listGioHang) {
				if(idMH.equals(gioHang.getIdMH())) {
					kt = true;
					System.out.println(kt);
					gioHang.setSoLuong(gioHang.getSoLuong() + Integer.parseInt(soLuong));
					gioHang.setGia((matHang.getGiaBan() - ((matHang.getGiaBan() * matHang.getGiamGia()) / 100))
							* gioHang.getSoLuong());
				}
			}
			
			if(kt == true) {
				session.setAttribute("soLuongGH", soLuongGH(listGioHang));
				String json = new Gson().toJson("Bạn đã thêm vào giỏ hàng thành công !");
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(json);
				return;
			} else {
				listGioHang.add(new GioHang(idMH, Integer.parseInt(soLuong), gia));
				session.setAttribute("cartNotUser", listGioHang);
				
				session.setAttribute("soLuongGH", soLuongGH(listGioHang));
				String json = new Gson().toJson("Bạn đã thêm vào giỏ hàng thành công !");
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(json);
				return;
			}
		}
	
		//addCartInUser
		String idTK = t.checkID(tenTK);
		if(b.chekGioHang(idMH, idTK)) {
			String json = new Gson().toJson( matHang.getTenMH()+" đã có trong giỏ hàng !");
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
			return ;
		}
		
		if(matHang.getSoLuong() < Integer.parseInt(soLuong) ) {
			String json = new Gson().toJson( matHang.getTenMH()+" chỉ còn "+matHang.getSoLuong()+" sản phẩm!");
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		}
		else {
			int gia = (matHang.getGiaBan() - ((matHang.getGiaBan() * matHang.getGiamGia()) / 100))
					* Integer.parseInt(soLuong);
			b.themGioHang(idMH, Integer.parseInt(soLuong), Integer.parseInt(idTK), gia);
			session.setAttribute("soLuongGH", new GioHangBO().soLuongGH(new TaiKhoanBO().checkID(tenTK)));
			String json = new Gson().toJson("Bạn đã thêm vào giỏ hàng thành công !");
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		}
	}
	
	@SuppressWarnings("unchecked")
	private void deleteCart(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		TaiKhoanBO t = new TaiKhoanBO();
		GioHangBO b = new GioHangBO();
		String tenTK = (String) session.getAttribute("tenDangNhap");
		String idMH = request.getParameter("idMH");
		
		
		
		if(tenTK == null) {
			ArrayList<GioHang> listGioHang = (ArrayList<GioHang>) session.getAttribute("cartNotUser");
			for (int i = 0; i < listGioHang.size(); i++) {
				if(idMH.equals(String.valueOf(listGioHang.get(i).getIdMH()))) {
					listGioHang.remove(i);
				}
			}
			session.setAttribute("soLuongGH", soLuongGH(listGioHang));
		}
		else {
			b.xoaGioHang(idMH, t.checkID(tenTK));
			session.setAttribute("soLuongGH", new GioHangBO().soLuongGH(new TaiKhoanBO().checkID(tenTK)));
		}
		
		String json = new Gson().toJson("Xóa thành công !");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		
	}
	
	
	@SuppressWarnings("unchecked")
	private void editCart(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		MatHangBO m = new MatHangBO();
		GioHangBO b = new GioHangBO();
		String tenTK = (String) session.getAttribute("tenDangNhap");
		String idMH = request.getParameter("idMH");
		String soLuong = request.getParameter("soLuong");
		/*System.out.println(soLuong+"  "+idMH);*/
		MatHang matHang = m.getSanPham(idMH);
		
		if(matHang.getSoLuong() < Integer.parseInt(soLuong)) {
			String json = new Gson().toJson("số lượng không đủ !");
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
			return;
		}
		
		
		if(tenTK == null) {
			ArrayList<GioHang> listGioHang = (ArrayList<GioHang>) session.getAttribute("cartNotUser");
			for (int i = 0; i < listGioHang.size(); i++) {
				if(idMH.equals(String.valueOf(listGioHang.get(i).getIdMH()))) {
					listGioHang.get(i).setSoLuong(Integer.parseInt(soLuong));;
					listGioHang.get(i).setGia((matHang.getGiaBan() - ((matHang.getGiaBan() * matHang.getGiamGia()) / 100))
							* listGioHang.get(i).getSoLuong());
				}
			}
			session.setAttribute("soLuongGH", soLuongGH(listGioHang));
		} else {
			int gia = (matHang.getGiaBan() - ((matHang.getGiaBan() * matHang.getGiamGia()) / 100))
					* Integer.parseInt(soLuong);
			b.updateSL(idMH, Integer.parseInt(soLuong), gia);
			session.setAttribute("soLuongGH", new GioHangBO().soLuongGH(new TaiKhoanBO().checkID(tenTK)));
		}
		
		String json = new Gson().toJson("sửa thành công !");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		
	}
	
	private int soLuongGH(ArrayList<GioHang> list) {
		int s = 0;
		for (GioHang gioHang : list) {
			s+=gioHang.getSoLuong();
		}
		return s;
	}
	
	
	/*private ArrayList<MatHang> listDaXem (HttpServletRequest request) {
		ArrayList<MatHang> listDAXEM = null;
		Cookie cookies[]= request.getCookies();
		if(cookies != null) {
			listDAXEM = new ArrayList<>();
			for (int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().startsWith("DX")) {
					listDAXEM.add(new MatHangBO().getSanPham(cookies[i].getValue()));
				}	
			}
		} 
		
		for (Cookie cookie : cookies) {
			System.out.println(cookie);
		}
		return listDAXEM;
	}*/
	
	 

}
