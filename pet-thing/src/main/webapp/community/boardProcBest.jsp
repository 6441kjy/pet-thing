<%@page import="c.community.BoardListDAO"%>
<%@page import="c.DTO.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int rowsPerPage = 5;
	
	
	int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	
	String searchSelect = request.getParameter("searchSelect");
	String searchWord = request.getParameter("searchWord");
	
	BoardListDAO boardListDao = new BoardListDAO();
	
	String conditional = boardListDao.getConditional(searchSelect, searchWord);
	
	List<Board> lstH2 = boardListDao.getBoardListHit2(pageNumber, rowsPerPage);
	
	
	session.setAttribute("boardLstHit2", lstH2);
	request.setAttribute("rowsPerPage", rowsPerPage);
	request.setAttribute("totalPage", boardListDao.getBoardCount(conditional));
	
%>
<jsp:forward page="/index.jsp">
<jsp:param value="boardFormBest" name="currentPage"/>
</jsp:forward>