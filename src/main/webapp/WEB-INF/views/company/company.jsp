<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
	<title>회사소개</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">	
<meta name="format-detection" content="telephone=no">
<meta name="description" content="국문" />

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<link rel="stylesheet" href="http://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<link rel="stylesheet" href="${path}/resources/css/free_styles.css">
	<link rel="stylesheet" href="${path}/resources/css/index.css">
	<link rel="stylesheet" href="${path}/resources/css/free_content.css">
	<link rel="shortcut icon" href="${path}/resources/img/파비콘.png" type="image/x-icon">

	<%-- <link rel="stylesheet" href="${path}/resources/company/css/reset.css" /> --%>
	<link rel="stylesheet" href="${path}/resources/company/css/main.css" />
	<link rel="stylesheet" href="${path}/resources/company/css/sub.css" />
	<link rel="stylesheet" href="${path}/resources/company/css/slick.css" />
	<link rel="stylesheet" href="${path}/resources/company/css/style_1200.css" />
	<link rel="stylesheet" href="${path}/resources/company/css/woco-accordion.css">
	<link rel="stylesheet" href="${path}/resources/company/css/dist.css" />
	
	<script src="${path}/resources/company/js/jquery-1.11.1.js"></script>
	<script src="${path}/resources/company/js/jquery.easing.1.3.js"></script>
	<script src="${path}/resources/company/js/jquery.mousewheel.min.js"></script>
	<script src="${path}/resources/company/js/jquery.flexslider.js"></script>
	<script src="${path}/resources/company/js/slick.js"></script>
	<script src="${path}/resources/company/js/default.js"></script>
	<script src="${path}/resources/company/js/index.js"></script>
	<script src="${path}/resources/company/js/asidebar.jquery.js" type="text/javascript"></script>
	<script src="${path}/resources/company/js/woco.accordion.min.js"></script>
	<script src="${path}/resources/company/js/jquery.bpopup.min.js"></script>

</head>
<body>
	<%@ include file="../include/header.jsp" %>
	<div id="wrap">
		
		<div class="content_in">
			<ul class=" about_2">
				<li>
					<p><b>회사명</b></p>
					<div>
						<div>우리동네 올림픽</div>
					</div>
					<img src="${path}/resources/company/image/sub/about1_1.jpg">
				</li>
				<li>
					<p><b>창립일</b> </p>
					<div>
						2022<span>년</span> 12<span>월</span> 29<span>일</span>
					</div>
					<img src="${path}/resources/company/image/sub/about1_2.jpg">
				</li>
				<li>
					<p><b>대표이사</b></p>
					<div>김철성</div>
					<img src="${path}/resources/company/image/sub/about1_3.jpg">
				</li>
				<li>
					<p><b>임직원</b></p>
					<div>
						6<span>명</span>
					</div>
					<img src="${path}/resources/company/image/sub/about1_4.jpg">
				</li>
			</ul>
			<div class="con_tb">
			
				<div>
					<div class="left" style="text-align: center;">사업목표</div>
                    <div class="right">
                        우리동네 올림픽은 시민들의 건강 및 여가시설로 활용할 수 있는 다목적복합체육관으로 내부 운영 시설 구비 및 시범운영을 통해 2월 27일 개관하였습니다. 
                        <br>지역주민에게 다가가는 시설로서, 평생교육을 바탕으로한 사회체육을 진응하여 시민의 체력을 증진하고 건강한 정신을 함양하여 명랑한 시민생활을 영위케 하며,
                        신체활동을 통한 자아실현을 물론 지역사회 발전과 건강한 체육문화 창달을 목적으로 활동하고 있습니다.
                        <br>지역 주민들의 건강지킴이로서 사회체육 활성화와 건강한 수월을 위하여 노력하겠습니다.
                        <br>많은 성원과 관심 부탁 드립니다. 감사합니다.
                    </div>

				</div>

            </div>
		</div>
		
	<script src="${path}/resources/company/js/common/layout.js"></script>

	</div>
	<%@ include file = "../include/footer.jsp" %>
</body>
</html>
