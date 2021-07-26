package member.hospital;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class hospitalDAO {
	Connection conn;
	
	public hospitalDAO() {
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
	
	public List<hospitalDTO> getMyHospital(String userId) {
		List<hospitalDTO> hospitalLst = new ArrayList<hospitalDTO>();
		String sql = "select no, id, name, address, phone "
				+ "from maphospital "
				+ "where id = ? "
				+ "order by no desc";
		
		PreparedStatement pstmt;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				hospitalDTO hDTO = new hospitalDTO();
				
				hDTO.setNo(rs.getInt(1));
				hDTO.setId(rs.getString(2));
				hDTO.setName(rs.getString(3));
				hDTO.setAddress(rs.getString(4));
				hDTO.setPhone(rs.getString(5));
				
				hospitalLst.add(hDTO);
				
				
			}
			rs.close();
			pstmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return hospitalLst;
	}
}
