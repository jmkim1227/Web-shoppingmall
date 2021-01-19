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
/*
#container_box table { width:900px; }
#container_box table th { font-size:20px; font-weight:bold;
       text-align:center; padding:10px; border-bottom:2px solid #666; }
#container_box table tr:hover { background:#eee; }
#container_box table td { padding:10px; text-align:center; }
#container_box table img { width:150px; height:auto; }
*/
 div#container_box ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
 div#container_box .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
</style>
코드 복사

</head>
<body>
	<%@ include file="../admin/header.jsp"%>
	<div id="container_box">
		<section id="content">
			<ul class="orderList">
				<c:forEach items="${orderList}" var="orderList">
					<li>
						<div>
							<p>
								<span>주문번호</span><a
									href="/admin/orderView.do?n=${orderList.orderId}">${orderList.orderId}</a>
							</p>
							<p>
								<span>주문자</span>${orderList.id}
							</p>
							<p>
								<span>수령인</span>${orderList.orderRec}
							</p>
							<p>
							<p>
								<span>번호</span><fmt:formatNumber pattern="###-####-###"
									value="${orderList.orderTel}" />
								<!--  ${orderList.orderTel}-->
							</p>
							<p>
								<span>주소</span>${orderList.address}
							</p>
							<p>
								<span>가격</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${orderList.amount}" />
								원
							</p>
							<p><span>상태</span>${orderList.delivery}</p>
						</div>
					</li>
				</c:forEach>
			</ul>
		</section>
	</div>






	<%@ include file="../admin/footer.jsp"%>
</body>
</html>