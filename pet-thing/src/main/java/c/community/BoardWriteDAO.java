package c.community;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import c.DTO.AttachFile;
import c.DTO.Board;

public class BoardWriteDAO {
	private MultipartRequest multiReq;
	public Connection getConn() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "c##petthing";
		String pass = "pet4thing";
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	public int Insert(Connection conn, Board board) {
		String sql = "INSERT INTO board(no, title, id, contents, wDate, header) "
				+ "VALUES(?, ?, ?, ?, sysdate, '誘멸뎄�쁽')";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, board.getNo());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getId());
			pstmt.setString(4, board.getContents());
			
			pstmt.executeUpdate();
			pstmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;	
	}
	public Board getBoard(HttpServletRequest request) {
		Board board = new Board();
		getMultiReq(request);
		board.setId(multiReq.getParameter("writer"));
		board.setTitle(multiReq.getParameter("title"));
		board.setContents(multiReq.getParameter("contents"));
		board.setNo(getAI(getConn(), "Board"));
		
		return board;
		
	}
	private Integer getAI(Connection conn, String tableName) {
		String sql = "select nvl(max(no), 0)+1 from "+tableName;
		int maxNum=0;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next());
				maxNum = rs.getInt(1);
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return maxNum;
	}
	private void getMultiReq(HttpServletRequest request) {
		String uploadFilePath = request.getServletContext().getRealPath("uploadFile");
		int maxSize = 1024*1024*10;
		
		try {
			multiReq = new MultipartRequest(request, uploadFilePath, maxSize, "UTF-8", 
					new DefaultFileRenamePolicy());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public AttachFile getAttachFile(HttpServletRequest request, int pno) {
		AttachFile attachFile = new AttachFile();
		int no = getAI(getConn(), "AttachFile");
		System.out.println(no);
		attachFile.setFileno(no);
		attachFile.setFilename(multiReq.getFilesystemName("uploadFile"));
		attachFile.setFilepath(multiReq.getOriginalFileName("uploadFile"));
		attachFile.setPno(pno);
		
		return attachFile;
	}
	public int Insert(Connection conn, AttachFile attachFile) {
		String sql="INSERT INTO AttachFile (fileno, filename, filepath, pno) "
				+ "VALUES(?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, attachFile.getFileno());
			pstmt.setString(2, attachFile.getFilename());
			pstmt.setString(3, attachFile.getFilepath());
			pstmt.setInt(4, attachFile.getPno());
			
			pstmt.executeUpdate();
			pstmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}
	public int Insert(Connection conn, int no, String pno) {
		String selectSql = "select depth+1 from reply where no=?";
		String insertSql = "INSERT INTO reply(no, pno, depth) values(?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(selectSql);
			pstmt.setString(1, pno);
			ResultSet rs = pstmt.executeQuery();
			int depth = 1;
			if(rs.next())	depth = rs.getInt(1);
			pstmt.close();
			
			pstmt = conn.prepareStatement(insertSql);
			pstmt.setInt(1, no);
			pstmt.setString(2,pno);
			pstmt.setInt(3, depth);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	public String getPno(HttpServletRequest requst) {
		return multiReq.getParameter("pno");
	}
}
