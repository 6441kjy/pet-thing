<%@page import="member.Level.LevelDTO"%>
<%@page import="java.util.List"%>
<%@page import="member.Level.LevelDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	LevelDAO levelDAO = new LevelDAO();

	//로그인 테스트용 

	
	String userId = (String) session.getAttribute("userId");
	List<LevelDTO> lvlLst = levelDAO.getLevel(userId);
	
	if(lvlLst.size()==0) {
		out.print("<p align=center class='mt-5 mb-5'>사업자 로그인이 필요합니다.</p>");
		return;
	}
	
	//out.print(userId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<div class="container mb-5" > 
	<form action="<%=request.getContextPath() %>/map/write/getCoords.jsp" method="post">
		<div class="col-6 card m-auto" style="position: relative; top: 30px;">
				<div class="card-header">
					<div class="mt-1">
					<h5><strong>병원 등록하기</strong></h5>
					</div>
				</div>
				<div class="card-body">
						<table class="table text-left">
								<colgroup>
										<col class="col-4">
										<col class="col-8">
								</colgroup>
		  						<tbody>
		  								<tr class="">
										   	<th scope="row">등록자 ID</th>
										    <td><input type="text" name="id" value="<%=lvlLst.get(0).getId() %>" readonly/></td>
							   			</tr>
										<tr>
										    <th scope="row">병원명</th>
										    <td><input type="text" name="name"/></td>
										</tr>
		                  				<tr>
											<th scope="row">병원 주소</th>
											<td colspan="2"><input type="text" name="address"/>
											</td>
		    							</tr>
		                  				<tr>
											<th scope="row">병원 전화번호</th>
											<td colspan="2"><input type="text" name="phone"/></td>
		    							</tr>
		                  				<tr>
											<th scope="row">병원 소개</th>
											<td colspan="2"><textarea name="info" rows="5" cols="40"></textarea></td>
		    							</tr>
		  						</tbody>
						</table>
				</div>
				<div class="text-center mb-4">
						<button type="button" onclick="history.back()" class="btn btn-secondary btn" >이전</button>
						<button type="submit" class="btn btn-primary fw-bold" data-bs-toggle="modal" data-bs-target="#exampleModal">등록하기</button>
				</div>
		</div>
	</form>
</div>
</div>

</body>
</html>