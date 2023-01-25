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

<script>
	if(${loginUser == null}){
		alert("로그인 후 이용하세요");
		location.href = "/user/login";
	}
</script>

</head>
<body>
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
				<div class="th">&lt; 일정생성 &gt;</div>
					<table class="type2">
						<tr>
							<td>이름</td>
							<td><input type="text" value="${loginUser.username}" name="username"
								id="username" readonly>
								<input type="hidden" value="${loginUser.userid}" name="loginUserid" id="loginUserid"/></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" value="${loginUser.email}" name="email"
								id="email" readonly></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="tel" value="${loginUser.phone}" name="phone"
								id="phone" readonly></td>
						</tr>
						<tr>
							<td>예약일</td>
							<td><input class="form-control" id="rv_date"
								pattern="\d{4}-\d{2}-\d{2}" placeholder="달력 보기"
								th:field="*{rv_date}" type="text" value="" /></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" id="reserBTN" onclick="searchTime();" value="검색"></td>
						</tr>
					</table>
				<!-- 검색 list(가능) 시작 -->
				<table class="type3">
					<span class="checkRS">※ 예약 취소 및 확인은 마이페이지에서 가능합니다.</span>
					<tr class="reser_type">
						<td>과목명</td>
						<td>수업시간</td>
						<td>정원</td>
						<td>예약하기</td>
					</tr>
				</table>
				<!-- 검색 list(가능) 끝 -->
				<div class="type4">날짜 선택과 검색버튼을 눌러주세요.</div>
				<!-- 검색 list(불가능) 시작 -->
			</div>
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

$('#reserBTN').on('click', function(){
   	var date = $("#rv_date").val();
   	var userid = $("#loginUserid").val();
	$.ajax({
        url: "result",
        type: "POST",
        data:{"rv_date" : date},
        success: function(resultData){
        	console.log("ajax 성공");
        	console.log(resultData.length);
        	$('.ResultData').remove();
        	if(resultData.length === 0 ) {
        		$('.type4').html('검색된 결과가 없습니다.');
        		$('.type4').css('display','flex');
        	} else {
        		let str = "";
	        	for(var i = 0; i < resultData.length; i++) {     		
	        		str = "";
	        		str += "<tr class='ResultData'>";
	        		str += "<td>"+resultData[i].rv_title+"</td>";
	        		str += "<td>"+resultData[i].rv_time+"</td>";
	        		str += "<td>"+resultData[i].rv_headCnt+" / "+resultData[i].rv_limit+"</td>";
	        		str += "<td>";
	        		str += "<form action='/reservation/user_rv' method='post' name='searchResult' id='searchResult'>";
	        		str += "<input type='hidden' name='userid' id='userid' value='"+userid+"'>";
	        		str += "<input type='hidden' name='rv_num' id='rv_num' value='"+resultData[i].rv_num+"'>";
	        		str += (resultData[i].rv_headCnt < resultData[i].rv_limit ? "<input type='submit' value='예약'/></form></td>" : "<span style='color:red;'>예약불가</span></form></td>");
	        		str += "</tr>";
	        		$('.type3').append(str);
	        	}
        	}
        },
        error: function(request, error){
        	console.log("ajax 실패");
        	console.log("code:"+request.status+"\n"+"message"+request.responseText+"\n"+"error:"+error);
        }
    });
});
function searchTime() {
	if($("#rv_date").val()==""){
		alert("예약일을 선택해 주세요");
		location.href="/reservation/search";
	}
		
	$('.type4').css('display','none');
} 

</script>
</html>