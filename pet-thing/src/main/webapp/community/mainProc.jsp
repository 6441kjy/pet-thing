<%@page import="c.DTO.Board"%>
<%@page import="java.util.List"%>
<%@page import="c.community.BoardListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	BoardListDAO boardListDao = new BoardListDAO();
	
	List<Board> lstR = boardListDao.getBoardListRecent();
	List<Board> lstH = boardListDao.getBoardListHit();
	
	String searchSelect = request.getParameter("searchSelect");
	String searchWord = request.getParameter("searchWord");

	String conditional = boardListDao.getConditional(searchSelect, searchWord);
	
	session.setAttribute("boardLstRecent", lstR); 
	session.setAttribute("boardLstHit", lstH);
	request.setAttribute("totalPage", boardListDao.getBoardCount(conditional));

%>
<jsp:forward page="/index.jsp">
<jsp:param value="mainForm" name="currentPage"/>
</jsp:forward>