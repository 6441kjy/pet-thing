<%@page import="java.util.List"%>
<%@page import="com.jin.map.Hospital"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
	List<String> reservLst = (List<String>) request.getAttribute("reservLst");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div>
<div class="container" > 
	<div class="col-6 card m-auto" style="position: relative; top: 30px; text-align:center;">
			<div class="card-header">
				<div>
				<small>���� ��û�� �Ϸ�Ǿ����ϴ�.</small><br/>
				<small> ��û�� ���εǾ�� ������ Ȯ���˴ϴ�.</small>
				</div>
				<div class="mt-1">
				<h5><strong><%=reservLst.get(3) %></strong></h5>
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
									   	<th scope="row">������ ���� </th>
									    <td><%=reservLst.get(2) %></td>
						   			</tr>
						   			<tr>
									    <th scope="row">������ ���̵�</th>
									    <td><%=reservLst.get(6) %></td>
									</tr>
									<tr>
									    <th scope="row">���� �Ͻ�</th>
									    <td><%=reservLst.get(0) +" / "+ reservLst.get(1) %></td>
									</tr>
	                  				<tr>
										<th scope="row">���� ����</th>
										<td colspan="2">���� ��û (�̽��� ����)</td>
	    							</tr>
	  						</tbody>
					</table>
			</div>
			<div class="text-center mb-4">
					<button type="button" class="btn btn-secondary btn" onclick = "location.href = '<%=request.getContextPath()%>/map/infoProc.jsp?no=<%=reservLst.get(4)%>' ">���� ȭ��</button>
					<button type="button" class="btn btn-danger btn " onclick = "location.href = '<%=request.getContextPath()+"/mypage/reservation/reservationProc.jsp?pageNumber=1&cancelpageNumber=1"%>'" >���� ���/����</button>
			</div>
	</div>
</div>
</div>

</body>
</html>