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
<link rel="stylesheet" href="${path}/resources/css/message.css">
<link rel="stylesheet" href="${path}/resources/css/msgwrite.css">
<link rel="stylesheet" href="${path}/resources/css/msgview.css">

</head>
<section>

	<div class="letterbox">
		<div class="title">
			<div class="material-symbols-outlined">mail</div>
			<div class="title_sub">내 쪽지함</div>
		</div>
		<div class="view" style="background-color: #6bc1ae;">> 보낸 쪽지 읽기</div>

		<div class="msgbox">
			<div class="input sendbox">보낸 사람 : ${result.sender}</div>
			<div class="input">
				받은 날짜 : <span><fmt:formatDate value="${result.time}"
						pattern="yy-MM-dd HH:mm" /> </span>
			</div>
			<div class="msgtitle">제목 : ${result.title}</div>
			<div class="msgcontents">${result.contents}</div>
		</div>
		<div class="btns">
			<form id="delete" method="post" action="${path}/msg/msgSentOneDelete">
			<input type="hidden" name="msg_num" value="${result.msg_num}">
				<input class="btn btn_delete" type="submit" value="삭제" onclick="return delete_check();">
			</form>
			<input class="btn btn_back" type="button" value="뒤로가기" onclick="location.href='/msg/msgsend?num=${select}'" />
		</div>
	</div>


</section>



</body>

</html>