package c.community;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import c.DTO.AttachFile;

public class BoardReadDAO {
	private Connection conn;
	public BoardReadDAO() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "c##petthing";
		String pass = "pet4thing";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public List<AttachFile> getAttachFileList(int pno) {
			String sql = "select fileno, filename fliepath, fno form attachfile "
				+ "where fno = ?";
		List<AttachFile> lst = new ArrayList<AttachFile>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AttachFile attachFile = new AttachFile();
				attachFile.setFileno(rs.getInt(1));
				attachFile.setFilename(rs.getString(2));
				attachFile.setFilepath(rs.getString(3));
				attachFile.setPno(rs.getInt(4));
				
				lst.add(attachFile);
			}
			rs.close();
			pstmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return lst;
	}
	public String getAttachFileURL(String contextPath, String uploadFolderName, AttachFile attachFile) {
		return "<a href='"+contextPath+"/"+uploadFolderName+"/"+attachFile.getFilename()+"'>"+attachFile.getFilepath()+"</a>";
	}
	public void Update(int no) {
		String selectSql = "SELECT readno FROM hits WHERE no=?";
		String deleteSql = "DELETE FROM hits WHERE no=?";
		String insertSql = "INSERT INTO hits VALUES(?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(selectSql);
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			int readNo = 1;
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
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
} 
