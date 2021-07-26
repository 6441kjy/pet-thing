<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); 
	out.print(request.getParameter("id")+"<br>"+request.getParameter("name")+"<br>"+request.getParameter("address")+"<br>"+request.getParameter("info"));
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
writeHospitalProc
</body>
</html>

<jsp:forward page="getCoords.jsp"/>