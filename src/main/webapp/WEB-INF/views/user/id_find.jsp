<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    .container{
        width: 600px;
        height: 400px;
        border: 1px solid black;
        margin: 150px auto;
    }
    .find_id{
        width: 500px;
        height: 50px;
        border: 1px solid black;
        margin: 30px auto;
        /* display: flex; */
        text-align: center;
        font-size: 30px;
        padding-top: 20px;
        font-weight: bold;
    }
    #idfindtable{
        margin: 50px auto;   
    }

    #idname{
        text-align: center;
        margin-top: 50px;
        /* padding-top: 50px; */
        }
    #usernamefixed{
        font-size: 20px;
        text-align: center;
        width: 100px;
        height: 50px;
        }
    #usernametext{
        width: 300px;
        height: 50px;
        font-size: 20px;
        }
    #emailline{
        text-align: center;
        margin-top: 50px;
        }
    #useremailfixed{
        font-size: 20px;
        text-align: center;
        width: 100px;
        height: 50px;
        }
    #useremailtext{
        width: 150px;
        height: 50px;
        font-size: 20px;
    }
    #submitbutton{
        margin-top: 30px;
        width: 100px;
        height: 60px;
        font-size: 20px;
        /* margin: 0 auto; */
        text-align: center;
    }
    #submitbutton:hover{
        background-color: gray;
        color: white;
        border: none;
        }
    
     .select_box {
  		width: 120px;
  		height: 50px;
  		box-sizing: border-box;
  		margin-left: 5px;
  		padding: 5px 0 5px 10px;
  		border-radius: 4px;
  		border: 1px solid #d9d6d6;
  		color: #383838;
  		background-color: #ffffff;
  		font-family: 'Montserrat', 'Pretendard', sans-serif;
  		font-size: 16px;
		}

/* option {
  font-size: 16px;
} */

	.text_box{
    	width: 140px;
    	height: 50px;
    	font-size: 16px;
		}
		
	.text_box #domain-list option {
  		font-size: 14px;
  		background-color: #ffffff;
	}
    
</style>
<body>
	<div class="container">
        <div class="find_id">
            아이디 찾기
        </div>
        <form action="id_find" method="post">
            <table id="idfindtable">
                <tr>
                    <td id="result" colspan="2"></td>
                </tr>
                <tr id="nameline">
                    <th><label for="username" id="usernamefixed">이름</label></th>
                    <td><input type="text" name="username" id="usernametext"></td>
                </tr>
           
                <tr id="emailline">
                    <th><label for="useremail" id="useremailfixed">이메일 주소</label></th>
                    <td><input type="e_mail" name="useremail" id="useremailtext"  onkeyup="pwcheck()"> @
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
                        <input type="submit" value="확인" id="submitbutton">
                    </th>
                </tr>
            </table>
        
    </div>
    <script>
       // 도메인 직접 입력 or domain option 선택
	const domainListEl = document.querySelector('#domain-list')
	const domainInputEl = document.querySelector('#domain-txt')
		// select 옵션 변경 시
	domainListEl.addEventListener('change', (event) => {
  		// option에 있는 도메인 선택 시
  	if(event.target.value !== "type") {
    	// 선택한 도메인을 input에 입력하고 disabled
    domainInputEl.value = event.target.value
    domainInputEl.disabled = true
  	} else { // 직접 입력 시
    	// input 내용 초기화 & 입력 가능하도록 변경
    domainInputEl.value = ""
    domainInputEl.disabled = false
  	}
	})
    </script>
</body>
</html>