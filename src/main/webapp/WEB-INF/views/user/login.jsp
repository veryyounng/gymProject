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
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

</head>

<script type="text/javascript">
	
	
	
	function check(){
		let userid = $("#useridtext");
		let userpw = $("#userpwtext");
		if(userid.val() == ""){
			alert("아이디를 입력하세요.");
			userid.focus();
			return false;
		}
		if(userpw.val() == ""){
			alert("비밀번호를 입력하세요.");
			userpw.focus();
			return false;
		}
			return true;
	}
	
</script>

<body>
	<%@ include file="../include/header.jsp"%>
	
	<div class="container">
		<div class="logo">
			<div class="logo_medal"></div>
			<div class="logo_img"></div>
		</div>
		<form method="post" action="${path}/user/login" name="login_form" id="login_form">
			<table id="logintable">
				<tr>
					<td id="result" colspan="2"></td>
				</tr>
				<tr id="idline">
					<th><label for="userid" id="useridfixed">아이디</label></th>
					<td><input type="text" name="userid" id="useridtext"
						placeholder="아이디를 입력하세요." value= "" autofocus></td>
				</tr>

				<tr id="pwline">
					<th><label for="userpw" id="userpwfixed">비밀번호</label></th>
					<td><input type="password" name="userpw" id="userpwtext"
						 placeholder="비밀번호를 입력하세요." value= ""></td>
				</tr>
				<tr>
					<th colspan="2" id="login_button"><input type="submit"
						value="로그인" id="loginbutton" onclick="return check();"></th>
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