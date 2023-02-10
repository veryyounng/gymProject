<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>운동지식공유 게시판</title>
    
<link rel="stylesheet" href="${path}/resources/css/reset.css">
<link rel="stylesheet" href="${path}/resources/css/free_styles.css">
<link rel="stylesheet" href="${path}/resources/css/free_list.css">
<link rel="shortcut icon" href="${path}/resources/img/파비콘.png" type="image/x-icon">

<link rel="stylesheet" href="http://fonts.googleapis.com/icon?family=Material+Icons" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
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
	
	select {
		width: 29%;
		display: inline;
	}
	#search {
		margin: 0;
		display:flex;
		align-items: center;
	}
	#search * {
		height: 22px;
		margin-right: 3px;
	}
	.btn_primary{
		width: 48px;
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
                    <h2>운동지식공유 게시판</h2>
                </div>
                <div class="noti_header">
                    <div class="noti_header_box">
                        <div class="mgt_10">총 <strong>${ex_page.count}</strong> 건의 게시물이 있습니다.</div>
                    </div>
                    
                    <div class="noti_header_box txt_right">
                        <div name="s_form" id="search">
	                        <select name = "searchType" >
	                    		<option value = "title" <c:if test="${ex_page.searchType eq 'title'}">selected</c:if> >제목</option>
	                    		<option value = "content" <c:if test="${ex_page.searchType eq 'content'}">selected</c:if> >내용</option>
	                    		<option value = "title_content" <c:if test="${ex_page.searchType eq 'title_content'}">selected</c:if> >제목 + 내용</option>
	                    		<option value = "writer" <c:if test="${ex_page.searchType eq 'writer'}">selected</c:if> >작성자</option>
	                    	</select>
                            <input name="keyword" value="${keyword}" maxlength=50 type="text" placeholder="검색어 입력">
                            <button class="btn_primary" id="searchBtn" type = "button">검색</button>
                        </div>
                    </div>
                   
                </div>
                
                <div id="contents">
                    <form name="form1" method="post" id="form1">
                        <input type="hidden" name="table_name" value="notice_list">
                        <ul class="ul_news_title" >
                            <div class="boardnum" style="width: 30px;">
                                <span class="board_num">번호</span>
                            </div>
                            <div class="title" style="width: 538px;">
                                <span>제목</span></a>
                            </div>
                            <div class="writer_id" style="width: 100px;"><span class="">작성자</span></div>
                            <div class="data" style="width: 150px;"><span class="">작성일</span></div>
                            <div class="view">
                            	<span class="view" style="width: 40px;">조회수</span>
                            </div>
                        </ul>
            	<c:forEach  items = "${ex_list}" var="ex_list">
                	<ul class="ul_news">
                    	<div class="boardnum" style="width: 30px;">
                        	<span class="board_num">${ex_list.ex_num}</span>
                        </div>
                        
                        <div class="title" style="width: 538px;">
                        	<span>
                        		<a href = "${path}/ex_board/ex_view?ex_num=${ex_list.ex_num}&reply_num=1">${ex_list.ex_title}</a>
                        	</span>
                        </div>
                        
                        <div class="writer_id" style="width: 100px;"><span class="">${ex_list.ex_writer}</span></div>
						
						<div class="data" style="width: 150px;">
							<span class="date"><fmt:formatDate
									value="${ex_list.ex_date}" pattern="yy-MM-dd HH:mm" /></span>
						</div>

                        <div class="view">
                        	<span class="view" style="display:inline-block; width: 40px !important; text-align:right;">${ex_list.view_cnt}</span>
                        </div>
                        
                    </ul> 
                </c:forEach>
                       
                    </form>
                </div>
                
                <div id="write_notice">
                	<a href="/ex_board/ex_write"><button onclick="idcheck()">글쓰기</button></a>
                </div>
                
                <!-- 페이지 작업 -->
                <div class="btns">
                    <ul class="pagination">
                    	
                    	<c:if test="${ex_page.prev}">
                    		<li>[<a href = "/ex_board/ex_list?num=${ex_page.startPageNum - 1}${ex_page.searchTypeKey}">이전</a>]</li>
                    	</c:if>
                    	
                    	<c:forEach begin="${ex_page.startPageNum}" end="${ex_page.endPageNum}" var = "num">
                    		<li>
                    		
                    			<c:if test = "${select != num}">
                    				<a href = "/ex_board/ex_list?num=${num}${ex_page.searchTypeKey}">&nbsp;${num}&nbsp;</a>
                    			</c:if>
                    		
		             			<c:if test = "${select == num}">
                    				<b style="font-weight: 700; color: red; text-decoration: underline;">
                    				${num}
                    				</b>
                    			</c:if>
                    		
                    		</li>
                    	</c:forEach>
                    	
                    	<c:if test="${ex_page.next}">
                    		<li>[<a href = "/ex_board/ex_list?num=${ex_page.endPageNum + 1}${ex_page.searchTypeKey}">다음</a>]</li>
                    	</c:if>
                    	
                    </ul>
                </div>
                
            </div>
        </div>
        <!-- 개발코드 끝 -->
    </section>
	
	<%@ include file = "../include/footer.jsp" %>
   
	<script>
	
	//검색하기
	document.getElementById("searchBtn").onclick = function(){
		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword = document.getElementsByName("keyword")[0].value;
		location.href = "/ex_board/ex_list?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
	};
	
	</script>
   
</body>
</html>