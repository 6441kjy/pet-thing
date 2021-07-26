<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	BoardListDAO boardListDAO = new BoardListDAO();
	//String mainPage = request.getContextPath()+"index.jsp?currentPage=main";
	int maxNum = 5;

	//List<BoardDTO> newList = boardListDAO.getNewBoardLst("board", maxNum);
	List<BoardDTO> newList = boardListDAO.getNewBoardLst(maxNum);
	List<BoardDTO> mostViewList = boardListDAO.getMostViewedLst(maxNum);
	
	//System.out.println(newList+" : mainProc");
	
	session.setAttribute("newList", newList);
	session.setAttribute("mostViewList", mostViewList);
	
	//System.out.println(mostViewList+" : mainProc");
	
	//response.sendRedirect(mainPage);
%>


<jsp:forward page="/index.jsp">
<jsp:param value="index" name="currentPage"/>
</jsp:forward>