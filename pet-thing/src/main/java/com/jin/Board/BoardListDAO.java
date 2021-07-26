package com.jin.Board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jin.DTO.Board;

public class BoardListDAO {
	private Connection conn;
	public BoardListDAO() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="c##petthing";
		String pass="pet4thing";
		//Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn= DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {	e.printStackTrace();	}
	}
	
	public List<Board> getBoardList(int PageNumber, int RowsPerPage, String conditional){
		String sql  ="select no, id, title, contents, wdate, hit, lvl "
				+ "from( "
				+ "    select LEVEL as lvl, rownum as rn, no, id, LPAD(' ', 4*(LEVEL-1)) || title title, contents, wdate, hit, pno "
				+ "    from( "
				+ "        select b.no, id, title, contents, wdate, nvl(readno, 0) as hit, nvl(pno,0) pno "
				+ "        from board b "
				+ "        LEFT JOIN hits h "
				+ "        ON b.no = h.no "
				+ "        LEFT JOIN reply rpl "
				+ "        ON b.no=rpl.no "
				+ 			conditional 
				+ "    ) "
				+ "    START WITH pno=0 "
				+ "    CONNECT BY PRIOR no=pno "
				+ "    ORDER SIBLINGS BY no DESC "
				+ ")"
				+ "where rn>=? and rownum <=?";
		
		List<Board> lst = new ArrayList<Board>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ((PageNumber - 1) * RowsPerPage) + 1);
			pstmt.setInt(2, RowsPerPage);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				
				board.setWriteno(rs.getInt(1));
				board.setId(rs.getString(2));
				board.setTitle(rs.getString(3));
				board.setWritecontents(rs.getString(4));
				board.setWritedate(rs.getString(5));
				board.setReadno(rs.getInt(6));
				board.setLevel(rs.getInt(7));
				
				lst.add(board);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {			e.printStackTrace();		}
		return lst;
	}
	public int getBoardCount(String conditional){
		String sql  ="select count(*) from board "+conditional;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {		return rs.getInt(1);			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {			e.printStackTrace();		}
		return 0;
	}
	public String getConditional(String searchSelect, String searchWord) {
		if(searchSelect==null)	return "";
		if("작성자".contentEquals(searchSelect))
			return "WHERE id like '%"+searchWord+"%'";
		if("제목".contentEquals(searchSelect))
			return "WHERE title like '%"+searchWord+"%'";
		if("전체".contentEquals(searchSelect))
			return "WHERE id like '%"+searchWord+"%'"
				  +"OR title like '%"+searchWord+"%'";
		
		return "";
	}
}



















