<%@page import="member.hospital.hospitalDTO"%>
<%@page import="java.util.List"%>
<%@page import="member.hospital.hospitalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	hospitalDAO hDAO = new hospitalDAO();
	System.out.println("왜안돼" + session.getAttribute("userId"));
	if(session.getAttribute("userId")==null)
		return;
	String userId = (String)session.getAttribute("userId");
	System.out.println("왜안돼" + userId);


	List<hospitalDTO> hospitalLst= hDAO.getMyHospital(userId);
	
	session.setAttribute("myHospitalLst", hospitalLst);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Listproc
</body>
</html>
<jsp:forward page="/index.jsp">
	<jsp:param value="myHospital" name="currentPage"/>
</jsp:forward>