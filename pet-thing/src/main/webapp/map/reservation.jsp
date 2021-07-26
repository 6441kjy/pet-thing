<!-- reservation.jsp -->
<%@page import="DTO.AHospital"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); 
	String busino = request.getParameter("no");
	String revname = request.getParameter("revname");
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
		<form action="<%=request.getContextPath()%>/map/reservProc.jsp" method=post>
		<input type="hidden" name="busino" value="<%= busino%>">
		<input type="hidden" name="revname" value="<%= revname %>">
			<div>
				<div class="container mt-4">
					<div class="col-6 card m-auto"
						style="position: relative; top: 30px;">
						<div class="card-header">
							<div>
								<small>예약하기</small>
							</div>
							<div class="mt-1">
								<h5>
									<strong><%= revname %></strong>
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
										<th scope="row" style="height:48px;">예약자 성함</th>
										<td class="align-middle"><input type="text" name="name"></td>
									</tr>
									<tr>
										<th scope="row" style="line-height:48px; height:48px;">예약 날짜</th>
										<td class="align-middle"><input type="text" id="Date"
											name="Date" value="날짜를 선택하세요."></td>
									</tr>
									<tr>
										<th scope="row" style="line-height:48px; height:48px;">예약 시간</th>
										<td colspan="2" class="align-middle"><select name="hour"
											class="form-select-sm"
											aria-label=".form-select-sm example">
												<option selected>시</option>
												<option value="9">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="13">13</option>
												<option value="14">14</option>
												<option value="15">15</option>
												<option value="16">16</option>
												<option value="17">17</option>
										</select> <select name="minute" class="form-select-sm"
											aria-label=".form-select-sm example">
												<option selected>분</option>
												<option value="00">00</option>
												<option value="30">30</option>
										</select></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="text-center mb-4" class="align-middle" style="line-height:48px; height:48px;">
							<input type="submit" class="btn btn-outline-primary" value="예약하기">
							<button type="button" class="btn btn-danger btn">취소</button>
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