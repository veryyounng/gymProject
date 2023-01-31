<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="path" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/reset.css" />
<link rel="stylesheet" href="${path}/resources/css/styles.css" />
<link rel="stylesheet" href="${path}/resources/paymentstyle/pay.css" />

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


</head>
<body>
	<%@ include file="../include/header.jsp" %>
		<div id="main_box">
		<div id="head_title">이용권 구매</div>
        <div class="big-box">
            <div class="box">
                <div class="box-main left-main"></div>
                <div class="box-price"><span>30만원</span>
                    <span>15만원</span>
                </div>
                <div class="box-term">3개월 + 3개월</div>
            </div>

            <div class="box">
                <div class="box-main mid-main"></div>
                <div class="box-price"><span>50만원</span>
                    <span>20만원</span>
                </div>
                <div class="box-term">6개월 + 6개월</div>
            </div>

            <div class="box">
                <div class="box-main right-main"></div>
                <div class="box-price"><span>15만원</span>
                    <span>5만원</span>
                </div>
                <div class="box-term">1개월 + 1개월</div>
            </div>
        </div>
        </div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>