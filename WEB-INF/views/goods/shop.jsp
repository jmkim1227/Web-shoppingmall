<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
html, body {
	width: 100%;
	height: 100%;
}

#foot {
	margin-top: -1.9em;
	height: 1.9em
}

div.goods div.goodsImage {
	float: left;
	width: 350px;
}

div.goods div.goodsImage img {
	width: 500px;
	height: 500px;
}

div.goods div.goodsInfo {
	float: right;
	width: 500px;
	font-size: 18px;
	padding-top: 100px;
}

div.goodsContents {
	font-size: 18px;
	clear: both;
	padding-top: 100px;
}
</style>
</head>
<body>

	<%@ include file="../default/header.jsp"%>

	<div class="root">
		<section id="container">
			<div id="container_box">

				<form action="/goods/addCart.do" method="post">
					<input type="hidden" id="goodsNum" value="${view.goodsNum}" />


					<div class="goods">
						<div class="goodsImage">
							<img src="${view.goodsImage1}">
						</div>

						<div class="goodsInfo">
							<p class="goodsName">${view.goodsName}</p>

							<p class="goodsPrice">
								<fmt:formatNumber pattern="###,###,###"
									value="${view.goodsPrice}" />
								원
							</p>
							<p class="goodsSize">
								<select name="goodsSize" id="goodsSize">
									<option value="">사이즈 선택</option>
									<option value="230">230mm</option>
									<option value="235">235mm</option>
									<option value="240">240mm</option>
									<option value="245">245mm</option>
									<option value="250">250mm</option>
									<option value="255">255mm</option>
									<option value="260">260mm</option>
									<option value="265">265mm</option>
									<option value="270">270mm</option>
									<option value="275">275mm</option>
									<option value="280">280mm</option>
									<option value="285">285mm</option>
								</select>
							</p>
							<p class="cartStock">
								<span>구입 수량</span>
								<button type="button" class="plus">+</button>
								<input type="number" class="numBox" min="1"
									max="${view.goodsStock}" value="1" readonly="readonly" />
								<button type="button" class="minus">-</button>

								<script>
									  $(".plus").click(function(){
									   var num = $(".numBox").val();
									   var plusNum = Number(num) + 1;
									   
									   if(plusNum >= ${view.goodsStock}) {
									    $(".numBox").val(num);
									   } else {
									    $(".numBox").val(plusNum);          
									   }
									  });
									  
									  $(".minus").click(function(){
									   var num = $(".numBox").val();
									   var minusNum = Number(num) - 1;
										   
									   if(minusNum <= 0) {
									    $(".numBox").val(num);
									   } else {
									    $(".numBox").val(minusNum);          
									   }
									  });
								</script>

							</p>

							<p class="addToCart">
								<button type="button" class="addCart_btn">카트에 담기</button>

								<script>
								 $(".addCart_btn").click(function(){
								  var goodsNum = $("#goodsNum").val();
								  var cartStock = $(".numBox").val();
								  var goodsSize = $("#goodsSize").val();
								  var data = {
								    goodsNum : goodsNum,
								    cartStock : cartStock,
								    goodsSize : goodsSize
								    };
								  
								  $.ajax({
								   url : "/member/addCart.do",
								   type : "post",
								   data : data,
								   success : function(result){
								    if(result == "1") {
								     alert("카트 담기 성공");
								     $(".numBox").val("1");
								    } else {
								     alert("회원만 사용할 수 있습니다.")
								     $(".numBox").val("1");
								    }
								   },
								   error : function(request, status, error){
									   alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

								    alert("카트 담기 실패");
								   }
								  });
								 });
								</script>
							</p>

							<button type="button">바로 구매</button>
							</p>
						</div>
						<div class="goodsContents">${view.goodsContents}</div>

					</div>
				</form>
			</div>
		</section>

		

	</div>
	<div style="clear: both;"></div>
	<footer class="footer">
		<%@ include file="../default/footer.jsp"%>
	</footer>
</body>
</html>