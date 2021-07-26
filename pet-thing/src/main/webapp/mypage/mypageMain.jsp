<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String currentPage = request.getParameter("currentPage");
	String pageName = "selfWrite/selfWriteProc.jsp";
	System.out.println(currentPage);
	if (currentPage == null)
		pageName = "selfWrite/selfWriteProc.jsp";
	else if ("selfWrite".contentEquals(currentPage))
		pageName = "selfWrite/selfWriteForm.jsp";
	else if ("myreservation".contentEquals(currentPage))
		pageName = "reservation/reservationForm.jsp";
	else if ("review".contentEquals(currentPage))
		pageName = "review/reviewFormNew.jsp";
	else if ("memo".contentEquals(currentPage))
		pageName = "memo/memoForm.jsp";
	else if ("bookmark".contentEquals(currentPage))
		pageName = "bookmark/bookmarkProc.jsp?page=1";
	else if("bookmarkForm".contentEquals(currentPage))
		pageName = "bookmark/bookmarkForm.jsp";
	else if ("myinfo".contentEquals(currentPage))
		pageName = "myinfo/myinfoForm.jsp";
	else if ("detailreserv".contentEquals(currentPage))
		pageName = "reservation/detailReservationForm.jsp";
	
	/* 보배씨 */

	else if ("myHospital".contentEquals(currentPage))
		pageName = "myHospital/list.jsp";
	
	System.out.println(pageName);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
<style type="text/css">
	/* div{
		padding: 10px;
	} */
	
</style>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/mypage/css/style.css">
</head>
<body>
<div class="row" >
	<div class="col-xxl-3">
		<%@ include file="profile/profileForm.jsp" %>
	</div>	
	<div class="col-sm-9 me-auto">
		<div class="bg-white">
			<%@ include file="common/mypageTop.jsp" %>
		</div>
		<div class="mt-3" style="height: 960px;">
			<jsp:include page="<%=pageName%>"/>
		</div>
	</div>
	
</div>
<script src="https://kit.fontawesome.com/bdcf636563.js" crossorigin="anonymous"></script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>	