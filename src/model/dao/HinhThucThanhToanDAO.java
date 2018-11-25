package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.HinhThucThanhToan;
import model.bean.MatHang;

public class HinhThucThanhToanDAO {
	
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
	
	public ArrayList<HinhThucThanhToan> getHTTT() {
		connect();
		ArrayList<HinhThucThanhToan> list = new ArrayList<>();
		String sql = "select * from HinhThucThanhToan";
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				list.add(new HinhThucThanhToan(rs.getInt(1), rs.getString(2)));
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


}
