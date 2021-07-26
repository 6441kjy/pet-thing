<%@page import="com.jin.Board.ReservationDAO"%>
<%@page import="com.jin.DTO.Reservation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
%>
<%
	int no = Integer.parseInt(request.getParameter("reserv"));
	out.print(no);
	ReservationDAO reservDao = new ReservationDAO();
	reservDao.Cancel(no, "reservationcancel");
	
	String path = "reservationProc.jsp?pageNumber=1&cancelpageNumber=1";
%>
<!-- <!DOCTYPE html>
<html>
<body>
	<div>cancle proc입니다.</div>
</body>
</html> -->
<jsp:forward page='<%=path %>'/>
