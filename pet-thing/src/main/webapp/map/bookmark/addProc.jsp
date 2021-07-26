<%@page import="member.bookmark.bookmarkDAO"%>
<%@page import="DTO.AHospital"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8"); 
	//out.print(session.getAttribute("userId")+"<br>"+request.getParameter("no"));
	
	String userId = (String)session.getAttribute("userId");
	int no = Integer.parseInt((String)request.getParameter("no"));
	
	bookmarkDAO bDAO = new bookmarkDAO();
	
	int result = bDAO.insertBookmark(no, userId);	
	
	out.print(result);
	
	//if(result) 결과에따라 페이지이동 0:실패 1:성공
	String pagePath = "result.jsp";
	if(result==0)
		pagePath = "failed.jsp";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
addProc
</body>
</html>
<jsp:forward page="<%=pagePath %>"/>