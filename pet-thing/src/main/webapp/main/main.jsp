<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<BoardDTO> newList = null;
	List<BoardDTO> mostViewList = null;
	
	String msg = "<p align='center' style='margin: 3rem;'>올바르지 않은 경로로 접속되었습니다.</p>";
	
	if(session.getAttribute("newList")!=null) {
		newList = (List<BoardDTO>)session.getAttribute("newList");
	} else {
		out.print(msg);
		return;
	}
	
	if(session.getAttribute("mostViewList")!=null) {
		mostViewList = (List<BoardDTO>)session.getAttribute("mostViewList");
	} else {
		out.print(msg);
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>


<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active"  data-bs-interval="10000">
      <img src="<%=request.getContextPath()%>/main/img/main.png" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item" data-bs-interval="10000">
      <img src="<%=request.getContextPath()%>/main/img/pethospital.png" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<div class="container">
<div class="container">
<div class="row mt-3 mb-3">
	<div class="card-group">
		<div class="card border-white">
			<div class="card-body">
				<h5 class="card-title"><i class="fas fa-dog"></i> 지도 </h5>
				<p class="card-text">
					  잃어버린 반려동물 공고 등록<br/>
					  주변 이웃들에게 알림<br/>
					  우리 집 근처 동물병원 정보 검색
				</p>
			</div>
		</div>
		<div class="card border-white"">
			<div class="card-body">
				<h5 class="card-title"><i class="fas fa-paw"></i> 커뮤니티 </h5>
				<p class="card-text">
					회원 간의 정보 공유의 장<br>
				</p>
			</div>
		</div>
		<div class="card border-white"">
			<div class="card-body">
				<h5 class="card-title"><i class="fas fa-cat"></i> 마이페이지 </h5>
				<p class="card-text">
					동물 병원 예약 관리<br>
					개인정보 관리<br>
				</p>
			</div>
		</div>
	</div>
</div>
</div>
</div>

<div class="row mt-3">
	<div class="col-4">
		<div class="card">
			<div class="card-header">
				<span>커뮤니티</span> <i class="fas fa-comments"></i>
			</div>
			<ul class="list-group list-group-flush">
				<li class="list-group-item">전체게시판</li>
				<li class="list-group-item">입양게시판</li>
				<li class="list-group-item">Q&A</li>
			</ul>
		</div>
	</div>
	<div class="col-4">
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">커뮤니티 최신글</h5>
				<p class="card-text">
					<ul class="list-group list-group-flush">
					  <% for(BoardDTO boardDTO : newList) {%>
					    	<li class="list-group-item text-truncate"><%=boardDTO.getTitle() %></li>
					  <% } %>
				    </ul>
				</p>
			</div>
		</div>
	</div>
	<div class="col-4">
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">커뮤니티 인기글</h5>
				<p class="card-text">
					<ul class="list-group list-group-flush">
					  <% for(BoardDTO boardDTO : mostViewList) {%>
					    	<li class="list-group-item text-truncate"><%=boardDTO.getTitle() %></li>
					  <% } %>
				    </ul>
				</p>
			</div>
		</div>
	</div>
</div>


</body>
</html>