<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="shortcut icon" href="${path}/resources/img/파비콘.png" type="image/x-icon">
<link rel="stylesheet" href="${path}/resources/css/styles.css" />
<link rel="stylesheet" href="${path}/resources/css/notidetail.css" />
<link rel="stylesheet"
	href="http://fonts.googleapis.com/icon?family=Material+Icons" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<script>
	function delete_check() {
		if (confirm("정말로 삭제하시겠습니까?")) {
			return true;
		} else {
			return false;
		}
	}
</script>
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<!-- 개발코드 시작  -->
	<div class="banana">
		<div class="board_body">
			<div class="title_box">
				<h2>공지사항</h2>
			</div>

			<div id="title_box2">
				<div class="view_title">${view.notice_title}</div>
			</div>
			<div class="view_dc">

				<div class="view_date">
					<i class="material-symbols-outlined">calendar_month</i> 등록일 :
					<fmt:formatDate value="${view.notice_date}" pattern="yyyy-MM-dd" />
				</div>
				<div class="view_cnt">조회수 : ${view.view_cnt}</div>
			</div>

			<div class="view_content">${view.notice_contents}</div>

			<div class="btns">
				<a class="btn_back"
					onclick="location.href='/board/notice?keyword=${keyword}&num=${select}'">목록</a>
				<c:if test="${loginUser.userid == 'admin'}">
					<a class="btn_modify"
						onclick="location.href='/board/notimodify?notice_num=${view.notice_num}'">수정</a>
					<form id="boardform" method="post" action="${cp}/board/notidelete">
						<input type="hidden" value="${view.notice_num}" name="notice_num" />
						<input class="btn_delete" type="submit" value="삭제"
							onclick="return delete_check();">
					</form>
				</c:if>
			</div>

		</div>
	</div>
	<!--  개발코드 끝 -->
	<%@ include file="../include/footer.jsp"%>
</body>
</html>