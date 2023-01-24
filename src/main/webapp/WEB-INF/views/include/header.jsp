<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    <header>
		<div class="header-menu">
			<div onclick="getIndex();">
				<!-- 누르면 index로 이동 -->
				<img src="${path}/resources/img/파비콘.png" alt=""/> <img
					src="${path}/resources/img/logo_text.png" alt=""/>
			</div>
			<div>
				<div class="dropdown company" onmouseover="companyhover()"
					onmouseout="companyhoverout()">
					<div class="dropbtn" id="company">회사</div>
					<div class="dropdown-content">
						<a href="/company/company">회사소개</a>
					</div>
				</div>
				<div class="dropdown program" onmouseover="programhover()"
					onmouseout="programhoverout()">
					<div class="dropbtn" id="program">프로그램</div>
					<div class="dropdown-content">
						<a href="/program/programid">프로그램 소개</a> <a href="/reservation/search">예약</a>
					</div>
				</div>
				<div class="dropdown community" onmouseover="communityhover()"
					onmouseout="communityhoverout()">
					<div class="dropbtn" id="community">커뮤니티</div>
					<div class="dropdown-content">
						<a href="/board/notice?num=1">공지사항</a> <a href="/free/freelist?num=1">자유게시판</a> <a href="/ex_board/ex_list?num=1">운동지식공유</a>
					</div>
				</div>
				<div class="dropdown help" onmouseover="helphover()"
						onmouseout="helphoverout()">
					<div class="dropbtn" id="help">고객센터</div>
					<div class="dropdown-content">
						<a href="/faq/faq_index">자주하는질문</a> <a href="/contactus/email_index">문의하기</a> <a href="/map/map_index">오시는길</a>
					</div>
				</div>
				<c:choose>
					<c:when test="${loginUser == null}">
						<a id="loginview" href="${path}/user/login">로그인/회원가입</a>
					</c:when>
					<c:otherwise>
						<a href="${path}/profile/profile_check">마이페이지 | </a>
						<a href="${path}/user/logout">로그아웃</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</header>
	<script src="${path}/resources/js/header.js"></script>