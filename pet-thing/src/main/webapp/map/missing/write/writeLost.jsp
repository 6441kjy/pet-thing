<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String userId = (String) session.getAttribute("userId");
	//out.print(request.getParameter("x")+"<br>"+request.getParameter("y"));
	
	String x = request.getParameter("x");
	String y = request.getParameter("y");
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
</head>
<body>
<div>
<div class="container mb-5" > 
	<form action="<%=request.getContextPath() %>/map/missing/write/writeLostProc.jsp" method="post">
		<input type="hidden" name="x" value="<%=x%>">
		<input type="hidden" name="y" value="<%=y%>">
		<div class="col-6 card m-auto" style="position: relative; top: 30px;">
				<div class="card-header">
					<div class="mt-1">
					<h5><strong>동물을 찾습니다</strong></h5>
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
										    <td><input type="text" name="id" value="<%=userId %>" readonly/></td>
							   			</tr>
										<tr>
										    <th scope="row">동물 이름</th>
										    <td><input type="text" name="petname"/></td>
										</tr>
		                  				<tr>
											<th scope="row">연락처</th>
											<td colspan="2"><input type="text" name="phone"/></td>
		    							</tr>
		                  				<tr>
											<th scope="row">종류</th>
											<td colspan="2">
												<div class="form-check form-check-inline">
													  <input class="form-check-input" type="radio" name="chk" id="inlineRadio1" value="1">
													  <label class="form-check-label" for="inlineRadio1">개</label>
												</div>
												<div class="form-check form-check-inline">
													  <input class="form-check-input" type="radio" name="chk" id="inlineRadio2" value="2">
													  <label class="form-check-label" for="inlineRadio2">고양이</label>
												</div>
												<div class="form-check form-check-inline">
													  <input class="form-check-input" type="radio" name="chk" id="inlineRadio3" value="3">
													  <label class="form-check-label" for="inlineRadio3">기타</label>
												</div>
											</td>
		    							</tr>
		    							<tr>
											<th scope="row">종</th>
											<td colspan="2"><input type="text" name="species"/></td>
		    							</tr>
		    							<tr>
											<th scope="row">성별</th>
											<td colspan="2">
												<div class="form-check form-check-inline">
													  <input class="form-check-input" type="radio" name="petgender" id="petgender_f" value="1">
													  <label class="form-check-label" for="petgender_f">암컷</label>
												</div>
												<div class="form-check form-check-inline">
													  <input class="form-check-input" type="radio" name="petgender" id="petgender_m" value="2">
													  <label class="form-check-label" for="petgender_m">수컷</label>
												</div>
											</td>
		    							</tr>
		    							<tr>
											<th scope="row">실종날짜</th>
											<td colspan="2">
												<input type="text" id="Date" name="mDate" value="날짜를 선택하세요.">
											</td>
		    							</tr>
		                  				<tr>
											<th scope="row">기타 정보</th>
											<td colspan="2">
												<textarea name="info" rows="5" cols="40"></textarea>
												<br><small>실종장소 및 기타 정보를 입력해주세요.</small>
											</td>
		    							
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
	<script>
		$("#Date").datepicker({
			format : "yyyy-mm-dd",
			startDate : new Date('2021'),
			todayHighlight : true
		});

		$('#click-btn').on('click', function() {
			var date = $('#dateRangePicker').val();
			alert(date);
		});
	</script>
</body>
</html>