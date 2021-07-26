package com.jin.Board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.jin.DTO.Board;
import com.jin.DTO.Reservation;
import com.jin.DTO.Reservationcancel;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;




public class ReservationDAO {
	private MultipartRequest multiReq;
	private Connection conn;
	public ReservationDAO() {
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="c##petthing";
		String pass="pet4thing";
		//Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn= DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {	e.printStackTrace();	}
	}
	
	
	public List<Reservation> getBoardList(int PageNumber, int RowsPerPage )	{
		String sql  ="select no, revdate, revname, progress, name "
				+ "				from    ( "
				+ "				    select rownum as rn, no, revdate, revname, progress, name "
				+ "                    from("
				+ "                    select no, revdate, revname, progress, name"
				+ "				    from reservation "
//				+ "    				where id = 'asd' " �궡�븘�씠�뵒濡� 議고쉶
				+ "				    order by no desc "
				+ "				    ))"
				+ "				where rn>=? and rownum <=? ";
		
		List<Reservation> lst = new ArrayList<Reservation>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, ((PageNumber - 1) * RowsPerPage) + 1);
			pstmt.setInt(2, RowsPerPage);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Reservation reserv = new Reservation();
				
				reserv.setNo(rs.getInt(1));
				reserv.setRevdate(rs.getString(2));
				reserv.setRevname(rs.getString(3));
				reserv.setProgress(rs.getString(4));
				reserv.setName(rs.getString(5));
	
				
				lst.add(reserv);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {			e.printStackTrace();		}
		return lst;
	}
	
	public List<Reservationcancel> getCancelList(int PageNumber, int RowsPerPage )	{
		String sql  ="select no, revdate, revname, progress, name "
				+ "from    ( "
				+ "    select rownum as rn, no, revdate, revname, progress, name "
				+ "    from reservationcancel "
				+ "    order by cancelno desc "
				+ "    ) "
				+ "where rn>=? and rownum <=? ";
		
		List<Reservationcancel> lst = new ArrayList<Reservationcancel>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, ((PageNumber - 1) * RowsPerPage) + 1);
			pstmt.setInt(2, RowsPerPage);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Reservationcancel reservcancel = new Reservationcancel();
				
				reservcancel.setNo(rs.getInt(1));
				reservcancel.setRevdate(rs.getString(2));
				reservcancel.setRevname(rs.getString(3));
				reservcancel.setProgress(rs.getString(4));
				reservcancel.setName(rs.getString(5));
				
				
				lst.add(reservcancel);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {			e.printStackTrace();		}
		return lst;
	}
	public int Cancel(int no, String tableName) {
		String selectSql = "INSERT INTO reservationcancel(no, revdate, revname, progress, id, revtime, busino, name, cancelno) "
				+ "SELECT no, revdate, revname, progress, id, revtime, busino, name, ? "
				+ "FROM reservation "
				+ "where no = ?";
		
		String deleteSql="delete from reservation "
				+ "where no = ? ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(selectSql);
			
			System.out.println("�뜲�씠�꽣 蹂듭궗 �꽆踰�: " + no);
			pstmt.setInt(1, getAI(conn, tableName));
			pstmt.setInt(2, no);
			pstmt.executeUpdate();
			pstmt.close();
			System.out.println("�뜲�씠�꽣蹂듭궗 �셿猷�");
			
			pstmt = conn.prepareStatement(deleteSql);
			System.out.println("�뜲�씠�꽣�궘�젣 �꽆踰�: " + no);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			pstmt.close();
			System.out.println("�뜲�씠�꽣�궘�젣");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	public int getBoardCount(String tbname){
		String sql  ="select count(*) from " + tbname ;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {		return rs.getInt(1);			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {			e.printStackTrace();		}
		return 0;
	}
	
	public int getAI(Connection conn, String tableName) {
		String sql="select nvl(max(cancelno), 0)+1 from "+tableName;
		int maxNum=0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, tableName);
			
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
