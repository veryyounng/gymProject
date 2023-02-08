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
<link rel="stylesheet" href="${path}/resources/css/styles.css" />
<link rel="stylesheet" href="${path}/resources/css/reservationstyle.css">
<link rel="stylesheet" href="${path}/resources/css/free_list.css">
<link rel="shortcut icon" href="${path}/resources/img/파비콘.png" type="image/x-icon">
<style>
.side-bar {
	position: relative;
	top: -171px;
}

.banana {
	border: 1px solid black;
	height: 800px;
	margin: 0 auto;
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

.choice_box {
	margin-top: 50px;
}

.choice_box form {
	display: flex;
	width: 55%;
}

#pastDate, #currentDate {
	width: 40%;
}

select#date-list {
	width: 20%;
}

select#lecture-list {
	width: 30%;
}

table.type3 {
	margin-top: 50px;
}

input[type="text"] {
	border: 1px solid black;
	height: 40px;
	text-align: right;
	padding-right: 10px;
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
			<div class="choice_box">
				<form method="get" name="choice_box_form" id="choice_box_form" action="${path}/profile/my_reserve_past">
					<input type="hidden" name="num" value="${select}">
					<input type="text" name="pastDate" id="pastDate" value="${pastDate}" readonly>
					&nbsp;&nbsp; ~ &nbsp;&nbsp;
					<input type="text" name="currentDate" id="currentDate" readonly> &nbsp;
					<input class="box" id="datepick" name="datepick" value="${page.datepick}" style="display: none;" disabled/>
					<select class="box" id="date_list" name="date_list">
						<option value="all_period" <c:if test="${page.date_list == 'all_period'}">selected="selected"</c:if>>전체 기간</option>
						<option value="1_month" <c:if test="${page.date_list == '1_month'}">selected="selected"</c:if>>1개월</option>
						<option value="3_months" <c:if test="${page.date_list == '3_months'}">selected="selected"</c:if>>3개월</option>
						<option value="6_months" <c:if test="${page.date_list == '6_months'}">selected="selected"</c:if>>6개월</option>
						<option value="12_months" <c:if test="${page.date_list == '12_months'}">selected="selected"</c:if>> 1년</option>
					</select> &nbsp; 
					<input class="box" id="lecturepick" name="lecturepick" value="${page.lecturepick}" style="display: none;" disabled/>
					<select class="box" id="lecture_list" name="lecture_list">
						<option value="all_lecture" <c:if test="${page.lecture_list== 'all_lecture'}">selected="selected"</c:if>>모든 강의</option>
						<option value="zumba" <c:if test="${page.lecture_list == 'zumba'}">selected="selected"</c:if>>줌바</option>
						<option value="yoga" <c:if test="${page.lecture_list == 'yoga'}">selected="selected"</c:if>>요가</option>
						<option value="dietdance" <c:if test="${page.lecture_list == 'dietdance'}">selected="selected"</c:if>>다이어트댄스</option>
						<option value="pilates" <c:if test="${page.lecture_list == 'pilates'}">selected="selected"</c:if>>필라테스</option>
						<option value="aerobics" <c:if test="${page.lecture_list == 'aerobics'}">selected="selected"</c:if>>에어로빅</option>
						<option value="spinning" <c:if test="${page.lecture_list == 'spinning'}">selected="selected"</c:if>>스피닝</option>
					</select>
					<input type="submit" value="검색">
				</form>
			</div>
			<div class="selectdate">
				<table class="type3">
					<tr class="reser_type">
						<td>No</td>
						<td>과목명</td>
						<td>예약일자</td>
						<td>수업시간</td>
					</tr>

					<c:forEach items="${list}" var="reservelist" varStatus="status">
						<tr class="reser_result">
							<td>${page.count - status.count + 1}</td>
							<td>${reservelist.rv_title}</td>
							<td>${reservelist.rv_date}</td>
							<td>${reservelist.rv_time}</td>
						</tr>
					</c:forEach>
				</table>
				<div class="btns">
					<ul class="pagination">
						<c:if test="${page.prev}">
							<li>[<a
								href='${path}/profile/my_reserve_past?num=${page.startPageNum-1}&date_list=${page.date_list}&lecture_list=${page.lecture_list}'>이전</a>]
							</li>
						</c:if>
						<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
							<li>
								<c:if test="${select != num}">
									<a href="${path}/profile/my_reserve_past?num=${num}&date_list=${page.date_list}&lecture_list=${page.lecture_list}">${num}</a>
								</c:if>
								<c:if test="${select == num}">
									<b style="font-weight: 700; color: red; text-decoration: underline;">${num}</b>
								</c:if>
							</li>
						</c:forEach>
						<c:if test="${page.next}">
							<li>[<a
								href="${path}/profile/my_reserve_past?num=${page.endPageNum+1}&date_list=${page.date_list}&lecture_list=${page.lecture_list}">다음</a>]
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		<!-- 개발코드 끝 -->
	</section>
	<%@ include file="../include/footer.jsp"%>
</body>
<script src="${path}/resources/js/header.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	var url = window.location.pathname+"?num=${select}";
	
	$('.sidetab').find('a').each(function() {
		$(this).toggleClass('current', $(this).attr('href') == url);
	});

	$('#currentDate').val(new Date().toISOString().substring(0, 10));
	
	const datepick= document.querySelector('#datepick');
	const datelist = document.querySelector('#date_list');
	const pd = document.getElementById('pastDate');
	
	datelist.addEventListener('change', (event) => {
		datepick.removeAttribute('value');
		datepick.value = event.target.value;
		if (datepick.value == "all_period") {
			pd.value = ".";
		}
		else if (datepick.value == "1_month") {
			let date1 = new Date();
			const pd1 = new Date(date1.setMonth(date1.getMonth()-1));
			pd.value = pd1.toISOString().substring(0, 10);
		}
		else if (datepick.value == "3_months") {
			let date3 = new Date();
			const pd3 = new Date(date3.setMonth(date3.getMonth()-3));
			pd.value = pd3.toISOString().substring(0, 10);
		}
		else if (datepick.value == "6_months") {
			let date6 = new Date();
			const pd6 = new Date(date6.setMonth(date6.getMonth()-6));
			pd.value = pd6.toISOString().substring(0, 10);
		}
		else if (datepick.value == "12_months") {
			let date12 = new Date();
			const pd12 = new Date(date12.setFullYear(date12.getFullYear()-1));
			pd.value = pd12.toISOString().substring(0, 10);
		}
	})
	
	const lecturepick= document.querySelector('#lecturepick')
	const lecturelist = document.querySelector('#lecture_list')
	lecturelist.addEventListener('change', (event) => {
		lecturepick.removeAttribute('value');
		lecturepick.value = event.target.value;
	})
</script>
</html>