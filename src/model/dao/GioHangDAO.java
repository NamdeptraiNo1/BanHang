package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.GioHang;
import model.bean.MatHang;

public class GioHangDAO {
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

	public ArrayList<GioHang> getGioHang(String id) {
		connect();
		ArrayList<GioHang> list = new ArrayList<>();
		String sql = "select idMH,SoLuong,Gia from GioHang where idTK="+id;
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				list.add(new GioHang(rs.getString(1), rs.getInt(2), rs.getInt(3)));
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
	
	public void themGioHang(String idmh,int SoLuong,int idTK,int Gia) {
		connect();
		String sql=	"INSERT INTO GioHang values(?,?,?,?)";
		try {
			PreparedStatement pr = connection.prepareStatement(sql);
			pr.setInt(1, idTK);
			pr.setString(2, idmh);
			pr.setInt(3, SoLuong);
			pr.setInt(4, Gia);
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
	
	public void xoaGioHang(String idMH, String idTK) {
		connect();
		String sql=	"DELETE FROM GioHang where idMH='"+idMH+"' and idTK="+idTK;
		try {
			Statement stmt = connection.createStatement();
			stmt.executeUpdate(sql);
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
	
	public boolean chekGioHang(String idMH, String idTK) {
		connect();
		String sql=	"select * FROM GioHang where idMH='"+idMH+"' and idTK="+idTK;
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				return true;
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
		return false;
	}
	
	public int soLuongGH(String idTK) {
		connect();
		String sql=	String.format("select sum(SoLuong) from GioHang where idTK=%s", idTK);
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				return rs.getInt(1);
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
		return 0;
	}
	
	public void updateSL(String idMH, int soLuong ,int gia ) {
		connect();
		String sql=	String.format("UPDATE GioHang SET SoLuong = %s , Gia = %s WHERE idMH = '%s'", soLuong,gia,idMH);
		try {
			Statement stmt = connection.createStatement();
			stmt.executeUpdate(sql);
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
	
	
	/*public boolean ktGioHang(String maMH) {
		connect();
		String sql=	"select * FROM GioHang where idMH='"+maMH+"'";
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				return true;
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
		return false;
	}*/
}
