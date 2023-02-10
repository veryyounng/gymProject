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
<link rel="stylesheet" href="${path}/resources/css/styles.css">
<link rel="stylesheet" href="${path}/resources/css/notistyle.css">
<link rel="stylesheet" href="${path}/resources/css/free_list.css">
<link rel="shortcut icon" href="${path}/resources/img/파비콘.png" type="image/x-icon">
<style>
.side-bar {
	position: relative;
	top: -227px;
}

section {
	min-height: 0px;
	height: 910px;
}

.banana {
	height: 100%;
	margin: 0 auto;
	padding-top: 50px;
	padding-left: 50px;
	padding-right: 50px;
}

.banana form {
	margin: 0 auto;
}

.banana .profile {
	display: flex;
	margin-bottom: 50px;
}

.banana .profile .profile_intro {
	margin-left: 10px;
}

.banana .profile span {
	display: block;
	line-height: 27px;
}

.banana #contents .boardnum {
	width: 5%;
}

.banana #contents .title {
	width: 45%;
}

.banana #contents .writer_id {
	width: 20%;
}

.banana #contents .data {
	width: 10%;
}

.banana #contents .view {
	width: 10%;
}

.banana #contents .etc {
	width: 10%;
}

.banana #contents .ul_news {
	height: 20px;
}

.banana #contents .ul_news .etc {
	display: flex;
	justify-content: end;
	margin-bottom: 10px;
}

.banana #contents .ul_news .etc #write_notice button,
	.banana #contents .ul_news .etc #write_notice input {
	margin-left: -15px;
}

.banana #contents .ul_news .etc #write_notice .modify_btn {
	background-color: #eee;
	border-color: #ddd;
	color: black;
}

.banana #contents .ul_news .etc #write_notice input {
	background-color: #333333;
	color: #eee;
	cursor: pointer;
}

.banana #contents .ul_news .reply_contents {
	width: 90%;
}

.banana #contents .ul_news .reply_contents span {
	display: block;
	margin-left: 5px;
	margin-bottom: 5px;
}

.deleteandwrite_btn {
	display: flex;
	justify-content: end;
	margin-left: -15px;
}

ul {
	list-style: none;
}

ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current {
	background: #F8F9FA;
	color: #222;
}

.tab-content {
	display: none;
	background: #F8F9FA;
	padding: 15px;
}

.tab-content.current {
	display: inherit;
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
		<!-- 사이드바 시작 -->
		<%@ include file="../include/profile_sidebar.jsp"%>
		<!-- 사이드바 끝 -->

		<!-- 개발코드 시작 -->
		<div class="banana">
			<div class="profile">
				<div class="profile_pic">
					<img src="${path}/resources/img/profile_pic.png" alt="프로필">
				</div>
				<div class="profile_intro">
					<span style="font-size: 25px; margin-bottom: 10px;">${loginUser.usernick}님</span>
					<span style="font-size: 15px;">
						운동지식공유 게시글 수: ${page.count}개 /
						댓글 수: ${replypage.count}개
					</span>
				</div>
			</div>
			<div class="boardcontents">
				<div id="contents">
					<ul class="tabs">
						<li class="tab-link" data-tab="tab-1" onclick="location.href='${path}/profile/my_ex?num=1'">내가 쓴 글</li>
						<li class="tab-link current" data-tab="tab-2">내가 쓴 댓글</li>
					</ul>

					<!-- 게시글 탭 시작 -->
					
					<!-- 게시글 탭 끝 -->

					<!-- 댓글 탭 시작 -->
					<div id="tab-2" class="tab-content current" style="height: 600px;">
						<form name="form1" method="post" id="form1">
							<input type="hidden" name="table_name" value="notice_list">
							<ul class="ul_news_title" style="display: block;">
								<div class=reply>
									<span class="reply" style="margin: 0 auto;">댓글</span>
								</div>
							</ul>
						</form>
						<c:forEach items="${replylist}" var="ex_reply">
							<ul class="ul_news" style="text-align: left; height: 100px;">
								<div class="reply_contents">
									<span>${ex_reply.exc_contents}</span>
									<span class="date" style="font-size: 10px; color: gray;">
										<fmt:formatDate value="${ex_reply.exc_date}" pattern="yyyy.MM.dd HH:mm:ss" />
									</span>
									<span class="view" style="font-size: 12px;">${ex_reply.ex_title}</span>
								</div>
								<form method="post" action="${path}/profile/my_ex_reply_delete" name="reply_delete_form">
									<div id="write_notice">
										<input type="hidden" name="exc_num" value="${ex_reply.exc_num}">
										<input type="hidden" name="num" value="${replyselect}">
										<input type="submit" value="삭제" onclick="return delete_check();">
									</div>
								</form>
							</ul>
						</c:forEach>
						<form method="post"
							action="${path}/profile/my_ex_reply_delete_all">
							<div class="deleteandwrite_btn">
								<div id="write_notice">
									<input type="hidden" name="exc_writer" value="${loginUser.userid}">
									<input type="hidden" name="num" value="${replyselect}">
									<input type="submit" value="전체 삭제" onclick="return delete_check();">
								</div>
							</div>
						</form>
						<div class="btns">
							<ul class="pagination">
								<c:if test="${replypage.prev}">
									<li>
										[<a href='${path}/profile/my_ex_reply?num=${replypage.startPageNum-1}'>이전</a>]
									</li>
								</c:if>
								<c:forEach begin="${replypage.startPageNum}" end="${replypage.endPageNum}" var="reply_num">
									<li>
										<c:if test="${replyselect != reply_num}">
											<a href="${path}/profile/my_ex_reply?num=${reply_num}">${reply_num}</a>
										</c:if>
										<c:if test="${replyselect == reply_num}">
											<b style="font-weight: 700; color: red; text-decoration: underline;">${reply_num}</b>
										</c:if>
									</li>
								</c:forEach>
								<c:if test="${replypage.next}">
									<li>
										[<a href="${path}/profile/my_ex_reply?num=${replypage.endPageNum+1}">다음</a>]
									</li>
								</c:if>
							</ul>
						</div>
					</div>
					<!-- 댓글 탭 끝 -->
				</div>
			</div>
		</div>
		<!-- 개발코드 끝 -->
	</section>
	<%@ include file="../include/footer.jsp"%>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	function delete_check() {
		if (confirm("정말로 삭제하시겠습니까?")) {
			return true;

		} else {
			return false;
		}
	}
	
	$('.myex').attr('class', 'current');
</script>
</html>