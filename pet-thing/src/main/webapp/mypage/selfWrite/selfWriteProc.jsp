<%@page import="com.jin.DTO.Selfboard"%>
<%@page import="java.util.List"%>
<%@page import="com.jin.Board.SelfboardListDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	out.print("내가 쓴 글 프락 입니다.");
	
	String userId = (String)session.getAttribute("userId");
	System.out.print("현재 아이디"+userId);
	SelfboardListDao selfboardDao =  new SelfboardListDao();
	List<Selfboard> lst = selfboardDao.getBoardList(userId);
	
	session.setAttribute("selfboard", lst);


	
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
<jsp:param value="selfWrite" name="currentPage"/> 
</jsp:forward>


 


