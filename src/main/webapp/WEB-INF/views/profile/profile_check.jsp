<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	top: -153px;
}

.banana {
	height: 100%;
	margin: 0 auto;
	align-items: center;
}

.banana form {
	margin: 0 auto;
}

.banana .banana_title {
	margin: 0 auto;
	border-bottom: 2px solid black;
	padding: 0px 50px 30px 50px;
	width: 75%;
}

.banana .banana_title h2 {
	font-size: 20px;
	font-weight: bold;
}

.banana table {
	margin: 50px auto;
}

.banana table th {
	width: 90px;
	text-align: left;
	font-weight: bold;
}

.banana #userid, .banana #email, .banana #username, .banana #usernick,
	.banana #phone, .banana #sample6_postcode, .banana #sample6_address,
	.banana #sample6_detailAddress, .banana #sample6_extraAddress {
	width: 300px;
	height: 40px;
}

.banana #membershipperiod {
	width: 255px;
	height: 40px;
}

.banana input[type=text] {
	color: gray;
}

.banana input[type=text]:focus {
	outline: none;
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
			<div class="banana_title">
				<h2>내 프로필</h2>
			</div>
			<form name="joinForm" method="post" action="" onsubmit="">
				<table>
					<tr>
						<th><label for="userid">아이디</label></th>
						<td>
							<input type="text" name="userid" id="userid" value="${loginUser.userid}" readonly>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
					<tr>
						<th><label for="email">이메일</label></th>
						<td>
							<input type="text" name="email" id="email" value="${loginUser.email}" readonly>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th><label for="username">이름</label></th>
						<td>
							<input type="text" name="username" id="username" value="${loginUser.username}" readonly>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th><label for="usernick">닉네임</label></th>
						<td>
							<input type="text" name="usernick" id="usernick" value="${loginUser.usernick}" readonly>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th><label for="phone">전화번호</label></th>
						<td>
							<input type="text" name="phone" id="phone" value="${loginUser.phone}" readonly>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr class="zipcode_area">
						<th>우편번호</th>
						<td>
							<input type="text" name="zipcode" id="sample6_postcode" value="${loginUser.zipcode}" readonly>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr class="addr_area">
						<th>주소</th>
						<td>
							<input type="text" name="addr" id="sample6_address" value="${loginUser.addr}" readonly>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td>
							<input type="text" name="addrdetail" id="sample6_detailAddress" value="${loginUser.addrdetail}" readonly>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>참고항목</th>
						<td>
							<input type="text" name="addretc" id="sample6_extraAddress" value="${loginUser.addretc}" readonly>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>회원권</th>
						<td>
							<c:choose>
								<c:when test="${loginUser.duedate == null}">
									<input type="text" name="membershipperiod" id="membershipperiod" value="회원권을 구매해주세요" readonly>
									<input type="button" onclick="location.href = '${path}/payment/pay'" value="구매">
								</c:when>
								<c:otherwise>
									<input type="text" name="membershipperiod" id="membershipperiod" value="~ <fmt:formatDate value="${loginUser.duedate}" pattern="yyyy년 MM월 dd일"/>" readonly>
									<input type="button" onclick="location.href = '${path}/payment/pay'" value="갱신">
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 개발코드 끝 -->
	</section>
	<%@ include file="../include/footer.jsp"%>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
//	현재 페이지의 경로 이름을 반환하는 함수 선언
	var url = window.location.pathname;
	
//	side-bar 클래스 안에 있는 a태그를 찾고, for문 기능을 하는 each 함수를 통해 하나하나 순환
	$('.sidetab').find('a').each(function() {
		$(this).toggleClass('current', $(this).attr('href') == url);
	});
//	this 선택자를 통해 해당 객체를 선택 (a).
//	class 값을 넣었다 뺄 수 있는 toggleClass 선택
//	선택된 객체와 pathname이 같은 a태그의 href 속성을 선택, current라는 클래스를 토글시켜준다.
//	근데 왜 js파일을 따로 만들면 적용이 안 되는지... 잘못 사용하고 있는 부분 확인해보기.
</script>
</html>