<!-- mapHome.jsp -->
<%@page import="java.util.List"%>
<%@page import="com.jin.map.Hospital"%>
<%@page import="DTO.AHospital"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	AHospital hos = new AHospital();
	Hospital dao = new Hospital();
	
	List<AHospital> hosLst = dao.getHospitalList();
	String mapPath = request.getContextPath()+"/map/infoProc.jsp?no=";
	
	session.setAttribute("hosLst", hosLst);
	
	String mapMenu="common/menu.jsp";
	String mapPage="loadMap.jsp";  
	
	if(request.getParameter("hospitalItemNo")!=null)
		mapPage = "loadOneMap.jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>API 연습</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<style type="text/css">
.row ul, .list-group ul {
   list-style: none;
   padding: 10px;
}

.row ul li, .list-group ul li {
   padding: 5px;
   margin-left: 10px;
}

/* .map-wrap {
   width:100%;
} */

.map-wrap::after {
   content:'';
   display:block;
   clear:both;
   
}
</style>
</head>
<body>
	<jsp:include page="<%=mapMenu%>"/>
	<div class="map-wrap position-relative">
		<jsp:include page="<%=mapPage%>"/>
		
		<div class="list-group"
			style="overflow: auto; width: 30%; height: 400px; float:left;">
			<ul>
		<%
			for(AHospital hosItem : hosLst){
		%>
		<li><a href="<%="?currentPage=mapHome&hospitalItemNo="+hosItem.getNo()+"&hospitalItemName="+hosItem.getName()+"&x="+hosItem.getX()+"&y="+hosItem.getY() %>"
					class="list-group-item list-group-item-action"
					aria-current="true">
						<div class="d-flex w-100 justify-content-between">
							<h5 class="mb-1"><%= hosItem.getName() %></h5>
						</div> <small><%= hosItem.getPhone() %></small>
						<p class="mb-1"><%= hosItem.getAddress() %></p>
				</a></li>
				<%} %>
			</ul>
		</div>
	</div>
	<small class="row justify-content-end mt-3">위치를 클릭하여 실종 공고를 등록하실 수 있습니다.</small>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>
</body>

</html>