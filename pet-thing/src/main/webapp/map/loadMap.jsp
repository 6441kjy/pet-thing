<%@page import="map.lost.LostPetDAO"%>
<%@page import="map.lost.LostPetDTO"%>
<%@page import="com.jin.map.Hospital"%>
<%@page import="DTO.AHospital"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	Hospital dao = new Hospital();
	List<AHospital> hosLst = dao.getHospitalList();
	
	LostPetDTO lostDTO = new LostPetDTO();
	LostPetDAO lostDAO = new LostPetDAO();
	List<LostPetDTO> lostLst = lostDAO.getLostPetLst();
	
	//out.print(lostLst.size());
	
	
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
		<div id="map" style="width:70%; height: 400px; float:left;" class=""></div>
		<div id="clickLatlng"></div>
	
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
		
		
		//병원목록 마커 표시
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
			
			
			
			/* var tag='<div class="col d-flex align-items-start">'
				tag+='<i class="fas fa-dog"></i>'
			    tag+='<div><h5 class="fw-bold mb-0">Featured title</h5>'
			    tag+='<p>Paragraph of text beneath the heading to explain the heading.</p>'
			    tag+='</div></div>'; */
			
			var positionsLost = [
				<% for(LostPetDTO lDTO : lostLst) {%>
					{title: '<%=lDTO.getPetname()%>',
					latlng: new kakao.maps.LatLng(<%=lDTO.getY()%>, <%=lDTO.getX()%>) ,
					content: '<div class="col d-flex align-items-start pt-2">'+'<i class="fas fa-paw m-1"></i><div><h5 class="fw-bold mb-0" style="width:200px;"><%=lDTO.getPetname()%></h5><p class="pb-2"><%=lDTO.getMdate()%><br><%=lDTO.getPhone()%><br><%=lDTO.getInfo()%></p></div></div>'},
				<%}%>
					
			];
			// 마커 이미지의 이미지 주소입니다
			var imgSrcLost = "<%=request.getContextPath()+"/img/search.png"%>"; 
			    
			for (var i = 0; i < positionsLost.length; i ++) {
			    
			    // 마커 이미지의 이미지 크기 입니다
			    var imgSizeLost = new kakao.maps.Size(35, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImgLost = new kakao.maps.MarkerImage(imgSrcLost, imgSizeLost); 
			    
			    // 마커를 생성합니다
			    var markersLost = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positionsLost[i].latlng, // 마커를 표시할 위치
			        title : positionsLost[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImgLost // 마커 이미지 
			    });
			    //markersLost.setMap(map);
			    
			    //----------------------------------
			    // 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new kakao.maps.InfoWindow({
			        content: positionsLost[i].content // 인포윈도우에 표시할 내용
			    });
			    
			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    kakao.maps.event.addListener(markersLost, 'mouseover', makeOverListener(map, markersLost, infowindow));
			    kakao.maps.event.addListener(markersLost, 'mouseout', makeOutListener(infowindow));
			    //----------------------------------
			    
			    
			 
			 
			}
			
			//--------------------------------------
			// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
			function makeOverListener(map, markersLost, infowindow) {
			    return function() {
			        infowindow.open(map, markersLost);
			    };
			}
			
			// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
			function makeOutListener(infowindow) {
			    return function() {
			        infowindow.close();
			    };
			}
			//--------------------------------------
			
			
		}
		
		// 지도를 클릭한 위치에 표출할 마커입니다
		//실종동물 등록 부분
		var marker2 = new kakao.maps.Marker({ 
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter() 
		}); 
		// 지도에 마커를 표시합니다
		marker2.setMap(map);

		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    
		    // 마커 위치를 클릭한 위치로 옮깁니다
		    marker2.setPosition(latlng);
		    
		    var message = '<div  class="position-absolute top-100 start-50 translate-middle mt-4 container ps-0">'
		    message += '<span style="display:none;">클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		    message += '경도는 ' + latlng.getLng() + ' 입니다</span>';
		   	message +="<a class='btn btn-primary' href='?currentPage=writeLost&x="+latlng.getLng()+"&y="+latlng.getLat()+"'>실종 공고 등록</a></div>"
		    
		    var resultDiv = document.getElementById('clickLatlng'); 
		    resultDiv.innerHTML = message;
		    
		    
		});
	</script>
	<script src="https://kit.fontawesome.com/bdcf636563.js" crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
		crossorigin="anonymous"></script>
</body>

</html>