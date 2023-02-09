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

<body>
	<%@ include file="../include/header.jsp"%>
	<div class="container">
		<div class="pwfind_body">
			<div class="find_img">
				<div class="logo_medal"></div>
           		<div class="logo_img"></div>
			</div> 
			<form action="${path}/user/changePW" method="post" class="pwfindform" name="pwfindform" onsubmit="return sendit();">
				<table id="idfindtable">
					<tr>
						<td><input type="hidden" name="userid" id="userid"
							value="${userid}"></td>
					</tr>
					
					<tr id="nameline">
						<th><label for="username1" id="usernamefixed" >새 비밀번호</label></th>
						<td><input type="password" name="userpw" id="usernametext" value="" autofocus></td>
					</tr>
					
					<tr id="certify_line">
						<th><label for="certifynum" id="certify_num">비밀번호 확인</label></th>
						<td><input type="password" id="certify_num_text" name= "userpw_re"></td>
					</tr>
					<tr class="pw_find_btn">
						<th colspan="5" id="submit_button"><button id="submitbutton">비밀번호 변경</button></th>
					</tr>
				</table>
				</form>
		</div>
	</div>
	<%@ include file="../include/footer.jsp"%>
	</body>
	<script type="text/javascript">
		function sendit(){
			const changePwForm = document.pwfindform;
			const userpw = $("#usernametext").val();
			const userpw_re = $("#certify_num_text").val();
			const englisha = /[a-z]/;
		    const special = /[~!@#$%^&*]/;
		    const number = /[0-9]/;
		    
		    if (userpw == "") {
		        alert("새로운 비밀번호를 입력해주세요!");
		        userpw_re.focus();
		        return false;
		      }
		      if (userpw.length < 8 || userpw_re.length > 20) {
		        alert("비밀번호는 8자 이상, 20자 이하로 입력하세요!");
		        userpw_re.focus();
		        return false;
		      }
		      if (!englisha.test(userpw) || !special.test(userpw) || !number.test(userpw)) {
		        alert("비밀번호는 영어(소문자), 숫자, 특수문자가 포함돼야 합니다!");
		        userpw_re.focus();
		        return false;
		      }
		      if (userpw_re == "") {
		        alert("비밀번호 확인을를 입력해주세요!");
		        userpw_recheck.focus();
		        return false;
		      }
		      if (userpw_re.length < 8 || userpw_re.length > 20) {
		        alert("비밀번호는 8자 이상, 20자 이하로 입력하세요!");
		        userpw_recheck.focus();
		        return false;
		      }
		      if (!englisha.test(userpw_re) || !special.test(userpw_re) || !number.test(userpw_re)) {
		        alert("비밀번호는 영어(소문자), 숫자, 특수문자가 포함돼야 합니다!");
		        userpw_recheck.focus();
		        return false;
		      }
		      if (userpw != userpw_re) {
		        alert("새로운 비밀번호가 일치하지 않습니다!");
		        userpw_re.focus();
		        return false;
		      }
				//alert("비밀번호가 변경되었습니다.");
		      	$(".pwfindform").submit();
		}
	</script>
	</html>