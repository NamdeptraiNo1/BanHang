package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.GioHang;
import model.bean.NguoiDatHang;

public class NguoiDatHangDAO {

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

	public ArrayList<NguoiDatHang> getNDH(String idTK) {
		connect();
		ArrayList<NguoiDatHang> list = new ArrayList<>();
		String sql = "select * from NguoiDatHang where idTK =" + idTK;
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				list.add(new NguoiDatHang(rs.getInt("idNDH"), rs.getString("TenNDH"), rs.getString("DiaChi"),
						rs.getString("SDT")));
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
		return list;
	}
	
	public void themNDH(String hoTen, String daiChi, String sDT, String idTK) {
		connect();
		String sql=	String.format("INSERT INTO NguoiDatHang "+
					" VALUES ( N'%s',N'%s','%s',%s )", hoTen, daiChi, sDT, idTK);
		try {
			Statement stmt = connection.createStatement();
			stmt.executeUpdate(sql);
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
	}
	
	public NguoiDatHang nguoiDatHang(String idNDH) {
		connect();
		NguoiDatHang list = null;
		String sql = "select * from NguoiDatHang where idNDH =" + idNDH;
		ResultSet rs = null;
		try {
			Statement stmt = connection.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				list = new NguoiDatHang(rs.getInt("idNDH"), rs.getString("TenNDH"), rs.getString("DiaChi"),
						rs.getString("SDT"));
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
		return list;
	}
	
	public void xoaNDH(String idNDH) {
		connect();
		String sql=	"DELETE FROM NguoiDatHang where idNDH =" + idNDH;
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
	
	
	public void updateNDH(String idNDH ,String hoTen, String daiChi, String sDT) {
		connect();
		String sql=	String.format("UPDATE NguoiDatHang SET TenNDH = N'%s' , DiaChi = N'%s', SDT = '%s' WHERE idNDH = %s", hoTen,daiChi,sDT,idNDH);
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
	

}
