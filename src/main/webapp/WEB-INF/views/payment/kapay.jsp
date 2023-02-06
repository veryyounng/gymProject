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

<!--
<form method="post" name="payForm" id="payForm" action="/payment/kapay">
<button onclick="pay()">카카오페이로 결제하기</button>
</form>

<form method="post" name="payForm" id="payFormGold" action="/payment/kapay01">
	<input type = "hidden" value = "p1001" id = "proNum" name="proNum">
	<input type = "hidden" value = "apple" id = "userId"  name="userId">
<button onclick="pay01()">골드멤버 결제하기(/kapay01)</button>
</form>
 -->


<form method="post" name="payFormGold" id="payFormGold" >
	<input type = "hidden" value = "p1001" id = "proNum" name="proNum">
	<input type = "hidden" value = "apple" id = "userId"  name="userId">
<button onclick="pay01()">골드멤버 결제하기(/kapay01)</button>
</form>


<form method="post" name="payFormSilver" id="payFormSilver" >
	<input type = "hidden" value = "p1002" id = "proNum" name="proNum">
	<input type = "hidden" value = "apple" id = "userId"  name="userId">
<button onclick="pay02()">실버멤버 결제하기(/kapay01)</button>
</form>


<form method="post" name="payFormBronze" id="payFormBronze" >
	<input type = "hidden" value = "p1003" id = "proNum" name="proNum">
	<input type = "hidden" value = "apple" id = "userId"  name="userId">
<button onclick="pay03()">브론즈멤버 결제하기(/kapay01)</button>
</form>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
/*
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
*/

    function pay01(){
    	let w = '650';
		let h = '675';
		let xPos = (document.body.offsetWidth/2) - (w/2);
		xPos += window.screenLeft;
		let yPos = (document.body.offsetHeight/2) - (h/2);
		let popOption = "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes";
		window.open("","pop",popOption);
		
		let form = document.payFormGold;
		form.target = "pop";
		form.action = "/payment/kapay01";
		
		form.submit();
		
		/* var orderId = $('#orderId').val();
		var itemName = $('#itemName').val();

        console.log(orderId);
        console.log(itemName);

		let jsonData = {"orderId" : orderId, "itemName" : itemName};

      $.ajax({
         type : "POST",
         url : "/payment/kapay01",
         data: JSON.stringify(jsonData),
         contentType: "application/json; charset=utf-8",
         success : function (){

         }
      }); */
    }


    function pay02(){
    	let w = '650';
		let h = '675';
		let xPos = (document.body.offsetWidth/2) - (w/2);
		xPos += window.screenLeft;
		let yPos = (document.body.offsetHeight/2) - (h/2);
		let popOption = "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes";
		window.open("","pop",popOption);
		
		let form = document.payFormSilver;
		form.target = "pop";
		form.action = "/payment/kapay01";
		
		form.submit();
    }
    
    
    function pay03(){
    	let w = '650';
		let h = '675';
		let xPos = (document.body.offsetWidth/2) - (w/2);
		xPos += window.screenLeft;
		let yPos = (document.body.offsetHeight/2) - (h/2);
		let popOption = "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes";
		window.open("","pop",popOption);
		
		let form = document.payFormBronze;
		form.target = "pop";
		form.action = "/payment/kapay01";
		
		form.submit();
    }
    
</script>
</body>
</html>
