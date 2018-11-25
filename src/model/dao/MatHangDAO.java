package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.MatHang;

public class MatHangDAO {

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

	public ArrayList<MatHang> getMatHang() {
		connect();
		ArrayList<MatHang> list = new ArrayList<>();
		String sql = "select idMH,TenMH,SoLuong,GiaBan,GiamGia,MoTa from MatHang";
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				list.add(new MatHang(rs.getString("idMH"), rs.getString("TenMH"), rs.getInt("SoLuong"),
						rs.getInt("GiaBan"), rs.getInt("GiamGia"),rs.getString("MoTa")));
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

	public byte[] getImageData(String id) {
		connect();
		String sql = "select Image from MatHang where idMH ="+id;
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				return rs.getBytes(1);
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
		
		return null;
	}
	
	public MatHang getSanPham(String id) {
		connect();
		MatHang mh = null;
		String sql = "select idMH,TenMH,SoLuong,GiaBan,GiamGia,MoTa from MatHang where idMH ='"+id+"'";
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				mh = new MatHang(rs.getString("idMH"), rs.getString("TenMH"), rs.getInt("SoLuong"),
						rs.getInt("GiaBan"), rs.getInt("GiamGia"),rs.getString("MoTa"));
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

		return mh;
	}
	
}
