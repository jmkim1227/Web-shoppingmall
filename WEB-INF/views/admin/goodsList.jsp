<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	#container_box table {width:900px;}
	#container_box table th {font-size:20px; font-weight: bold; text-align: center; padding:10px;
								border-bottom: 2px solid #666;}
	#container_box table tr:hover {background: #eee;}
	#container_box table td {padding:10px; text-align: center;}
	#container_box table img {width:150px; height: auto;}
</style>
</head>
<body>
<%@ include file="../admin/header.jsp" %>
<div id="container_box">
	<table>
 <thead>
  <tr>
   <th>번호</th>
   <th>이름</th>
   <th>카테고리</th>
   <th>가격</th>
   <th>수량</th>
   <th>등록날짜</th>
  </tr>
 </thead>
 <tbody>
  <c:forEach items="${list}" var="list">
  <tr>
   <td><img src="${list.goodsThumbImage}"></td>
   <td>
   		<a href="/admin/goodsView.do?n=${list.goodsNum}">${list.goodsName}</a>
   </td>
   <td>${list.category}</td>
   <td>
   		<fmt:formatNumber value="${list.goodsPrice}" pattern="###,###,###"/>
   	</td>
   <td>${list.goodsStock}</td>
   <td>
	   <fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" />
   </td>
  </tr>   
  </c:forEach>
 </tbody>
</table>
</div>






<%@ include file="../admin/footer.jsp" %>
</body>
</html>