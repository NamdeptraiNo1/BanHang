package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import model.bean.GioHang;
import model.bo.GioHangBO;
import model.bo.TaiKhoanBO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String tenTK = request.getParameter("tenTK");
		String matKhauTK = request.getParameter("matKhauTK");
		
		if (new TaiKhoanBO().checkLogin(tenTK, matKhauTK) == true) {
			TaiKhoanBO t = new TaiKhoanBO();
			HttpSession session = request.getSession();
			session.setAttribute("tenDangNhap", tenTK);
			session.setAttribute("hoName", t.checkName(tenTK));
			/*System.out.println(session.getAttribute("hoName"));
			System.out.println(session.getId());*/
			// nếu mặt hàng trong giỏ hàng của tài khoản chưa có thì thêm vòa
			ArrayList<GioHang> list = (ArrayList<GioHang>) session.getAttribute("cartNotUser");
			if (list != null) {
				GioHangBO b = new GioHangBO();
				for (GioHang gioHang : list) {
					if (b.chekGioHang(gioHang.getIdMH(), t.checkID(tenTK)) == false) {
						b.themGioHang(gioHang.getIdMH(), gioHang.getSoLuong(), Integer.parseInt(t.checkID(tenTK)),
								gioHang.getGia());
					}
				}
			}
			// xét session cho số lượng
			session.setAttribute("soLuongGH", new GioHangBO().soLuongGH(t.checkID(tenTK)));

			String json = new Gson().toJson("<script>window.location.reload();</script>");
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		} else {
			String json = new Gson().toJson("Tài khoản hoặc mật khẩu không chính xác !");
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		}
	}

}
