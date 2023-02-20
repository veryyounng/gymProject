<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="shortcut icon" href="${path}/resources/img/파비콘.png" type="image/x-icon">
<link rel="stylesheet" href="${path}/resources/css/reset.css" />
<link rel="stylesheet" href="${path}/resources/css/styles.css" />
<link rel="stylesheet" href="${path}/resources/css/notistyle.css" />
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<!-- 개발코드 시작 -->
	<section>
		<div class="banana">
			<div class="board_body">
				<div class="title_box">
					<h2>공지사항</h2>
				</div>
				<div class="noti_header">
					<div class="noti_header_box">
						<div class="mgt_10">
							총 <strong>${page.count}</strong>건의 게시물이 있습니다.
						</div>
					</div>
					<div class="noti_header_box txt_right">
						<form name="s_form" id="search" action="/board/notice" method="get">
							<input id ="search_box" name="keyword" value="${keyword}" maxlength=50 type="text"
								placeholder="검색어 입력">
								<input type="hidden" name="num" value="1"/>
							<input class="btn_primary" type="submit" value= "검색"/>
						</form>
					</div>
				</div>
				<c:choose>
					<c:when test="${fn:length(contents) != 0}">
					<c:forEach items="${contents}" var="list">
							<ul class="ul_news">
								<div class="title" title="${list.notice_title}">
									<span class="label_list">공지사항</span> <a
		                        href="/board/notidetail?notice_num=${list.notice_num}&keyword=${keyword}&num=${select}">${list.notice_title}</a>
								</div>
								<div class="data">
									<span class="date"><fmt:formatDate
											value="${list.notice_date}" pattern="yyyy-MM-dd" /></span>
								</div>
							</ul>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div style="display:flex; align-items:center; justify-content:center; width:1000px; height:640px; margin:auto; border-bottom:2px solid #333333; font-size:17px;">
							검색결과가 없습니다.
						</div>
					</c:otherwise>
				</c:choose>
				<c:if test="${loginUser.userid == 'admin'}">
					<div id="write_notice" onclick="location.href='/board/notiwrite'">
						<button>글쓰기</button>
					</div>
					
				</c:if>
				<div class="btns">
					<ul class="pagination">
						<c:if test="${page.prev}">
							<li>[<a href="/board/notice?keyword=${keyword}&num=${page.startPageNum - 1}">이전</a>]</li>
						</c:if>
						<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
							<li>
								<c:if test="${select != num}">
									<a href="/board/notice?keyword=${keyword}&num=${num}">${num}</a>
								</c:if>
								<c:if test="${select == num}"> 
									<b id="page_select">${num}</b>
								</c:if> 
							</li>
						</c:forEach>
						<c:if test="${page.next}">
							<li>[<a href="/board/notice?keyword=${keyword}&num=${page.endPageNum + 1}">다음</a>]</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>

	</section>
	<!-- 개발코드 끝 -->
	<%@ include file="../include/footer.jsp"%>
</body>
</html>