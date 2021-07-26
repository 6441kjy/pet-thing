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
	
	List<Board> lst = boardListDao.getBoardList(pageNumber, rowsPerPage);
	
	
	
	session.setAttribute("boardLst", lst);
	request.setAttribute("rowsPerPage", rowsPerPage);
	request.setAttribute("totalPage", boardListDao.getBoardCount(conditional));
	
	/* String searchSelect = request.getParameter("searchSelect");
	String searchWord = request.getParameter("searchWord");
	
	BoardListDAO boardListDao = new BoardListDAO();
	List<Board> lst = boardListDao.getBoardList(pageNumber, rowsPerPage);
	session.setAttribute("boardLst", lst);
	
		String conditional = boardListDao.getConditional(searchSelect, searchWord);
	
	List<Board> lst = boardListDao.getBoardList();
	
	session.setAttribute("boardLst", lst);
	request.setAttribute("rowsPerpage", rowsPerPage);
	request.setAttribute("totalPage", boardListDao.getBoardCount(conditional)); */
%>
<jsp:forward page="/index.jsp">
<jsp:param value="boardForm" name="currentPage"/>
</jsp:forward>