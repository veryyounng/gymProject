<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel = "stylesheet" href="${path}/resources/css/id_find.css" >
<link rel="stylesheet" href="${path}/resources/css/styles.css" />
<link rel="stylesheet" href="${path}/resources/css/notistyle.css" />
<link rel="shortcut icon" href="${path}/resources/img/파비콘.png" type="image/x-icon">
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
</head>

<body>
<%@ include file="../include/header.jsp" %>
	<div class="container">
		<div class="body_findid">
        <div class="find_img">
           	<div class="logo_medal"></div>
           	<div class="logo_img"></div>
        </div>
       
            <table id="idfindtable">
                <tr id="nameline">
                    <th><label for="username" id="usernamefixed">이름</label></th>
                    <td><input type="text" name="username" id="usernametext" value="" autofocus></td>
                </tr>
           
                <tr id="emailline">
                    <th><label for="useremail" id="useremailfixed">이메일 주소</label></th>
                    <td id="e_mail_box"><input type="e_mail" name="useremail" id="useremailtext"> @
                        <input class="text_box" id="domain-txt" type="text"/>
                        <select class="select_box" id="domain-list">
                          <option value="type">직접 입력</option>
                          <option value="naver.com">naver.com</option>
                          <option value="gmail.com">gmail.com</option>
                          <option value="hanmail.net">hanmail.net</option>
                          <option value="nate.com">nate.com</option>
                          <option value="kakao.com">kakao.com</option>
                        </select>
                    
                    </td>
                </tr>
               
                <tr>
                    <th colspan="2" id="submit_button">
                        <input type="submit" value="아이디 찾기" id="submitbutton">
                    </th>
                </tr>
            </table>
           
        </div>
    </div>
<script type="text/javascript">
	const domainListEl = document.querySelector('#domain-list');
	const domainInputEl = document.querySelector('#domain-txt');
	
	domainListEl.addEventListener('change', (event) => {
  	if(event.target.value !== "type") {
    domainInputEl.value = event.target.value
    domainInputEl.disabled = true
  	} else { 
    domainInputEl.value = ""
    domainInputEl.disabled = false
  	}
	});
	
	$('#submitbutton').on('click',function(){
		const name = $('#usernametext').val();
	 	const email = $('#useremailtext').val() + '@' + $('#domain-txt').val();
		console.log(name);
		console.log(email);
		$.ajax({
	        url:'findedid',
	        type:'POST',
	        data: {"username": name,
	        	   "email": email},
	        dataType : "json",
	        success:function(result){
	        	let addString = $('#idfindtable');
	        	console.log("에이젝스 성공");
	        	addString.empty();
	        	var str = "";
	        	if(result == null){
					str += '<div>';
					str += '아이디를 찾을 수 없습니다.';
					str += '</div>';
	        	} else {
	        		str += '<div>';
	               	str += '<span style="color:blue; font-weight:700;">"'+name + '"</span> 님의 아이디는 <span style="color:blue; font-weight:700;">"' + result.userid + '"</span> 입니다.';
	       			str += '</div>';
	        	}
				addString.append(str);
	        },
	        error: function(request, error){
	        	alert('정보를 다시 입력해주시길 바랍니다.' );
	        }
	    });
	});
</script>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>