<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="./main_logo.gif" type="image/x-icon">
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css" />
<title>우리동네 올림픽</title>
<link rel="stylesheet" href="${path}/resources/css/reset.css" />
<link rel="stylesheet" href="${path}/resources/css/styles.css">
<link rel="shortcut icon" href="${path}/resources/img/파비콘.png" type="image/x-icon">
<style>
.side-bar {
	position: relative;
	top: -71px;
}

.banana {
	border: 1px solid black;
	height: 600px;
	margin: 0 auto;
	display: flex;
	align-items: center;
}

.banana form {
	margin: 0 auto;
}

.banana table th {
	width: 90px;
	text-align: left;
	font-weight: bold;
}

.banana #userid, .banana #userpw {
	width: 300px;
	height: 40px;
}

.banana #delete_confirm {
	width: 390px;
	height: 40px;
}

.side-bar div ul li a.current {
	pointer-events: none;
	cursor: default;
	color: red;
	font-weight: bold;
}
</style>
</head>

<body>
	<%@ include file="../include/header.jsp"%>
	<c:if test="${loginUser == null }">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace('${cp}/user/login');
		</script>
	</c:if>
	<section>
		<%@ include file="../include/profile_sidebar.jsp"%>

		<!-- 개발코드 시작 -->
		<div class="banana">
			<form name="joinForm" method="post" action=""
				onsubmit="return sendit()">
				<table>
					<tr>
						<th><label for="userid">아이디</label></th>
						<td><input type="text" name="userid" id="userid" value=""
							style="color: gray;"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th><label for="userpw">비밀번호</label></th>
						<td><input type="password" name="userpw" id="userpw">
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th><label for="delete_confirm">입력</label></th>
						<td style="color: red;">'회원 탈퇴를 신청합니다.'를 입력해주세요.</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" name="delete_confirm"
							id="delete_confirm"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;"><input
							type="submit" value="회원탈퇴"></td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 개발코드 끝 -->
	</section>
	<%@ include file="../include/footer.jsp"%>
</body>
<script src="${path}/resources/js/header.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	var url = window.location.pathname;
	
	$('.side-bar').find('a').each(function() {
		$(this).toggleClass('current', $(this).attr('href') == url);
	});
	
	function sendit() {
		const joinForm = document.joinForm;
		const userid = joinForm.userid;
		const userpw = joinForm.userpw;
		const delete_confirm = joinForm.delete_confirm;

		if (delete_confirm.value != "회원 탈퇴를 신청합니다.") {
			alert("입력칸을 확인해주세요!");
			delete_confirm.focus();
			return false;
		}

		return true;
	}
</script>
</html>