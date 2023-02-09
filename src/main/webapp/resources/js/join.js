const idReg = /^[A-za-z0-9]/;

const korean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
const koreanname = /^[가-힣]{2,15}$/;

const englisha = /[a-z]/;

const number = /[0-9]/;
const special = /[~!@#$%^&*]/;
const phone_num = /^(?:(010\d{4})|(01[1|6|7|8|9]\d{3,4}))(\d{4})$/;

$('#userpw').focusout(function() {
	if ($('#userpw').val() == "") {
		$('#pwcheck').attr('style', 'color:red;');
		$('#pwcheck').text('비밀번호를 입력해주세요!');
	}
	else if ($('#userpw').val().length < 8 || $('#userpw').val().length > 20) {
		$('#pwcheck').attr('style', 'color:red;');
		$('#pwcheck').text('비밀번호는 8자 이상, 20자 이하로 입력해주세요!');
	}
	else if (!englisha.test($('#userpw').val()) || !special.test($('#userpw').val()) || !number.test($('#userpw').val())) {
		$('#pwcheck').attr('style', 'color:red;');
		$('#pwcheck').text('비밀번호는 알파벳 소문자, 숫자, 특수문자가 포함돼야 합니다!');
	}
	else {
		$('#pwcheck').attr('style', 'color:green;');
		$('#pwcheck').text('입력이 완료되었습니다!');
	}
})

$('#userpw_re').focusout(function() {
	if ($('#userpw_re').val() != $('#userpw').val()) {
		$('#re_pwcheck').attr('style', 'color:red;');
		$('#re_pwcheck').text('비밀번호를 확인해주세요!');
	}
	else {
		if ($('#userpw').val() == "") {
			$('#re_pwcheck').attr('style', 'color:red;');
			$('#re_pwcheck').text('비밀번호를 확인해주세요!');
		}
		else {
			$('#re_pwcheck').attr('style', 'color:green;');
			$('#re_pwcheck').text('비밀번호가 확인되었습니다!');
		}
	}
})
	
$('#username').focusout(function() {
	if ($('#username').val() == "") {
		$('#namecheck').attr('style', 'color:red;');
		$('#namecheck').text('이름을 입력해주세요!');
	}
	else if (!koreanname.test($('#username').val())) {
		$('#namecheck').attr('style', 'color:red;');
		$('#namecheck').text('오타가 없는지 확인해주세요!');
	}
	else {
		$('#namecheck').attr('style', 'color:green;');
		$('#namecheck').text('입력이 완료되었습니다!');
	}
})
	
$('#usernick').focusout(function() {
	if ($('#usernick').val() == "") {
		$('#nickcheck').attr('style', 'color:red;');
		$('#nickcheck').text('닉네임을 입력해주세요!');
	}
	else if ($('#usernick').val().length > 10) {
		$('#nickcheck').attr('style', 'color:red;');
		$('#nickcheck').text('닉네임은 10자 이하로 입력해주세요!');
	}
	else {
		$('#nickcheck').attr('style', 'color:green;');
		$('#nickcheck').text('입력이 완료되었습니다!');
	}
})
	
$('#middle_num').keyup(function() {
	if ($('#middle_num').val().length == 4) {
		$('#last_num').focus();
	}
})
	
$('#middle_num').focusout(function() {
	if ($('#middle_num').val() == "") {
		$('#phonecheck').attr('style', 'color:red;');
		$('#phonecheck').text('전화번호를 입력해주세요!');
	}
	else if (!number.test($('#middle_num').val())) {
		$('#phonecheck').attr('style', 'color:red;');
		$('#phonecheck').text('전화번호에는 숫자만 입력해주세요!');
	}
})

$('#last_num').focusout(function() {
	if ($('#last_num').val() == "") {
		$('#phonecheck').attr('style', 'color:red;');
		$('#phonecheck').text('전화번호를 입력해주세요!');
	}
	else if (!number.test($('#last_num').val())) {
		$('#phonecheck').attr('style', 'color:red;');
		$('#phonecheck').text('전화번호에는 숫자만 입력해주세요!');
	}
	else {
		$('#phonecheck').attr('style', 'color:green;');
		$('#phonecheck').text('입력이 완료되었습니다!');
	}
})

$('#phone').focusout(function() {
	if ($('#phone').val() == "") {
		$('#phone').attr('style', 'color:red;');
		$('#phone').text('전화번호를 입력해주세요!');
	}
	else if (!number.test($('#phone').val())) {
		$('#phone').attr('style', 'color:red;');
		$('#phone').text('전화번호에는 숫자만 입력해주세요!');
	}
	else if (!phone_num.test($('#phone').val())) {
		$('#phone').attr('style', 'color:red;');
		$('#phone').text('전화번호를 확인해주세요!');
	}
	else {
		$('#phone').attr('style', 'color:green;');
		$('#phone').text('입력이 완료되었습니다!');
	}
})
		
$('#sample6_detailAddress').focusout(function() {
	if ($('#sample6_postcode').val() != "" && $('#sample6_detailAddress').val() == "") {
		$('#detail_addrcheck').attr('style', 'color:red;');
		$('#detail_addrcheck').text('상세주소를 입력해주세요!');
	}
	else if ($('#sample6_postcode').val() != "" && $('#sample6_detailAddress').val() != "") {
		$('#detail_addrcheck').text('');
	}
})


$('#joinForm').submit(function() {
	if ($('#userid').val() == "") {
		alert("아이디를 입력해주세요!");
		$('#userid').focus();
		return false;
	}
	if ($('#userid').val() == "admin") {
		alert("사용할 수 없는 아이디입니다!");
		$('#userid').focus();
		return false;
	}
	if ($('#userid').val().length < 4 || $('#userid').val().length > 16) {
		alert("아이디는 4자 이상, 16자 이하로 입력하세요!");
		$('#userid').focus();
		return false;
	}
	if (korean.test($('#userid').val())) {
		alert("아이디에는 영어와 숫자만 입력해주세요!");
		$('#userid').focus();
		return false;
	}
	if (!idReg.test($('#userid').val())) {
		alert("숫자만 입력할 수는 없습니다!");
		$('#userid').focus();
		return false;
	}
	if ($('#userid_chkpoint').val() != 'Y') {
		alert("중복된 아이디는 사용할 수 없습니다!");
		$('#userid').focus();
		return false;
	}

	if ($('#userpw').val() == "") {
		alert("비밀번호를 입력하세요!");
		$('#userpw').focus();
		return false;
	}
	if ($('#userpw').val().length < 8 || $('#userpw').val().length > 20) {
		alert("비밀번호는 8자 이상, 20자 이하로 입력하세요!");
		$('#userpw').focus();
		return false;
	}
	if (!englisha.test($('#userpw').val()) || !special.test($('#userpw').val()) || !number.test($('#userpw').val())) {
		alert("비밀번호는 영어(소문자), 숫자, 특수문자가 포함돼야 합니다!");
		$('#userpw').focus();
		return false;
	}
	
	if ($('#userpw_re').val() == "") {
		alert("비밀번호를 확인해주세요!");
		$('#userpw_re').focus();
		return false;
	}
	if ($('#userpw').val() != $('#userpw_re').val()) {
		alert("비밀번호를 확인해주세요!");
		$('#userpw_re').focus();
		return false;
	}

	if ($('#username').val() == "") {
		alert("이름을 입력하세요!");
		$('#username').focus();
		return false;
	}
	if (!koreanname.test($('#username').val())) {
		alert("오타가 없는지 확인해주세요!");
		$('#username').focus();
		return false;
	}

	if ($('#usernick').val() == "") {
		alert("닉네임을 입력해주세요!");
		$('#usernick').focus();
		return false;
	}
	if ($('#usernick').val().length > 10) {
		alert("닉네임은 10자 이하로 입력해주세요!");
		$('#usernick').focus();
		return false;
	}
	    
	if ($('#middle_num').val() == "") {
		alert("전화번호를 입력해주세요!");
		$('#middle_num').focus();
		return false;
	}
	if ($('#last_num').val() == "") {
		alert("전화번호를 입력해주세요!");
		$('#last_num').focus();
		return false;
	}
	if (!number.test($('#middle_num').val()) || !number.test($('#last_num').val())) {
		alert("전화번호에는 숫자만 입력해주세요!");
		$('#middle_num').focus();
		return false;
	}
	
	if ($('#phone').val() == "") {
		alert("전화번호를 입력해주세요!");
		$('#phone').focus();
		return false;
	}
	if (!number.test($('#phone').val())) {
		alert("전화번호에는 숫자만 입력해주세요!");
		$('#phone').focus();
		return false;
	}
	if (!phone_num.test($('#phone').val())) {
		alert("전화번호를 확인해주세요!");
		$('#phone').focus();
		return false;
	}
	
	if ($('#sample6_postcode').val() != "" && $('#sample6_detailAddress').val() == "") {
		alert("상세주소를 입력해주세요!");
		$('#sample6_detailAddress').focus();
		return false;
	}

	return true;
})

$('#sample6_postcode, #postcode_btn').click(function() {
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
})