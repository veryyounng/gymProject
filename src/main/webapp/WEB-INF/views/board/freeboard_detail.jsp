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
     <link rel="stylesheet" href="http://fonts.googleapis.com/icon?family=Material+Icons">
     <link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="${path}/resources/css/free_styles.css">
    <link rel="stylesheet" href="${path}/resources/css/index.css">
    <link rel="stylesheet" href="${path}/resources/css/free_content.css">
    <link rel="shortcut icon" href="${path}/resources/img/파비콘.png" type="image/x-icon">
    
    <script>
       function getIndex() {
            location.href = './index.html';
       }
       
       function delete_check(){
    	   if(confirm("정말로 삭제하시겠습니까?")){
    		   return true;
    	   } else {
    		   return false;
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
        <div class="view_title"> ${freedetail.b_title}</div>
        <div class="cnt_date_writer">
 
          <div class="writer">작성자: ${freedetail.b_writer}</div>
          <div class="view_date"> 작성일 : <fmt:formatDate
									value="${freedetail.b_date}" pattern="yy-MM-dd HH:mm" /></div>
          <div class="view_cnt">조회수: ${freedetail.view_cnt}</div>
        </div>
      </div>
      <!--<div class="view_date"> <i class="fas fa-paperclip"></i>
            첨부파일 : <a class="btn_link"><strong>adfdf.zip </strong></a><strong></strong>
            </div>-->
         <div class="view_content">
           ${freedetail.b_content}<br>
         </div>
      		<div class="btns">
        		<a class="btn_back" onclick="history.back();">뒤로가기</a>
         	<c:if test="${freedetail.b_writer == loginUser.userid}">
        		<a class="btn_modi" href="/free/freemodify?b_num=${freedetail.b_num}">수정</a>
       		 	<a class="btn_delete" href="/free/freedelete?b_num=${freedetail.b_num}" onclick="return delete_check();">삭제</a>
      		</c:if>
      		</div>
      		
      	 <ul class="reply_textbox">
        <div class="reply_textbox2">
          <div class="reply_wr">
            <label class="reply_writer">댓글 작성자: </label> <input type="text" >
            <span> ·  2023.01.26</span>
          </div>
          <div>
            <textarea rows="5" cols="50" class="reply_text"></textarea>
          </div>
          <div>
            <button type="button" class="reply_btn">댓글 작성</button>
          </div>
        </div>

        <li class="reply">
          <div>
            <p>1. 작성자닉네임 · 2023.01.26</p>  
            <p>댓글 내용</p>
          </div>
        </li>
      </ul>
    </div>
  </div>

  <%@ include file = "../include/footer.jsp" %>
</body>
</html>