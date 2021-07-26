<%@page import="c.community.BoardReadDAO"%>
<%@page import="c.DTO.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Board board = (Board)request.getAttribute("board");
	
	
	String indexPath = request.getContextPath() + "/index.jsp";
	String boardListPath = request.getContextPath() + "/community/boardProc.jsp";
	String path = request.getContextPath()+"/community/boardProc.jsp?pageNumber=1";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS only -->
<link rel="stylesheet" href='<%=request.getContextPath()+"/community/css/common.css"%>' />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>
<div class="container" style="width: 1000px; margin: 50px auto">
	<div class="container titleM">
   		<h1 class="mainTitle"><%=board.getTitle() %></h1>
   	</div>
   	<form action='<%=path %>' method="post" >
		<div class="formArea">
			<div class="userD">
				<div class="writerArea">
					<span>작성자 : <%=board.getId() %></span>
				</div>
				<div class="wdateArea">
					<span><%=board.getWdate() %></span>
				</div>
			</div>
			<div class="conArea">
				<span class="contentA">
				<%=board.getContents() %>
				</span>
			</div>
			<div class="f_Menu">
				<input type="submit" value="목록" class="btn btn-primary" />
			</div>
		</div>
	</form>
</div>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>