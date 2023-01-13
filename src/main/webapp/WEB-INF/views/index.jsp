<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="${path}/resources/img/파비콘.png" type="image/x-icon">
<!-- SWIPER -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<link rel="stylesheet"
	href="http://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<title>우리동네 올림픽</title>

<link rel="stylesheet" href="${path}/resources/css/styles.css">
<link rel="stylesheet" href="${path}/resources/css/index.css">
</head>
<body>
	<%@ include file="./include/header.jsp"%>
	<!-- 본문 시작 -->
	<div class="container" id="container">
		<div class="top_img" id="main_img">
			<div class="main_img2">
				<div id="top_img2"></div>
				<div id="top_img1"></div>
				<div id="top_img"></div>
			</div>
		</div>
		<div class="main_box">
			<div class="noti_box">
				<div class="material-symbols-outlined notice plusicon"
					onclick="more();">add</div>
				<div class="main_title">
					<div id="noti_box_notice" class="focus_board"
						onclick="boardnotice();ntt();">공지사항</div>
					<div id="free_board" onclick="boardfreeb();ftt();">자유게시판</div>
					<div id="ex_board" onclick="boardexboard();ett();">운동지식공유</div>

				</div>
				<div id="noti_subbox">
					<div class="focus_boardcontents">
						<table id="notice_table">
							<tr>
								<td>공지사항 제목</td>
								<td>등록일</td>
							</tr>

						</table>
						<table id="free_table" style="display: none;">
							<tr>
								<td>자유게시판 제목</td>
								<td>등록일</td>
							</tr>
						</table>
						<table id="ex_table" style="display: none;">
							<tr>
								<td>운동지식공유 제목</td>
								<td>등록일</td>
							</tr>
						</table>
					</div>
				</div>
			</div>

			<div class="go">
				<div class="rsvn_go"></div>
				<div class="shop_go"></div>
			</div>

		</div>
		<div class="swiper">
			<div class="swiper-wrapper" onclick="location.href=''">
				<div class="swiper-slide img1">
					<div class="pic" id="HY"></div>
				</div>
				<div class="swiper-slide img2">
					<div class="pic" id="DY"></div>
				</div>
				<div class="swiper-slide img3">
					<div class="pic" id="YC"></div>
				</div>
				<div class="swiper-slide img4">
					<div class="pic" id="SY"></div>
				</div>
				<div class="swiper-slide img5">
					<div class="pic" id="CS"></div>
				</div>
				<div class="swiper-slide img6">
					<div class="pic" id="SW"></div>
				</div>
			</div>

			<div class="swiper-pagination"></div>

			<div class="swiper-button-prev">
				<div class="material-icons">arrow_back</div>
			</div>
			<div class="swiper-button-next">
				<div class="material-icons">arrow_forward</div>
			</div>
		</div>
	</div>
	<%@ include file="./include/footer.jsp"%>
</body>

<script src="resources/js/index.js"></script>
</html>