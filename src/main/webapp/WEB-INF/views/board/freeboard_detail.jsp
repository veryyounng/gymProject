<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>

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
    <script>
 
       function delete_check(){
    	   if(confirm("정말로 삭제하시겠습니까?")){
    		   return true;
    		   
    	   } else {
    		   return false;
    	   }
       }

       function replyCheck(){
    	   let reply_writer = $("#c_writer").val();
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
    		   $("#replyform").submit();
    	   }
       }
     </script>
     
</head>
<body>
   <%@ include file="../include/header.jsp" %>
   <div class="banana">
       <div class="board_body">
       
            <div class="title_box">
              <h2>자유 게시판</h2>
            </div>
         		<div id="title_box2">
        			<div class="view_title" id="b_title" name="b_title"> ${freedetail.b_title}</div>
        			<div class="cnt_date_writer" >
          				<div class="writer" id="b_writer" name="b_writer">작성자: ${freedetail.b_writer}</div>
          				<div class="view_date" id="b_date" name="b_date"> 작성일 : <fmt:formatDate value="${freedetail.b_date}" pattern="yy-MM-dd HH:mm"/></div>
          				
          				<div class="view_cnt" id="view_cnt" name="view_cnt">조회수: ${freedetail.view_cnt}</div>
        				<input type="hidden" name="b_num" value="${freedetail.b_num}">
        			</div>
      			</div>

         <div class="view_content" id="b_content" name="b_content">
           ${freedetail.b_content}<br>
         </div>
      		<div class="btns">
        		<a class="btn_back" href="/free/freelist?searchType=T&keyword=${keyword}&num=${select}">목록</a>
         	<c:if test="${freedetail.b_writer == loginUser.userid}">
        		<a class="btn_modi" href="/free/freemodify?b_num=${freedetail.b_num}">수정</a>
            <form  method="post" action="${cp}/free/freedelete" id="deleteForm" name="deleteForm">
            	<input type="hidden" value="${freedetail.b_num}" name="b_num">
            	<input class="btn_delete" type="submit" value="삭제" onclick="return delete_check();" id="btn_delete">
        	</form>
      		</c:if>
      		</div>

      	<form action="/free/replywrite" name="replyform" id="replyform" method="post">
      	 <ul class="reply_textbox">
        	<div class="reply_textbox2">
          <div class="reply_wr">
            <label class="reply_writer">댓글 작성자</label> <input style="width:90px; padding:0 5px;" type="text" value="${loginUser.userid}" id="c_writer" name="c_writer" readonly>
          </div>
          <div>
            <textarea rows="5" cols="50" class="reply_text" style="resize:none;" name="c_contents"></textarea>
            <input type="hidden" value="${freedetail.b_num}" name="b_num"/>
          </div>
          <div>
            <button type="button" class="reply_btn" onclick="replyCheck();">댓글 작성</button>
          </div>
        </div>
        </form>

			<c:forEach items="${reply}" var="free_reply">
        		<li class="reply">
          			<div class="free_reply_div1">
            			<p> ${free_reply.c_writer} · 
            			<fmt:formatDate value="${free_reply.c_date}" pattern="yyyy.MM.dd HH:mm:ss" /></p>  
            			<p>${free_reply.c_contents}</p>
            		<div class="free_reply_div2">
            			<c:if test="${free_reply.c_writer == loginUser.userid}">
        					<a class="free_reply_modify" href="">수정</a>
            				<form  method="post" action="" id="" name="">
            					<input type="hidden" value="${free_reply.c_num}" name="c_num">
            					<input class="free_reply_delete" type="submit" value="삭제" onclick="" id="">
        					</form>
      					</c:if>
      				</div>
          			</div>
          		</li>
          	</c:forEach>
			
			<div class="btns">
					<ul class="pagination" style="display:flex;">
						<c:if test="${page.prev}">
							<li style="margin-right:5px;">[<a href='/free/freedetail?b_num=${freedetail.b_num}&reply_num=${page.startPageNum-1}'>이전</a>]
							</li>
						</c:if>
						<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
							var="num">
							<li style="margin-right:5px;"><c:if test="${select != num}">
									<a href="/free/freedetail?b_num=${freedetail.b_num}&reply_num=${num}">${num}</a>
								</c:if> <c:if test="${select == num}">
									<b
										style="font-weight: 700; color: red; text-decoration: underline;">${num}</b>
								</c:if></li>
						</c:forEach>
						<c:if test="${page.next}">
							<li>[<a href="/free/freedetail?b_num=${freedetail.b_num}&reply_num=${page.endPageNum+1}">다음</a>]
							</li>
						</c:if>
					</ul>
				</div>
        
      </ul>
    </div>
  </div>

  <%@ include file = "../include/footer.jsp" %>
</body>
</html>