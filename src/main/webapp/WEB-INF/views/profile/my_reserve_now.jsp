<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	top: -120px;
}

.banana {
	border: 1px solid black;
	height: 700px;
	margin: 0 auto;
	display: flex;
	justify-content: space-around;
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

table.type3 {
	margin-top: 0px;
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
			<div class="selectdate">
				<table class="type3">
					<tr class="reser_type">
						<td>No</td>
						<td>과목명</td>
						<td>예약일자</td>
						<td>수업시간</td>
						<td>정원</td>
						<td>예약관리</td>
					</tr>

					<c:forEach items="${list}" var="reservelist" varStatus="status">
						<tr class="reser_result">
							<td>${page.count - status.count + 1}</td>
							<td>${reservelist.rv_title}</td>
							<td>${reservelist.rv_date}</td>
							<td>${reservelist.rv_time}</td>
							<td>${reservelist.rv_headCnt}/ ${reservelist.rv_limit}</td>
							<form method="post" action="${path}/profile/my_reserve_delete">
								<td>
									<input type="hidden" name="rv_num" value="${reservelist.rv_num}">
									<input type="hidden" name="num" value="${select}">
									<input type="submit" value="취소">
								</td>
							</form>
						</tr>
					</c:forEach>
				</table>
				<div class="btns">
					<ul class="pagination">
						<c:if test="${page.prev}">
							<li>[<a
								href='${path}/profile/my_reserve_now?num=${page.startPageNum-1}'>이전</a>]
							</li>
						</c:if>
						<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
							<li>
								<c:if test="${select != num}">
									<a href="${path}/profile/my_reserve_now?num=${num}">${num}</a>
								</c:if>
								<c:if test="${select == num}">
									<b style="font-weight: 700; color: red; text-decoration: underline;">${num}</b>
								</c:if>
							</li>
						</c:forEach>
						<c:if test="${page.next}">
							<li>[<a
								href="${path}/profile/my_reserve_now?num=${page.endPageNum+1}">다음</a>]
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
	var url = window.location.pathname;
	
	$('.side-bar').find('a').each(function() {
		$(this).toggleClass('current', $(this).attr('href') == url);
	});
</script>
</html>