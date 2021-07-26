<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String btnChk=(String)session.getAttribute("btnChk");

	String allBtn="btn btn-outline-primary";
	String lostBtn="btn btn-outline-primary";
	String hospitalBtn="btn btn-outline-primary";
	
	if("mapHome".equals(btnChk)) allBtn="btn btn-primary";
	if("mapLost".equals(btnChk)) lostBtn="btn btn-primary";
	if("mapHospital".equals(btnChk)) hospitalBtn="btn btn-primary";
	
	//out.print(btnChk);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<ul class="nav col-lg-9">
			<li class="nav-item"><a href="<%=request.getContextPath()+"/index.jsp?currentPage=mapHome"%>"
				class="nav-link <%=allBtn %>" style="border-color:white;">전체보기</a></li>
				
			<li class="nav-item"><a href="<%=request.getContextPath() %>/index.jsp?currentPage=mapLost"
				class="nav-link <%=lostBtn %>" style="border-color:white;">실종 공고</a></li>

			<li class="nav-item"><a href="<%=request.getContextPath() %>/index.jsp?currentPage=mapHospital"
				class="nav-link <%=hospitalBtn %>" style="border-color:white;">동물병원</a></li>
			<li class="nav-item"><a href=""
				class="nav-link" >호텔</a></li>
			<li class="nav-item"><a href=""
				class="nav-link" >유치원</a></li>
			<li class="nav-item"><a href=""
				class="nav-link" >카페/식당</a></li>
			<li class="nav-item"><a href=""
				class="nav-link" >숙소</a></li>
		</ul>
	<%
		if(session.getAttribute("userLvl")!=null) {
			if((Integer) session.getAttribute("userLvl")==2) {
	%>
	<div class="col-3 justify-content-end pe-5">
		<a href="<%=request.getContextPath() %>/?currentPage=mapWrite" class="pt-2 pb-2 btn btn-primary mt-4 fw-bolder" style="width:250px;">병원 등록하기</a>
	</div>
	<%
		}}
	%>
	
	</div>
	
</body>
</html>