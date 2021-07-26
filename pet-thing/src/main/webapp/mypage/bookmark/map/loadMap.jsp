<%@page import="member.bookmark.origin.bookmarkDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	if(session.getAttribute("userId")==null)
		return;
	List<bookmarkDTO> hospitalLst = (List) session.getAttribute("hospitalLst");
	String x = hospitalLst.get(0).getX();
	String y = hospitalLst.get(0).getY();
	
	//System.out.println(x+" & "+y);
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
	
	<div id="map" style="width: 100%; min-height:470px;"></div>
	
	
	<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=85d541c64ba5949e2936434ddb813671"></script>

	<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        //center: new kakao.maps.LatLng(33.450705, 126.570677), // 지도의 중심좌표
        center: new kakao.maps.LatLng(<%=y%>,<%=x%>), // 지도의 중심좌표
        //center: new kakao.maps.LatLng(37.56369310143514,127.01596945561263), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
	<%
	for(bookmarkDTO bDTO : hospitalLst){
	%>
    {
        title: '<%=bDTO.getName()%>', 
        latlng: new kakao.maps.LatLng(<%=bDTO.getY()%>, <%=bDTO.getX()%>)
    },
    <%} %> 
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}
</script>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>
</body>

</html>