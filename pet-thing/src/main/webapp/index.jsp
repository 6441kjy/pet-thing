<!-- index.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/header.jspf" %>
<%
	String currentPage = request.getParameter("currentPage");
	String pageName="/main/mainProc.jsp";
	if (currentPage == null)
		pageName = "/main/mainProc.jsp";
	else if ("mypage".contentEquals(currentPage))
		pageName = "/mypage/mypageMain.jsp";
	else if ("selfWrite".contentEquals(currentPage))
		pageName = "/mypage/mypageMain.jsp?currentPage=selfWrite";
	else if ("myreservation".contentEquals(currentPage))
		pageName = "/mypage/mypageMain.jsp?currentPage=myreservation";
	else if ("review".contentEquals(currentPage))
		pageName = "/mypage/mypageMain.jsp?currentPage=review";
	else if ("memo".contentEquals(currentPage))
		pageName = "/mypage/mypageMain.jsp?currentPage=memo";
	else if ("bookmark".contentEquals(currentPage))
		pageName = "/mypage/mypageMain.jsp?currentPage=bookmark";
	else if ("bookmarkForm".contentEquals(currentPage))
		pageName = "/mypage/mypageMain.jsp?currentPage=bookmarkForm";
	else if ("myinfo".contentEquals(currentPage))
		pageName = "/mypage/mypageMain.jsp?currentPage=myinfo";
	else if ("detailreserv".contentEquals(currentPage))
		pageName = "/mypage/mypageMain.jsp?currentPage=detailreserv";
	
	/* 보배 */
	else if(currentPage.contentEquals("main"))
		pageName="/main/mainProc.jsp";
		
	else if(currentPage.contentEquals("index"))
		pageName="/main/main.jsp";
	
	else if(currentPage.contentEquals("register"))
		pageName = "/member/register.jsp";
	
	else if(currentPage.contentEquals("login"))
		pageName = "/login/loginForm.jsp";
	else if ("myHospital".contentEquals(currentPage))
		pageName = "/mypage/mypageMain.jsp?currentPage=myHospital";
	else if("writeLost".contentEquals(currentPage))
		pageName="/map/missing/write/writeLost.jsp";
	else if ("mapHospital".contentEquals(currentPage))
		pageName="/map/mapHomeHospital.jsp";
	else if ("mapLost".contentEquals(currentPage))
		pageName="/map/mapHomeLost.jsp";
	
	/* 지예 */
	else if ("mapHome".contentEquals(currentPage))
		pageName="/map/mapHome.jsp";
	else if ("mapInfo".contentEquals(currentPage))
		pageName="/map/mapInfo.jsp";
	else if ("mapWrite".contentEquals(currentPage))
		pageName="/map/write/writeHospital.jsp";
	else if ("mapWrite".contentEquals(currentPage))
		pageName="/map/write/writeHospital.jsp";
	else if ("reservation".contentEquals(currentPage))
		pageName="/map/reservation.jsp";
	else if ("reservCheck".contentEquals(currentPage))
		pageName="/map/reservCheck.jsp";
	else if ("reviewForm".contentEquals(currentPage))
		pageName="/map/reviewForm.jsp";
	else if ("qnaForm".contentEquals(currentPage))
		pageName="/map/qnaForm.jsp";
	
	/* 서연 */
	else if("mainForm".contentEquals(currentPage))
		pageName = "/community/mainForm.jsp";
	else if("mainProc".contentEquals(currentPage))
		pageName = "/community/mainProc.jsp";
	else if("boardFormBest".contentEquals(currentPage))
		pageName = "/community/boardFormBest.jsp";
	else if("writeForm".contentEquals(currentPage))
		pageName = "/community/writeForm.jsp";
	else if("boardForm".contentEquals(currentPage))
		pageName = "/community/boardForm.jsp";
	else if("viewForm".contentEquals(currentPage))
		pageName = "/community/viewForm.jsp";
	
	System.out.print("pageName :" + pageName);
	session.setAttribute("btnChk", currentPage);
	
%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
			.wrap {
			padding-top: 5rem;
			}
	</style>
	<meta charset="EUC-KR">
	<title>펫띵</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>
	<div class="container wrap">
		<header class="main container">
			<%@ include file="/common/top.jsp" %>
		</header>
		<div class="p-3 pt-5 mainPageContainer">
			<jsp:include page="<%=pageName%>"/>
		</div>
		<footer style="height: 50px;">
			<%@ include file="/common/footer.jspf"%>
		</footer>
	</div>
	<script src="https://kit.fontawesome.com/bdcf636563.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>