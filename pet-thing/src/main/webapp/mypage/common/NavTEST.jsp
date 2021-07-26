<!-- top.jsp -->
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   String contextPath =request.getContextPath();
   String path = contextPath +  "/index.jsp?currentPage=";
   
   String btnChk=(String)session.getAttribute("btnChk");
   
   String btnClass="";
   String reviewBtnC="";
   String selfwriteBtnC="";
   String reservationC="";
   String bookmarkBtnC="";
   String bookmarkFormBtnC="";
   String myinfoBtnC="";
   String myHospitalBtnC="";
   
   if("review".equals(btnChk))reviewBtnC="btn btn-primary";
  
   if("selfwrite".equals(btnChk))selfwriteBtnC="btn btn-primary";
  
   if("reservation".equals(btnChk))reservationC="btn btn-primary";
  
   if("bookmark".equals(btnChk))bookmarkBtnC="btn btn-primary";
  
   if("bookmarkForm".equals(btnChk))bookmarkFormBtnC="btn btn-primary";
   
   if("myinfo".equals(btnChk))myinfoBtnC="btn btn-primary";
   
   if("myHospital".equals(btnChk))myHospitalBtnC="btn btn-primary";
  
   out.print(btnChk+"<br>");
%>


<body >
<div>
<ul class="nav col-lg-9">
   <li class="nav-item"><a href='<%=request.getContextPath()+"/mypage/selfWrite/selfWriteProc.jsp"%>' class="nav-link" id="selfwrite" 
   aria-selected="true" >내가 쓴 글</a></li>
   
   <li class="nav-item" role="presentation" ><a href="<%=path %>reservation&btnNum=" class="nav-link" id="pills-profile-tab" 
   aria-selected="true">예약/취소 내역</a></li>
   
   <li class=" nav-item " role="presentation" ><a href="<%=path %>review" class="nav-link <%=reviewBtnC%>" id="pills-profile-tab" 
   aria-selected="true">후기</a></li>

   <li class="nav-item" role="presentation" ><a href="<%=path %>memo" class="nav-link <%=btnClass%>" id="pills-home-tab" 
   data-toggle="pill" data-target="pills-home" role="tab" 
   aria-controls="pills-home" aria-selected="true">메모</a></li>
   
   <li class="nav-item" role="presentation" ><a href="<%=path %>bookmark" class="nav-link" id="pills-home-tab" data-toggle="pill" role="tab" 
   aria-controls="pills-home" aria-selected="true">관심 장소</a></li>
   
   <li class="nav-item" role="presentation" ><a href="<%=path %>myinfo" class="nav-link" id="pills-home-tab" data-toggle="pill" role="tab" 
   aria-controls="pills-home" aria-selected="true">개인 정보</a></li>
   
   <%
      if(session.getAttribute("userLvl")!=null) {
         if((Integer) session.getAttribute("userLvl")==2) {
   %>
   <li class="nav-item" role="presentation" ><a href="<%=request.getContextPath() %>/mypage/myHospital/listProc.jsp" class="nav-link btn btn-outline-primary" id="pills-home-tab" data-toggle="pill" role="tab" 
   aria-controls="pills-home" aria-selected="true">지도 등록 관리</a></li>
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

















