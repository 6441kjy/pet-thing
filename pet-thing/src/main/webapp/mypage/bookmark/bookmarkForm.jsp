<%@page import="java.util.ArrayList"%>
<%@page import="member.bookmark.origin.bookmarkDTO"%>
<%@page import="java.util.List"%>
<%@page import="member.bookmark.origin.bookmarkDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    
<%
	List<bookmarkDTO> hospitalLst = (List) session.getAttribute("hospitalLst");
	String favNavi = (String) session.getAttribute("favNavi");
	//out.print(hospitalLst);
	String mapPage="map/loadMap.jsp";
	int pageNum=1;
	
	if(hospitalLst.size()==0) {
		out.print("<p align=center class='mt-5'>등록된 관심매장이 없습니다.</p>");
		return;
	}
	
	
	if(request.getParameter("LstItem")!=null)
		mapPage = "map/loadOneMap.jsp";
	
	if(request.getParameter("page")!=null)
		pageNum= Integer.parseInt(request.getParameter("page"));
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-4">
			<div class="card mb-3">
				<h5 class="card-header">
					<a class="link-dark text-decoration-none" href="">관심장소 목록</a>
				</h5>
				
				<%
					for(bookmarkDTO bDTO : hospitalLst) {
						
				%>
				<div class="p-2">
					<div class="list-group list-group-flush border-bottom">
						<a href="<%=request.getContextPath() %>/mypage/bookmark/bookmarkProc.jsp?page=<%=pageNum %>&LstItemNo=<%=bDTO.getNo() %>&LstItem=<%=bDTO.getName() %>&x=<%=bDTO.getX()%>&y=<%=bDTO.getY() %>" class="list-group-item list-group-item-action py-1" >
							<div class="fw-bold">
								<%=bDTO.getName() %>
							</div>
							<div>
								<small><%=bDTO.getAddress() %></small>
							</div>
						</a>
					</div>
				</div>
				<%
					}
				%>
				
				<div class="m-auto mt-1 pb-3">
				
				<%=favNavi %>
				
				</div>
			</div>
		</div>
		<div class="col-8">
			<div class="card mb-3 border-white">
				<h5 class="card-header bg-white">
					<a class="link-dark text-decoration-none" href="">지도</a>
				</h5>
				<div class="card-body pt-2 pb-2">
				
					<jsp:include page="<%=mapPage%>"/>
					<span></span>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>