<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/main1.css">
</head>
<body>
<%@include file="../default/header.jsp" %>
<div class="container-login100">
<div class="wrap-login100 p-t-90 p-b-30">
	
	<form class="login100-form validate-form" action="/member/user_check.do" method="post">
	<span class="login100-form-title p-b-40"> Login </span>

	<div class="wrap-input100 validate-input m-b-16">
		<input class="input100"	type="text" name="id" placeholder="id"> 
		 <span class="focus-input100"></span>  
		 
	</div>
	
	<div class="wrap-input100 validate-input m-b-20" data-validate = "Please enter password">
		<span class="btn-show-pass"> <i class="fa fa fa-eye"></i></span> 
		<input class="input100" type="password" name="pwd"
			placeholder="Password"> 
			 <span class="focus-input100"></span>
	</div>	
	<c:if test="${clientmsg == false}">
    </c:if>

		<input class="container-login100-form-btn" type="submit" value="login" />
	</form>
 <br>
 
	<span class="login100-form-title p-b-25"> Login with SNS </span>
	<a href="https://kauth.kakao.com/oauth/authorize?client_id=9d6c23b8bb3dd2f9c884fe9ab2bb2c2c&redirect_uri=
http://localhost:8081/root/success&response_type=code" class="login100-form-title p-b-40" ><img
		src="/resources/image/kakao_login_medium_narrow.png"></a>
	
	<div class="flex-col-c p-t-224">
		<span class="txt2 p-b-10"> 회원가입이 필요하신가요? </span> <a href="Register.do"
			class="txt3 bo1 hov1"> 회원가입 </a>
	</div>
	
	<br /><br /><br />
	<br /><br /><br />
	<div align="right">
		<a href="/admin/adminlogin.do"><b>manage</b></a>
	</div>
</div>
</div>

<%@ include file="../default/footer.jsp" %>
</body>


</body>
</html>