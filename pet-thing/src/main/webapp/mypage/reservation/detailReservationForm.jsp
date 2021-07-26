<%@page import="com.jin.DTO.Reservation"%>
<%@page import="java.util.List"%>
<%@page import="com.jin.Board.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
%>

<%
	Reservation reserv = (Reservation)request.getAttribute("reserv");
%>
<!DOCTYPE html>
<html>
<body>
<div>
<div class="container" > 
	<div class="col-6 card m-auto" style="position: relative; top: 30px;">
			<div class="card-header">
				<div>
				<small>No.<%=reserv.getNo() %></small>
				</div>
				<div class="mt-1">
				<h5><strong><%=reserv.getRevname() %></strong></h5>
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
									   	<th scope="row">예약자 성함 </th>
									    <td><%=reserv.getName() %></td>
						   			</tr>
									<tr>
									    <th scope="row">예약 일시</th>
									    <td><%=reserv.getRevdate() %></td>
									</tr>
	                  				<tr>
										<th scope="row">예약 내용</th>
										<td colspan="2">재활및 정기검진</td>
	    							</tr>
	                  	
	  						</tbody>
					</table>
			</div>
			<div class="text-center mb-4">
					<button type="button" onclick="history.back()" class="btn btn-secondary btn" >이전</button>
					<button type="button" class="btn btn-danger btn " data-bs-toggle="modal" data-bs-target="#exampleModal">예약 취소</button>
			</div>
	</div>
</div>
</div>






<!--예약 취 Modal -->
<form action="<%=request.getContextPath() %>/mypage/reservation/cancelProc.jsp" method="post">
<input type="hidden" name="reserv" value=<%=reserv.getNo() %>>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">	
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">예약 취소</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       	예약을 정말로 진짜로 취소하시겠습니까?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="submit"  class="btn btn-primary">계속</button>
      </div>
    </div>
  </div>
</div>
</form>
</body>
</html>