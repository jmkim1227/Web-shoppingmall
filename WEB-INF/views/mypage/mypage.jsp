<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link type="text/css" rel="stylesheet" href="/resources/css/menu.1.css">
<link type="text/css" rel="stylesheet" href="/resources/css/common(1).css">
<script type="text/javascript" src="/resources/js/menu.1.js?t=202009031602"></script>
<script type="text/javascript" src="/resources/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/resources/js/lazyload.min.js"></script>
<script type="text/javascript" src="/resources/js/wcslog.js"></script>
<script type="text/javascript" src="/resources/js/flash.js"></script>
<link type="text/css" rel="stylesheet" href="/resources/css/mp_main.css?t=202009031602">
<link type="text/css" rel="stylesheet" href="/resources/css/mp_main.css">
</head>
<body>
<%@ include file="../default/header.jsp" %>
<h1>마이페이지</h1>


<div id="Paris" class="city" style="display:none">
  <h2>Paris</h2>
  <p>Paris is the capital of France.</p>
</div>

<div id="Tokyo" class="city" style="display:none">
  <h2>Tokyo</h2>
  <p>Tokyo is the capital of Japan.</p>
</div>
<div class="w3-bar w3-black">
  <button class="w3-bar-item w3-button" onclick="openCity('London')"  style="padding-right: 100px; padding-left: 100px;">주문내역</button>
  <button class="w3-bar-item w3-button" onclick="openCity('Paris')" style="padding-right: 100px;">개인정보 수정</button>
  <button class="w3-bar-item w3-button" onclick="openCity('Tokyo')" style="padding-right: 100px;">내 마일리지</button>
  <button class="w3-bar-item w3-button" onclick="openCity('Tokyo')" style="padding-right: 100px;">찜한 상품</button>
  <button class="w3-bar-item w3-button" onclick="openCity('Tokyo')" style="padding-right: 100px;">내 게시글</button>
  <button class="w3-bar-item w3-button" onclick="openCity('Tokyo')" style="padding-right: 100px;">회원 탈퇴</button>
</div>
<div id="wrap">
    
<link type="text/css" rel="stylesheet" href="/resources/css/header.1.css?t=202012171358">
<link rel="stylesheet" href="/resources/js/xeicon.min.css">
<link type="text/css" rel="stylesheet" href="/resources/css/common.css?r=1599116572">
<link rel="stylesheet" type="text/css" href="/resources/css/slick.css">
<script src="/resources/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="/resources/css/slick.min.js"></script>


<!-- //상단 시작 -->
<script type="text/javascript" src="/resources/js/header.1.js?t=202012171358"></script>
    <div id="contentWrapper">
        <div id="contentWrap">
            
<link type="text/css" rel="stylesheet" href="/resources/css/menu.1.css?t=202009031602">
 
<script type="text/javascript" src="/resources/js/menu.1.js?t=202009031602"></script>
            <div id="content">
                <div id="mypage">
      
                        
                        <div class="hd">
                            <h3>주문 내역</h3>
                            <a class="CSSbutton" href="/shop/mypage.html?mypage_type=myorder">more</a>
                        </div>
                        <div class="tbl">
                            <table summary="주문일자, 상품명, 결제금액, 주문상세">
                                <caption>최근 주문 정보 목록</caption>
                                <colgroup>
                                    <col width="185">
                                    <col width="*">
                                    <col width="280">
                                    <col width="220">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th><div class="tb-center">주문일자</div></th>
                                        <th><div class="tb-center">상품명</div></th>
                                        <th><div class="tb-center">결제금액</div></th>
                                        <th><div class="tb-center">주문상세</div></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="4"><div class="tb-center">주문 내역이 없습니다.</div></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="hd">
                            <h3>최근 등록 게시글</h3>
                            <a class="CSSbutton" href="/shop/mypage.html?mypage_type=myarticle">more</a>
                        </div>
                        <div class="tbl">
                            <table summary="등록일자, 제목, 게시판">
                                <caption>최근 등록 게시물 목록</caption>
                                <colgroup>
                                    <col width="185">
                                    <col width="*">
                                    <col width="200">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th><div class="tb-center">등록일자</div></th>
                                        <th><div class="tb-center">제목</div></th>
                                        <th><div class="tb-center">게시판</div></th>
                                    </tr>
                                </thead>
                                <tbody>
                                                                    <tr>
                                        <td colspan="3"><div class="tb-center">작성된 게시글이 없습니다.</div></td>
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                        
                        <div class="prod_list_wrap">
                            <div class="bx_list">
                                <div class="hd">
                                    <h3>관심상품</h3>
                                    <a class="CSSbutton" href="/shop/mypage.html?mypage_type=mywishlist">more</a>
                                </div>
                                <table class="lst" summary="상품사진, 상품명, 상품가격">
                                    <caption>위시리스트 목록</caption>
                                    <colgroup>
                                        <col width="120">
                                        <col width="*">
                                    </colgroup>
                                    <tbody>
                                                                        </tbody><tbody>
                                </tbody></table>
                            </div>
                            
                            <div class="bx_list ml-40">
                                <div class="hd">
                                    <h3>내 마일리지</h3>
                                    <a class="CSSbutton" href="/shop/mypage.html?mypage_type=myseegoods">more</a>
                                </div>
                                <table class="lst" summary="상품사진, 상품명, 상품가격">
                                    <caption>오늘본상품 목록</caption>
                                    <colgroup>
                                        <col width="120">
                                        <col width="*">
                                    </colgroup>
                                    <tbody>
                                                                        </tbody><tbody>
                                </tbody></table>
                            </div>
                        </div><!-- //prod_list_wrap -->
                        
                    </div><!-- .page-body -->
                </div><!-- #mypage -->
            </div><!-- #content -->
        </div><!-- #contentWrap -->
    </div><!-- #contentWrapper-->
    <hr>
    <hr>
<%@ include file="../default/footer.jsp" %>

</body>
</html>