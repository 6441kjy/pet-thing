<%@page import="member.bookmark.origin.bookmarkTools"%>
<%@page import="member.bookmark.origin.bookmarkDTO"%>
<%@page import="java.util.List"%>
<%@page import="member.bookmark.origin.bookmarkDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String userId = "petthing";
	bookmarkDAO bDAO = new bookmarkDAO();
	bookmarkTools bTools = new bookmarkTools();
	
	if(session.getAttribute("userId")!=null) 
		userId = (String) session.getAttribute("userId");
	
	int rowsPerPage=5;
	int pageNumber =Integer.parseInt( request.getParameter("page") );
	String url = request.getContextPath()+"/mypage/bookmark/bookmarkProc.jsp?page=";
	
	System.out.println(url);
	
	String pageNo = request.getParameter("page");

	List<bookmarkDTO> hospitalLst = bDAO.getHospitalBookmark(userId, pageNumber, rowsPerPage);
	int hospitalCnt = bDAO.getHospitalCnt(userId);
	
	String nav = bTools.getNavi(hospitalCnt, rowsPerPage, url, pageNumber);
	
	session.setAttribute("hospitalLst", hospitalLst);
	session.setAttribute("favNavi",nav);
	
	
	
	
	


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<jsp:forward page="/index.jsp">
	<jsp:param value="bookmarkForm" name="currentPage"/>
</jsp:forward>