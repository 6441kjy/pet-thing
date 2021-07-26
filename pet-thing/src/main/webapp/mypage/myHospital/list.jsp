<%@page import="java.util.List"%>
<%@page import="member.hospital.hospitalDTO"%>
<%@page import="member.hospital.hospitalDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	hospitalDAO hDAO = new hospitalDAO();

	if(session.getAttribute("userId")==null)
		return;

	List<hospitalDTO> hospitalLst= (List<hospitalDTO>)session.getAttribute("myHospitalLst");
	System.out.println(hospitalLst.size());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="card mb-3 " >
	<h5 class="card-header "><a class="link-dark text-decoration-none" href="">등록 내역</a></h5>
		<div class="card-body pt-2 pb-2">
	<table class="table">
		<colgroup>
			<col style="width:90px">        
			<col style="width:200px">
			<col>
			<col style="width:200px">
			<col style="width:90px">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">등록번호</th>
				<th scope="col">상호명</th>
				<th scope="col">주소</th>
				<th scope="col">전화번호</th>
				<th scope="col">수정/삭제</th>
			</tr>
		</thead>
		<tbody>
		<%
			if(hospitalLst.size()==0)	{
		%>		
					<tr>
						<td colspan="9" class="text-center">예약하신 내역이 없습니다.</td>
					</tr>
		<%
			} else{
				for(hospitalDTO hDTO : hospitalLst){
		
		%>
				<tr>
					<td><%=hDTO.getNo() %></td>
					<td><%=hDTO.getName() %></td>
					<td><%=hDTO.getAddress() %></td>
					<td><%=hDTO.getPhone()%></td>
					<td>수정/삭제</td>
				</tr>
				
		<%
			}}
		%>
			
		</tbody>
	</table>
	</div>
	</div>
</body>
</html>