<!-- infoProc.jsp -->
<%@page import="DTO.AHospital"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8"); 
    String no = request.getParameter("no");
    int noInt = Integer.parseInt(no);
    List<AHospital> hosLst = (List<AHospital>) session.getAttribute("hosLst");
    
	for(AHospital hos : hosLst){
		if(noInt==hos.getNo()){
			request.setAttribute("hospital", hos);
			break;
		}}
    %>
<jsp:forward page="/index.jsp">
<jsp:param value="mapInfo" name="currentPage"/>
</jsp:forward>