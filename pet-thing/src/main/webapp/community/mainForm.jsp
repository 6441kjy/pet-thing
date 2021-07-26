<%@page import="c.common.BoardTools"%>
<%@page import="java.util.List"%>
<%@page import="c.DTO.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	List<Board> boardLstRecent = (List<Board>)session.getAttribute("boardLstRecent");
	List<Board> boardLstHit =(List<Board>)session.getAttribute("boardLstHit");
	
	String deletePath = "formSubmit('frm','"+request.getContextPath()+"/board/deleteProc.jsp')";
	String viewPath = request.getContextPath()+"/community/viewProc.jsp?no=";	
	
	String contextPath =request.getContextPath();
	String path = contextPath;
	String path2 = request.getContextPath()+"/community/boardProcBest.jsp?pageNumber=1";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>communityMain</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="stylesheet" href="<%=path %>/community/css/common.css" />
</head>
<body>
    <div class="container-xxl">
    	<div class="container titleM">
    		<h1 class="mainTitle">커뮤니티</h1>
    	</div>
    	<div class="container">
			<div class="container commuNav">
				<nav class="navTop" style="width: 361px;">
		    		<ul>
		    			<li>
		    				<a href="<%=path %>/community/boardProc.jsp?pageNumber=1" class="btn btn-outline-primary">전체보기</a>
		    			</li>
		    			<li>
		    				<a href="<%=path2 %>" class="btn btn-outline-primary">인기글</a>
		    			</li>
		    			<li>
		    				<a href="<%=path %>" class="btn btn-outline-primary">최신글</a>
		    			</li>
		    			<li>
		    				<a href="<%=path %>" class="btn btn-outline-primary">입양게시판</a>
		    			</li>
		    			<li>
		    				<a href="<%=path %>" class="btn btn-outline-primary btn-last" >Q&amp;A</a>
		    			</li>
		    		</ul>
		    	</nav>
			</div>
			<div class="board_area">
				<div class="board container" style="width: 1100px;">
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
					    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">인기글</button>
					    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">최신글</button>
					</div>
					<div class="tab-content" id="nav-tabContent">
					  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
					  	<table class="table" style="margin: 10px auto; width:900px">
							<thead>
								<tr>
									<th style="width: 110px;">No.</th>
									<th style="width: 450px;">제목</th>
									<th style="width: 200px;">작성자</th>
									<th style="width: 150px;">작성일</th>
									<th style="width: 110px;">조회수</th>
								</tr>
							</thead>
							<tbody>
								<%
								for(Board board : boardLstHit){
								%>
								<tr>
									<td><%=board.getNo() %></td>
									<td><a href="<%=viewPath+board.getNo()%>"><%=board.getTitle() %></a></td>
									<td><%=board.getId() %></td>
									<td><%=board.getWdate() %></td>
									<td><%=board.getReadno() %></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					  </div>
					  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
					  	<table class="table" style="margin: 10px auto; width:900px">
							<thead>
								<tr>
									<th style="width: 110px;">No.</th>
									<th style="width: 450px;">제목</th>
									<th style="width: 200px;">작성자</th>
									<th style="width: 150px;">작성일</th>
									<th style="width: 110px;">조회수</th>
								</tr>
							</thead>
							<tbody>
								<%
								for(Board board : boardLstRecent){
								%>
								<tr>
									<td><%=board.getNo() %></td>
									<td><a href="<%=viewPath+board.getNo()%>"><%=board.getTitle() %></a></td>
									<td><%=board.getId() %></td>
									<td><%=board.getWdate() %></td>
									<td><%=board.getReadno() %></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					  </div>
					</div>
					<div class="more">
						<a href="<%=path %>/community/boardProc.jsp?pageNumber=1" class="moreBtn">+더보기</a>
					</div>
				</div>
				<div class="board2">
					<div class="adoption_board">
						<h2 class="title">입양게시판</h2>
							<table class="table" style="margin: 10px auto; width:900px">
							<thead>
								<tr>
									<th style="width: 110px;">No.</th>
									<th style="width: 450px;">제목</th>
									<th style="width: 200px;">작성자</th>
									<th style="width: 150px;">작성일</th>
									<th style="width: 110px;">조회수</th>
								</tr>
							</thead>
							<tbody>
							<tr>
									<td>1</td>
									<td>우리집 포메의 아이들의 가족이 되어주실 분!</td>
									<td>fjkds</td>
									<td>2021-04-28 12:28:11</td>
									<td>7</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="qa_board">
						<h2 class="title">Q&amp;A</h2>
						<table class="table" style="margin: 10px auto; width:900px">
							<thead>
								<tr>
									<th style="width: 110px;">No.</th>
									<th style="width: 450px;">제목</th>
									<th style="width: 200px;">작성자</th>
									<th style="width: 150px;">작성일</th>
									<th style="width: 110px;">조회수</th>
								</tr>
							</thead>
							<tbody>
							
								<tr>
									<td>1</td>
									<td>우리 아이가 밥을 먹질 못해요ㅜㅜ</td>
									<td>fjkds</td>
									<td>2021-04-01 12:00:45</td>
									<td>10</td>
								</tr>
							
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>