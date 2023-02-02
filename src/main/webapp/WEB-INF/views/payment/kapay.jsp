<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="path" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오페이 테스트</title>

</head>
<body>
<h1> kakaoPay api 이용하기 </h1>

<!-- <form method="post" action="/payment/kapay">
    <button>카카오페이로 결제하기</button>
</form> -->

<form method="post" name="payForm" id="payForm" action="/payment/kapay"></form>
<button onclick="pay()">카카오페이로 결제하기</button>

</body>
<script>
	function pay(){
		let w = '650';
		let h = '675';
		let xPos = (document.body.offsetWidth/2) - (w/2);
		xPos += window.screenLeft;
		let yPos = (document.body.offsetHeight/2) - (h/2);
		let popOption = "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes";
		window.open("","pop",popOption);
		
		let form = document.payForm;
		form.target = "pop";
		form.action = "/payment/kapay";
		
		form.submit();
		
	}
</script>
</html>