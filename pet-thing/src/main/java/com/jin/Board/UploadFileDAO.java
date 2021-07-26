package com.jin.Board;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import com.jin.DTO.profileImageDTO;

public class UploadFileDAO {
	private MultipartRequest multiReq;
	Connection conn;
	
	public UploadFileDAO() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user = "c##petthing";
		String pass = "pet4thing";
		conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
			
			System.out.println("====================================");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private int cntProfileImg(String userId) {
		String sql = "select count(*) "
				+ "from profileimg "
				+ "where id=?";
		
		int result = 0;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
				result = rs.getInt(1);
			
			pstmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public void insertProfileImg(profileImageDTO pImageDTO) {
		int result = cntProfileImg(pImageDTO.getId());
		
		//String sql;
		String insertSql = "INSERT INTO profileImg "
				+ "(id, imgpath) "
				+ "VALUES (?, ?)";
		String updateSql = "UPDATE profileImg "
				+ "SET imgpath = ?"
				+ "WHERE id = ?";
		
		if(result==0) {
			try {
				PreparedStatement pstmt = conn.prepareStatement(insertSql);
				pstmt.setString(1, pImageDTO.getId());
				pstmt.setString(2, pImageDTO.getImgpath());
				
				pstmt.executeUpdate();
				pstmt.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
			
		} else if(result==1) {
			try {
				PreparedStatement pstmt = conn.prepareStatement(updateSql);
				pstmt.setString(1, pImageDTO.getImgpath());
				pstmt.setString(2, pImageDTO.getId());
				
				pstmt.executeUpdate();
				pstmt.close();
			
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	//�떎瑜� DAO濡� 鍮쇱빞�븯�굹?
	public String getProfileImg(String userId) {
		String imgPath="";
		
		String sql="SELECT imgpath "
			+ "FROM profileImg "
			+ "WHERE id = ?";

		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				imgPath = rs.getString(1);
			}
			
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();}
		
		return imgPath;
	}
	
	
	    
}
