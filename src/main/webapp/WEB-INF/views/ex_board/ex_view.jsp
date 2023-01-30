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

			<h2>운동지식공유 게시판 게시물 보기</h2>
			<br>
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="ex_title" id="ex_title" value="${ex_view.ex_title}" >
				</div>

				<div class="mb-3">
					<label for="reg_id">작성자</label>
					<input type="text" class="form-control" name="ex_writer" id="ex_writer" value="${ex_view.ex_writer}" >
				</div>

				<div class="mb-3">
					<label for="content">내용</label>
					<textarea rows="5" class="form-control" name="ex_content" id="ex_content" >${ex_view.ex_content}</textarea>
				</div>
				
				<c:if test="${ex_view.ex_writer == loginUser.userid}">
					<div class="mb-3">
						<a href="/ex_board/ex_modify?ex_num=${ex_view.ex_num}">게시물 수정</a>
						<form method = "post" action="${cp}/ex_board/ex_delete" id = "ex_delete" name = "ex_delete">
							<input type = "hidden" value = "${ex_view.ex_num}" name = "ex_num">
							<input class="btn_delete" type="submit" value="삭제" id="btn_delete" onclick = "return delete_check();">
						</form>
					</div>
				</c:if>

	<!-- 댓글 시작 -->
	<c:forEach items = "${ex_reply}" var = "ex_reply">
		<li>
			<div>
				<p>[작성자] : ${ex_reply.exc_writer} [작성시간] <fmt:formatDate value="${ex_reply.exc_date}" pattern = "yyyy-MM-dd HH:mm" /></p>
				<p>[댓글내용] <br> ${ex_reply.exc_contents}</p>
				
				<p>
					<a href="/ex_reply/ex_replymodify?ex_num=${ex_view.ex_num}&exc_num=${ex_reply.exc_num}">수정</a> / <a href="">삭제</a>
				</p>
				
				<hr />
				
			</div>
		</li>
	</c:forEach>
	
	<div>
		
		<form method="post" action="/ex_reply/exc_write">
			<p>
				<label>댓글 작성자</label> <input type="text" name = "exc_writer" value = "${loginUser.userid}">
			</p>
			<p>
				<textarea rows="5" cols="50" name = "exc_contents"></textarea>
			</p>
			<p>
				<input type="hidden" name = "ex_num" value = "${ex_view.ex_num}">
				<button type = "submit">댓글 작성</button>
			</p>
		</form>
		
	</div>
	<!-- 댓글 끝 -->
		</div>
		
	</article>
	
<%@ include file = "../include/footer.jsp" %>
	
<script>
	//ckeditor setting
    window.onload = function(){
       ck = CKEDITOR.replace("ex_content");
    };
    
    //읽기 전용으로 만들기
    $("#ex_title").attr("disabled",true);
    $("#ex_writer").attr("disabled",true);
    $("#ex_content").attr("disabled",true);
   
    function delete_check(){
    	if(confirm("게시물을 삭제하시겠습니까?")){
    		return true;
    	} else {
    		return false;
    	}
    }
    
    
    
    
</script>

</body>

</html>

