<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/ckeditor/ckeditor.js"></script>
<Style>
	.inputArea{margin:10px p;}
	select{width:100px;}
	label{display:inline-block; width:70px;padding:5px;}
	label[for='goodsContents'] {display:block;}
	input {width:150px;}
	textarea#goodsContents {width:400px;height:180px;}
		
	.select_img img {width:500px; margin:20px 0;}
</Style>
</head>
<body>
<%@ include file="../admin/header.jsp" %>

<form action="/admin/postgoodsModify.do" method="post" autocomplete="off" enctype="multipart/form-data">
<input type="hidden" name="goodsNum" value="${goods.goodsNum}" />
<div class="inputArea"> 
 <label>카테고리</label>
 <select class="category" name="category">
  <option value="운동화/스니커즈">운동화/스니커즈</option>
  <option value="캐쥬얼화">캐쥬얼화</option>
  <option value="샌들">샌들</option>
  <option value="컴포트화">컴포트화</option>
  <option value="여성화">여성화</option>
 </select>
</div>

<div class="inputArea">
 <label for="goodsName">상품명</label>
 <input type="text" id="goodsName" name="goodsName" value="${goods.goodsName }"/>
</div>

<div class="inputArea">
 <label for="goodsPrice">상품가격</label>
 <input type="text" id="goodsPrice" name="goodsPrice" value="${goods.goodsPrice }" pattern="[0-9]+"/>
</div>

<div class="inputArea">
 <label for="goodsStock">상품수량</label>
 <input type="text" id="goodsStock" name="goodsStock" value="${goods.goodsStock }"pattern="[0-9]+"/>
</div>

<div class="inputArea">
 <label for="goodsContents">상품소개</label>
 <textarea rows="5" cols="50" id="goodsContents" name="goodsContents" >${goods.goodsContents }</textarea>
  <script>
 var ckeditor_config = {
   resize_enaleb : false,
   enterMode : CKEDITOR.ENTER_BR,
   shiftEnterMode : CKEDITOR.ENTER_P,
   filebrowserUploadUrl : "/admin/ckUpload.do"
 };
 
 CKEDITOR.replace("goodsContents", ckeditor_config);
</script>
</div>

<div class="inputArea">
 <label for="goodsImage1">이미지</label>
 <input type="file" id="goodsImage1" name="file" />
 <div class="select_img">
  <img src="${goods.goodsImage1}" />
  <input type="hidden" name="goodsImage1" value="${goods.goodsImage1}" />
  <input type="hidden" name="goodsThumbImage" value="${goods.goodsThumbImage}" /> 
 </div>
 
 <script>
  $("#goodsImage1").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>

</div>

 

<div class="inputArea">
 <button type="submit" id="update_Btn" class="btn btn-primary">완료</button>
 <button type="button" id="back_Btn" class="btn btn-warning">취소</button> 
</div>   

</form>

 <script>
  $("#goodsImage").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>

<!-- 취소 버튼 기능 -->
<script>
$("#back_Btn").click(function(){
 history.back();
 //location.href = "/admin/goodsView?n=" + ${goods.goodsNum};
});   
</script>


<%@ include file="../admin/footer.jsp" %>
</body>
</html>