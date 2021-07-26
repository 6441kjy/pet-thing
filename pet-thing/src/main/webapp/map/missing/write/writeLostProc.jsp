<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="map.lost.LostPetDTO"%>
<%@page import="map.lost.LostPetDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");

	LostPetDTO lostDTO = new LostPetDTO();
	DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");

	lostDTO.setId(request.getParameter("id"));
	lostDTO.setPetname(request.getParameter("petname"));
	lostDTO.setPhone(request.getParameter("phone"));
	lostDTO.setChk(Integer.parseInt(request.getParameter("chk")));
	lostDTO.setSpecies(request.getParameter("species"));
	lostDTO.setPetgender(Integer.parseInt(request.getParameter("petgender")));
	lostDTO.setMdate(request.getParameter("mDate"));
	lostDTO.setInfo(request.getParameter("info"));
	lostDTO.setX(request.getParameter("x"));
	lostDTO.setY(request.getParameter("y"));
	
	LostPetDAO lostDAO = new LostPetDAO();
	
	if(lostDAO.insert(lostDTO)==1)
		out.print("입력됨");
	
	/* request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	out.print(id+"<br>");
	
	String petname = request.getParameter("petname");
	out.print(petname+"<br>");
	
	String phone = request.getParameter("phone");
	out.print(phone +"<br>");
	
	String chk = request.getParameter("chk");
	out.print(chk +"<br>");
	String species = request.getParameter("species");
	out.print(species +"<br>");
	String petgender = request.getParameter("petgender");
	out.print(petgender +"<br>");
	
	String mDate = request.getParameter("mDate");
	out.print(mDate+"<br>");
	String info = request.getParameter("info");
	out.print(info+"<br>"); */
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
<jsp:param value="mapLost" name="currentPage"/>
</jsp:forward>