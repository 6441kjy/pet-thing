<!-- top.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   String path = request.getContextPath() + "/index.jsp?currentPage=";
   //String url = request.getRequestURI().toString();
   String userId = (String) session.getAttribute("userId");
   
%>

<body>

   <nav class="navbar navbar-expand-lg fixed-top bg-light p-3 col-12 d-flex flex-wrap align-items-center">
        <a class="navbar-brand" href="<%=path %>main"><img src="<%=request.getContextPath()%>/common/img/top-logo.png" style="width:70px;"></a>
      <ul class="nav me-auto">
         <li><a href="<%=path %>main" class="nav-link active" role="tab" data-toggle="tab">홈</a></li>
         <li><a href="<%=path %>mapHome" class="nav-link" role="tab" data-toggle="tab" >지도</a></li>
         <li><a href="<%=path %>mainProc" class="nav-link" role="tab" data-toggle="tab" >커뮤니티</a></li>
      </ul>
      
      <%if(userId!=null) {%>
         <a href="<%=path %>mypage" class="btn btn-outline-primary me-2">마이페이지</a>
         <a href='<%=request.getContextPath() %>/login/logout.jsp' class="btn btn-outline-primary">로그아웃</a>
      <%} else{ %>
         <a href="<%=path %>login" class="btn btn-primary me-2">로그인</a>
         <a href='<%=path %>register' class="btn btn-outline-primary">회원가입</a>
      <%} %>
   </nav>

</body>













