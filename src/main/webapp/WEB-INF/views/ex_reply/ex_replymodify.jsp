<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<!-- ckeditor CDN -->
<script src="//cdn.ckeditor.com/4.20.1/standard/ckeditor.js"></script>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
 integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
 integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link rel="stylesheet" href="http://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="${path}/resources/css/free_styles.css">
<link rel="stylesheet" href="${path}/resources/css/index.css">
<link rel="stylesheet" href="${path}/resources/css/free_content.css">
<link rel="shortcut icon" href="${path}/resources/img/파비콘.png" type="image/x-icon">

<title>운동지식공유 게시판</title>

</head>

<body>
<%@ include file="../include/header.jsp" %>
	<article>
		<div class="container" role="main">

			<h2>운동지식공유 게시판 댓글 수정</h2>
			<br>
	
	<div>
		
		<form method="post" action="/ex_reply/ex_replymodify">
			<p>
				<label>댓글 작성자</label> <input type="text" name = "exc_writer" readonly value = "${ex_reply.exc_writer }">
			</p>
			<p>
				<textarea rows="5" cols="50" name = "exc_contents">${ex_reply.exc_contents}</textarea>
			</p>
			<p>
				<input type="hidden" name = "ex_num" value = "${ex_reply.ex_num}">
				<input type="hidden" name = "exc_num" value = "${ex_reply.exc_num}">
				<button type = "submit">댓글 수정</button>
			</p>
		</form>
		
	</div>
	<!-- 댓글 끝 -->
		</div>
		
	</article>
	
<%@ include file = "../include/footer.jsp" %>

</body>

</html>

