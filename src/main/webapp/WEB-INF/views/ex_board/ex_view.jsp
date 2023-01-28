<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<title>운동지식공유 게시판</title>

<style>

body {
  padding-top: 70px;
  padding-bottom: 30px;
}

</style>
</head>

<body>
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
		
				<div class="mb-3">
					<a href="/ex_board/ex_modify?ex_num=${ex_view.ex_num}">게시물 수정</a>
					<a href="/ex_board/ex_delete?ex_num=${ex_view.ex_num}">게시물 삭제</a>
				</div>
				
				<ul>
				    <li>
				        <div>
				            <p>첫번째 댓글 작성자</p>
				            <p>첫번째 댓글</p>
				        </div>
				    </li>
				    <li>
				        <div>
				            <p>두번째 댓글 작성자</p>
				            <p>두번째 댓글</p>
				        </div>
				    </li>
				    <li>
				        <div>
				            <p>세번째 댓글 작성자</p>
				            <p>세번째 댓글</p>
				        </div>
				    </li>
				</ul>
				
		</div>
		
	</article>
	
<script>
	//ckeditor setting
    window.onload = function(){
       ck = CKEDITOR.replace("ex_content");
    };
    
    //읽기 전용으로 만들기
    $("#ex_title").attr("disabled",true);
    $("#ex_writer").attr("disabled",true);
    $("#ex_content").attr("disabled",true);
   
</script>

</body>

</html>

