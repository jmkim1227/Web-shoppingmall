<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section#content ul li { margin:10px 0; }
 section#content ul li img { width:250px; height:250px; }
 section#content ul li::after { content:""; display:block; clear:both; }
 section#content div.thumb { float:left; width:250px; }
 section#content div.goodsInfo { float:right; width:calc(100% - 270px); }
 section#content div.goodsInfo { font-size:20px; line-height:2; }
 section#content div.goodsInfo span { display:inline-block; width:100px; font-weight:bold; margin-right:10px; }
.listResult { padding:20px; background:#eee; }
.listResult .sum { float:left; width:45%; font-size:22px; }

.listResult .orderOpne { float:right; width:45%; text-align:right; }
.listResult .orderOpne button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;}
.listResult::after { content:""; display:block; clear:both; }
</style>
<link rel="stylesheet"
	href="/resources/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="/resources/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ include file="../default/header.jsp"%>
<section id="container">
		<div id="container_box">
			<section id="content">
				<form action="/member/order.do" method="post">
				<ul>
					<c:set var="sum" value="0" />
					<c:forEach items="${cartList}" var="cartList">
					<li>
						<div class="thumb">
							<img src="${cartList.goodsThumbImage}" />
						</div>
						<div class="goodsInfo">
							<p>
								<span>상품명</span>${cartList.goodsName}<br /> <span>개당 가격</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${cartList.goodsPrice}" />
								원<br /> <span>구입 수량</span>${cartList.cartStock} 개<br /> <span>최종
									가격</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${cartList.goodsPrice * cartList.cartStock}" />
								원
							</p>

						</div>
						</li>
						<c:set var="sum"
							value="${sum + (cartList.goodsPrice * cartList.cartStock)}" />
					</c:forEach>
					</ul>
					
		<h2>주문자 정보</h2>

		<table class="table table-boardered">
			<tr>
				<th>이름</th>
				<td><input type="text" class="form-control" id="Name"
					name="Name"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" class="form-control" id="Email"
					name="Email"
					></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="tel" class="form-control" id="Tel"
					name="Tel"></td>
			</tr>
			</table>
		<h2>배송 정보</h2>
		<table class="table table-boardered">
			<tr>
				<th>주소</th>
				<td><input type="text" class="form-control2"id="addr1" name="address" placeholder="우편번호">
				<input type="button" class="form-control3" onclick="daumPost()" value="우편번호 찾기"></td>
			</tr>
			<tr>
				<th></th>
				<td><input type="text" class="form-control" id="addr2" placeholder="주   소" ></td>
			</tr>
			<tr>
				<th></th>
				<td><input type="text" class="form-control" id="addr3" placeholder="상세주소"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="cancelbtn" onclick="index()">Cancel</button>
					<input type="submit" class="signupbtn" disabled="disabled" onclick="signup()"
					value="Sign Up">
			</tr>
		</table>
	
		
	</form>
			</section>
		</div>
	</section>
	<%@ include file="../default/footer.jsp"%>
</body>
</html>