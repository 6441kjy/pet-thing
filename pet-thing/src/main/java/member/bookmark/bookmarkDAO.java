package member.bookmark;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class bookmarkDAO {
	Connection conn;
	
	public bookmarkDAO() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user = "c##petthing";
		String pass = "pet4thing";
		conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
			
			//System.out.println("====================================");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<bookmarkDTO> getHospitalBookmark(String userId, int pageNumber, int rowsPerPage) {
		List<bookmarkDTO> lst = new ArrayList<bookmarkDTO>();
		
		//System.out.println(userId+"�븘�씠�뵒"); 
		
		/*
		 * String sql="select name, address, phone " + "FROM ( " +
		 * "SELECT ROWNUM AS rn, " + "name, address, phone " +
		 * "from favhospital, maphospital " + "where favhospital.no= maphospital.no " +
		 * "and favhospital.id=? " + "order by favhospital.favno desc) " +
		 * "WHERE rn >= ? AND rownum <= ?";
		 */
		
		String sql = "select name, address, phone, x, y , num "
				+ "from( "
				+ "SELECT rownum as rn, favno, name, address, phone, x, y, num "
				+ "from( "
				+ "select favno, name, address, phone, x, y , maphospital.no as num "
				+ "from favhospital, maphospital "
				+ "where favhospital.no= maphospital.no "
				+ "and favhospital.id=?"
				+ "order by favhospital.favno desc "
				+ ")) "
				+ "where rn>=? and rownum<=?";
		
		PreparedStatement pstmt;
		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				pstmt.setInt(2, ((pageNumber - 1) * rowsPerPage) + 1);
				pstmt.setInt(3, rowsPerPage);
				
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					bookmarkDTO bDTO = new bookmarkDTO();
					bDTO.setName(rs.getString(1));
					bDTO.setAddress(rs.getString(2));
					bDTO.setPhone(rs.getString(3));
					bDTO.setX(rs.getString(4));
					bDTO.setY(rs.getString(5));
					bDTO.setNo(rs.getString(6));
					
					lst.add(bDTO);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return lst;
	}
	
	public int getHospitalCnt(String userId) {
		int result=0;
		
		String sql = "select count(*) "
				+ "from favhospital, maphospital "
				+ "where favhospital.no= maphospital.no "
				+ "and favhospital.id=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) 
				result = rs.getInt(1);
				
			rs.close();
			pstmt.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return result;
	}
	

	public int insertBookmark(int no, String userId) {
		String selectSql = "select count(*) "
				+ "from favhospital "
				+ "where no=? and id=?";
		
		String insertSql = "INSERT INTO favHospital "
				+ "(no, id, favno) "
				+ "VALUES (?, ?, ?)";
		
		int selectResult=0;
		int insertResult=0;
		
		
		try {
			PreparedStatement selectPstmt = conn.prepareStatement(selectSql);
			selectPstmt.setInt(1, no);
			selectPstmt.setString(2, userId);
			
			ResultSet rs= selectPstmt.executeQuery();
			
			if(rs.next())
				selectResult = rs.getInt(1);
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		if(selectResult==0) {
			try {
				PreparedStatement insertPstmt = conn.prepareStatement(insertSql);
				insertPstmt.setInt(1, no);
				insertPstmt.setString(2, userId);
				insertPstmt.setInt(3, getAI());
				
				insertResult = insertPstmt.executeUpdate();
				insertPstmt.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return insertResult;
		
	}
	
	public int getAI() {
		String sql="select max(favno)+1 from favhospital";
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
	
	
}
