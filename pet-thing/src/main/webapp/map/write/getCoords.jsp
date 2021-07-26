<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8"); 
	String address=request.getParameter("address");

	System.out.println("getCoords.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="map" style="width:100%;height:350px;" style='display:none;'></div>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85d541c64ba5949e2936434ddb813671&libraries=services,clusterer,drawing"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
//var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('<%=address%>', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        
       // document.write(result[0].y+"<br>"+result[0].x);
       
       var tag = "<div style='display:none;'>"
       tag+="<form method='post' action='writeHospitalProc.jsp' name='writeHospitalForm'>";
       tag+= "<input type='text' name='x' value='";
       tag+= result[0].x;
       tag+= "'><br><input type='text' name='y' value='";
       tag+= result[0].y;
       tag+= "'><br>"
       tag+= "<input type='text' name='id' value='"
       tag+= "<%=request.getParameter("id")%>"
       tag+= "'><br>"
   	   tag+= "<input type='text' name='name' value='"
	   tag+= "<%=request.getParameter("name")%>"
 	   tag+= "'><br>"
 	   tag+= "<input type='text' name='address' value='"
 	   tag+= "<%=request.getParameter("address")%>"
 	   tag+= "'><br>"
 	   tag+= "<input type='text' name='phone' value='"
 	   tag+= "<%=request.getParameter("phone")%>"
 	   tag+= "'><br>"
 	   tag+= "<textarea name='info' rows='5' cols='40'>"
 	   tag+= "<%=request.getParameter("info")%>"
 	   tag+= "</textarea><br>"
 	   
       tag	+= "<button type='submit'>확인</button></form></div>";
        
        
        //document.write("<form method='post' action='writeHospitalProc2.jsp'><input type='text' name='x' value='"+result[0].x+"'><br><input type='text' name='y' value='"+result[0].y+"'><button type='submit'>확인</button></form>");
        document.write(tag);
        
        
        // 결과값으로 받은 위치를 마커로 표시합니다
       // var marker = new kakao.maps.Marker({
       //     map: map,
       //     position: coords
       // });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        //var infowindow = new kakao.maps.InfoWindow({
        //    content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        //});
        //infowindow.open(map, marker);

        //지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        //map.setCenter(coords);
        
        
        //document.writeHospitalForm.submit();
    } else {
    	document.write("<form method='post' action='failed.jsp' name='writeHospitalForm'></form>")
    } 
     document.writeHospitalForm.submit();
});    
</script>
</body>
</html>