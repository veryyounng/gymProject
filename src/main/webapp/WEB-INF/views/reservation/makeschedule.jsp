<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="path" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="./img/파비콘.png" type="image/x-icon">
<title>우리동네 올림픽</title>
<link rel="stylesheet" href="${path}/resources/css/reset.css" />
<link rel="stylesheet" href="${path}/resources/css/styles.css" />
<link rel="stylesheet" href="${path}/resources/css/reservationstyle.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" href="${path}/resources/css/datepicker.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<style>
#reserBTN {
	width:64px;
}
#rv_title,
#rv_time {
	width: 60%;
	height: 80%;
	font-size:16px;
}
.banana{
	height:980px;
}
</style>
<script>
	if(${loginUser == null}){
		alert("로그인 후 이용하세요");
		location.href = "/user/login";
	}
</script>

</head>
<body>
	<c:if test="${ms == 'T'}">
		<script>
			alert("예약일정 생성이 완료되었습니다.");
		</script>
	</c:if>
	<c:if test="${ms == 'F'}">
		<script>
			alert("예약일정 생성에 실패하였습니다.");
		</script>
	</c:if>
	<c:if test="${loginUser.userid != 'admin'}">
		<script>
			alert("잘못된 접근입니다.");
			location.href="/";
		</script>
	</c:if>
	<%@ include file="../include/header.jsp"%>
	<section>

		<!-- 개발코드 시작 -->
		<div class="banana">
			<div class="board_body">
				<div class="title_box">
					<h2>예약일정 생성(관리자 전용)</h2>
				</div>
				<table class="type1">
					<th>G.X룸 수업 시간표</th>
					<tr>
						<td rowspan="2">시간</td>
						<td colspan="3">월, 수, 금</td>
						<td colspan="3">화, 목</td>
					</tr>
					<tr>
						<td>강좌명</td>
						<td>강사명</td>
						<td>정원</td>
						<td>강좌명</td>
						<td>강사명</td>
						<td>정원</td>
					</tr>
					<tr>
						<td>09:10~10:00</td>
						<td>줌바</td>
						<td>박예찬</td>
						<td>20명</td>
						<td>줌바</td>
						<td>박예찬</td>
						<td>20명</td>
					</tr>
					<tr>
						<td>10:10~11:00</td>
						<td>요가</td>
						<td>최현영</td>
						<td>20명</td>
						<td>필라테스</td>
						<td>이동엽</td>
						<td>10명</td>
					</tr>
					<tr>
						<td>11:10~12:00</td>
						<td>다이어트댄스</td>
						<td>장승욱</td>
						<td>15명</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
					</tr>
					<tr>
						<td>19:00~19:50</td>
						<td>필라테스</td>
						<td>이동엽</td>
						<td>10명</td>
						<td>다이어트댄스</td>
						<td>장승욱</td>
						<td>15명</td>
					</tr>
					<tr>
						<td>20:00~20:50</td>
						<td>에어로빅</td>
						<td>최소영</td>
						<td>30명</td>
						<td>요가</td>
						<td>최현영</td>
						<td>20명</td>
					</tr>
					<tr>
						<td>21:00~21:50</td>
						<td>스피닝</td>
						<td>김철성</td>
						<td>20명</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
					</tr>
				</table>
				<div class="th" style="margin-bottom : 50px;">&lt; 일정생성 &gt;</div>
				<form style="display:inline;" name="makeForm" method="post">
					<table class="type2">
						<tr>
							<td>강좌명</td>
<!-- 							<td><input type="text" value="" name="rv_title" -->
<!-- 								id="rv_title"></td> -->
							<td>
			                    <select id="rv_title" name="rv_title">
			                       <option value="줌바">줌바</option>
			                       <option value="요가">요가</option>
			                       <option value="다이어트댄스">다이어트댄스</option>
			                       <option value="필라테스">필라테스</option>
			                       <option value="에어로빅">에어로빅</option>
			                       <option value="스피닝">스피닝</option>
                  				</select>
                  			</td>
						</tr>
						<tr>
							<td>정원</td>
							<td><input type="text" value="" name="rv_limit"
								id="rv_limit" placeholder="숫자만 입력하세요" value=""></td>
						</tr>
						<tr>
							<td>시간</td>
							<td>
								<select id="rv_time" name="rv_time">
			                       <option value="09:10 ~ 10:00">09:10 ~ 10:00</option>
			                       <option value="10:10 ~ 11:00">10:10 ~ 11:00</option>
			                       <option value="11:10 ~ 12:00">11:10 ~ 12:00</option>
			                       <option value="19:00 ~ 19:50">19:00 ~ 19:50</option>
			                       <option value="20:00 ~ 20:50">20:00 ~ 20:50</option>
			                       <option value="21:00 ~ 21:50">21:00 ~ 21:50</option>
                  				</select>
                  			</td>
						</tr>
						<tr>
							<td>날짜</td>
							<td><input class="form-control" id="rv_date" name="rv_date"
								pattern="\d{4}-\d{2}-\d{2}" placeholder="달력 보기"
								th:field="*{rv_date}" type="text"/></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" onclick="return checkNaN();" id="reserBTN" value="예약생성"></td>
						</tr>
					</table>
				</form>
				<!-- 검색 list(가능) 끝 -->
			<!-- 개발코드 끝 -->
	</section>
	<%@ include file="../include/footer.jsp"%>
</body>

<script type="text/javascript">
var fp = flatpickr(document.getElementById("rv_date"), {
	'monthSelectorType' : 'static',
	"locale" : "ko",
	"minDate" : "today"
});
function checkNaN(){
	let rv_limit = $("#rv_limit");
	
	if(!isNaN(rv_limit.val())) {
		return true;
	} else {
		alert("숫자만 입력해주세요.");
		rv_limit.val("");
		console.log(rv_limit.val());
		rv_limit.focus();
		return false;
	}
}
</script>
</html>