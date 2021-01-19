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
.w3-sidebar a {font-family: "Roboto", sans-serif}
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
a { text-decoration:none;}
 section#content ul li { display:inline-block; margin:10px; }
 section#content div.goodsThumb img { width:200px; height:200px; }
 section#content div.goodsName { padding:10px 0; text-align:center; }
 section#content div.goodsName a { color:#000; }
 section#content div.goodsPrice { padding:10px 0; text-align:center;}

	#container_box table {width:900px;}
	#container_box table th {font-size:20px; font-weight: bold; text-align: center; padding:10px;
								border-bottom: 2px solid #666;}
	#container_box table tr:hover {background: #eee;}
	#container_box table td {padding:10px; text-align: center;}
	#container_box table img {width:150px; height: auto;}
	section#content ul li { display:inline-block; margin:10px; }
	section#content div.goodsThumb img { width:200px; height:200px; }
	section#content div.goodsName { padding:10px 0; text-align:center; }
	section#content div.goodsName a { color:#000; }
</style>
</head>
<body>
<%@ include file="header.jsp" %>
	<section id="container">
		<div id="container_box">
			<section id="content">
				<ul>
					<c:forEach items="${list}" var="list">
						<li>
							<div class="goodsThumb">
								<img src="${list.goodsThumbImage}">
							</div>
							<div class="goodsName">
								<a href="/goods/shop.do?n=${list.goodsNum}"><b>${list.goodsName}</b></a>
							</div>
							<div class="goodsPrice">
								 <span><fmt:formatNumber value="${list.goodsPrice}" pattern="###,###,###"/>원</span>
							</div>
						</li>
					</c:forEach>
				</ul>
			</section>
		</div>
	</section>




<%@ include file="footer.jsp" %>
</body>
</html>