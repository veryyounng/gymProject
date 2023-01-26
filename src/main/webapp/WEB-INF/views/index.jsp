<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script>
function loading(){
	alert("준비중 입니다.");
}
</script>

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
 						<c:forEach items="${nnews}" var= "list" >
							<tr onclick="location.href='/board/notidetail?notice_num=${list.notice_num}&keyword=&num=1'">
									<td>${list.notice_title}</td>
									<td><fmt:formatDate
									value="${list.notice_date}" pattern="yyyy-MM-dd" /></td>
							</tr>
 						</c:forEach>
						</table>
						<table id="free_table" style="display: none;">
						<c:forEach items="${fnews}" var="list">
							<tr onclick="location.href='/free/freedetail?b_num=${list.b_num}'">
								<td>${list.b_title}</td>
								<td><fmt:formatDate
									value="${list.b_date}" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
						</table>
						<table id="ex_table" style="display: none;">
						<c:forEach items="${enews}" var="list">
							<tr onclick="location.href='/ex_board/ex_list?ex_num=${list.ex_num}'">
								<td>${list.ex_num}</td>
								<td><fmt:formatDate 
								value="${list.ex_date}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
						</table>
					</div>
				</div>
			</div>
  
			<div class="go">
				<div class="rsvn_go" onclick="location.href='/reservation/search'"></div>
				<div class="shop_go" onclick= 'loading();'></div>
			</div>

		</div>
		<div class="swiper">
			<div class="swiper-wrapper" onclick="location.href='/program/programid'">
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