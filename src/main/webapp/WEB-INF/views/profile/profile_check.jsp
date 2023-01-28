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
<link rel="stylesheet" href="${path}/resources/css/styles.css">
<style>
.side-bar {
	position: relative;
	top: -155px;
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
	.banana #phone, .banana #sample6_postcode, .banana #sample6_address,
	.banana #sample6_detailAddress, .banana #sample6_extraAddress {
	width: 300px;
	height: 40px;
}

.banana #membershipperiod {
	width: 217px;
	height: 40px;
}

.banana input[type=text] {
	color: gray;
}

.banana input[type=text]:focus {
	outline: none;
}
</style>
</head>

<body>
	<%@ include file="../include/header.jsp"%>
	<section>
		<%@ include file="../include/profile_sidebar.jsp"%>
		<!-- 개발코드 시작 -->
		<div class="banana">
			<form name="joinForm" method="post" action="" onsubmit="">
				<table>
					<tr>
						<th><label for="userid">아이디</label></th>
						<td><input type="text" name="userid" id="userid"
							value="${loginUser.userid}" readonly></td>
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
						<td><input type="text" name="email" id="email"
							value="${loginUser.email}" readonly></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th><label for="username">이름</label></th>
						<td><input type="text" name="username" id="username"
							value="${loginUser.username}" readonly></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th><label for="usernick">닉네임</label></th>
						<td><input type="text" name="usernick" id="usernick"
							value="${loginUser.usernick}" readonly></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th><label for="phone">전화번호</label></th>
						<td><input type="text" name="phone" id="phone"
							value="${loginUser.phone}" readonly></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr class="zipcode_area">
						<th>우편번호</th>
						<td><input type="text" name="zipcode" id="sample6_postcode"
							value="${loginUser.zipcode}" readonly></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr class="addr_area">
						<th>주소</th>
						<td><input type="text" name="addr" id="sample6_address"
							value="${loginUser.addr}" readonly></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td><input type="text" name="addrdetail"
							id="sample6_detailAddress" value="${loginUser.addrdetail}"
							readonly></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>참고항목</th>
						<td><input type="text" name="addretc"
							id="sample6_extraAddress" value="${loginUser.addretc}" readonly></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>회원권</th>
						<td><input type="text" name="membershipperiod"
							id="membershipperiod" value="" readonly> <input
							type="button" value="구매(갱신)"></td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 개발코드 끝 -->
	</section>
	<%@ include file="../include/footer.jsp"%>
</body>
<script src="${path}/resources/js/header.js"></script>
</html>