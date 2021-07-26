<!-- reviewForm.jsp -->
<%@page import="DTO.AHospital"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
String busino = request.getParameter("no");
String revname = request.getParameter("revname");
String userid = (String)session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫띵</title>
</head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">


<body>
	<center>
		<form action="<%=request.getContextPath()%>/map/qnaProc.jsp"
			method=post>
			<input type="hidden" name="busino" value="<%=busino%>"> <input
				type="hidden" name="revname" value="<%=revname%>">
			<div>
				<div class="container">
					<div class="col-6 card m-auto"
						style="position: relative; top: 30px;">
						<div class="card-header">
							<div>
								<small>문의 사항을 남겨주세요</small>
							</div>
							<div class="mt-3">
								<h5>
									<strong><%=revname%></strong>
								</h5>
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
										<th scope="row" style="height: 48px;">회원 아이디</th>
										<td class="align-middle">
											<%=userid %></td>
									</tr>
									<tr>
										<th scope="row" style="line-height: 48px; height: 48px;">별점
											평가</th>
										<td class="align-middle"><select name="openness"
											class="form-select-sm" aria-label=".form-select-sm example">
												<option selected value="o">공개</option>
												<option value="x">비공개</option>
										</select></td>
									</tr>
									<tr>
										<th scope="row" style="line-height: 200px;">문의 내용</th>
										<td colspan="2" class="align-middle">
										<textarea name="qna-contents" class="w-100" style="height:200px;" placeholder="문의 사항을 남겨주세요"></textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="text-center mb-4" class="align-middle"
							style="line-height: 48px; height: 48px;">
							<input type="submit" class="btn btn-outline-primary" value="등록">
							<button type="button" class="btn btn-danger btn" onclick = "location.href = '<%=request.getContextPath()%>/map/infoProc.jsp?no=<%=busino%>' ">취소</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</center>

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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>
</body>
</html>