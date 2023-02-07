<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 쪽지함</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="${path}/resource/css/message.css">
<link rel="stylesheet" href="${path}]/resource/css/msgwrite.css">
<script defer src="${path}/resource/js/message.js"></script>
</head>

<body>
	<section>

		<div class="letterbox">
			<div class="title">
				<div class="material-symbols-outlined">mail</div>
				<div class="title_sub">내 쪽지함</div>
			</div>
			<div class="send">> 쪽지 보내기</div>

				<form id="sendmsg" method="post" action="">
			<div class="msgbox">
				<div class="input sendbox">보내는 사람 : <span name="sender">${loginUser.userid}</span></div>
				<div class="input">
					받는사람 : <input type="text" class="input-receive"
						placeholder="아이디를 입력하세요">
				</div>
				<div class="msgtitle">
					<input type="text" placeholder="제목을 입력하세요." id="msgtitle">
				</div>
				<div class="msgcontents">
					<textarea placeholder="내용을 입력하세요." style="resize: none;"
						id="msgcontents"></textarea>
				</div>
			</div>
			<div class="btns">
					<input class="btn btn_delete" type="submit" value="보내기" onclick="">
			</div>
				</form>
		</div>
	</section>



</body>

</html>