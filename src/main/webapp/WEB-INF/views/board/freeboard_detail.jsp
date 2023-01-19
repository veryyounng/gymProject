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
    
    <script>
       function getIndex() {
            location.href = './index.html';
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
      </div>
    </div>
  </div>
  </div>
  <%@ include file = "../include/footer.jsp" %>
</body>
</html>