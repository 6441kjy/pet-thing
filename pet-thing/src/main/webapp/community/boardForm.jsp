<%@page import="java.util.ArrayList"%>
<%@page import="c.common.BoardTools"%>
<%@page import="c.community.BoardListDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="c.DTO.Board" %>
<%

	String searchSelect =BoardTools.getEncoder(request, "searchSelect", "UTF-8");
	String searchWord = BoardTools.getEncoder(request, "searchWord", "UTF-8");

	String naviStrm = "searchSelect="+searchSelect+"&searchWord="+searchWord;
	
	List<Board> boardLst = (List<Board>)session.getAttribute("boardLst");
	String url = request.getContextPath()+"/community/boardProc.jsp?"+naviStrm+"&pageNumber=";
	
	int rowsPerPage = (Integer)request.getAttribute("rowsPerPage");
	int totalPage = (int)request.getAttribute("totalPage");	
	int pageNumber = Integer.parseInt( request.getParameter("pageNumber") );
	
	String path = request.getContextPath()+"/community/boardProc.jsp?pageNumber=1";
	String path2 = request.getContextPath()+"/community/boardProcBest.jsp?pageNumber=1";
	String deletePath = "formSubmit('frm','"+request.getContextPath()+"/board/deleteProc.jsp')";
	String viewPath = request.getContextPath()+"/community/viewProc.jsp?no=";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>communityAll</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/common.css" />
</head>
<body>
    <div class="container">
    	<div class="container titleM">
    		<h1 class="mainTitle">커뮤니티</h1>
    	</div>
    	<div class="container">
			<div class="container commuNav">
				<nav class="navTop" style="width: 361px;">
		    		<ul>
		    			<li>
		    				<a href="<%=path %>" class="btn btn-outline-primary">전체보기</a>
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
			<div class="board_area" style="padding-top: 40px;">
				<div class="board container" style="width: 1100px;">
					<form action="<%=request.getContextPath() %>/index.jsp?currentPage=writeForm" method="post">
						<div class="tableArea">
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
										for(Board board : boardLst){
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
							  <div style="text-align: center">
							 	<%
								out.print(BoardTools.getNavi(totalPage, rowsPerPage, url, pageNumber));
								%>
							  </div>
							</div>
						</div>
						<div class="subNav">
							<select>
								<option>전체글</option>
								<option>인기글</option>
								<option>최신글</option>
							</select>
							<input type="submit" value="글쓰기" class="btn btn-primary">
						</div>
						<div class="shNav">
							<%
								String jsFuncName = "formSubmit('frm','"+path+"')";
								List<String> lst = new ArrayList<String>();
								lst.add("전체");
								lst.add("제목");
								lst.add("작성자");
								
								out.print(BoardTools.getSearch(lst, jsFuncName));
							%>	
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>