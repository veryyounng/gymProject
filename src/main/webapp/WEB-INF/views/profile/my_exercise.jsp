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
<link rel="stylesheet" href="${path}/resources/css/styles.css">
<link rel="stylesheet" href="${path}/resources/css/notistyle.css">
<link rel="stylesheet" href="${path}/resources/css/free_list.css">
<style>
.side-bar {
	position: relative;
	top: -40px;
}

.banana {
	border: 1px solid black;
	height: 100%;
	margin: 0 auto;
	align-items: center;
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

.banana #contents .ul_news .etc #write_notice button {
	margin-left: -15px;
}

.banana #contents .ul_news .etc #write_notice .modify_btn {
	background-color: #eee;
	border-color: #ddd;
	color: black;
}

.deleteandwrite_btn {
	display: flex;
	justify-content: end;
	margin-left: -15px;
}
</style>
</head>

<body>
	<%@ include file="../include/header.jsp" %>
	<section>
		<!-- 사이드바 시작 -->
		<%@ include file="../include/profile_sidebar.jsp" %>
		<!-- 사이드바 끝 -->

		<!-- 개발코드 시작 -->
		<div class="banana">
			<div class="profile">
				<div class="profile_pic">
					<img src="${path}/resources/img/profile_pic.png" alt="프로필">
				</div>
				<div class="profile_intro">
					<span style="font-size: 25px; margin-bottom: 10px;">닉네임 님</span> <span
						style="font-size: 15px;">운동지식 공유 게시글 수: 개 / 댓글 수: 개</span>
				</div>
			</div>
			<div class="boardcontents">
				<div id="contents">
					<form name="form1" method="post" id="form1">
						<input type="hidden" name="table_name" value="notice_list">
						<ul class="ul_news_title">
							<div class=boardnum>
								<span class="board_num">번호</span>
							</div>
							<div class="title">
								<a><span>제목</span></a>
							</div>
							<div class="writer_id">
								<span class="">작성자</span>
							</div>
							<div class="data">
								<span class="date">작성일자</span>
							</div>
							<div class="view">
								<span class="view">조회수</span>
							</div>
							<div class="etc"></div>
						</ul>
						<ul class="ul_news">
							<div class=boardnum>
								<span class="board_num">10</span>
							</div>
							<div class="title">
								<a href="./free_board_context.html"><span>테스트10</span></a>
							</div>
							<div class="writer_id">
								<span class="">apple</span>
							</div>
							<div class="data">
								<span class="date">2023.01.05.</span>
							</div>
							<div class="view">
								<span class="view">1</span>
							</div>
							<div class="etc">
								<div id="write_notice">
									<button class="modify_btn">수정</button>
								</div>
								<div id="write_notice">
									<button>삭제</button>
								</div>
							</div>
						</ul>
						<ul class="ul_news">
							<div class=boardnum>
								<span class="board_num">9</span>
							</div>
							<div class="title">
								<span>테스트9</span>
							</div>
							<div class="writer_id">
								<span class="">apple</span>
							</div>
							<div class="data">
								<span class="date">2023.01.05.</span>
							</div>
							<div class="view">
								<span class="view">1</span>
							</div>
							<div class="etc">
								<div id="write_notice">
									<button class="modify_btn">수정</button>
								</div>
								<div id="write_notice">
									<button>삭제</button>
								</div>
							</div>
						</ul>
						<ul class="ul_news">
							<div class=boardnum>
								<span class="board_num">8</span>
							</div>
							<div class="title">
								<span>테스트8</span>
							</div>
							<div class="writer_id">
								<span class="">apple</span>
							</div>
							<div class="data">
								<span class="date">2023.01.05.</span>
							</div>
							<div class="view">
								<span class="view">1</span>
							</div>
							<div class="etc">
								<div id="write_notice">
									<button class="modify_btn">수정</button>
								</div>
								<div id="write_notice">
									<button>삭제</button>
								</div>
							</div>
						</ul>
						<ul class="ul_news">
							<div class=boardnum>
								<span class="board_num">7</span>
							</div>
							<div class="title">
								<span>테스트7</span>
							</div>
							<div class="writer_id">
								<span class="">apple</span>
							</div>
							<div class="data">
								<span class="date">2023.01.05.</span>
							</div>
							<div class="view">
								<span class="view">1</span>
							</div>
							<div class="etc">
								<div id="write_notice">
									<button class="modify_btn">수정</button>
								</div>
								<div id="write_notice">
									<button>삭제</button>
								</div>
							</div>
						</ul>
						<ul class="ul_news">
							<div class=boardnum>
								<span class="board_num">6</span>
							</div>
							<div class="title">
								<span>테스트6</span>
							</div>
							<div class="writer_id">
								<span class="">apple</span>
							</div>
							<div class="data">
								<span class="date">2023.01.05.</span>
							</div>
							<div class="view">
								<span class="view">1</span>
							</div>
							<div class="etc">
								<div id="write_notice">
									<button class="modify_btn">수정</button>
								</div>
								<div id="write_notice">
									<button>삭제</button>
								</div>
							</div>
						</ul>
						<ul class="ul_news">
							<div class=boardnum>
								<span class="board_num">5</span>
							</div>
							<div class="title">
								<span>테스트5</span>
							</div>
							<div class="writer_id">
								<span class="">apple</span>
							</div>
							<div class="data">
								<span class="date">2023.01.05.</span>
							</div>
							<div class="view">
								<span class="view">1</span>
							</div>
							<div class="etc">
								<div id="write_notice">
									<button class="modify_btn">수정</button>
								</div>
								<div id="write_notice">
									<button>삭제</button>
								</div>
							</div>
						</ul>
						<ul class="ul_news">
							<div class=boardnum>
								<span class="board_num">4</span>
							</div>
							<div class="title">
								<span>테스트4</span>
							</div>
							<div class="writer_id">
								<span class="">apple</span>
							</div>
							<div class="data">
								<span class="date">2023.01.05.</span>
							</div>
							<div class="view">
								<span class="view">1</span>
							</div>
							<div class="etc">
								<div id="write_notice">
									<button class="modify_btn">수정</button>
								</div>
								<div id="write_notice">
									<button>삭제</button>
								</div>
							</div>
						</ul>
						<ul class="ul_news">
							<div class=boardnum>
								<span class="board_num">3</span>
							</div>
							<div class="title">
								<span>테스트3</span>
							</div>
							<div class="writer_id">
								<span class="">apple</span>
							</div>
							<div class="data">
								<span class="date">2023.01.05.</span>
							</div>
							<div class="view">
								<span class="view">1</span>
							</div>
							<div class="etc">
								<div id="write_notice">
									<button class="modify_btn">수정</button>
								</div>
								<div id="write_notice">
									<button>삭제</button>
								</div>
							</div>
						</ul>
						<ul class="ul_news">
							<div class=boardnum>
								<span class="board_num">2</span>
							</div>
							<div class="title">
								<span>테스트2</span>
							</div>
							<div class="writer_id">
								<span class="">apple</span>
							</div>
							<div class="data">
								<span class="date">2023.01.05.</span>
							</div>
							<div class="view">
								<span class="view">1</span>
							</div>
							<div class="etc">
								<div id="write_notice">
									<button class="modify_btn">수정</button>
								</div>
								<div id="write_notice">
									<button>삭제</button>
								</div>
							</div>
						</ul>
						<ul class="ul_news">
							<div class=boardnum>
								<span class="board_num">1</span>
							</div>
							<div class="title">
								<span>테스트1</span>
							</div>
							<div class="writer_id">
								<span class="">apple</span>
							</div>
							<div class="data">
								<span class="date">2023.01.05.</span>
							</div>
							<div class="view">
								<span class="view">1</span>
							</div>
							<div class="etc">
								<div id="write_notice">
									<button class="modify_btn">수정</button>
								</div>
								<div id="write_notice">
									<button>삭제</button>
								</div>
							</div>
						</ul>
					</form>
				</div>
				<div class="deleteandwrite_btn">
					<div id="write_notice">
						<button>전체 삭제</button>
					</div>
					<div id="write_notice">
						<button>글쓰기</button>
					</div>
				</div>
				<div class="btns">
					<ul class="pagination">
						<li class='active'><a href='#'>1</a></li>
						<li class='active'><a href='#'>2</a></li>
						<li class='active'><a href='#'>3</a></li>
						<li class='active'><a href='#'>4</a></li>
						<li class='active'><a href='#'>5</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- 개발코드 끝 -->
	</section>
	<%@ include file="../include/footer.jsp" %>
</body>
<script src="${path}/resources/js/header.js"></script>
</html>