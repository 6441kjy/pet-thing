<!-- mapInfo.jsp -->

<%@page import="DTO.Qna"%>
<%@page import="java.util.List"%>
<%@page import="com.jin.map.ReviewDAO"%>
<%@page import="DTO.Review"%>
<%@page import="DTO.AHospital"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); 
	AHospital hos = (AHospital) request.getAttribute("hospital");
		
	String indexPath = request.getContextPath() + "/index.jsp";
	
	ReviewDAO dao = new ReviewDAO();
	List<Review> revLst = dao.getReviewList(hos.getNo());
	int total = dao.count("review", hos.getNo());
	List<Qna> qnaLst = dao.getQnaList(hos.getNo());
	int qna = dao.count("qna", hos.getNo());
	String userid = (String)session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫띵</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<style type="text/css">
.checked {
	color: orange;
}
a {text-decoration: none; outline: none}
a:hover, a:active {text-decoration: none; background-color:#f59000;}
</style>
</head>
<body>
	<center>
	<form id="frm" action="<%=request.getContextPath()%>/index.jsp" method=post>
	<input type="hidden" name="currentPage" value="reservation">
	<input type="hidden" name="no" value="<%=hos.getNo()%>">
	<input type="hidden" name="revname" value="<%=hos.getName()%>">
		<div class="justify-content-center container text-center mt-1">

			<div class="row justify-content-center">
				<div class="col m-3 mb-0 border bg-light" style="line-height: 400px;">
					<img src='<%=request.getContextPath()+"/img/thumbnail.jpg" %>' class="img-fluid" style="vertical-align:middle;" alt="thumbnail">
				</div>
				<div class="col m-3 mb-0 ms-0 border bg-light"
					style="height: 400px;">
					<div class="p-3">
						<br />
						<h2 class="mb-2"><%=hos.getName() %></h2>
						<small><%=hos.getPhone() %></small>
						<p class="mb-1"><%=hos.getAddress() %></p>
					</div>
					<div class="m-5">
						<p><h4 class="mb-5">"동물이 행복한 세상을 만드는 <%=hos.getName() %>"
						</h4>
						</p>
					</div>
					<div class="pt-3 align-item-center">
						<input type="submit" class="btn btn-outline-primary w-25" value="예약하기">	
	               		<a href="<%=request.getContextPath() %>/map/bookmark/addProc.jsp?no=<%=hos.getNo() %>" type="submit" class="btn btn-outline-warning w-25 ms-3">관심 매장 등록</a>
					</div>
				</div>
			</div>

			<div class="row p-3">
				<a href="#detail-info"class="col themed-grid-col bg-light border"
					style="line-height: 50px;">상세 정보</a>
				<a href="#review" class="col themed-grid-col bg-light border"
					style="line-height: 50px;">후기</a>
				<a href="#qna" class="col themed-grid-col bg-light border"
					style="line-height: 50px;">문의 사항</a>
			</div>
			<div id="detail-info" class="border" style="line-height: 2100px">
				<img src='<%=request.getContextPath() + "/img/marianimal.png"%>'
					alt="detail-img">
			</div>
			<br />
			<div style="text-align: left;" id="review">
				<h5>
					<b>후기 <%=total %>건</b>
				</h5>
				<p style="font-size: 15px;">
					<small>상품에 대한 후기를 공유해주세요.</small>
				</p>
			</div>
			<div>
				<div class="border p-2">
					<textArea id="new-review" placeholder="후기를 작성하려면 이곳을 클릭해주세요."
						style="height: 80px; width: 100%;" onclick="review('frm', '<%=indexPath %>', 'reviewForm')"></textArea>
				</div>
				<br/>
				<div class="border" id="review-list">
					<div>
					<% if (total!=0) {
					for(Review item : revLst) {
					int star = Integer.parseInt(item.getStar() );%>
						<div class="list-group list-group-flush border-bottom scrollarea">
							<div class="list-group-item py-3 lh-tight"
								aria-current="true">
								<div
									class="d-flex w-100 align-items-center justify-content-between">
									<div>
										<strong class="mb-1" style="float: left;"><%=userid %></strong>
										<div id="star-rating" class="ms-4" style="float: left;">
										<%for(int i=0; i<star; i++) {%>
											<span class="fa fa-star checked"></span>
											<%} %>
										<%for(int j=0; j<5-star; j++){ %>
										<span class="fa fa-star"></span>
										<%} %>
										</div>
									</div>
									<small><%=item.getRdate() %></small>
								</div>
									<div>
									<small style="float:right;"> 삭제 </small>
									<small class="me-3" style="float:right;"> 수정 </small>
									</div>
								<div class="col-10 mb-1 ms-5 mt-3 small" style="text-align: left;"><%=item.getContents() %></div>
							</div>
						</div>
						<%}}else{ %>
						<div class="list-group list-group-flush border-bottom scrollarea">
							<div class="list-group-item py-3 lh-tight" aria-current="true">
								<div class="d-flex w-100 align-items-center justify-content-between">
									
									
								</div>
								<div class="pt-5 pb-5 small" style="text-align: center;">등록된 후기가 없습니다.</div>
							</div>
						</div>
						<%} %>
					</div>
				</div>
			</div>
			<br />
			<div style="text-align: left;" id="qna">
				<h5>
					<b>문의 사항 <%=qna %>건</b>
				</h5>
				<p style="font-size: 15px;">
					<small>궁금한 점이 있으신 경우 문의해주세요. 평일 9시~6시 사이에는 전화 상담도 가능합니다.</small>
				</p>
			</div>
			<div id="qa">
				<div class="border p-2">
					<textArea id="new-review" placeholder="문의하실 사항이 있으시다면 이곳을 클릭해주세요."
						style="height: 80px; width: 100%;" onclick="review('frm', '<%=indexPath %>', 'qnaForm')"></textArea>
				</div>
				<br />
			</div>
			<div class="border" id="qna-list">
					<div>
					<% if (qna!=0) {
					for(Qna item : qnaLst) {
					String openness = item.getOpen();
					%>
						<div class="list-group list-group-flush border-bottom scrollarea">
							<div class="list-group-item py-3 lh-tight"
								aria-current="true">
								<div
									class="d-flex w-100 align-items-center justify-content-between">
									<div>
										<strong class="mb-1" style="float: left;"><%=userid %></strong>
									</div>
									<small><%=item.getQdate() %></small>
								</div>
									<div>
									<small style="float:right;"> 삭제 </small>
									<small class="me-3" style="float:right;"> 수정 </small>
									</div>
									<%if(openness.contentEquals("o")) {%>
								<div class="col-10 mb-1 ms-5 mt-3 small" style="text-align: left;"><%=item.getContents() %></div>
							<%} else {%>
							<div class="col-10 mb-1 ms-5 mt-3 small" style="text-align: left;">비공개로 작성된 글 입니다.</div>
							<%} %>
							</div>
						</div>
						<%}}else{ %>
						<div class="list-group list-group-flush border-bottom scrollarea">
							<div class="list-group-item py-3 lh-tight" aria-current="true">
								<div class="d-flex w-100 align-items-center justify-content-between">
									
									
								</div>
								<div class="pt-5 pb-5 small" style="text-align: center;"> 등록된 문의가 없습니다.</div>
							</div>
						</div>
						<%} %>
					</div>
				</div>
				<br/>
		</div>
</form>
	</center>
	<script type="text/javascript" src='<%=request.getContextPath()+"/js/reviewForm.js"%>'></script>
	<script type="text/javascript" src='<%=request.getContextPath()+"/js/common.js"%>'></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>
</body>
</html>