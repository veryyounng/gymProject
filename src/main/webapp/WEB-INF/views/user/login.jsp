<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<style>

        * a{
            text-decoration: none;
            font-size: 18px;
            color: black;
        }
        .container{
            margin: 0 auto;
            border: 1px solid black;
            width: 500px;
            height: 750px;
        }
        .logo{
            margin: 0 auto;
            text-align: center;
            margin-top: 50px;
            border: 1px solid black;
            width: 400px;
            height: 250px;
        }
        .logo_img{
            text-align: center;
            width: 300px;
            height: 250px;
            background-position: contain;
        }
        #logintable{
            /* text-align: center; */
            margin: 0 auto;
            margin-top: 50px;
        }
        #idline{
            text-align: center;
            margin-top: 50px;
            /* padding-top: 50px; */
        }
        #useridfixed{
            font-size: 20px;
            text-align: center;
            width: 100px;
            height: 50px;
        }
        #pwline{
            text-align: center;
            margin-top: 50px;
        }
        #userpwfixed{
            font-size: 20px;
            text-align: center;
            width: 100px;
            height: 50px;
        }
        #useridtext{
            width: 300px;
            height: 50px;
            font-size: 20px;
        }
        #userpwtext{
            /* margin-top: 50px; */
            width: 300px;
            height: 50px;
            font-size: 20px;
        }
        #loginbutton{
            margin-top: 30px;
            width: 100px;
            height: 60px;
            font-size: 20px;
            /* margin: 0 auto; */
            text-align: center;
            
        }
        #loginbutton:hover{
            background-color: gray;
            color: white;
            border: none;
        }
        .etcbtn{
            margin-top: 80px;
            text-align: center;
            color: gray;
        }
    </style>
<body>
	<div class="container">
        <div class="logo">
            <img src="/resources/img/부자.jpg" alt="" class="logo_img">
        </div>
        <form action="loginForm" method="post">
            <table id="logintable">
                <tr>
                    <td id="result" colspan="2"></td>
                </tr>
                <tr id="idline">
                    <th><label for="userid" id="useridfixed">아이디</label></th>
                    <td><input type="text" name="userid" id="useridtext" placeholder="아이디를 입력하세요."></td>
                </tr>
           
                <tr id="pwline">
                    <th><label for="userpw" id="userpwfixed">비밀번호</label></th>
                    <td><input type="password" name="userpw" id="userpwtext"  onkeyup="pwcheck()" placeholder="비밀번호를 입력하세요."></td>
                </tr>
                <tr>
                    <th colspan="2" id="login_button">
                        <input type="submit" value="로그인" id="loginbutton">
                    </th>
                </tr>
            </table>

            <div class="etcbtn">
                <a href="./id_find.html"> 아이디 찾기 | </a>
                <a href="./pw_find.html"> 비밀번호 찾기 | </a>
                <a href=""> 회원가입  </a>
            </div>
</body>
</html>