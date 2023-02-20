<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ckeditor CDN -->
<!-- <script src="//cdn.ckeditor.com/4.20.1/standard/ckeditor.js"></script> -->
<!-- ckeditor resources -->
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<link rel="shortcut icon" href="${path}/resources/img/파비콘.png" type="image/x-icon">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
 integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
 integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<title>공지사항 글쓰기</title>
<link rel="stylesheet" href="${path}/resources/css/styles.css" />
<link rel="stylesheet" href="http://fonts.googleapis.com/icon?family=Material+Icons"/>
<link rel="stylesheet" 
href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<script>
	if(${loginUser == null}){
		alert("로그인 후 이용하세요");
		location.href = "/user/login";
	}
</script>
	<c:if test="${loginUser.userid != 'admin' }">
		<script>
		alert("잘못된 접근입니다.");
		location.href= "/";
		</script>
	</c:if>
<style>
.board_body {
    width: 1000px;
    min-height: 1000px;
    height: 100%;
    margin: 0 auto;
}
#cke_1_contents {
	height: 600px !important;
	resize: none !important; 
}

/* .banana .board_body article div:last-child{
	text-align: center;
	
} */

.btn-primary{
  background-color: #333333;
  color: #eee !important;
  cursor: pointer;
  border: none;
}
.btn-primary:hover,
.btn-primary:active,
.btn-primary:focus{
  background-color: #333333 !important;
  color: #eee !important;
  cursor: pointer;
  border: none !important;
}
a {
  text-decoration : none !important;
}
</style> 
</head>
<body>
<%@ include file="../include/header.jsp" %>
<section>
	<div class="banana">
		<div class="board_body" role="main">
	<article>
			<div class="title_box">
			<h2>공지사항 글쓰기</h2>
			</div>
			<form name="form" id="form" role="form" method="post" style="margin-top: 30px"; action="${pageContext.request.contextPath}/board/notiwrite">

				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="notice_title" id="notice_title" placeholder="제목을 입력해 주세요">
				</div>

				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="notice_contents" id="notice_contents" placeholder="내용을 입력해 주세요" ></textarea>
				</div>

			</form>
			<div style="text-align: right;">
				<button type="button" class="btn btn-sm btn-primary" id="btnSave" 
				 onclick="check();">작성완료</button>
				<!-- <button type="button" class="btn btn-sm btn-primary" id="btnList" >목록</button> -->
			</div>
	</article>
		</div>
	</div>
	</section>
<script>
	//ckeditor setting
    window.onload = function(){
       ck = CKEDITOR.replace("notice_contents");
    };
    
    function check(){
    	let title = $("#notice_title");
    	let iframe_body = $(".cke_wysiwyg_frame.cke_reset").contents().find(".cke_editable.cke_editable_themed.cke_contents_ltr.cke_show_borders");
    	let iframe= $(".cke_wysiwyg_frame.cke_reset").contents().find(".cke_editable.cke_editable_themed.cke_contents_ltr.cke_show_borders p");
    	let iframe_html = iframe.html();
    	let noti_content = $.trim(iframe_html);
    	if(title.val() == ""){
    		alert("제목을 입력하세요");
    		title.focus();
    		return false;
    	}
    	if(noti_content == "<br>"){
    		alert("내용을 입력하세요.");
    		iframe_body.focus();
    		return false;
    	}
    	
    	$("#form").submit();
    }
</script>
<%@ include file="../include/footer.jsp" %>
</body>

</html>

