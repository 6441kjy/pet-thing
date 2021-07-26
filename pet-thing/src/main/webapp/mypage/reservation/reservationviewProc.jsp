<%@page import="com.jin.DTO.Reservation"%>
<%@page import="com.jin.Board.ReservationDAO"%>
<%@page import="com.jin.DTO.Attachfile"%>
<%@page import="com.jin.Board.BoardReadDAO"%>
<%@page import="com.jin.DTO.Board"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String no = request.getParameter("no");
	List<Reservation> boardLst = (List<Reservation>)session.getAttribute("reserv");
	ReservationDAO reservDao = new ReservationDAO();
	int noInt = Integer.parseInt(no);
	
	System.out.println("reserv :" + boardLst.size());
	for(Reservation reservLst : boardLst){
		if(noInt==reservLst.getNo()){
			request.setAttribute("reserv", reservLst);
			/* boardReadDao.Update(noInt); */
			break;
		}
	}
	
	/* List<Attachfile> attachFileLst = boardReadDao.getAttachFileList(Integer.parseInt(no));
	request.setAttribute("attachFileLst", attachFileLst); */
%>
<jsp:forward page="/index.jsp">
<jsp:param value="detailreserv" name="currentPage"/>
</jsp:forward>




