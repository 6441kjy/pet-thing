<!-- reviewProc.jsp -->
<%@page import="java.sql.Connection"%>
<%@page import="com.jin.map.ReviewDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.jin.map.Hospital"%>
<%@page import="DTO.AHospital"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8"); 
    String revname = request.getParameter("revname");
    int busino = Integer.parseInt(request.getParameter("busino"));
    String star = request.getParameter("star-rating");
    String contents = request.getParameter("review-contents");

    String id = "jin";
    
	ReviewDAO dao = new ReviewDAO();
	Connection conn = dao.getConn();
	dao.Insert(conn, busino, id, star, contents);

    System.out.println("db 입력 완료");
    
    %>
<jsp:forward page="infoProc.jsp">
<jsp:param value="<%=busino %>" name="no"/>
</jsp:forward>