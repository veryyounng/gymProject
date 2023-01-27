<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${path}/resources/css/styles.css" />
<link rel="stylesheet" href="${path}/resources/css/notistyle.css" />
<link rel="shortcut icon" href="${path}/resources/img/파비콘.png"
	type="image/x-icon">
<link rel="stylesheet" href="${path}/resources/css/pw_find.css" />
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
			<form action="id_find" method="post">
				<table id="idfindtable">
					<tr id="nameline">
						<th><label for="username" id="usernamefixed" >이름</label></th>
						<td><input type="text" name="username" id="usernametext" value="" autofocus></td>
					</tr>
					<tr id="emailline">
						<th><label for="useremail" id="useremailfixed">이메일 주소</label></th>
						<td><input type="text" name="useremail" id="useremailtext"
							onkeyup="pwcheck()"> @ <input class="text_box"
							id="domain-txt" type="text" /> <select class="select_box"
							id="domain-list">
								<option value="type">직접 입력</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="nate.com">nate.com</option>
								<option value="kakao.com">kakao.com</option>
						</select></td>
						<th><input type="button" value="인증번호 전송" id="certify_send"></th>
					</tr>
					<tr id="certify_line">
						<th><label for="certifynum" id="certify_num">인증번호</label></th>
						<td><input type="text" id="certify_num_text"></td>
					</tr>
					<tr class="pw_find_btn">
						<th colspan="5" id="submit_button"><input type="submit"
							value="비밀번호 찾기" id="submitbutton"></th>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script>
       // 도메인 직접 입력 or domain option 선택
	const domainListEl = document.querySelector('#domain-list')
	const domainInputEl = document.querySelector('#domain-txt')
		// select 옵션 변경 시
	domainListEl.addEventListener('change', (event) => {
  		// option에 있는 도메인 선택 시
  	if(event.target.value !== "type") {
    	// 선택한 도메인을 input에 입력하고 disabled
    domainInputEl.value = event.target.value
    domainInputEl.disabled = true
  	} else { // 직접 입력 시
    	// input 내용 초기화 & 입력 가능하도록 변경
    domainInputEl.value = ""
    domainInputEl.disabled = false
  	}
		})
   </script>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>