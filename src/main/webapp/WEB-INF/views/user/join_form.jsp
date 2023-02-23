<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="./main_logo.gif" type="image/x-icon">
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
<title>회원가입</title>
<link rel="stylesheet" href="${path}/resources/css/styles.css">
<style>
.banana {
	margin: 0 auto;
	margin-top: 50px;
	margin-bottom: 100px;
	display: flex;
	align-items: center;
}

.banana form {
	margin: 0 auto;
}

.banana table th {
	width: 120px;
}

.banana #userid {
	width: 298.5px;
	height: 40px;
}

.banana #userid, .banana #userpw, .banana #userpw_re, .banana #username, .banana #usernick,
	.banana #sample6_address, .banana #sample6_detailAddress, .banana #sample6_extraAddress {
	width: 370px;
	height: 40px;
}

.banana #userphone, .banana #middle_num, .banana #last_num {
	width: 115px;
	height: 40px;
}

.banana #sample6_postcode {
	width: 267px;
	height: 40px;
}
</style>
</head>

<body>
	<%@ include file="../include/header.jsp"%>
	<section>
		<!-- 개발코드 시작 -->
		<div class="banana">
			<form name="joinForm" id="joinForm" method="post" action="${path}/user/join_complete" onsubmit="return sendit()">
				<table>
					<tr>
						<th><input type="hidden" name="email" id="email" value="${email}"></th>
					</tr>
					<tr>
						<th><label for="userid">아이디</label></th>
						<td>
							<input type="text" name="userid" id="userid">
							<input type="hidden" name="userid_chkpoint" id="userid_chkpoint">
						</td>
					</tr>
					<tr>
						<td></td>
						<td><span id="idcheck">&nbsp;</span></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th><label for="userpw">비밀번호</label></th>
						<td>
							<input type="password" name="userpw" id="userpw">
						</td>
					</tr>
					<tr>
						<td></td>
						<td><span id="pwcheck">&nbsp;</span></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th><label for="userpw_re">비밀번호 확인</label></th>
						<td><input type="password" name="userpw_re" id="userpw_re">
						</td>
					</tr>
					<tr>
						<td></td>
						<td><span id="re_pwcheck">&nbsp;</span></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th><label for="username">이름</label></th>
						<td>
							<input type="text" name="username" id="username">
						</td>
					</tr>
					<tr>
						<td></td>
						<td><span id="namecheck">&nbsp;</span></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th><label for="usernick">닉네임</label></th>
						<td>
							<input type="text" name="usernick" id="usernick">
						</td>
					</tr>
					<tr>
						<td></td>
						<td><span id="nickcheck">&nbsp;</span></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th><label for="userphone">전화번호</label></th>
						<td>
							<select name="userphone" id="userphone">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="019">019</option>
							</select>
							- <input type="text" name="middle_num" id="middle_num">
						 	- <input type="text" name="last_num" id="last_num">
						</td>
						<td>
							<input type="hidden" name="phone" id="phone">
						</td>
					</tr>
					<tr>
						<td></td>
						<td><span id="phonecheck">&nbsp;</span></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr class="zipcode_area">
						<th>우편번호</th>
						<td>
							<input type="text" name="zipcode" id="sample6_postcode" readonly>
							<input type="button" id="postcode_btn" value="우편번호 찾기">
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr class="addr_area">
						<th>주소</th>
						<td>
							<input type="text" name="addr" id="sample6_address" readonly>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td>
							<input type="text" name="addrdetail" id="sample6_detailAddress">
						</td>
					</tr>
					<tr>
						<td></td>
						<td><span id="detail_addrcheck"></span></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>참고항목</th>
						<td>
							<input type="text" name="addretc" id="sample6_extraAddress" readonly>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<input type="submit" value="가입 완료">
							<input type="reset" value="초기화">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 개발코드 끝 -->
	</section>
	<%@ include file="../include/footer.jsp"%>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/resources/js/join.js"></script>
<script>
//	id 중복체크
	$('#userid').focusout(function() {
		$.ajax({
			url : "${path}/user/idchk",
			type : "post",
			data : {userid : $("#userid").val()},
			success : function(result) {
				$('#userid_chkpoint').val('Y');
				if (result == 'success') {
					if ($('#userid').val().length < 4 || $('#userid').val().length > 16) {
						$('#idcheck').attr('style', "color:red;");
						$('#idcheck').text('아이디는 4자 이상, 16자 이하로 입력해주세요!');
					}
					else if (!idReg.test($('#userid').val())) {
						$('#idcheck').attr('style', "color:red;");
						$('#idcheck').text('아이디에는 영어와 숫자가 포함되어야 합니다!');
					}
					else {
						$('#idcheck').attr('style', "color:green;");
						$('#idcheck').text('사용 가능한 아이디입니다!');
					}
				}
				else {
					$('#userid_chkpoint').val('');
					if ($('#userid').val() == 'admin') {
						$('#idcheck').attr('style', "color:red;");
						$('#idcheck').text('이 아이디는 사용할 수 없는 아이디입니다!');
					}
					else {
						$('#idcheck').attr('style', "color:red;");
						$('#idcheck').text('중복된 아이디입니다!');
					}
			 	}
			}
		});
	})
	
//   번호 가져오기
   $("#userphone").blur(function(){
      phone_number();   
   });
   
   $("#middle_num").blur(function(){
      phone_number();
   });
   
   $("#last_num").blur(function() {
      phone_number();
   });

   function phone_number() {
      const first = $("#userphone").val();
      const middle = $("#middle_num").val();
      const last = $("#last_num").val();
      
      if(first != "" && middle != "" && last != "") {
         $("#phone").val(first+middle+last);
      }
   };
</script>
</html>