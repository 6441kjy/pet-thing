package c.community;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.management.AttributeList;

import c.DTO.Board;

public class BoardListDAO {
	private Connection conn;
	public BoardListDAO() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="c##petthing";
		String pass="pet4thing";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public List<Board>getBoardList(int PageNumber, int RowsPerPage) {
		String sql = "select no, id, title, contents, wDate, header, hit "
				+ "from( "
				+ "		select rownum as rn, no, id, title, contents, wDate, header, hit "
				+ "		from( "
				+ "			select b.no, id, title, contents, wDate, header, nvl(readno, 0) as hit " 
				+ "			from board b "
				+ "			LEFT JOIN hits h "
                + "			on b.no = h.no "
				+ "			ORDER BY no DESC "
				+ " 		) "
				+ ") "
				+ "where rn>=? and rownum <=?";

				
//		"select * from board ORDER BY NO DESC";
		
		List<Board> lst = new ArrayList<Board>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ((PageNumber - 1) * RowsPerPage) + 1);
			pstmt.setInt(2, RowsPerPage);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setNo(rs.getInt(1));
				board.setId(rs.getString(2));
				board.setTitle(rs.getString(3));
				board.setContents(rs.getString(4));
				board.setWdate(rs.getString(5));
				board.setHeader(rs.getString(6));
				board.setReadno(rs.getInt(7));
				lst.add(board);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
	}
	public List<Board>getBoardListHit() {
		String sql = "select no, id, title, contents, wDate, header, hit "
				+ "from( "
				+ "		select rownum as rn, no, id, title, contents, wDate, header, hit "
				+ "		from( "
				+ "			select b.no, id, title, contents, wDate, header, nvl(readno, 0) as hit " 
				+ "			from board b "
				+ "			LEFT JOIN hits h "
                + "			on b.no = h.no "
				+ "			ORDER BY hit DESC "
				+ " 		) "
				+ ") "
				+ "where rn>=1 and rownum <=3";
		
		List<Board> lstH = new ArrayList<Board>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, ((PageNumber - 1) * RowsPerPage) + 1);
//			pstmt.setInt(2, RowsPerPage);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setNo(rs.getInt(1));
				board.setId(rs.getString(2));
				board.setTitle(rs.getString(3));
				board.setContents(rs.getString(4));
				board.setWdate(rs.getString(5));
				board.setHeader(rs.getString(6));
				board.setReadno(rs.getInt(7));
				lstH.add(board);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return lstH;
	}
	public List<Board>getBoardListHit2(int PageNumber, int RowsPerPage) {
		String sql = "select no, id, title, contents, wDate, header, hit "
				+ "from( "
				+ "		select rownum as rn, no, id, title, contents, wDate, header, hit "
				+ "		from( "
				+ "			select b.no, id, title, contents, wDate, header, nvl(readno, 0) as hit " 
				+ "			from board b "
				+ "			LEFT JOIN hits h "
                + "			on b.no = h.no "
				+ "			ORDER BY hit DESC "
				+ " 		) "
				+ ") "
				+ "where rn>=? and rownum <=?";
		
		List<Board> lstH2 = new ArrayList<Board>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ((PageNumber - 1) * RowsPerPage) + 1);
			pstmt.setInt(2, RowsPerPage);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setNo(rs.getInt(1));
				board.setId(rs.getString(2));
				board.setTitle(rs.getString(3));
				board.setContents(rs.getString(4));
				board.setWdate(rs.getString(5));
				board.setHeader(rs.getString(6));
				board.setReadno(rs.getInt(7));
				lstH2.add(board);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return lstH2;
	}
	public List<Board>getBoardListRecent() {
		String sql = "select no, id, title, contents, wDate, header, hit "
				+ "from( "
				+ "		select rownum as rn, no, id, title, contents, wDate, header, hit "
				+ "		from( "
				+ "			select b.no, id, title, contents, wDate, header, nvl(readno, 0) as hit " 
				+ "			from board b "
				+ "			LEFT JOIN hits h "
                + "			on b.no = h.no "
				+ "			ORDER BY no DESC "
				+ " 		) "
				+ ") "
				+ "where rn>=1 and rownum <=3";

		
		List<Board> lstR = new ArrayList<Board>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setNo(rs.getInt(1));
				board.setId(rs.getString(2));
				board.setTitle(rs.getString(3));
				board.setContents(rs.getString(4));
				board.setWdate(rs.getString(5));
				board.setHeader(rs.getString(6));
				board.setReadno(rs.getInt(7));
				lstR.add(board);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lstR;
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
		if("�ۼ���".contentEquals(searchSelect))
			return "WHERE id like '%"+searchWord+"%'";
		if("����".contentEquals(searchSelect))
			return "WHERE title like '%"+searchWord+"%'";
		if("��ü".contentEquals(searchSelect))
			return "WHERE id like '%"+searchWord+"%'"
				  +"OR title like '%"+searchWord+"%'";
		
		return "";
	}
}
