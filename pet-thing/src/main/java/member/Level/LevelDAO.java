package member.Level;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LevelDAO {
	Connection conn;
	public LevelDAO() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user = "c##petthing";
		String pass = "pet4thing";
		
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
	}
	
	public List<LevelDTO> getLevel(String userId) {
		List<LevelDTO> lst = new ArrayList<LevelDTO>();
		
		int level = 0;
		String sql = "select member.id, name, memlevel "
				+ "from member, memberlevel "
				+ "where member.id=memberlevel.id "
				+ "and member.id=?";
		
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				LevelDTO lvlDTO = new LevelDTO();
				lvlDTO.setId(rs.getString(1));
				lvlDTO.setName(rs.getString(2));
				lvlDTO.setLevel(rs.getInt(3));
				
				lst.add(lvlDTO);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return lst;
	}

}
