<%@page import="com.jin.DTO.Reservationcancel"%>
<%@page import="com.jin.common.BoardTools"%>
<%@page import="com.jin.DTO.Reservation"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	List<Reservation> boardLst = (List<Reservation>)session.getAttribute("reserv");
	List<Reservationcancel> cancelboardLst = (List<Reservationcancel>)session.getAttribute("reservcancel");

	String contextPath =request.getContextPath();
	String path = contextPath +  "/index.jsp?currentPage=";

	int rowsPerPage = (Integer)request.getAttribute("rowsPerPage");
	int totalPage = (int)request.getAttribute("totalPage");	
	int pageNumber = Integer.parseInt( request.getParameter("pageNumber") );
	
	int cancelrowsPerPage = (Integer)request.getAttribute("cancelrowsPerPage");
	int canceltotalPage = (int)request.getAttribute("canceltotalPage");	
	int cancelpageNumber = Integer.parseInt( request.getParameter("cancelpageNumber") );
	
	String url = request.getContextPath()+"/mypage/reservation/reservationProc.jsp?cancelpageNumber="+cancelpageNumber+"&pageNumber=";
	String cancelurl = request.getContextPath()+"/mypage/reservation/reservationProc.jsp?pageNumber="+pageNumber+"&cancelpageNumber=";

	String firstpath = request.getContextPath()+"/mypage/reservation/reservationProc.jsp?pageNumber=1&cancelpageNumber=1";
	String viewPath = request.getContextPath()+"/mypage/reservation/reservationviewProc.jsp?no=";
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<div>
	<div class="card mb-3 " style="height:300px; ">
	<h5 class="card-header "><a class="link-dark text-decoration-none" href="">예약 내역</a></h5>
		<div class="card-body pt-2 pb-2">
	<table class="table">
		<colgroup>
			<col style="width:90px">
			<col >
			<col style="width:300px">
			<col style="width:110px">
			<col style="width:110px">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">예약번호</th>
				<th scope="col">예약일</th>
				<th scope="col">예약명</th>
				<th scope="col">예약자</th>
				<th scope="col">진행상황</th>
			</tr>
		</thead>
		<tbody>
<%
	if(boardLst.size()==0)	{
%>		
			<tr>
				<td colspan="9" class="text-center">예약하신 내역이 없습니다.</td>
			</tr>
<%
	}
	else	{
		for(Reservation reservLst : boardLst){
%>
				<tr>
					<td class="text-center" ><%=reservLst.getNo() %></td>
					<td > 
					<a class="link-dark text-decoration-none" href="<%=viewPath+reservLst.getNo() %>"><%=reservLst.getRevdate() %></a></td>
					<td > 
					<a class="link-dark text-decoration-none" href="<%=viewPath+reservLst.getNo() %>"><%=reservLst.getRevname() %></a></td>
					<td ><%=reservLst.getName() %></td>                                                                                                                                                         
					<td >예약 요청</td>
				</tr>
<%
	}
}
%> 
</tbody>
	</table>
		<div class="m-auto mt-1 text-center">
					<%
out.print(BoardTools.getNavi(totalPage, rowsPerPage, url, pageNumber));
%>
		</div>
		</div>
		</div>
		</div>
		<div>
			<div class="card mb-3" style="height:300px; ">
				<h5 class="card-header"><a class="link-dark text-decoration-none" href="">취소 내역</a></h5>
				<div class="card-body pt-2 pb-2">
				<table class="table">
								<colgroup>
					<col style="width:90px">
					<col >
					<col style="width:300px">
					<col style="width:110px">
					<col style="width:110px">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">예약번호</th>
						<th scope="col">예약일</th>
						<th scope="col">예약명</th>
						<th scope="col">예약자</th>
						<th scope="col">진행상황</th>
					</tr>
				</thead>
		<tbody>
			<%
	if(cancelboardLst.size()==0)	{
%>		
			<tr>
				<td colspan="9" class="text-center">취소하신 내역이 없습니다.</td>
			</tr>
<%
	}
	else	{
		for(Reservationcancel reservLst : cancelboardLst){
%>
				<tr>
					<td class="text-center" ><%=reservLst.getNo() %></td>
					<td > 
					<a class="link-dark text-decoration-none" href="<%=viewPath+reservLst.getNo() %>"><%=reservLst.getRevdate() %></a></td>
					<td > 
					<a class="link-dark text-decoration-none" href="<%=viewPath+reservLst.getNo() %>"><%=reservLst.getRevname() %></a></td>
					<td ><%=reservLst.getName() %></td>
					<td >취소 요청</td>
				</tr>
<%
	}
}
%> 
		</tbody>
	</table>
		<div class="m-auto mt-1 text-center">
					<%
out.print(BoardTools.getNavi(canceltotalPage, cancelrowsPerPage, cancelurl, cancelpageNumber));
%>
		</div>
		</div>
		</div>
	</div>

</div>
</body>
</html>