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
<link rel="stylesheet" href="${path}/resources/css/message.css" />
<link rel="stylesheet" href="${path}/resources/css/msgwrite.css" />
<link rel="stylesheet" href="${path}/resources/css/msgview.css" />
<script>
	function delete_check() {
		if (confirm("정말로 삭제하시겠습니까?")) {
			return true;
		} else {
			return false;
		}
	}
</script>
</head>

<body>
	<section>

		<div class="letterbox">
			<div class="title">
				<div class="material-symbols-outlined">mail</div>
				<div class="title_sub">내 쪽지함</div>
			</div>
			<div class="view">> 쪽지 읽기</div>

			<div class="msgbox">
				<div class="input sendbox">보낸 사람 : ${result.sender}</div>
				<div class="input">
					받은 날짜 :
					<span><fmt:formatDate value="${result.time}" pattern="yy-MM-dd HH:mm" />
					</span>
				</div>
				<div class="msgtitle">제목 : ${result.title}</div>
				<div class="msgcontents">${result.contents}</div>
			</div>
			<div class="btns">
				<form id="sendmsg" method="post" action="${path}/msg/msgwrite">
					<input type="hidden" name="receiver" value="${result.sender}"/>
					<input class="btn btn_answer" type="submit" value="답장" />
				</form>
				<form id="delete" method="post" action="${path}/msg/msgOneDelete">
					<input type="hidden" name="msg_num" value="${result.msg_num}">
					<input class="btn btn_delete" type="submit" value="삭제" onclick="return delete_check();">
				</form>
				<input class="btn btn_back" type="button" value="뒤로가기" onclick="location.href='/msg/msgmain?num=${select}'">
			</div>
		</div>
	</section>



</body>

</html>