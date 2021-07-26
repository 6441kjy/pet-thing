<!-- reservProc.jsp -->
<%@page import="java.util.ArrayList"%>
<%@page import="com.jin.map.Hospital"%>
<%@page import="DTO.AHospital"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8"); 
    String date = request.getParameter("Date");
	String hour = request.getParameter("hour");
    String minute = request.getParameter("minute");
    String name = request.getParameter("name");
    String revname = request.getParameter("revname");
    String busino = request.getParameter("busino");
    int progress = 1;
    String time = hour + ":" + minute;
    String id = (String)session.getAttribute("userId");
   
    

    Hospital dao = new Hospital();
    dao.Insert(date, revname, progress, id, time, busino, name);
    
    List<String> reservLst = new ArrayList<>();
    reservLst.add(0, date);
    reservLst.add(1, time);
    reservLst.add(2, name);
    reservLst.add(3, revname);
    reservLst.add(4, busino);
    reservLst.add(5, progress+"");
    reservLst.add(6, id);
    
    request.setAttribute("reservLst", reservLst);
    
    System.out.println("db 입력 완료");
    
    %>
<jsp:forward page="/index.jsp">
<jsp:param value="reservCheck" name="currentPage"/>
</jsp:forward>