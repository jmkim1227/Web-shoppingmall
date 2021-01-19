<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/ckeditor/ckeditor.js"></script>

</head>
<body>
<%@ include file="../admin/header.jsp" %>

<form action="/admin/goodsRegister.do" method="post" autocomplete="off" enctype="multipart/form-data">

<div class="inputArea"> 
 <label>카테고리</label>
 <select class="category" name="category">
  <option value="sportsneakers">운동화/스니커즈</option>
  <option value="casual">캐쥬얼화</option>
  <option value="sandal">샌들</option>
  <option value="comfort">컴포트화</option>
  <option value="woman">여성화</option>
 </select>
</div>

<div class="inputArea">
 <label for="goodsName">상품명</label>
 <input type="text" id="goodsName" name="goodsName" />
</div>

<div class="inputArea">
 <label for="goodsPrice">상품가격</label>
 <input type="text" id="goodsPrice" name="goodsPrice" pattern="[0-9]+"/>
</div>

<div class="inputArea">
 <label for="goodsStock">상품수량</label>
 <input type="text" id="goodsStock" name="goodsStock" pattern="[0-9]+"/>
</div>

<div class="inputArea">
 <label for="goodsContents">상품소개</label>
 <textarea rows="5" cols="50" id="goodsContents" name="goodsContents"></textarea>
 
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
 <label for="goodsImage">이미지</label>
 <input type="file" id="goodsImage" name="file" />
 <div class="select_img"><img src="" /></div>
 
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
</div>

<div class="inputArea">
 <button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
 
</div>

</form>


<%@ include file="../admin/footer.jsp" %>
</body>
</html>