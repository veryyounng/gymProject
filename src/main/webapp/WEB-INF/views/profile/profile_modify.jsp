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
<title>우리동네 올림픽</title>
<link rel="stylesheet" href="${path}/resources/css/reset.css" />
<link rel="stylesheet" href="${path}/resources/css/styles.css">
<link rel="shortcut icon" href="${path}/resources/img/파비콘.png" type="image/x-icon">
<style>
.side-bar {
	position: relative;
	top: -70px;
}

.banana {
	border: 1px solid black;
	height: 100%;
	margin: 0 auto;
	display: flex;
	align-items: center;
}

.banana form {
	margin: 0 auto;
}

.banana table th {
	width: 90px;
	text-align: left;
	font-weight: bold;
}

.banana #userid, .banana #email, .banana #username, .banana #usernick,
	.banana #sample6_address, .banana #phone, .banana #sample6_detailAddress,
	.banana #sample6_extraAddress {
	width: 300px;
	height: 40px;
}

.banana #sample6_postcode {
	width: 195px;
	height: 40px;
}

.side-bar div ul li a.current {
	pointer-events: none;
	cursor: default;
	color: red;
	font-weight: bold;
}
</style>
</head>

<body>
	<%@ include file="../include/header.jsp"%>
	<c:if test="${loginUser == null }">
		<script>
			alert("로그인 후 이용하세요!");
			location.replace('${cp}/user/login');
		</script>
	</c:if>
	<section>
		<%@ include file="../include/profile_sidebar.jsp"%>

		<!-- 개발코드 시작 -->
		<div class="banana">
			<form name="joinForm" method="post" action=""
				onsubmit="return sendit()">
				<table>
					<tr>
						<th><label for="userid">아이디</label></th>
						<td><input type="text" name="userid" id="userid"
							value="${loginUser.userid}" readonly style="color: gray;"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th><label for="email">이메일</label></th>
						<td><input type="text" name="email" id="email"
							value="${loginUser.email}" readonly style="color: gray;"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th><label for="username">이름</label></th>
						<td><input type="text" name="username" id="username"
							value="${loginUser.username}" readonly style="color: gray"></td>
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
							onfocusout="nickcheck()" value="${loginUser.usernick}"></td>
					</tr>
					<tr>
						<td></td>
						<td><span id="nickcheck">&nbsp;</span></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th><label for="phone">전화번호</label></th>
						<td><input type="text" name="phone" id="phone"
							value="${loginUser.phone}"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr class="zipcode_area">
						<th>우편번호</th>
						<td><input type="text" name="zipcode" id="sample6_postcode"
							readonly onclick="sample6_execDaumPostcode()"
							value="${loginUser.zipcode}"> <input type="button"
							value="우편번호 찾기" onclick="sample6_execDaumPostcode()"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr class="addr_area">
						<th>주소</th>
						<td><input type="text" name="addr" id="sample6_address"
							value="${loginUser.addr}" readonly></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td><input type="text" name="addrdetail"
							id="sample6_detailAddress" onfocusout="detail_addrcheck()"
							value="${loginUser.addrdetail}"></td>
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
							id="sample6_extraAddress" value="${loginUser.addretc}" readonly></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;"><input
							type="submit" value="수정 완료"> <input type="reset"
							value="초기화"></td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 개발코드 끝 -->
	</section>
	<%@ include file="../include/footer.jsp"%>
</body>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${path}/resources/js/header.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	var url = window.location.pathname;
	
	$('.side-bar').find('a').each(function() {
		$(this).toggleClass('current', $(this).attr('href') == url);
	});
	
	function nickcheck() {
		const usernick = document.joinForm.usernick;

		if (usernick.value == "") {
			document.getElementById("nickcheck").setAttribute('style',
					'color: red;');
			document.getElementById("nickcheck").innerHTML = "닉네임을 입력해주세요!"
		} else if (usernick.value.length > 10) {
			document.getElementById("nickcheck").setAttribute('style',
					'color: red;');
			document.getElementById("nickcheck").innerHTML = "닉네임은 10자 이하로 입력해주세요!"
		} else {
			document.getElementById("nickcheck").setAttribute('style',
					'color: green;');
			document.getElementById("nickcheck").innerHTML = "입력이 완료됐습니다!"
		}
	}

	function detail_addrcheck() {
		const zipcode = document.joinForm.zipcode;
		const addrdetail = document.joinForm.addrdetail;

		if (!zipcode.value == "" && addrdetail.value == "") {
			document.getElementById("detail_addrcheck").setAttribute('style',
					'color: red;');
			document.getElementById("detail_addrcheck").innerHTML = "상세주소를 입력해주세요!"
		} else if (!zipcode.value == "" && !addrdetail.value == "") {
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
		const phone_num = /^010||^011||^016||^017||^019\d{8}/;

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

		const zipcode = joinform.zipcode;
		const addrdetail = joinform.addrdetail;
		if (!zipcode.value == "" && addrdetail.value == "") {
			alert("상세주소를 입력해주세요!");
			addrdetail.focus();
			return false;
		}

		const phone = joinform.phone;
		if (!number.test(phone.value)) {
			alert("전화번호에는 숫자만 입력해주세요!");
			phone.focus();
			return false;
		}
		if (!phone_num.test(phone.value)) {
			alert("전화번호를 확인해주세요!");
			phone.focus();
			return false;
		}

		return true;
	}

	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>
</html>