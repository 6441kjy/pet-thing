<%@page import="java.sql.Connection"%>
<%@page import="com.jin.map.Hospital"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8"); 
	//System.out.println(request.getParameter("id"));
	
	//out.print(request.getParameter("id")+"<br>"+request.getParameter("name")+"<br>"+request.getParameter("address")+"<br>"+request.getParameter("info"));

	Hospital hospitalDAO = new Hospital();
	Connection conn = hospitalDAO.getConn();
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String address=request.getParameter("address");
	String phone = request.getParameter("phone");
	String x = request.getParameter("x");
	String y = request.getParameter("y");
	
	int result = hospitalDAO.Insert(conn, id, name, address, phone, x, y);
	
	//String pagePath = request.getContextPath()+"?currentPage=writehospitalResult";
	
	String pagePath = "result.jsp";
	
	if(result==0)
		pagePath = "failed.jsp";
	
	System.out.println("writeHospitalProc.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
proc2
</body>
</html>
<jsp:forward page="<%=pagePath %>"/>