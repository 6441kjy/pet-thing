<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 

	String prevPage = request.getHeader("referer");
	String userId;
	int userLvl;
	
	if(session.getAttribute("userId")!=null) {
		userId = (String) session.getAttribute("userId");
		userLvl = (Integer)session.getAttribute("userLvl");
	
	//세션에 로그인정보 있으면 로그인폼 안보이게 하기
	
	//if(session.getAttribute("userId")!=null) {
		out.print("<p align='center' style='margin: 3rem;'>이미 아이디\"<strong>"+userId+"</strong>\"(으)로 로그인 되어있습니다.<br>레벨 :"+userLvl+"</p>");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/login/css/LoginReal.css?v=<%=System.currentTimeMillis() %>"/>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/login/js/loginForm.js"></script>
</head>
<body>
	<div class="form-signin" style="width: 100%;
  max-width: 330px;
  padding: 15px;
  padding-bottom: 3rem;
  margin: auto;">
		<form class="text-center" method="post"
			action="<%=request.getContextPath()%>/login/loginProc.jsp"
			id="loginForm">
			<input type="hidden" name="prevPage" value="<%=prevPage%>">
			<h1 class="h3 mb-3 fw-normal text-center">Login</h1>

			<div class="form-floating mb-2">
				<input type="id" class="form-control" id="floatingInput"
					placeholder="아이디를 입력하세요" name="id" maxlength="12"> <label
					for="floatingInput">아이디</label>
			</div>
			<div class="form-floating mb-3">
				<input type="password" class="form-control" id="floatingPassword"
					placeholder="비밀번호를 입력하세요" name="pw" maxlength="20"
					onkeydown="JavaScript:enter();"> <label
					for="floatingPassword">비밀번호</label>
			</div>

			<button class="w-100 btn btn-lg btn-primary mb-5" id="loginSubmit" type="button"
				onClick="chkInput();" onkeyup="enter();">로그인</button>
				<br/>
			<div class="border-top border-secondary p-5">
				<a id="kakao-login-btn"></a> <a
					href="http://developers.kakao.com/logout"></a>
			</div>
		</form>
	</div>
	<script type='text/javascript'>
		Kakao.init('85d541c64ba5949e2936434ddb813671');

		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {

				Kakao.API.request({
					url : '/v2/user/me',
					success : function(res) {
						console.log(res);

						var userID = res.id;
						var userEmail = res.kakao_account.email;
						var userAge = res.kakao_account.age_range;
						
						 document.getElementById("floatingInput").value = userID;
				         document.getElementById("floatingPassword").value = "0";
				         document.getElementById("loginSubmit").click();

					},
					fail : function(error) {
						alert(JSON.stringify(error));
					}
				});
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
	</script>
</body>
</html>