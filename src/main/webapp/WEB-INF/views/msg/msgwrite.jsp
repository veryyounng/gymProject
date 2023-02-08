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
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
	function goBack() {
		window.history.back();
	}
	
	function check(){
		let msgtitle = $("#msgtitle");
		let msgcontents = $("#msgcontents");
		let receiver = $("#receiver");
		
		if(receiver.val() == ""){
			alert("받는사람을 입력하세요.");
			receiver.focus();
			return false;
		}
		if(msgtitle.val() == ""){
			alert("제목을 입력하세요.");
			msgtitle.focus();
			return false;
		}
		if(msgcontents.val() == ""){
			alert("내용을 입력하세요.");
			msgcontents.focus();
			return false;
		}
			return true;
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
			<div class="send">> 쪽지 보내기</div>

			<form id="sendmsg" method="post" action="${path}/msg/send">
				<div class="msgbox">
					<div class="input sendbox">
						보내는 사람 : <span>${loginUser.userid}</span>
					</div>
					<div class="input">
						받는사람 : <input type="text" class="input-receive"
							placeholder="아이디를 입력하세요" value="${receiver}" name="receiver" id="receiver">
					</div>
					<div class="msgtitle">
						<input type="text" placeholder="제목을 입력하세요." id="msgtitle"
							name="title">
					</div>
					<div class="msgcontents">
						<textarea placeholder="내용을 입력하세요." style="resize: none;"
							id="msgcontents" name="contents"></textarea>
					</div>
				</div>
				<div class="btns">
					<input class="btn btn_send" type="submit" value="보내기" onclick= "return check();">
			<input class="btn btn_back" type="button" value="뒤로가기"
				onclick="return goBack()" />
				</div>
			</form>

		</div>
	</section>
</body>
</html>