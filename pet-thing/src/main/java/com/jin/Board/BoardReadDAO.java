package com.jin.Board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.jin.DTO.Attachfile;
import com.jin.DTO.Board;

public class BoardReadDAO {
	private Connection conn;
	public BoardReadDAO() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="c##petthing";
		String pass="pet4thing";
		//Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn= DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {	e.printStackTrace();	}
	}
	
	public List<Attachfile> getAttachFileList(int fno){
		String sql  ="select writeno, attachedfile, filepath, fno from attachfile "
				+ "where fno=?";
		List<Attachfile> lst = new ArrayList<Attachfile>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fno);
	
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Attachfile attachFile = new Attachfile();
				attachFile.setWriteno(rs.getInt(1));
				attachFile.setAttachedfile(rs.getString(2));
				attachFile.setFilepath(rs.getString(3));
				attachFile.setFno(rs.getInt(4));
				
				lst.add(attachFile);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {			e.printStackTrace();		}
		return lst;
	}
	public String getAttachFileURL(String contextPath, 
			String uploadFolderName, Attachfile attachFile) {
		return "<a href='"+contextPath+"/"+uploadFolderName+"/"+ 
				attachFile.getAttachedfile()+"'>"+
				attachFile.getFilepath()+"</a>";
	}
	
	
	public void Update(int no)	{
		String selectSql  ="select readno from hits where no=? ";
		String deleteSql  ="delete from hits where no=? ";
		String insertSql  ="insert into hits values(?,?) ";
		
		
		List<Board> lst = new ArrayList<Board>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(selectSql);
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			
			int readNo=1;
			
			if(rs.next())	readNo=rs.getInt(1)+1;
			
			rs.close();
			pstmt.close();
			
			pstmt = conn.prepareStatement(deleteSql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt = conn.prepareStatement(insertSql);
			pstmt.setInt(1, no);
			pstmt.setInt(2, readNo);
			pstmt.executeUpdate();
			pstmt.close();
			
			
		} catch (SQLException e) {			e.printStackTrace();		}
	}
	
	
	public List<Board> getReadNo(String no)	{
		String sql  ="select readno from hits"
				+ "where no = " + no;
		List<Board> lst = new ArrayList<Board>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
	
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board();
				lst.add(board);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {			e.printStackTrace();		}
		return lst;
	}
}



















