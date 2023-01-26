<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<!DOCTYPE html>
<html>
<head> 
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유 게시판</title>
    <link rel="stylesheet" href="${path}/resources/css/reset.css">
    <link rel="stylesheet" href="${path}/resources/css/free_styles.css">
    <link rel="stylesheet" href="${path}/resources/css/free_list.css">
    
    <link rel="stylesheet" href="http://fonts.googleapis.com/icon?family=Material+Icons"/>
   <link rel="stylesheet" 
   href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script>
        function getIndex() {
            location.href = './views/index.jsp';
        }

    </script>
    <style>
        section {
            height: 1120px;
            display: block;
        }
        .ul_news_title {
           margin-bottom: 0px;
        }
        .ul_news {
           margin: 0px;
        }
    </style>
</head>

<body>
<%@ include file="../include/header.jsp" %>
    <section>
        <!-- 개발코드 시작 -->
        <div class="banana">
            <div class="board_body">
                <div class="title_box">
                    <h2>자유 게시판</h2>
                </div>
                <div class="noti_header">
                    <div class="noti_header_box">
                        <div class="mgt_10">총 <strong>${page.count}</strong>건의 게시물이 있습니다.</div>
                    </div>
                    <div class="noti_header_box txt_right">
                        <form name="s_form" id="search">
                            <input name="key" value="" maxlength=50 type="text" placeholder="검색어 입력">
                            <button class="btn_primary" onclick="">검색</button>
                        </form>
                    </div>
                </div>
                
                <div id="contents">
                    <form name="form1" method="post" id="form1">
                        <input type="hidden" name="table_name" value="notice_list">
                        <ul class="ul_news_title">
                            <div class="boardnum">
                                <span class="board_num">번호</span>
                            </div>
                            <div class="title" style="width: 60%;">
                                <span>제목</span></a>
                            </div>
                            <div class="writer_id" style="width: 10%;"><span class="">작성자</span></div>
                            <div class="data" style="width: 15%;"><span class="date">작성일</span></div>
                            <div class="view"><span class="view" style="width: 10%;">조회수</span></div>
                        </ul>
            	<c:forEach items="${freelist}" var="freelist">
                        <ul class="ul_news">
                            <div class="boardnum">
                                <span class="board_num">${freelist.b_num}</span>
                            </div>
                            <div class="title" style="width: 60%;">
                                <a href="/free/freedetail?b_num=${freelist.b_num}"><span>${freelist.b_title}</span></a></div>
                            <div class="writer_id" style="width: 10%;"><span class="">${freelist.b_writer}</span></div>
                            <div class="data" style="width: 15%;"><span class="date"><fmt:formatDate
									value="${freelist.b_date}" pattern="yy-MM-dd HH:mm" /></span></div>
                            <div class="view"><span class="view" style="width: 10%;">${freelist.view_cnt}</span></div>
                        </ul> 
                </c:forEach>
                        
                    </form>
                </div>
                <div id="write_notice"><a href="/free/freewrite"><button onclick="idcheck()">글쓰기</button></a></div>
                <div class="btns">
                    <ul class="pagination">
                    	<c:if test="${page.prev}">
                        	<li>[<a href='/free/freelist?num=${page.startPageNum-1}'>이전</a>]</li>
                        </c:if> 
                        <c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
                        	<li>
                        		<c:if test="${select != num}">
                        			<a href="/free/freelist?num=${num}">${num}</a>
                        		</c:if>
                        		<c:if test="${select == num}">
                        			<b style="font-weight:700; color:red; text-decoration:underline;">${num}</b>
                        		</c:if>
                        	</li>
                        </c:forEach>
                        <c:if test="${page.next}">
                        	<li>[<a href="/free/freelist?num=${page.endPageNum+1}">다음</a>]</li>
                       	</c:if>
                    </ul>
                </div>
            </div>
        </div>
        </div>

        </div>
        <!-- 개발코드 끝 -->
    </section>
   <%@ include file = "../include/footer.jsp" %>

</body>
</html>