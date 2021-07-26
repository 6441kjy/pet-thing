<!-- top.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String contextPath =request.getContextPath();
	String path = contextPath +  "/index.jsp?currentPage=";

	String btnChk=(String)session.getAttribute("btnChk");
	String btnClass="btn btn-outline-primary";
	String reviewBtnC="btn btn-outline-primary";
	String selfwriteBtnC="btn btn-outline-primary";
	String reservationBtnC="btn btn-outline-primary";
	String bookmarkBtnC="btn btn-outline-primary";
	String bookmarkFormBtnC="btn btn-outline-primary";
	String myinfoBtnC="btn btn-outline-primary";
	String myHospitalBtnC="btn btn-outline-primary";
	
	if("review".equals(btnChk))reviewBtnC="btn btn-primary";
	
	if("selfWrite".equals(btnChk))selfwriteBtnC="btn btn-primary";
	
	if("myreservation".equals(btnChk))reservationBtnC="btn btn-primary";
	if("detailreserv".equals(btnChk))reservationBtnC="btn btn-primary";
	
	if("bookmark".equals(btnChk))bookmarkBtnC="btn btn-primary";
	
	if("bookmarkForm".equals(btnChk))bookmarkBtnC="btn btn-primary";
	
	if("myinfo".equals(btnChk))myinfoBtnC="btn btn-primary";
	
	if("myHospital".equals(btnChk))myHospitalBtnC="btn btn-primary";
	
	
%>
<!-- <style type="text/css">
ul{
	list-style: none;
	text-align: center;
}
ul li{
    display:inline; 
    border-left: 1px solid #999;  
	padding: 0 24px;                        
}
ul li:first-child{
	border-left: none;
}
</style> -->


<body >
<div>
<ul class="nav navi-tabs col-lg-9 ">
	<li class="nav-item">
	<a href = '<%=request.getContextPath()+"/mypage/selfWrite/selfWriteProc.jsp?"%>'
	class="nav-link  <%=selfwriteBtnC %> me-1" style="border-color: white" id="selfwrite" 
	aria-current="page" >내가 쓴 글</a></li>
	
	<li class="nav-item">
	<a href = '<%=request.getContextPath()+"/mypage/reservation/reservationProc.jsp?pageNumber=1&cancelpageNumber=1"%>'
	class="nav-link <%=reservationBtnC %> me-1 " style="border-color: white" id="reserv"
	aria-current="page">예약/취소 내역</a></li>

	<li class="nav-item">
	<a href="<%=path %>review" class="nav-link <%=reviewBtnC %> me-1" style="border-color: white" id="pills-home-tab" 
	aria-current="page">후기</a></li>
	
	<li class="nav-item">
	<a href="<%=path %>bookmark" class="nav-link <%=bookmarkBtnC %> me-1" style="border-color: white" id="pills-home-tab" 
	aria-current="page">관심 장소</a></li>
	
	<li class="nav-item">
	<a href="<%=path %>myinfo" class="nav-link <%=myinfoBtnC %> me-1" style="border-color: white" id="pills-home-tab" 
	aria-current="page">개인 정보</a></li>
	
	<%
		if(session.getAttribute("userLvl")!=null) {
			if((Integer) session.getAttribute("userLvl")==2) {
	%>
	<li class="nav-item">
	<a href="<%=request.getContextPath() %>/mypage/myHospital/listProc.jsp" class="nav-link <%=myHospitalBtnC %> "  
	aria-current="page">지도 등록 관리</a></li>
	<%
		}}
	%>
	
	
	<!-- <li><a href="">추가기능1</a></li>
	<li><a href="">추가기능2</a></li>
	<li><a href="">추가기능3</a></li>
	<li><a href="">추가기능4</a></li> -->
</ul>

</div>
<script type="text/javascript">

function btnActive() {
	const btn = document.getElementById('selfwrite');
	console.log(btn)
	btn.className += " -active"
}
</script>
</body>


















