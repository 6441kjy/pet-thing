<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	//if(session.getAttribute("userId")==null)
	//	return;
	String lstItem  = (String) request.getParameter("hospitalItemName");
	String lstItemNo  = (String) request.getParameter("hospitalItemNo");
	String x =(String) request.getParameter("x");
	String y =(String) request.getParameter("y");
	
	String mapPath = request.getContextPath()+"/map/infoProc.jsp?no=";
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지도</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
</head>
<body style="width:100%; height:100%;">
	
	<div id="map" style="width: 70%; height: 400px; float:left;"></div>
	
	
	<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=85d541c64ba5949e2936434ddb813671&libraries=services"></script>

	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 


        var coords = new kakao.maps.LatLng(<%=y%>, <%=x%>);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:160px;text-align:center;padding:6px 0;font-weight:bold;" class="p-2"><a href="<%=mapPath + lstItemNo%>" class="text-decoration-none text-dark map-info-window"><%=lstItem%></a></div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
  
</script>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>
</body>

</html>