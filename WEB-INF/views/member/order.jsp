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
 .orderMessage {width:500px; padding:10px; border:1px solid #ddd;}
 .listResult { padding:20px; background:#eee; }
.listResult .sum { float:left; width:45%; font-size:22px; }

.listResult .orderOpne { float:right; width:45%; text-align:right; }
.listResult .orderOpne button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;}
.listResult::after { content:""; display:block; clear:both; }
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/member/js/daumpost.js"></script>
<link rel="stylesheet"
	href="/resources/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="/resources/js/bootstrap.min.js"></script>
<script>
	function order(){
		var addr1 = $("#addr1").val();
		var addr2 = $("#addr2").val();
		var addr3 = $("#addr3").val();
		var address = addr1+"/"+addr2+"/"+addr3
		$("#addr1").val(address);
		info.submit();
	}
</script>
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file='../default/header.jsp' %>
<section id="container">
		<div id="container_box">
			<section id="content">
			<form action="/member/payment.do" method="post">
				<ul>
					<c:set var="sum" value="0" />
					<c:forEach items="${cartList}" var="cartList">
						<li>
							<div class="thumb">
								<img src="${cartList.goodsThumbImage}" />
							</div>
							<div class="goodsInfo">
								<p>
									<span>상품명</span>${cartList.goodsName}<br> 
									<span>사이즈</span>${cartList.goodsSize}<br>
									<span>개당 가격</span>
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
						
					<c:set var="sum" value="${sum + (cartList.goodsPrice * cartList.cartStock)}" />
					<input type="hidden" value="${sum }" name="amount" id="amount">
					<input type="hidden" value="${cartList.goodsName }" name="goodsName" id="goodsName">
					<input type="hidden" value="${clientUser.name }" name="name" id="name">
					</c:forEach>
				</ul>
				<h3>주문자 정보</h3>
					<table class="table table-boardered" style="border-top: 3px solid #000">
						<tr>
							<th>이름</th>
							<td><span>${clientUser.name }</span></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="email" class="form-control" id="email"
								name="email"></td>
						</tr>

						<tr>
							<th>전화번호</th>
							<td><input type="tel" class="form-control" id="orderTel"
								name="orderTel" maxlength="13"></td>
						</tr>
					</table>
					<h3>배송 정보</h3>
						<table class="table table-boardered" style="border-top: 3px solid #000">
						<tr>
							<th>이름</th>
							<td><input type="text" class="form-control" id="orderRec"
								name="orderRec"></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" class="form-control2" id="addr1"
								name="address" placeholder="우편번호"> <input type="button"
								class="form-control3" onclick="daumPost()" value="우편번호 찾기"></td>
						</tr>
						<tr>
							<th></th>
							<td><input type="text" class="form-control" id="addr2"
								placeholder="주   소"></td>
						</tr>
						<tr>
							<th></th>
							<td><input type="text" class="form-control" id="addr3"
								placeholder="상세주소"></td>
						</tr>
						<tr>
							<th>주문 메세지<br>(100자 내외)</th>
							<td><textarea name="orderMessage" id="orderMessage" maxlength="100" class="orderMessage"></textarea> </td>
						</tr>
					</table>
				<div class="listResult">
					<div class="sum">
						총 합계 :
						<fmt:formatNumber pattern="###,###,###" value="${sum}" />
						원
					</div>
					<div class="orderOpne">
						<input type="submit" class="orderOpne_bnt" value="카카오페이로 결제" onclick="order()">
					</div>
				</div>
				</form>
			</section>
		</div>
	</section>


<%@ include file='../default/footer.jsp' %>

</body>
</html>