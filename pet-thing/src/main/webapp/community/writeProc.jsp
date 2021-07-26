
<%@page import="c.DTO.Board"%>
<%@page import="c.community.BoardWriteDAO"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
	BoardWriteDAO boardDao = new BoardWriteDAO();
	Connection conn = boardDao.getConn();
	Board board = boardDao.getBoard(request);
	boardDao.Insert(conn, board);
	
	/* AttachFile attachFile = boardDao.getAttachFile(request, board.getNo());
	boardDao.Insert(conn, attachFile); */
%>
<jsp:forward page="./boardProc.jsp">
<jsp:param value="1" name="pageNumber"/>
</jsp:forward>