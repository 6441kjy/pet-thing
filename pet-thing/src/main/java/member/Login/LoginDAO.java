package member.Login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LoginDAO {
	public Connection getConn() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user = "c##petthing";
		String pass = "pet4thing";
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
			
			System.out.println("====================================");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public int LoginProc(Connection conn, LoginDTO login) {//�젅踰⑥젙蹂� �븘�슂�뾾�씠 濡쒓렇�씤留� �떆�궗寃쎌슦 �궗�슜�븯�뒗 proc
		String sql = "select count(*) "
				+ "from login "
				+ "where id=? and pw=?";
		
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, login.getId());
			pstmt.setString(2, login.getPw());
			
			System.out.println(login.getId());
			System.out.println(login.getPw());
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("寃곌낵 : "+rs.getInt(1));
				return rs.getInt(1);
			}
			pstmt.close();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;//�씪移섑븯�뒗 �젙蹂닿� �뾾�뒗 寃쎌슦 return 0;
	}
	
	public List<GetLoginDTO> getLoginInfo(Connection conn, LoginDTO login) {
		List<GetLoginDTO> lst = new ArrayList<GetLoginDTO>();
		
		String sql = "SELECT login.id, memlevel "
				+ "FROM memberLevel, login "
				+ "WHERE memberLevel.id=login.id "
				+ "and login.id = ? and login.pw=? ";
		
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, login.getId());
			pstmt.setString(2, login.getPw());
			
			System.out.println(login.getId());
			System.out.println(login.getPw());
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				GetLoginDTO getLogin = new GetLoginDTO();
				
				getLogin.setId(rs.getString(1));
				getLogin.setLevel(rs.getInt(2));
				
				lst.add(getLogin);
			}
			pstmt.close();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return lst;
	}
}
