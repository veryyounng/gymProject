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

<style>
    #btn_delete{
    border: 1px solid #dddddd;
  	width: 80px;
  	height: 40px;
  	display: flex;
  	align-items: center;
  	justify-content: center;
  	cursor: pointer;
  	vertical-align: top;
  	background-color: white;
    }
    #btn_delete:hover{
	color: #000;
  	background-color: rgb(242, 242, 242);
	}
</style>

</head>

<title>운동지식공유 게시판</title>

</head>

<body>
	<%@ include file="../include/header.jsp" %>
	<div class="banana">
       <div class="board_body">

			<!-- 제목 -->
			<div class="title_box">
				<h2>운동지식공유 게시판 </h2>
			</div>

			<!-- 게시물 정보 -->				
			<div class="title_box2">
				<div class="view_title" id="ex_title" name="ex_title"> ${ex_view.ex_title}</div>
				<div class="cnt_date_writer" >
					<div class="writer" id="ex_writer" name="ex_writer">작성자 : ${ex_view.ex_writer}</div>
					<div class="view_date" id="ex_date" name="ex_date"> 작성일 : <fmt:formatDate value="${ex_view.ex_date}" pattern="yyyy-MM-dd HH:mm"/></div>
					<div class="view_cnt" id="view_cnt" name="view_cnt">조회수 : ${ex_view.view_cnt}</div>
					<input type="hidden" name="ex_num" id="ex_num" value="${ex_view.ex_num}">
				</div>
			</div>
			<hr style = "margin-top : -1px">

			<!-- 본문 -->
			<div class="view_content">
				${ex_view.ex_content}
			</div>
				
			<div class="btns">
				<a class="btn_back" href="/profile/my_ex?num=${select}">목록</a>
				
				<!-- 수정 / 삭제버튼 표시 -->
				<c:if test="${ex_view.ex_writer == loginUser.userid}">
					<a class="btn_modi" a href="/profile/my_ex_modify?ex_num=${ex_view.ex_num}">수정</a>
					<form method="post" action="${cp}/profile/my_ex_delete" id="ex_delete" name="ex_delete">
						<input type="hidden" value="${ex_view.ex_num}" name="ex_num">
						<input class="btn_delete" type="submit" value="삭제" id="btn_delete" onclick="return delete_check();">
					</form>
				</c:if>
			</div>
			<br>

			<!-- 댓글 시작 -->
			<form method="post" action="/ex_reply/exc_write" name="ex_replyform" id="ex_replyform">
				<ul class="reply_textbox">
        			<div class="reply_textbox2">
						<div class="reply_wr">
            				<label class="reply_writer">댓글 작성자</label>
            				<input style="width:90px; padding:0 5px;" type="text" value="${loginUser.userid}" id="exc_writer" name="exc_writer" readonly>
          				</div>
						<div>
	            			<textarea rows="5" cols="50" class="reply_text" style="resize:none;" name="exc_contents"></textarea>
	            			<input type="hidden" value="${ex_view.ex_num}" name="ex_num" >
						</div>
						<div>
	           	 			<button type="button" class="reply_btn" onclick="replyCheck();">댓글 작성</button>
						</div>
					</div>
				</ul>
			</form>
	
			<!-- 댓글 보기 -->
			<c:forEach items="${ex_reply}" var="ex_reply">
				<li class="reply" id="reply${ex_reply.exc_num}">
					<div class="free_reply_div1 reply${ex_reply.exc_num}">
						<p>${ex_reply.exc_writer} · <fmt:formatDate value="${ex_reply.exc_date}" pattern="yyyy.MM.dd HH:mm:ss" /></p>
						<p>${ex_reply.exc_contents}</p>
						<div class="free_reply_div2">
							<!-- 댓글 수정 삭제 -->
							<c:if test="${ex_reply.exc_writer == loginUser.userid}">
								<a class="free_reply_modify" id="ex_reply_modireply${ex_reply.exc_num}" href="${ex_reply.exc_num}">수정</a>
								<%-- <a class="free_reply_modify" href="/ex_reply/ex_replymodify?ex_num=${ex_view.ex_num}&exc_num=${ex_reply.exc_num}">수정</a> --%>
								<form method="post" action="${cp}/ex_reply/ex_replydelete?ex_num=${ex_view.ex_num}&exc_num=${ex_reply.exc_num}" id="ex_replydelete" name="ex_replydelete">
									<input type="hidden" value="${ex_reply.exc_num}" name="exc_num">
									<input type="hidden" value="${select}" name="select">
									<input type="hidden" value="${ex_reply.ex_num}" name="ex_num">
									<input class="free_reply_delete" type="submit" value="삭제" id="" onclick="return reply_delete();">
								</form>
							</c:if>
						</div>
					</div>
				</li>
			</c:forEach>

			<!-- 댓글 페이징 -->
			<div class="btns">
				<ul class="pagination" style="display:flex;">
					<c:if test="${erpage.prev}">
						<li style="margin-right:5px;">
							[<a href='/profile/my_ex_detail?ex_num=${ex_view.ex_num}&reply_num=${erpage.startPageNum-1}'>이전</a>]
						</li>
					</c:if>
					<c:forEach begin="${erpage.startPageNum}" end="${erpage.endPageNum}" var="num">
						<li style="margin-right:5px;">
							<c:if test="${select != num}">
								<a href="/profile/my_ex_detail?ex_num=${ex_view.ex_num}&reply_num=${num}">${num}</a>
							</c:if>
							<c:if test="${select == num}">
								<b style="font-weight: 700; color: red; text-decoration: underline;">${num}</b>
							</c:if>
						</li>
					</c:forEach>
					<c:if test="${erpage.next}">
						<li>
							[<a href="/profile/my_ex_detail?ex_num=${ex_view.ex_num}&reply_num=${erpage.endPageNum+1}">다음</a>]
						</li>
					</c:if>
				</ul>
			</div>
			<!-- 댓글 끝 -->

		</div>
	</div>
	
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
   
    //삭제 체크
    function delete_check(){
    	if(confirm("게시물을 삭제하시겠습니까?")){
    		return true;
    	} else {
    		return false;
    	}
    }

    //댓글 체크
    function replyCheck(){
 	   let reply_writer = $("#exc_writer").val();
 	   let reply_content = $(".reply_text").val();
 	   if(reply_writer == ""){
 		   alert("로그인 후 이용하세요!");
 		   return false;
 	   }
 	   if(reply_content == ""){
 		   alert("댓글을 입력하세요.");
 		   return false;
 	   }
 	   if(confirm("댓글을 등록하시겠습니까?")){
 		   $("#ex_replyform").submit();
 	   }
    }
    
    //댓글 삭제 체크
    function reply_delete(){
 	   if(confirm("정말로 삭제하시겠습니까?")){
 		   return true;
 	   } else {
 	   return false;
 	   }
    }
    
    //댓글 수정 ajax
    	$('.free_reply_modify').on("click",updateviewBtn);
        function updateviewBtn(e){
    	   
			e.preventDefault();
			let exc_num = $(this).attr("href");
			let replyModi = $(".reply"+exc_num);
			let ex_num = $("#ex_num").val();
			let reply_num = ${select};
    	   
			$.ajax({
        	   url: "exc_modiview",
        	   type: "POST",
        	   data: {"exc_num": exc_num},
        	   success : function(result){
        		   replyModi.empty();
        		   var commentsview = "";
        		   commentsview += '<form action="/ex_board/exc_modireply" name="replymodiform" id="replymodiform" method="post">';
                   commentsview += '<ul class="reply_textbox">';
                   commentsview += '<div class="reply_textbox2" style="border:none;">';
                   commentsview += '<div class="reply_wr">';
                   commentsview += '<label class="reply_writer">';
                   commentsview += '<p>'+ result.exc_writer;
                   
                   commentsview += '</p>';
                   commentsview += '</div>';
                   commentsview += '<textarea rows="5" cols="50" class="reply_text2" style="resize:none;" id="reply_modify" name="exc_contents">';
                   commentsview += 	result.exc_contents;
                   commentsview += '</textarea>';
                   commentsview += '<input type="hidden" value="'+ result.exc_num + '" name="exc_num" />';
                   commentsview += '<input type="hidden" value="'+ reply_num + '" name="reply_num" />';
                   commentsview += '<input type="hidden" value="'+ ex_num + '" name="ex_num" />';
                   commentsview += '</div>';
                   commentsview += '<div>';
                   commentsview += '<button type="button" class="reply_btn" onclick="replyModiCheck();">';
                   commentsview += '수정완료';
                   commentsview += '</button>';
                   commentsview += '</div>';
                   commentsview += '</div>';
                   commentsview += '</form>';
                   replyModi.append(commentsview);
        	   },
        	   error: function(request, error){
               	console.log("ajax 실패");
               	console.log("code:"+request.status+"\n"+"message"+request.responseText+"\n"+"error:"+error);
               }

        })
       } 
        
        function replyModiCheck(){
        	if($("#reply_modify").val() == "") {
        		alert("댓글을 입력해주세요.");
        		return false;
        	} 
        	$("#replymodiform").submit();
        	
        }
    
    
</script>

</body>

</html>

