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
<style>
.side-bar {
	position: relative;
	top: -155px;
}

.banana {
	border: 1px solid black;
	height: 100%;
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
</style>
</head>

<body>
	<%@ include file="../include/header.jsp"%>
	<section>
		<%@ include file="../include/profile_sidebar.jsp"%>
		<!-- 개발코드 시작 -->
		<div class="banana">
			<div class="choice_box">
				<form action="" method="post">
					<input type="text" name="pastDate" id="pastDate" readonly>
					&nbsp;&nbsp; ~ &nbsp;&nbsp;
					<input type="text" name="currentDate" id="currentDate" value = "." readonly> &nbsp;
					<input class="box" id="datepick" name="datepick" value="all_period" disabled/>
					<select class="box" id="date-list">
						<option value="all_period">전체 기간</option>
						<option value="1_month" id="1_month">1개월</option>
						<option value="3_months">3개월</option>
						<option value="6_months">6개월</option>
						<option value="12_months">1년</option>
					</select> &nbsp; 
					<input class="box" id="lecturepick" name="lecturepick" value="all_lecture" style="display: none;" disabled/>
					<select class="box" id="lecture-list">
						<option value="all_lecture">모든 강의</option>
						<option value="zumba">줌바</option>
						<option value="yoga">요가</option>
						<option value="dietdance">다이어트댄스</option>
						<option value="pilates">필라테스</option>
						<option value="aerobics">에어로빅</option>
						<option value="spinning">스피닝</option>
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

					<c:forEach items="${list}" var="reservelist">
						<tr class="reser_result">
							<c:forEach var="i" begin="1" end="" step="1">
								<td>${i}</td>
							</c:forEach>
							<td>${reservelist.rv_title}</td>
							<td>${reservelist.rv_date}</td>
							<td>${reservelist.rv_time}</td>
						</tr>
					</c:forEach>
					<tr class="reser_result">
						<td>10</td>
						<td>요가</td>
						<td>23.02.03.</td>
						<td>10:00 ~ 12:00</td>
					</tr>
					<tr class="reser_result">
						<td>9</td>
						<td>요가</td>
						<td>23.02.03.</td>
						<td>10:00 ~ 12:00</td>
					</tr>
					<tr class="reser_result">
						<td>8</td>
						<td>요가</td>
						<td>23.02.03.</td>
						<td>10:00 ~ 12:00</td>
					</tr>
					<tr class="reser_result">
						<td>7</td>
						<td>요가</td>
						<td>23.02.03.</td>
						<td>10:00 ~ 12:00</td>
					</tr>
					<tr class="reser_result">
						<td>6</td>
						<td>요가</td>
						<td>23.02.03.</td>
						<td>10:00 ~ 12:00</td>
					</tr>
					<tr class="reser_result">
						<td>5</td>
						<td>요가</td>
						<td>23.02.03.</td>
						<td>10:00 ~ 12:00</td>
					</tr>
					<tr class="reser_result">
						<td>4</td>
						<td>요가</td>
						<td>23.02.03.</td>
						<td>10:00 ~ 12:00</td>
					</tr>
					<tr class="reser_result">
						<td>3</td>
						<td>요가</td>
						<td>23.02.03.</td>
						<td>10:00 ~ 12:00</td>
					</tr>
					<tr class="reser_result">
						<td>2</td>
						<td>요가</td>
						<td>23.02.03.</td>
						<td>10:00 ~ 12:00</td>
					</tr>
					<tr class="reser_result">
						<td>1</td>
						<td>요가</td>
						<td>23.02.03.</td>
						<td>10:00 ~ 12:00</td>
					</tr>
				</table>
				<div class="btns">
					<ul class="pagination">
						<c:if test="${page.prev}">
							<li>[<a
								href='${path}/profile/my_free?num=${page.startPageNum-1}'>이전</a>]
							</li>
						</c:if>
						<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
							var="num">
							<li><c:if test="${select != num}">
									<a href="${path}/profile/my_free?num=${num}">${num}</a>
								</c:if> <c:if test="${select == num}">
									<b
										style="font-weight: 700; color: red; text-decoration: underline;">${num}</b>
								</c:if></li>
						</c:forEach>
						<c:if test="${page.next}">
							<li>[<a
								href="${path}/profile/my_free?num=${page.endPageNum+1}">다음</a>]
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
	$('#currentDate').val(new Date().toISOString().substring(0, 10));
	
	const datepick= document.querySelector('#datepick');
	const datelist = document.querySelector('#date-list');
	const pd = document.getElementById('pastDate');
	
	datelist.addEventListener('change', (event) => {
		datepick.removeAttribute('value');
		datepick.value = event.target.value;
		if (datepick.value == "1_month") {
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
		else if (datepick.value == "all_period") {
			pd.value == ".";
		}
	})
	
	const lecturepick= document.querySelector('#lecturepick')
	const lecturelist = document.querySelector('#lecture-list')
	lecturelist.addEventListener('change', (event) => {
		lecturepick.removeAttribute('value');
		lecturepick.value = event.target.value;
	})
</script>
</html>







