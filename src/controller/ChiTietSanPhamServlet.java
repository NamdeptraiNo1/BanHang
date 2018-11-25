package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.MatHang;
import model.bo.MatHangBO;

/**
 * Servlet implementation class ChiTietSanPhamServlet
 */
@WebServlet("/ChiTietSanPhamServlet")
public class ChiTietSanPhamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChiTietSanPhamServlet() {
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
		MatHangBO m = new MatHangBO();
		MatHang maHang = m.getSanPham(request.getParameter("id"));
		Cookie cookie = new Cookie(""+maHang.getIdMH(), maHang.getIdMH());
		/*cookie.setMaxAge(60*60);*/
		response.addCookie(cookie);
		request.setAttribute("sanPham", maHang);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/chitietsanpham.jsp");
		rd.forward(request, response);
		
	}

}
