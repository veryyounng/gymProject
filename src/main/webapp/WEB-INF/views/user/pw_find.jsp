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
			<form action="${path}/user/changePW_view" method="post" class="pwfindform" >
				<table id="idfindtable">
					<tr id="nameline">
						<th><label for="username1" id="usernamefixed" >아이디</label></th>
						<td><input type="text" name="username" id="usernametext" value="" autofocus></td>
					</tr>
					<tr id="emailline">
						<th><label for="useremail1" id="useremailfixed">이메일 주소</label></th>
						<td><input type="text" id="useremailtext"> @ <input class="text_box"
							id="domain-txt" type="text" /> <select class="select_box"
							id="domain-list">
								<option value="type">직접 입력</option>
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="nate.com">nate.com</option>
								<option value="kakao.com">kakao.com</option>
						</select></td>
						<th><input type= "button" value="인증번호 전송" id="certify_send"></th>
					</tr>
					<tr id="certify_line">
						<th><label for="certifynum" id="certify_num">인증번호</label></th>
						<td><input type="text" id="certify_num_text"></td>
					</tr>
					<tr class="pw_find_btn">
						<th colspan="5" id="submit_button"><button id="submitbutton" onclick="return changepwfunc();">비밀번호 변경</button></th>
					</tr>
				</table>
				</form>

		</div>
	</div>
	<script>
    // 도메인 직접 입력 or domain option 선택
    let snum = null;
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

	$('#certify_send').click(function(){
		const id = $('#usernametext').val();
		const email =$('#useremailtext').val() + '@' + $('#domain-txt').val();
		
		console.log(id);
		console.log(email);
		$.ajax({
			url: 'findpw',
			type: 'POST',
			data: {"userid": id,
					"email": email},
			dataType: "text",
			success: function(result){
				console.log("ajax 성공");
				if(result == null){
					alert('가입되지 않은 이메일입니다.');
				}else{
					console.log(result);
					alert("인증번호를 전송했습니다.");
					snum = result;
				}
			},
			error: function(request, error){
	        	alert('정보를 다시 입력해주시길 바랍니다.' );
	        }
		})
	});
	
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	   // 인증번호 비교 
		   function changepwfunc(){
	    	  //문서가 준비되면 매개변수로 넣은 콜백 함수를 실행하라
	         console.log(snum);
	         console.log($('#certify_num_text').val());
	         if ($('#certify_num_text').val() != snum) {
	            alert('인증번호가 일치하지 않습니다! 다시 확인해주세요!.');
	            $('#certify_num_text').focus();
	            console.log("인증번호 실패");
	            return false;
	         }else{
	         console.log("인증번호 성공");
	         $(".pwfindform").submit();
	         }
	      };
	
   </script>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>