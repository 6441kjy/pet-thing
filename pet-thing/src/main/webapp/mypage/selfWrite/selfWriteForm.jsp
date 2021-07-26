<%@page import="java.util.List"%>
<%@page import="com.jin.DTO.Selfboard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	List<Selfboard> boardLst = (List<Selfboard>)session.getAttribute("selfboard");
	String viewPath = request.getContextPath()+"/community/viewProc.jsp?no=";
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<div class="card mb-3">
		<h5 class="card-header"><a class="link-dark text-decoration-none" href="">최근 게시글</a></h5>
		<div class="card-body pt-2 pb-2">
			<div class="row">
				<table class="table mb-2 text-center">
					<tbody>
					<%
for(Selfboard board : boardLst){
%>
						<tr>
							<th scope="row"><%=board.getNo() %></th>
							<td colspan="2"><a class="link-dark text-decoration-none" href="<%=viewPath+board.getNo()%>"><%=board.getTitle() %></a></td>
							<td><%=board.getDate() %></td>
						</tr>
<%
}
%>
		</tbody>
				</table>
				<div class="d-inline-flex justify-content-end" style="font-size:small;">
					<a class="link-dark text-decoration-none" href="">더보기..</a>
				</div>
			</div>
		</div>
	</div>
	<div class="card mb-3">
		<h5 class="card-header"><a class="link-dark text-decoration-none" href="">최근 댓글</a></h5>
		<div class="card-body pt-2 pb-2">
			<div class="row">
				<table class="table mb-2 text-center">
					<tbody>
		<%
for(Selfboard board : boardLst){
%>
						<tr>
							<th scope="row"><%=board.getNo() %></th>
							<td colspan="2">안녕하세요~</td>
							<td><%=board.getDate() %></td>
						</tr>
<%
}
%>
		</tbody>
				</table>
				<div class="d-inline-flex justify-content-end" style="font-size:small;">
					<a class="link-dark text-decoration-none" href="">더보기..</a>
				</div>
			</div>
		</div>
	</div>

	
</div>
</body>
