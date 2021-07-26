package map.lost;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.AHospital;

public class LostPetDAO {
	Connection conn;
	
	
	public LostPetDAO() {
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
	
	
	public int insert(LostPetDTO DTO) {
		int result =0;
		
		String sql = "INSERT INTO lost "
				+ "(no, petname, chk, species, petgender, mDate, info, id, x, y, phone) "
				+ "VALUES "
				+ "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, getNo());
				pstmt.setString(2, DTO.getPetname());
				pstmt.setInt(3, DTO.getChk());
				pstmt.setString(4, DTO.getSpecies());
				pstmt.setInt(5, DTO.getPetgender());
				pstmt.setString(6, DTO.getMdate());
				pstmt.setString(7, DTO.getInfo());
				pstmt.setString(8, DTO.getId());
				pstmt.setString(9, DTO.getX());
				pstmt.setString(10, DTO.getY());
				pstmt.setString(11, DTO.getPhone());
				
				
				
				pstmt.executeUpdate();
				pstmt.close();
				
				result=1;
			
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return result;
		
	}
	
	private int getNo() {
		String sql = "select nvl(max(no),0)+1 from lost";
		int maxNo = 0;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
				maxNo =rs.getInt(1);
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return maxNo;
	}
	
	public List<LostPetDTO> getLostPetLst(){
		String sql  ="select no, petname, chk, species, petgender, mdate, info, id, x, y, phone "
				+ "from lost "
				+ "order by no desc";
		
		List<LostPetDTO> lst = new ArrayList<LostPetDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				LostPetDTO lDTO= new LostPetDTO();
				
				lDTO.setNo(rs.getInt(1));
				lDTO.setPetname(rs.getString(2));
				lDTO.setChk(rs.getInt(3));
				lDTO.setSpecies(rs.getString(4));
				lDTO.setPetgender(rs.getInt(5));
				lDTO.setMdate(rs.getString(6));
				lDTO.setInfo(rs.getString(7));
				lDTO.setId(rs.getString(8));
				lDTO.setX(rs.getString(9));
				lDTO.setY(rs.getString(10));
				lDTO.setPhone(rs.getString(11));
				
				lst.add(lDTO);
				
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {			e.printStackTrace();		}
		return lst;
	}

}
