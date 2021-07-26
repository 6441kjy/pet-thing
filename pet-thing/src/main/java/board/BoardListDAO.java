package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardListDAO {
	private Connection conn;
	public BoardListDAO() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="c##petthing";
		String pass="pet4thing";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn= DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {	e.printStackTrace();	}
	}
	
	public List<BoardDTO> getboardLst(String table) {
		
		
		return null;
		
	}
	
	public List<BoardDTO> getNewBoardLst(int maxNum) {
		List<BoardDTO> list= new ArrayList<BoardDTO>();
		
		String sql = "SELECT no, title, id, contents, wDate, header "
				+ "FROM ( "
				+ "SELECT ROWNUM AS rn, "
				+ "no, title, id, contents, wDate, header "
				+ "FROM board ORDER BY no DESC) "
				+ "WHERE rn >= 1 AND rownum <=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, table);
			pstmt.setInt(1, maxNum);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO boardDTO = new BoardDTO();
				
				boardDTO.setNo(rs.getInt(1));
				boardDTO.setTitle(rs.getString(2));
				boardDTO.setId(rs.getString(3));
				boardDTO.setContents(rs.getString(4));
				boardDTO.setwDate(rs.getString(5));
				boardDTO.setHeader(rs.getString(6));
				
				list.add(boardDTO);
				
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	
	public List<BoardDTO> getMostViewedLst(int maxNum) {
		List<BoardDTO> list= new ArrayList<BoardDTO>();
		
		String sql = "select no, title, id,contents,wdate,header,readno "
				+ "from (select rownum as rn, hits.no no, title, id,contents,wdate,header,readno "
				+ "from hits, board "
				+ "where hits.no=board.no "
				+ "order by readno desc) "
				+ "where rn>=1 and rownum<=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, table);
			pstmt.setInt(1, maxNum);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO boardDTO = new BoardDTO();
				
				boardDTO.setNo(rs.getInt(1));
				boardDTO.setTitle(rs.getString(2));
				boardDTO.setId(rs.getString(3));
				boardDTO.setContents(rs.getString(4));
				boardDTO.setwDate(rs.getString(5));
				boardDTO.setHeader(rs.getString(6));
				boardDTO.setReadno(rs.getInt(7));
				
				list.add(boardDTO);
				
				//System.out.println(list);
				
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	
}
