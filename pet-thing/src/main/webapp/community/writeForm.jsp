<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String usrId = (String)session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>Insert title here</title> -->
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="stylesheet" href="<%=request.getContextPath() %>/community/css/common.css" />
</head>
<body>
<div class="container" style="width: 1000px; margin: 50px auto">
	<div class="container titleM">
   		<h1 class="mainTitle">글쓰기</h1>
   	</div>
	<div class="formArea">
		<form action="community/writeProc.jsp" method="post" enctype="multipart/form-data">
			<div class="writerArea">
				<label for="writer">
					<span>작성자 : </span>
				</label>
				<input type="text" name="writer" readonly="readonly" value="<%=usrId %>" class="forminput"/>
			</div>
			<div class="titleArea">
				<label for="title">
					<span>제 &nbsp;&nbsp;목 : </span>
				</label>	
				<input type="text" name="title" value="" class="forminput"/>
			</div>
			<div class="txtArea">
				<textarea name="contents" id="writeArea" cols="120" rows="20" class="writeArea"></textarea>
			</div>
			<div class="input-group mb-3 fileArea">
			  <input type="file" class="form-control" id="inputGroupFile01" >
			</div>
			<div class="btMenu">
				<input type="submit" value="글쓰기" class="btn btn-primary" style="margin-right: 5px" />
				<input type="reset" value="취소" class="btn btn-primary" />
			</div>
		</form>
	</div>
</div>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
</body>
</html>