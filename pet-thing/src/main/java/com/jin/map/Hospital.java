package com.jin.map;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import DTO.AHospital;

public class Hospital {
	public Connection getConn() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="c##petthing";
		String pass="pet4thing";
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn= DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {	e.printStackTrace();	}
		
		return conn;
	}
	public int Insert(Connection conn, String id, String name, String address, String phone, String x, String y) {
		String sql="INSERT INTO mapHospital(no,  id,  name, address, phone, x, y) "
				+ "VALUES(?, ?, ?, ?, ?, ?, ?)";
		
		int result=0;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, getAI(getConn(), "mapHospital"));
			pstmt.setString(2, id);
			pstmt.setString(3, name);
			pstmt.setString(4, address);
			pstmt.setString(5, phone);
			pstmt.setString(6, x);
			pstmt.setString(7, y);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			result=1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	public int getAI(Connection conn, String tablename) {
		String sql="select nvl(max(no), 0)+1 from " + tablename;
		int maxNum=0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
				maxNum =rs.getInt(1);
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return maxNum;
	}
	public List<AHospital> getHospitalList(){
		String sql  ="select name, phone, address, no, x, y from maphospital order by no desc";
		List<AHospital> lst = new ArrayList<AHospital>();
		Connection conn = getConn();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AHospital hos = new AHospital();
				hos.setName(rs.getString(1));
				hos.setPhone(rs.getString(2));
				hos.setAddress(rs.getString(3));
				hos.setNo(Integer.parseInt(rs.getString(4)));
				hos.setX(rs.getString(5));
				hos.setY(rs.getString(6));
				
				lst.add(hos);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {			e.printStackTrace();		}
		return lst;
	}
	public int Insert(String revdate, String revname, int progress, String id, String time, String busino, String name) {
		String sql="INSERT INTO reservation(no, revdate, revname, progress, id, revtime, busino, name) "
				+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		Connection conn = getConn();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, getAI(getConn(), "reservation"));
			pstmt.setString(2, revdate);
			pstmt.setString(3, revname);
			pstmt.setInt(4, progress);
			pstmt.setString(5, id);
			pstmt.setString(6, time);
			pstmt.setString(7, busino);
			pstmt.setString(8, name);
			
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

}
