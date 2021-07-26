<%@page import="com.jin.map.Hospital"%>
<%@page import="DTO.AHospital"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	Hospital dao = new Hospital();
	List<AHospital> hosLst = dao.getHospitalList();
	
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
	
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85d541c64ba5949e2936434ddb813671&libraries=services,clusterer,drawing"></script>
	<script>
		var mapContainer = document.getElementById('map'), mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),
			level: 5
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);

		if (navigator.geolocation) {
			navigator.geolocation
					.getCurrentPosition(function(position) {

						var lat = position.coords.latitude, lon = position.coords.longitude;

						var locPosition = new kakao.maps.LatLng(lat, lon);

						displayMarker(locPosition);
						setMarker();

					});

		} else {
			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = '현재 위치 정보를 알 수 없습니다.'

			displayMarker(locPosition);
		}

		function displayMarker(locPosition) {
			var	imageSrc = '<%=request.getContextPath()+"/img/red_button.png"%>',
			imageSize = new kakao.maps.Size(30, 30), 
			imageOption = {
				offset : new kakao.maps.Point(27, 69)
			};

			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imageOption);
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition,
				image : markerImage
			});
			
			marker.setMap(map);
			map.setCenter(locPosition);
		}
		function setMarker() {
			
			var positions = [
				<% for(AHospital Item : hosLst) {%>
					{title: '<%=Item.getName()%>',
					latlng: new kakao.maps.LatLng(<%=Item.getY()%>, <%=Item.getX()%> )},
					
				<%}%>
			];
			// 마커 이미지의 이미지 주소입니다
			var imgSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			    
			for (var i = 0; i < positions.length; i ++) {
			    
			    // 마커 이미지의 이미지 크기 입니다
			    var imgSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImg = new kakao.maps.MarkerImage(imgSrc, imgSize); 
			    
			    // 마커를 생성합니다
			    var markers = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng, // 마커를 표시할 위치
			        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImg // 마커 이미지 
			    });
			    markers.setMap(map);
			}
		}
	</script>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>
</body>

</html>