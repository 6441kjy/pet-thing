<%@page import="c.community.BoardReadDAO"%>
<%@page import="c.DTO.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no = request.getParameter("no");
	System.out.println("no :" + no);
	List<Board> boardLst = (List<Board>)session.getAttribute("boardLst");
	BoardReadDAO boardReadDao = new BoardReadDAO();
	int noInt = Integer.parseInt(no);
	System.out.println("noInt :" + noInt);
	System.out.println("noInt :" + boardLst.size());
	for(Board board : boardLst){
		if(noInt==board.getNo()){
			request.setAttribute("board", board);
			System.out.print("보드셋 완료");
			break;
		}
	}
	
	/* List<AttachFile> attachFileLst = boardReadDao.getAttachFileList(Integer.parseInt(no));
	request.setAttribute("attachFileLst",attachFileLst); */
%>
<jsp:forward page="/index.jsp">
<jsp:param value="viewForm" name="currentPage"/>
</jsp:forward>