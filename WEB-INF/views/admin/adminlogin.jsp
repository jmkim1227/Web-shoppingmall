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
	
	<form class="login100-form validate-form" action="/admin/admin_check.do" method="post">
	<span class="login100-form-title p-b-40"> Login </span>

	<div class="wrap-input100 validate-input m-b-16">
		<input class="input100"	type="text" name="adminid" placeholder="adminid"> 
		 <span class="focus-input100"></span>  
		 
	</div>
	
	<div class="wrap-input100 validate-input m-b-20" data-validate = "Please enter password">
		<span class="btn-show-pass"> <i class="fa fa fa-eye"></i></span> 
		<input class="input100" type="password" name="pwd"
			placeholder="Password"> 
			 <span class="focus-input100"></span>
	</div>
	<c:if test="${message !=null}">
		<p>${message}</p>
	</c:if>
	 <% session.removeAttribute("message"); %>

		<input class="container-login100-form-btn" type="submit" value="login" />
	</form>
 <br>
 

	
	<br /><br /><br />
	<br /><br /><br />
	<div align="right">
		<a href="/member/clientLogin.do"><b>client</b></a>
	</div>
</div>
</div>

<%@ include file="../default/footer.jsp" %>
</body>


</body>
</html>