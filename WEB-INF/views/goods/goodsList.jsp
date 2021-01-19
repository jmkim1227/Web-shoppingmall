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
body,h1,h2,h3,h4,h5,h6,.w3-wide {font-family: "Montserrat", sans-serif;}
a { text-decoration:none;}
 section#content ul li { display:inline-block; margin:10px; }
 section#content div.goodsThumb img { width:200px; height:200px; }
 section#content div.goodsName { padding:10px 0; text-align:center; }
 section#content div.goodsName a { color:#000; }
 section#content div.goodsPrice { padding:10px 0; text-align:center;}
 
} 
</style>
</head>
<body>
<%@ include file="../default/header.jsp" %>
<h1>운동화/스니커즈</h1>
	<section id="container">
		<div id="container_box">
			<section id="content">
				<ul>
					<c:forEach items="${sportandsneakers}" var="sportandsneakers">
						<li>
							<div class="goodsThumb">
								<img src="${sportandsneakers.goodsThumbImage}">
							</div>
							<div class="goodsName">
								<a href="/goods/shop.do?n=${sportandsneakers.goodsNum}"><b>${sportandsneakers.goodsName}</b></a>
							</div>
							<div class="goodsPrice">
								 <span><fmt:formatNumber value="${sportandsneakers.goodsPrice}" pattern="###,###,###"/>원</span>
							</div>
						</li>
					</c:forEach>
				</ul>
			</section>
		</div>
	</section>

<%@ include file="../default/footer.jsp" %>
</body>
</html>