<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<script src="/resources/client/js/jquery-3.3.1.js"></script>


<head>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/member/js/daumpost.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function signup(){
		var addr1 = $("#addr1").val();
		var addr2 = $("#addr2").val();
		var addr3 = $("#addr3").val();
		var address = addr1+"/"+addr2+"/"+addr3
		$("#addr1").val(address);
		info.submit();
	}
</script>
<script>
	//닉네임과 이메일 입력하지 않았을 경우 가입버튼 비활성화
	function signupCheck() {
		var email = $("#clientEmail").val();
		var tel = $("#clientTel").val();
		var birth = $("#clientBirth").val();
		var name = $("#clientName").val();
		if (email == "" || tel == "" || birth == "" || name == "") {
			$(".signupbtn").prop("disabled", true);
			$(".signupbtn").css("background-color", "#aaaaaa");
		} else {
		}
	}
	//     아이디와 비밀번호가 맞지 않을 경우 가입버튼 비활성화를 위한 변수설정
	var idCheck = 0;
	var pwdCheck = 0;

	//아이디 체크하여 가입버튼 비활성화, 중복확인.
	function checkId() {
		var inputed = $('.form-control').val();
		console.log(inputed);
		$.ajax({
			data : {
				id : inputed
			},
			url : "/member/checkId.do",
			success : function(data) {
				if (inputed == "" && data == '0') {
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#Id").css("background-color", "#FFCECE");
					idCheck = 0;
				} else if (data == '0') {
					$("#Id").css("background-color", "#B0F6AC");
					idCheck = 1;

					if (idCheck == 1 && pwdCheck == 1) {
						$(".signupbtn").prop("disabled", false);
						$(".signupbtn").css("background-color", "#4CAF50");
						signupCheck();
					}
				} else if (data == '1') {
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#Id").css("background-color", "#FFCECE");
					idCheck = 0;
				}
				console.log(data);
			}
		});
	}
	//재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
	function checkPwd() {
		var inputed = $('#Pwd').val();

		var reinputed = $('#chackPwd').val();
		if (reinputed == "" && (inputed != reinputed || inputed == reinputed)) {
			$(".signupbtn").prop("disabled", true);
			$(".signupbtn").css("background-color", "#aaaaaa");
			$("#chackPwd").css("background-color", "#FFCECE");
		} else if (inputed == reinputed) {
			$("#chackPwd").css("background-color", "#B0F6AC");
			pwdCheck = 1;
			if (idCheck == 1 && pwdCheck == 1) {
				$(".signupbtn").prop("disabled", false);
				$(".signupbtn").css("background-color", "#4CAF50");
				signupCheck();
			}
		} else if (inputed != reinputed) {
			pwdCheck = 0;
			$(".signupbtn").prop("disabled", true);
			$(".signupbtn").css("background-color", "#aaaaaa");
			$("#chackPwd").css("background-color", "#FFCECE");

		}
	}

	$(document).ready(function() {
		$(document).on('keyup', '#info input', infoChange)
	})
	function infoChange() {
		console.log("..................")

		var email = $("#Email").val();
		var tel = $("#Tel").val();
		var birth = $("#Birth").val();
		var name = $("#Name").val();

		if (email == "" || tel == "" || birth == "" || name == "" || idCheck == 0 && pwdCheck == 0 ) {
			$(".signupbtn").prop("disabled", true);
			$(".signupbtn").css("background-color", "#aaaaaa");
		}
		else{
			$(".signupbtn").prop("disabled", false);
			$(".signupbtn").css("background-color", "#4CAF50");
			signupCheck();
			
			
		}
	}

	//캔슬버튼 눌렀을 눌렀을시 인풋박스 클리어
	function index() {
		location.href = "index.do";
	}


</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="/resources/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="/resources/js/bootstrap.min.js"></script>

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<style type="text/css">
.form-control2 {
	float:left;
	width: 30%;
	height: calc(1.5em + .75rem + 2px);
	padding: .375rem .75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out
}

.form-control2:focus {
	color: #495057;
	border-color: #80bdff;
	outline: 0;
	box-shadow: 0 0 0 .2rem rgba(0, 123, 255, .25)
}
.form-control3{
	width: 120px;
	height: 34px;
	margin-left: 3px;
}
</style>
</head>
<body>
<%@include file="../default/header.jsp" %>
	<form action="/member/signup.do" method="Post" id="info">
		<h2>회원가입</h2>

		<table class="table table-boardered">
			<tr>
				<th>아이디</th>
				<td><input type="text" class="form-control" name="Id"
					placeholder="id를 넣으세요" oninput="checkId()" id="Id"></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="password" class="form-control"
					name="Pwd" placeholder="pw를 넣어주세요" required class="pass"
					id="Pwd" oninput="checkPwd()"></td>
			</tr>

			<tr>
				<th>패스워드확인</th>
				<td><input type="password" class="form-control"
					id="chackPwd" placeholder="pw 재입력" name="chackPwd"
					required class="pass" oninput="checkPwd()"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" class="form-control" id="Name"
					name="Name"></td>
			</tr>
			<tr>
				<th>생일</th>
				<td><input type="Date" class="form-control" id="Birth"
					name="Birth"></td>
			</tr>

			<tr>
				<th>이메일</th>
				<td><input type="email" class="form-control" id="Email"
					name="Email"
					></td>
			</tr>

			<tr>
				<th>전화번호</th>
				<td><input type="tel" class="form-control" id="Tel"
					name="Tel"></td>
			</tr>
			
			<tr>
				<th>주소</th>
				<td><input type="text" class="form-control2"id="addr1" name="address" placeholder="우편번호">
				<input type="button" class="form-control3" onclick="daumPost()" value="우편번호 찾기"></td>
			</tr>
			<tr>
				<th></th>
				<td><input type="text" class="form-control" id="addr2" placeholder="주   소" ></td>
			</tr>
			<tr>
				<th></th>
				<td><input type="text" class="form-control" id="addr3" placeholder="상세주소"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="cancelbtn" onclick="index()">Cancel</button>
					<input type="submit" class="signupbtn" disabled="disabled" onclick="signup()"
					value="Sign Up">
			</tr>


		</table>
	</form>
	<a href="${kakaoURI }">카카오로 로그인</a>
	<%@include file="../default/footer.jsp" %>
</body>
</html>