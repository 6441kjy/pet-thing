package com.jin.map;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.AHospital;
import DTO.Qna;
import DTO.Review;

public class ReviewDAO {
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
	public int Insert(Connection conn, int busino, String id, String star, String contents) {
		String sql="INSERT INTO review(no, busino, id, star, contents, rDate) " + 
				"VALUES (?, ?, ?, ?, ?, sysdate)";
		
		int result=0;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, getAI(getConn(), "review"));
			pstmt.setInt(2, busino);
			pstmt.setString(3, id);
			pstmt.setString(4, star);
			pstmt.setString(5, contents);
			
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
	public List<Review> getReviewList(int bNo){
		String sql  ="select no, busino, id, star, contents, rDate from review "
				+ "where busino= ? "
				+ "order by no desc ";
		List<Review> lst = new ArrayList<Review>();
		Connection conn = getConn();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Review rev = new Review();
				rev.setNo(Integer.parseInt( rs.getString(1)) );
				rev.setBusino(Integer.parseInt( rs.getString(2)) );
				rev.setId(rs.getString(3));
				rev.setStar(rs.getString(4));
				rev.setContents(rs.getString(5));
				rev.setRdate(rs.getString(6));
				
				lst.add(rev);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {			e.printStackTrace();		}
		return lst;
	}
	public int count(String tableName, int bNo) {
		String sql = "select count(*) from " + tableName
				+ " where busino= ?";
		int total=0;
		Connection conn = getConn();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				total = Integer.parseInt(rs.getString(1));
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {			e.printStackTrace();		}
		
		return total;
	}
	public int InsertQna(Connection conn, int busino, String id, String open, String contents) {
		String sql="INSERT INTO qna(no, busino, id, open, contents, qDate) " + 
				"VALUES (?, ?, ?, ?, ?, sysdate)";
		
		int result=0;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, getAI(getConn(), "qna"));
			pstmt.setInt(2, busino);
			pstmt.setString(3, id);
			pstmt.setString(4, open);
			pstmt.setString(5, contents);
			
			pstmt.executeUpdate();
			pstmt.close();
			
			result=1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	public List<Qna> getQnaList(int bNo){
		String sql  ="select no, busino, id, open, contents, qDate from qna "
				+ "where busino= ? "
				+ "order by no desc ";
		List<Qna> lst = new ArrayList<Qna>();
		Connection conn = getConn();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bNo);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Qna qna = new Qna();
				qna.setNo(Integer.parseInt( rs.getString(1)) );
				qna.setBusino(Integer.parseInt( rs.getString(2)) );
				qna.setId(rs.getString(3));
				qna.setOpen(rs.getString(4));
				qna.setContents(rs.getString(5));
				qna.setQdate(rs.getString(6));
				
				lst.add(qna);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {			e.printStackTrace();		}
		return lst;
	}
}
