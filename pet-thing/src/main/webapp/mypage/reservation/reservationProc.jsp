<%@page import="com.jin.DTO.Reservationcancel"%>
<%@page import="com.jin.Board.ReservationDAO"%>
<%@page import="com.jin.DTO.Reservation"%>
<%@page import="com.jin.DTO.Selfboard"%>
<%@page import="java.util.List"%>
<%@page import="com.jin.Board.SelfboardListDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	out.print("예약 내역입니다.");
	int rowsPerPage = 4;
	int pageNumber = Integer.parseInt( request.getParameter("pageNumber") );

		
	int cancelpageNumber = 1;
	
	if(request.getParameter("cancelpageNumber")!=null)	{
		cancelpageNumber = Integer.parseInt( request.getParameter("cancelpageNumber"));
	}
	/* else	{
		int cancelpageNumber = Integer.parseInt( request.getParameter("cancelpageNumber") );
	}  */
	
	ReservationDAO reservDao =  new ReservationDAO();
	
	List<Reservation> lst = reservDao.getBoardList(pageNumber, rowsPerPage);
	
	session.setAttribute("reserv", lst); 
	request.setAttribute("rowsPerPage", rowsPerPage);
	request.setAttribute("totalPage", reservDao.getBoardCount("reservation"));
	
	List<Reservationcancel> cancellst = reservDao.getCancelList(cancelpageNumber, rowsPerPage);
	
	session.setAttribute("reservcancel", cancellst); 
	request.setAttribute("cancelrowsPerPage", rowsPerPage);
	request.setAttribute("canceltotalPage", reservDao.getBoardCount("reservationcancel"));
	
%>

<%-- 	
	
 	<div class="card">
		<h5 class="card-header"><a class="link-dark text-decoration-none" href="">후기</a></h5>
		<div class="card-body pt-2 pb-2">
			<div class="row">
				<table class="table mb-2">
					<tbody>
<%
for(Selfboard board : boardLst){
%>
						<tr>
							<th scope="row">1</th>
							<td colspan="2"><%=board.getNo() %></td>
							<td><%=board.getTitle() %></td>
							<td><%=board.getDate() %></td>
						</tr>
<%
}
%>
		</tbody>
				</table>
				<div class="d-inline-flex justify-content-end" style="font-size:small;">
					<a class="link-dark text-decoration-none" href="">더보기..</a>
				</div>
			</div>
		</div>
	</div> --%>
	
<jsp:forward page="/index.jsp">
<jsp:param value="myreservation" name="currentPage"/> 
</jsp:forward>


 


