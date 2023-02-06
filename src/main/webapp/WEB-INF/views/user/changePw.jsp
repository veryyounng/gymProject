<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${path}/resources/css/styles.css" />
<link rel="stylesheet" href="${path}/resources/css/notistyle.css" />
<link rel="shortcut icon" href="${path}/resources/img/파비콘.png"
	type="image/x-icon">
<link rel="stylesheet" href="${path}/resources/css/pw_find.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>
<script type="text/javascript">
	
</script>
<body>
	<%@ include file="../include/header.jsp"%>
	<div class="container">
		<div class="pwfind_body">
			<div class="find_img">
				<div class="logo_medal"></div>
           		<div class="logo_img"></div>
			</div>
			<form action="${path}/user/login" method="post" class="pwfindform">
				<table id="idfindtable">
					<tr id="nameline">
						<th><label for="username1" id="usernamefixed" >새 비밀번호</label></th>
						<td><input type="text" name="username" id="usernametext" value="" autofocus></td>
					</tr>
					
					<tr id="certify_line">
						<th><label for="certifynum" id="certify_num">비밀번호 확인</label></th>
						<td><input type="text" id="certify_num_text"></td>
					</tr>
					<tr class="pw_find_btn">
						<th colspan="5" id="submit_button"><button id="submitbutton" onclick="return changepwfunc();">비밀번호 변경</button></th>
					</tr>
				</table>
				</form>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
	</body>
	</html>