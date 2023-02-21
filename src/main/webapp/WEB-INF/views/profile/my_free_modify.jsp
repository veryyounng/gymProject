<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ckeditor CDN -->
<script src="//cdn.ckeditor.com/4.20.1/standard/ckeditor.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="${path}/resources/css/styles.css" />
<link rel="stylesheet" href="http://fonts.googleapis.com/icon?family=Material+Icons" />
<link rel="shortcut icon" href="${path}/resources/img/파비콘.png" type="image/x-icon">
<title>자유 게시판</title>
<style>
#cke_1_contents {
	height: 600px !important;
	resize: none !important;
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
	<article>
		<div class="container" role="main">
			<h2 style="margin-top: 100px">자유 게시판 수정</h2>
			<form name="form" id="form" role="form" method="post" action="${path}/profile/my_free_modify" style="margin-top: 20px">
				<div class="mb-3">
					<label for="title">제목</label> <input type="text" class="form-control" name="b_title" value="${freedetail.b_title}">
					<input type="hidden" class="form-control" name="b_writer" value="${freedetail.b_writer}" readonly>
				</div>

				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control3" rows="5" name="b_content">${freedetail.b_content}</textarea>
				</div>
			</form>
			<div style="margin-bottom: 50px">
				<button type="button" class="btn btn-sm btn-primary" id="btnSave" onclick="document.getElementById('form').submit();">수정 완료</button>
				<!-- <button type="button" class="btn btn-sm btn-primary" id="btnList" >목록</button> -->
			</div>
		</div>
	</article>
	<%@ include file="../include/footer.jsp"%>

	<script>
		//ckeditor setting
		window.onload = function() {
			ck = CKEDITOR.replace("b_content");
		};
	</script>
</body>
</html>