<%@page import="com.jin.Board.UploadFileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    
<%
	//String prevPage = request.getHeader("referer");
	
	String userId = "petthing";
	if(session.getAttribute("userId")!=null) {
		userId = (String) session.getAttribute("userId");
	}
	
	UploadFileDAO uFileDAO = new UploadFileDAO();
	String imgFilePath = request.getContextPath()+"/mypage/sampleimg/cat.png";
	String imgFileName = uFileDAO.getProfileImg(userId);
	
	System.out.println(imgFileName);
	
	
	//if(session.getAttribute("userId")!=null)
	//if(imgFileName!=null||imgFileName.length()!=0) {
	//if(!imgFileName.equals(null)) {
	if(imgFileName!=null)	{
		if(!"".contentEquals(imgFileName)) {
			imgFilePath = request.getContextPath()+"/mypage/uploadFile/"+imgFileName;
		}
	}
%>

<%-- <!DOCTYPE html>
<html>
<style type="text/css">
	img{
		border-radius: 10px;
	}

</style>

<body>
	<div class="card border-white " style="width: 19rem;">
		<p class="fs-3 fw-normal font-monospace d-inline-flex p-1 ">
			petthing 님
		</p>
		<img src='<%=request.getContextPath()+"/mypage/sampleimg/cat.png"%>'  alt="Empty_logo">
		<div class="card-body">
			<h5 class="card-title">이르미</h5>
			<p class="card-text">품종</p>
		</div>
		<ul class="list-group">
			<li
				class="list-group-item d-flex justify-content-between align-items-center"><a class="link-dark text-decoration-none" href="">오늘 예약</a><span class="badge bg-primary rounded-pill">2</span>
			</li>
			<li
				class="list-group-item d-flex justify-content-between align-items-center"><a class="link-dark text-decoration-none" href="">문의 내역</a><span class="badge bg-primary rounded-pill">2</span>
			</li>
			<li
				class="list-group-item d-flex justify-content-between align-items-center"><a class="link-dark text-decoration-none" href="">쪽지</a><span class="badge bg-primary rounded-pill">1</span>
			</li>
		</ul>
	</div>
</body>
</html> --%>

<!DOCTYPE html>
<html>

<body>
	<div class="card border-white " style="width: 19rem;">
		<p class="fs-3 fw-normal font-monospace d-inline-flex p-1 ">
			<%=userId %> 님
		</p>
		<div class="card border-white position-relative profileImg-wrap">
			<a href="" title="프로필 사진 업로드" class="" data-bs-toggle="modal" data-bs-target="#profileModal">
			    <div class="bg-light border border-secondary text-secondary me-2 position-absolute top-100 start-50 translate-middle shadow-sm  profile-img-btn">
				    	<i class="fas fa-camera" aria-hidden="true" style="line-height: 32px;"></i>
			    </div>
			</a>
		    <img src="<%=imgFilePath %>" alt="Empty_logo" class="profile-img">
		</div>
		<div class="card-body">
			<h5 class="card-title">이르미</h5>
			<p class="card-text">품종</p>
		</div>
		<ul class="list-group">
			<li
				class="list-group-item d-flex justify-content-between align-items-center"><a class="link-dark text-decoration-none" href="">오늘 예약</a><span class="badge bg-primary rounded-pill">2</span>
			</li>
			<li
				class="list-group-item d-flex justify-content-between align-items-center"><a class="link-dark text-decoration-none" href="">문의 내역</a><span class="badge bg-primary rounded-pill">2</span>
			</li>
			<li
				class="list-group-item d-flex justify-content-between align-items-center"><a class="link-dark text-decoration-none" href="">쪽지</a><span class="badge bg-primary rounded-pill">1</span>
			</li>
		</ul>
	</div>
	
	
	<!-- Modal -->
<div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">프로필 사진 업로드</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       	<form action="<%=request.getContextPath() %>/mypage/profile/profileImgProc.jsp" method="post" enctype="multipart/form-data">
	        <div class="mb-3 needs-validation was-validated">
	        	<input type="hidden" name="userId" value="<%=userId %>">
	        	<!-- proc으로 이동한 후 다시이전페이지로 돌아가야 정상이긴한데 -->
		        	<label for="formFile" class="form-label file-label">이미지 파일만 업로드 가능합니다. (용량제한 : 10M)</label>
				  	<input class="form-control" type="file" id="formFile" name="profileImg" accept="image/*" required="">
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="submit" class="btn btn-primary">저장하기</button>
	      </div>
      	</form>
    </div>
  </div>
</div>

</body>
</html>