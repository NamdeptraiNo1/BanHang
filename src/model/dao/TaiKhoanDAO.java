package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TaiKhoanDAO {
	String url = "jdbc:sqlserver://localhost:1433;databaseName=BanHang";
	String userName = "sa";
	String password = "1910";
	Connection connection;
	
	void connect(){
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			connection = DriverManager.getConnection(url, userName, password);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public boolean checkLogin(String tenDangNhap, String matKhau) {
		connect();
		String sql=	String.format("select * from NguoiDung where TenTK=N'%s' and MatKhau='%s'", tenDangNhap, matKhau);
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(rs.next()){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
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
	
	
	public String checkID(String tenDangNhap) {
		connect();
		String sql=	String.format("select idTK from NguoiDung where TenTK=N'%s'" , tenDangNhap);
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(rs.next()){
				return rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return null;
	}
	
	
	public String checkName(String tenDangNhap) {
		connect();
		String sql=	String.format("select hoTen from NguoiDung where TenTK=N'%s'" , tenDangNhap);
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				return rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return null;
	}
	
	public static void main(String[] args) {
		System.out.println(new TaiKhoanDAO().checkName("Nam"));
	}
}
