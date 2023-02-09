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
	top: -70px;
}

.banana {
	border: 1px solid black;
	height: 100%;
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

.banana #userid, .banana #email, .banana #username, .banana #usernick,
	.banana #sample6_address, .banana #phone, .banana #sample6_detailAddress,
	.banana #sample6_extraAddress {
	width: 300px;
	height: 40px;
}

.banana #sample6_postcode {
	width: 195px;
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
			<form name="joinForm" method="post" action="${path}/profile/profile_modify">
				<table>
					<tr>
						<th><label for="userid">아이디</label></th>
						<td>
							<input type="text" name="userid" id="userid" value="${loginUser.userid}" readonly style="color: gray;">
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th><label for="email">이메일</label></th>
						<td>
							<input type="text" name="email" id="email" value="${loginUser.email}" readonly style="color: gray;">
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
							<input type="text" name="username" id="username" value="${loginUser.username}" readonly style="color: gray">
						</td>
					</tr>
					<tr>
						<td></td>
						<td><span id="namecheck">&nbsp;</span></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th><label for="usernick">닉네임</label></th>
						<td>
							<input type="text" name="usernick" id="usernick" value="${loginUser.usernick}">
						</td>
					</tr>
					<tr>
						<td></td>
						<td><span id="nickcheck">&nbsp;</span></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th><label for="phone">전화번호</label></th>
						<td>
							<input type="text" name="phone" id="phone" value="${loginUser.phone}">
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
							<input type="button" id="postcode_btn" value="우편번호 찾기">
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
							<input type="text" name="addrdetail" id="sample6_detailAddress"value="${loginUser.addrdetail}">
						</td>
					</tr>
					<tr>
						<td></td>
						<td><span id="detail_addrcheck"></span></td>
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
						<td colspan="2" style="text-align: center;">
							<input type="submit" value="수정 완료">
							<input type="reset" value="초기화">
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
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/resources/js/join.js"></script>
<script>
	var url = window.location.pathname;
	
	$('.sidetab').find('a').each(function() {
		$(this).toggleClass('current', $(this).attr('href') == url);
	});
</script>
</html>