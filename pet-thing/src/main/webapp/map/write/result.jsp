<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	alert('등록되었습니다. \n등록내역 확인을 위해 마이페이지로 이동합니다.');
	document.location.href="<%=request.getContextPath()+"/mypage/myHospital/listProc.jsp"%>";
</script>
</body>
</html>