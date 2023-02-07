<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 쪽지함</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="${path}/resources/css/message.css">
<script defer src="${path}/resources/js/message.js"></script>
</head>

<body>
	<section>

		<div class="letterbox">
			<div class="title">
				<div class="material-symbols-outlined">mail</div>
				<div class="title_sub">내 쪽지함</div>
			</div>
			<div class="receive">받은 쪽지함 ${page.count}</div>
			<div class="delete">
				<div class="btn_form">
					<input class="btn btn_receive" type="submit" value="보낸 쪽지함"
						onclick=""> <input class="btn btn_send" type="submit"
						value="쪽지 보내기" onclick="location.href='/msg/send'">
				</div>
				<form id="deleteform" method="post" action="${cp}/msg/msgDelete">
					<input class="btn btn_delete" type="submit" value="선택삭제" onclick="">
				</form>
			</div>
			<div class="msgbox">
				<ul class="list list1">
					<li style="width: 80px; text-align: center;">보낸사람</li>
					<li style="width: 220px; text-align: center;">제목</li>
					<li style="width: 80px; text-align: center;">수신여부</li>
					<li style="width: 150px; text-align: center;">보낸시간</li>
					<li style="width: 60px; text-align:center;"><input
						type="checkbox" name="chkAll" value="selectAll"
						onclick="selectAll(this)" />전체선택</li>
				</ul>

				<c:choose>
					<c:when test="${page.count != 0}">
						<c:forEach items="${list}" var="result">
							<ul class="list list2" onclick="location.href='/msg/receiveDetail?msg_num=${result.msg_num}&select=${select}&page=${page}'">
								<li style="width: 80px; text-align: center;">${result.sender}</li>
								<li style="width: 190px; text-align: center; ">${result.title}</li>
								<li style="width: 80px; text-align: center;">
								<c:if test="${result.reception == 'O'}">
								읽음
								</c:if>
								<c:if test="${result.reception == 'X'}">
								읽지않음
								</c:if>
								</li>
								<li style="width: 150px; text-align: center;"><span
									class="date"><fmt:formatDate value="${result.time}"
											pattern="yy-MM-dd HH:mm" /></span></li>
								<li style="width: 60px; text-align: center;"><input
									type="checkbox" name="chkAll" /></li>
							</ul>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="noMsg">
							받은 쪽지가 없습니다.</div>
					</c:otherwise>
				</c:choose>
			</div>

		</div>


		<div class="btns">
			<ul>
				<c:if test="${page.prev}">
					<li>[<a
						href="/msg/">이전</a>]
					</li>
				</c:if>
				<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
					var="num">
					<li><c:if test="${select != num}">
							<a href="">${num}</a>
						</c:if> <c:if test="${select == num}">
							<b id="page_select">${num}</b>
						</c:if></li>
				</c:forEach>
				<c:if test="${page.next}">
					<li>[<a
						href="">다음</a>]
					</li>
				</c:if>
			</ul>
		</div>

	</section>

</body>

</html>
