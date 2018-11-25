package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.DonDatHang;
import model.bean.GioHang;

public class DonDatHangDAO {
	String url = "jdbc:sqlserver://localhost:1433;databaseName=BanHang";
	String userName = "sa";
	String password = "1910";
	Connection connection;

	void connect() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			connection = DriverManager.getConnection(url, userName, password);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	
	public void themDonDatHang(String idDDH,String idNDH,String ngayDat,int tongTien, String trangThai, String idHTTT) {
		connect();
		String sql=	"INSERT INTO DonDatHang values(?,?,?,?,?,?)";
		try {
			PreparedStatement pr = connection.prepareStatement(sql);
			pr.setString(1, idDDH);
			pr.setString(2, idNDH);
			pr.setString(3, ngayDat);
			pr.setInt(4, tongTien);
			pr.setString(5, trangThai);
			pr.setString(6, idHTTT);
			pr.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<DonDatHang> getDonDatHang(String idTK) {
		connect();
		ArrayList<DonDatHang> list = new ArrayList<>();
		String sql = "select * from DonDatHang where idNDH in (select idNDH from NguoiDatHang where idTK = "+idTK+")  order by NgayDat desc";
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				list.add(new DonDatHang(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	
	public DonDatHang donDatHang(String idDDH) {
		connect();
		DonDatHang dDH = null;
		String sql = "select * from DonDatHang where idDDH='"+idDDH+"'";
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				dDH = new DonDatHang(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return dDH;
	}
	
	public void updateTrangThai(String idDDH) {
		connect();
		String sql  = "update DonDatHang set TrangThai=2 where idDDH = ?";
		try {
			PreparedStatement pr = connection.prepareStatement(sql);
			pr.setString(1, idDDH);
			pr.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
	}
}
