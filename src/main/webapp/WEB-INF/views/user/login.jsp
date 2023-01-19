<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<link rel="stylesheet" href="${path}/resources/css/login.css" />
<link rel="stylesheet" href="${path}/resources/css/reset.css" />
<link rel="stylesheet" href="${path}/resources/css/styles.css" />

</head>
<body>
	<%@ include file="../include/header.jsp"%>
	
	<div class="container">
		<div class="logo">
			<div class="logo_medal"></div>
			<div class="logo_img"></div>
		</div>
		<form method="post" action="${path}/user/login">
			<table id="logintable">
				<tr>
					<td id="result" colspan="2"></td>
				</tr>
				<tr id="idline">
					<th><label for="userid" id="useridfixed">아이디</label></th>
					<td><input type="text" name="userid" id="useridtext"
						placeholder="아이디를 입력하세요."></td>
				</tr>

				<tr id="pwline">
					<th><label for="userpw" id="userpwfixed">비밀번호</label></th>
					<td><input type="password" name="userpw" id="userpwtext"
						onkeyup="pwcheck()" placeholder="비밀번호를 입력하세요."></td>
				</tr>
				<tr>
					<th colspan="2" id="login_button"><a href="/login/login"><input type="submit"
						value="로그인" id="loginbutton"></a></th>
				</tr>
			</table>
		</form>

		<div class="etcbtn">
			<a href="${path}/user/id_find"> 아이디 찾기 | </a> <a href="${path}/user/pw_find"> 비밀번호
				찾기 | </a> <a href="${path}/user/join"> 회원가입 </a>
		</div>

	</div>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>