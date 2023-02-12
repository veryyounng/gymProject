<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<!-- ckeditor CDN -->
<!-- <script src="//cdn.ckeditor.com/4.20.1/standard/ckeditor.js"></script> -->

<!-- ckeditor resources -->
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
 integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
 integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<link rel="stylesheet" 
href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="${path}/resources/css/styles.css" />
<link rel="stylesheet" href="http://fonts.googleapis.com/icon?family=Material+Icons"/>
<link rel="shortcut icon" href="${path}/resources/img/파비콘.png" type="image/x-icon">

<title>운동지식공유 게시판</title>

<style>
#cke_1_contents{
	height: 600px !important;
	resize: none !important;
	}
	a {
	text-decoration:none !important;
	}
</style>
</head>

<body>
<%@ include file="../include/header.jsp" %>
	<c:if test="${loginUser == null }">
		<script>
			alert("로그인 후 이용하세요!");
			location.href = '${cp}/user/login';
		</script>
	</c:if>
	<article>
		<div class="container" role="main">

			<h2 style="margin-top: 100px">운동지식공유 게시판 글쓰기</h2>
			<form name="form" id="form" role="form" method="post" style= "margin-top: 20px"
			action="${pageContext.request.contextPath}/ex_board/ex_write">

				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="ex_title" id="ex_title" placeholder="제목을 입력해 주세요">
				</div>

				<input type="hidden" class="form-control" name="ex_writer" value="${loginUser.userid }" >

				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="ex_content" id="ex_content" placeholder="내용을 입력해 주세요" ></textarea>
				</div>

			</form>
			<div style="margin-bottom: 50px">
				<button type="button" class="btn btn-sm btn-primary" id="btnSave"
				 onclick="check();">작성완료</button>
				<!-- <button type="button" class="btn btn-sm btn-primary" id="btnList" >목록</button> -->
			</div>
		</div>

	</article>
<%@ include file="../include/footer.jsp" %>
	
<script>
	//ckeditor setting
    window.onload = function(){
       ck = CKEDITOR.replace("ex_content");
    };
    
    function check(){
    	let title = $("#ex_title");
    	if(title.val() == ""){
    		alert("제목을 입력하세요.");
    		title.focus();
    		return false;
    	}
    	
    	if(confirm("게시물을 등록하시겠습니까?")){
    		$("#form").submit();
    	}else{
    		return false;
    	}
    }
    
   
</script>

</body>

</html>

