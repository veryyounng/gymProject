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
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css" />
<title>회원가입</title>
<link rel="stylesheet" href="${path}/resources/css/styles.css">
<style>
.banana {
	border: 1px solid black;
	margin: 0 auto;
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

.banana #userpw, .banana #userpw_re, .banana #username, .banana #usernick,
	.banana #sample6_address, .banana #sample6_detailAddress, .banana #sample6_extraAddress
	{
	width: 370px;
	height: 40px;
}

.banana #userphone, .banana #middle_num, .banana #last_num {
	width: 115px;
	height: 40px;
}

.banana #sample6_postcode {
	width: 269px;
	height: 40px;
}
</style>
</head>

<body>
	<%@ include file="../include/header.jsp"%>
	<section>
		<!-- 개발코드 시작 -->
		<div class="banana">
			<form name="joinForm" method="post"
				action="${path}/user/join_complete" onsubmit="return sendit()">
				<table>
					<tr>
						<th><input type="hidden" name="email" id="email"
							value="${email}"></th>
					</tr>
					<tr>
						<th><label for="userid">아이디</label></th>
						<td><input type="text" name="userid" id="userid"
							onfocusout="idcheck()"> <input type="button"
							id="useridcheck" value="중복검사"></td>
						<td><input type="hidden" name="checked_id" id="checked_id"
							value=""></td>
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
						<td><input type="password" name="userpw" id="userpw"
							onfocusout="pwcheck()"></td>
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
						<td><input type="password" name="userpw_re" id="userpw_re"
							onkeyup="re_pwcheck()"></td>
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
						<td><input type="text" name="username" id="username"
							onfocusout="namecheck()"></td>
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
						<td><input type="text" name="usernick" id="usernick"
							onfocusout="nickcheck()"></td>
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
						<td><select name="userphone" id="userphone">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="019">019</option>
						</select> - <input type="text" name="middle_num" id="middle_num"
							onfocusout="middle_phonecheck()"> - <input type="text"
							name="last_num" id="last_num" onfocusout="last_phonecheck()"></td>
						<td><input type="hidden" name="phone" id="phone"></td>
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
						<td><input type="text" name="zipcode" id="sample6_postcode"
							readonly onclick="sample6_execDaumPostcode()"> <input
							type="button" value="우편번호 찾기"
							onclick="sample6_execDaumPostcode()"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr class="addr_area">
						<th>주소</th>
						<td><input type="text" name="addr" id="sample6_address"
							readonly></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td><input type="text" name="addrdetail"
							id="sample6_detailAddress" onfocusout="detail_addrcheck()">
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
						<td><input type="text" name="addretc"
							id="sample6_extraAddress" readonly></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;"><input
							type="submit" value="가입 완료"> <input type="reset"
							value="초기화"></td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 개발코드 끝 -->
	</section>
	<%@ include file="../include/footer.jsp"%>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/resources/js/header.js"></script>
<script>
  let flag = true;
  $('#useridcheck').click(function fn_idchk() {
   $.ajax({
     url : "${path}/user/idchk",
     type : "post",
     data : {userid : $("#userid").val()},
     success : function(result) {
       if (result == 'success') {
       }
       else {
         flag = false;
         console.log(flag);
         document.getElementById("idcheck").setAttribute('style', 'color:red;');
         document.getElementById("idcheck").innerHTML = "중복된 아이디입니다!"
      }
     }
   });
  })
  
  $('#useridcheck').click(function checked_id () {
	  $('#checked_id').val('Y');
  })
  
  function idcheck() {
    flag = true;
    const userid = document.joinForm.userid;
    const check_id = document.joinForm.checked_id;
    const korean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
    const number = /[0-9]/;
    var idReg = /^[A-za-z0-9]/g;
    
    if (flag) {
       if (userid.value == "") {
         document.getElementById("idcheck").setAttribute('style', 'color:red;');
         document.getElementById("idcheck").innerHTML = "아이디를 입력해주세요!"
       }
       else if (userid.value.length < 4 || userid.value.length > 16) {
         document.getElementById("idcheck").setAttribute('style', 'color:red;');
         document.getElementById("idcheck").innerHTML = "아이디는 4자 이상, 16자 이하로 입력해주세요!"
       }
       else if (korean.test(userid.value)) {
         document.getElementById("idcheck").setAttribute('style', 'color:red;');
         document.getElementById("idcheck").innerHTML = "아이디에는 영어와 숫자만 입력해주세요!"
       }
       else if (!idReg.test(userid.value)) {
         document.getElementById("idcheck").setAttribute('style', 'color:red;');
         document.getElementById("idcheck").innerHTML = "숫자만 입력할 수는 없습니다!"
       }
       else if (check_id.value != 'Y') {
         document.getElementById("idcheck").setAttribute('style', 'color:red;');
         document.getElementById("idcheck").innerHTML = "중복체크를 진행해주세요!"
       }
       else {
    	 document.getElementById("idcheck").setAttribute('style', 'color:green;');
         document.getElementById("idcheck").innerHTML = "사용 가능한 아이디입니다!"
       }
    }
  }
  
  function pwcheck() {
    const userpw = document.joinForm.userpw;
    const englisha = /[a-z]/;
    const special = /[~!@#$%^&*]/;
    const number = /[0-9]/;
    
    if (userpw.value == "") {
      document.getElementById("pwcheck").setAttribute('style', 'color: red;');
      document.getElementById("pwcheck").innerHTML = "비밀번호를 입력해주세요!"
    }
    else if (userpw.value.length < 8 || userpw.value.length > 20) {
      document.getElementById("pwcheck").setAttribute('style', 'color: red;');
      document.getElementById("pwcheck").innerHTML = "비밀번호는 8자 이상, 20자 이하로 입력해주세요!"
    }
    else if (!englisha.test(userpw.value) || !special.test(userpw.value) || !number.test(userpw.value)) {
      document.getElementById("pwcheck").setAttribute('style', 'color: red;');
      document.getElementById("pwcheck").innerHTML = "비밀번호는 알파벳 소문자, 숫자, 특수문자가 포함돼야 합니다!"
    }
    else {
      document.getElementById("pwcheck").setAttribute('style', 'color:green;');
      document.getElementById("pwcheck").innerHTML = "입력이 완료됐습니다!"
    }
  }

  function re_pwcheck() {
    const userpw = document.joinForm.userpw;
    const userpw_re = document.joinForm.userpw_re;
    
    if (userpw.value != userpw_re.value) {
      document.getElementById("re_pwcheck").setAttribute('style', 'color: red;');
      document.getElementById("re_pwcheck").innerHTML = "이런, 오타를 내셨군요!"
    }
    else {
      if (userpw.value == "") {}
      else {
          document.getElementById("re_pwcheck").setAttribute('style', 'color: green;');
          document.getElementById("re_pwcheck").innerHTML = "비밀번호가 확인되었어요!"
        }
      }
  }

  function namecheck() {
    const username = document.joinForm.username;
    const korean = /^[가-힣]+$/;

    if (username.value == "") {
      document.getElementById("namecheck").setAttribute('style', 'color: red;');
      document.getElementById("namecheck").innerHTML = "이름을 입력해주세요!"
    }
    else if (!korean.test(username.value)) {
      document.getElementById("namecheck").setAttribute('style', 'color: red;');
      document.getElementById("namecheck").innerHTML = "오타가 없는지 확인해주세요!"
    }
    else {
      document.getElementById("namecheck").setAttribute('style', 'color: green;');
      document.getElementById("namecheck").innerHTML = "입력이 완료됐습니다!"
    }
  }

  function nickcheck() {
    const usernick = document.joinForm.usernick;

    if (usernick.value == "") {
      document.getElementById("nickcheck").setAttribute('style', 'color: red;');
      document.getElementById("nickcheck").innerHTML = "닉네임을 입력해주세요!"
    }
    else if (usernick.value.length > 10) {
      document.getElementById("nickcheck").setAttribute('style', 'color: red;');
      document.getElementById("nickcheck").innerHTML = "닉네임은 10자 이하로 입력해주세요!"
    }
    else {
      document.getElementById("nickcheck").setAttribute('style', 'color: green;');
      document.getElementById("nickcheck").innerHTML = "입력이 완료됐습니다!"
    }
  }
  
  function middle_phonecheck() {
    const middle_num = document.joinForm.middle_num;
    const last_num = document.joinForm.last_num;
    const number = /[0-9]/;
    if (middle_num.value == "") {
      document.getElementById("phonecheck").setAttribute('style', 'color: red;');
      document.getElementById("phonecheck").innerHTML = "전화번호를 입력해주세요!"
    }
    else if (!number.test(middle_num.value)) {
      document.getElementById("phonecheck").setAttribute('style', 'color: red;');
      document.getElementById("phonecheck").innerHTML = "전화번호에는 숫자만 입력해주세요!"
    }
    else {
      last_num.focus();
    }
  }
  
  function last_phonecheck() {
    const last_num = document.joinForm.last_num;
    const number = /[0-9]/;
    if (last_num.value == "") {
      document.getElementById("phonecheck").setAttribute('style', 'color: red;');
      document.getElementById("phonecheck").innerHTML = "전화번호를 입력해주세요!"
    }
    else if (!number.test(last_num.value)) {
      document.getElementById("phonecheck").setAttribute('style', 'color: red;');
      document.getElementById("phonecheck").innerHTML = "전화번호에는 숫자만 입력해주세요!"
    }
    else {
      document.getElementById("phonecheck").setAttribute('style', 'color: green;');
      document.getElementById("phonecheck").innerHTML = "입력이 완료됐습니다!"
    }
  }
  
  function detail_addrcheck() {
    const zipcode = document.joinForm.zipcode;
    const addrdetail = document.joinForm.addrdetail;
    
    if (!zipcode.value == "" && addrdetail.value == "") {
      document.getElementById("detail_addrcheck").setAttribute('style', 'color: red;');
      document.getElementById("detail_addrcheck").innerHTML = "상세주소를 입력해주세요!"
    }
    else if (!zipcode.value == "" && !addrdetail.value == "") {
      document.getElementById("detail_addrcheck").innerHTML = ""
    }
  }

  function sendit() {
    const joinform = document.joinForm;
    const korean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
    const koreana = /^[가-힣]+$/;
    const englisha = /[a-z]/;
    const special = /[~!@#$%^&*]/;
    const number = /[0-9]/;
    var idReg = /^[A-za-z0-9]/g;

    const userid = joinform.userid;
    const check_id = document.joinForm.checked_id;
    if (userid.value == "") {
      alert("아이디를 입력해주세요!");
      userid.focus();
      return false;
    }
    if (userid.value.length < 4 || userid.value.length > 16) {
      alert("아이디는 4자 이상, 16자 이하로 입력하세요!");
      userid.focus();
      return false;
    }
    if (korean.test(userid.value)) {
      alert("아이디에는 영어와 숫자만 입력해주세요!");
      userid.focus();
      return false;
    }
    if (!idReg.test(userid.value)) {
      alert("숫자만 입력할 수는 없습니다!");
      userid.focus();
      return false;
    }
    if (check_id.value != 'Y') {
       alert("중복체크를 진행해주세요!");
       userid.focus();
       return false;
    }

    const userpw = joinform.userpw;
    const userpw_re = joinform.userpw_re;
    if (userpw.value == "") {
      alert("비밀번호를 입력하세요!");
      userpw.focus();
      return false;
    }
    if (userpw.value.length < 8 || userpw.value.length > 20) {
      alert("비밀번호는 8자 이상, 20자 이하로 입력하세요!");
      userpw.focus();
      return false;
    }
    if (!englisha.test(userpw.value) || !special.test(userpw.value) || !number.test(userpw.value)) {
      alert("비밀번호는 영어(소문자), 숫자, 특수문자가 포함돼야 합니다!");
      userpw.focus();
      return false;
    }
    if (userpw_re.value == "") {
      alert("비밀번호를 확인해주세요!");
      userpw_re.focus();
      return false;
    }
    if (userpw.value != userpw_re.value) {
      alert("비밀번호를 확인해주세요!");
      userpw_re.focus();
      return false;
    }

    const username = joinform.username;
    if (username.value == "") {
      alert("이름을 입력하세요!");
      username.focus();
      return false;
    }
    if (!koreana.test(username.value)) {
      alert("오타가 없는지 확인해주세요!");
      username.focus();
      return false;
    }

    const usernick = joinform.usernick;
    if (usernick.value == "") {
      alert("닉네임을 입력해주세요!");
      usernick.focus();
      return false;
    }
    if (usernick.value.length > 10) {
      alert("닉네임은 10자 이하로 입력해주세요!");
      usernick.focus();
      return false;
    }
    
    const middle = joinform.middle_num;
    const last = joinform.last_num;
    if (middle.value == "") {
    	alert("전화번호를 입력해주세요!");
    	middle.focus();
    	return false;
    }
    if (last.value == "") {
    	alert("전화번호를 입력해주세요!");
    	last.focus();
    	return false;
    }
    if (!number.test(middle.value) || !number.test(last.value)) {
    	alert("전화번호에는 숫자만 입력해주세요!");
    	middle.focus();
    	return false;
    }

    const zipcode = joinform.zipcode;
    const addrdetail = joinform.addrdetail;
    if (!zipcode.value == "" && addrdetail.value == "") {
      alert("상세주소를 입력해주세요!");
      addrdetail.focus();
      return false;
    }

    return true;
  }

  function sample6_execDaumPostcode() {
    new daum.Postcode({
      oncomplete: function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var addr = ''; // 주소 변수
        var extraAddr = ''; // 참고항목 변수

        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
          addr = data.roadAddress;
        }
        else { // 사용자가 지번 주소를 선택했을 경우(J)
          addr = data.jibunAddress;
        }

        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
        if(data.userSelectedType === 'R'){
          // 법정동명이 있을 경우 추가한다. (법정리는 제외)
          // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
          if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
            extraAddr += data.bname;
          }
          // 건물명이 있고, 공동주택일 경우 추가한다.
          if(data.buildingName !== '' && data.apartment === 'Y'){
            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
          }
          // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
          if(extraAddr !== ''){
            extraAddr = ' (' + extraAddr + ')';
          }
          // 조합된 참고항목을 해당 필드에 넣는다.
          document.getElementById("sample6_extraAddress").value = extraAddr;
            
        }
        else {
          document.getElementById("sample6_extraAddress").value = '';
        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.getElementById('sample6_postcode').value = data.zonecode;
        document.getElementById("sample6_address").value = addr;
        // 커서를 상세주소 필드로 이동한다.
        document.getElementById("sample6_detailAddress").focus();
      }
    }).open();
  }
  
//   번호 가져오기
   $("#userphone").blur(function(){
      phone_num();   
   });
   
   $("#middle_num").blur(function(){
      phone_num();
   });
   
   $("#last_num").blur(function() {
      phone_num();
   });

   function phone_num() {
      const first = $("#userphone").val();
      const middle = $("#middle_num").val();
      const last = $("#last_num").val();
      
      if(first != "" && middle != "" && last != "") {
         $("#phone").val(first+middle+last);
      }
   };
</script>
</html>