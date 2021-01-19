<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<Style>
	.inputArea{margin:10px p;}
	select{width:100px;}
	label{display:inline-block; width:70px;padding:5px;}
	label[for='goodsContents'] {display:block;}
	input {width:150px;}
	textarea#goodsContents {width:400px;height:180px;}
	
	.oriImg {width:500px; height:auto;}
	.thumbImg {}
	
	.goodsContents img{ max-width:600px; height:auto;}
</Style>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
</head>
<body>
<%@ include file="../admin/header.jsp" %>

<form action="/admin/goodsModify.do" method="post" autocomplete="off">
	<input type="hidden" name="n" value="${goods.goodsNum }"/>
	
	<div class="inputArea"> 
		<label>카테고리</label>
		<span class="category">${goods.category}</span>
	</div>
	
	<div class="inputArea">
		<label for="goodsName">상품명</label>
		<span class="goodsName">${goods.goodsName }</span>
	</div>
	
	<div class="inputArea">
		<label for="goodsPrice">상품가격</label>
		<span><fmt:formatNumber value="${goods.goodsPrice}" pattern="###,###,###"/></span>
	</div>
	
	<div class="inputArea">
		<label for="goodsStock">상품수량</label>
		<span class="goodsStock">${goods.goodsStock }</span>
	</div>
	
	<div class="inputArea">
		<label for="goodsContents">상품소개</label>
		<div class="goodsContents">${goods.goodsContents }</div>
	</div>
	
	<div class="inputArea">
	 <label for="goodsImg">이미지</label>
	 <p>원본 이미지</p>
	 <img src="${goods.goodsImage1}" class="oriImg"/>
	 
	 <p>썸네일</p>
	 <img src="${goods.goodsThumbImage}" class="thumbImg"/>
	</div>
<div class="inputArea">
	<button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
	<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>

	
	</div>
</form>
<script>
		var formObj = $("form[action='/admin/goodsModify.do']");
		$("#modify_Btn").click(function() {
			formObj.attr("action", "/admin/goodsModify.do");
			formObj.attr("method", "get")
			formObj.submit();
		});
		$("#delete_Btn").click(function(){
				 var con = confirm("정말로 삭제하시겠습니까?");
				 if(con) {      
				  formObj.attr("action", "/admin/goodsDelete.do");
				  formObj.submit();
				 }
			});
	</script>

<%@ include file="../admin/footer.jsp" %>
</body>
</html>