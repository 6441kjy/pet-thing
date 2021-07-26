package com.jin.Board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jin.DTO.Board;
import com.jin.DTO.Selfboard;

public class SelfboardListDao {
	private Connection conn;
	public SelfboardListDao() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="c##petthing";
		String pass="pet4thing";
		//Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn= DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {	e.printStackTrace();	}
	}
	
	public List<Selfboard> getBoardList(String userId)	{
		String sql  ="select rn, title, wdate "
				+ "from( "
				+ "    select rownum as rn, no, title, wdate, id "
				+ "    from board "
				+ "    where id = ? "
				+ "    order by no desc "
				+ "    ) "
				+ "where rn>=1 and rownum <=4 ";
		
		List<Selfboard> lst = new ArrayList<Selfboard>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);

			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Selfboard board = new Selfboard();
				
				board.setNo(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setDate(rs.getString(3));
			
				
				lst.add(board);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {			e.printStackTrace();		}
		return lst;
	}
}
