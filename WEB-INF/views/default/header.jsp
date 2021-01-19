<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/w3/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

<style>
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
</style> 
<style type="text/css"> 
a { text-decoration:none;
} 
</style>
</head>
<body class="w3-content" style="max-width:1500px">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top" style="z-index:3;width:250px" id="mySidebar">
  <div class="w3-container w3-display-container w3-padding-16">
    <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
    <h3 class="w3-wide"><b><a href="/" style="color:black;">AKIII CLASSIC</a></b></h3>
  </div>
  <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">
    <a href="/default/totalList.do" class="w3-bar-item w3-button">전체보기</a>
    <a href="/default/goodsList.do?category=sportsneakers" class="w3-bar-item w3-button">운동화/스니커즈</a>
	<a href="/default/goodsList.do?category=casual" class="w3-bar-item w3-button">캐쥬얼화</a>	
    <a href="/default/goodsList.do?category=sandal" class="w3-bar-item w3-button">샌들</a>
    <a href="/default/goodsList.do?category=comfort" class="w3-bar-item w3-button">컴포트화</a>
    <a href="/default/goodsList.do?category=woman" class="w3-bar-item w3-button">여성화</a>

	<div class="member" style="padding-top: 50px;">
  		<c:choose>
			<c:when test="${clientUser == null}">
 				 <a href="/member/clientLogin.do" class="w3-bar-item w3-button w3-padding">로그인</a>
			</c:when>
			<c:otherwise>
				<a href="/member/clientlogout.do" class="w3-bar-item w3-button w3-padding">로그아웃</a>
				<a href="/member/cartList.do" class="w3-bar-item w3-button w3-padding">장바구니</a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${clientUser == null}">
				  <a href="/member/signup_form.do" class="w3-bar-item w3-button w3-padding">회원가입</a>
			</c:when>
			<c:otherwise>
			
			</c:otherwise>
		</c:choose>
   		<c:choose>
			<c:when test="${clientUser == null }">
				  <a href="/member/login.do" class="w3-bar-item w3-button w3-padding">마이페이지</a>
			</c:when>
			<c:otherwise>
				  <a href="/mypage/mypage.do" class="w3-bar-item w3-button w3-padding">마이페이지</a>
			</c:otherwise>
		</c:choose>
  
  <a href="/member/orderList.do" class="w3-bar-item w3-button w3-padding">주문조회</a>
  <a href="#" class="w3-bar-item w3-button w3-padding">고객센터</a>
 	 </div>
   </div>
   
</nav>

<!-- Top menu on small screens -->
<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
  <div class="w3-bar-item w3-padding-24 w3-wide">LOGO</div>
  <a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding-24 w3-right" onclick="w3_open()"><i class="fa fa-bars"></i></a>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:250px">

  <!-- Push down content on small screens -->
  <div class="w3-hide-large" style="margin-top:83px"></div>
  
  <!-- Top header -->
  <header class="w3-container w3-xlarge">
<nav class="navbar navbar-expand-lg navbar-white bg-white" style="float:right;">
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="검색" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
    </form>
    <i class="fa fa-shopping-cart w3-margin-right" style="padding-left: 24px;"></i>
  </div>
</nav>
  </header>

</body>
</html>