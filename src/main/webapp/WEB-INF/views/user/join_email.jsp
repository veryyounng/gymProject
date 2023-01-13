<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="./main_logo.gif" type="image/x-icon">
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
   crossorigin="anonymous"></script>
<link
   href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic"
   rel="stylesheet" type="text/css" />
<link
   href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
   rel="stylesheet" type="text/css" />
<title>회원가입</title>
<link rel="stylesheet" href="${path}/resources/css/styles.css">
<style>
.banana {
   border: 1px solid black;
   height: 600px;
   margin: 0 auto;
   display: flex;
   align-items: center;
}

.banana form {
   margin: 0 auto;
}

.banana table th {
   width: 90px;
}

.banana #email_id, .banana #domain-txt {
   width: 150px;
   height: 40px;
}

.banana #domain-list {
   height: 40px;
}

.banana #certification_number {
   width: 300px;
   height: 40px;
}
</style>
</head>

<body>
   <%@ include file="../include/header.jsp"%>
   <section>
      <!-- 개발코드 시작 -->
      <div class="banana">
         <form name="email_certification" id="emailform" method="post"
            action="${path}/user/join_form">
            <table>
               <tr>
                  <th>이메일</th>
                  <td><input class="box" id="email_id" name="email_id"
                     placeholder="이메일" /> @ <input class="box" id="domain-txt"
                     name="domain-txt" type="text" /> <select class="box"
                     id="domain-list">
                        <option value="type">직접 입력</option>
                        <option value="naver.com">naver.com</option>
                        <option value="google.com">google.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="nate.com">nate.com</option>
                        <option value="kakao.com">kakao.com</option>
                        <option value="yahoo.com">yahoo.com</option>
                  </select> <input type="button" id="mail-Check-Btn" value="전송" onclick="">
                  </td>
                  <td><input type="hidden" name="email" id="email"></td>
               </tr>
               <tr>
                  <td></td>
                  <td style="color: gray; line-height: 16px;">*이메일 전송까지는 30초~1분
                     정도의 시간이 소요됩니다.</td>
               </tr>
               <tr>
                  <td>&nbsp;</td>
               </tr>
               <tr>
                  <td>&nbsp;</td>
               </tr>
               <tr>
                  <th id="certification_number_title">인증번호</th>
                  <td><input type="text" name="certification_number"
                     id="certification_number" disabled> <span id="Timer"
                     style="color: red;"></span></td>
               </tr>
               <tr>
                  <td></td>
                  <td style="color: gray; line-height: 16px;">*'인증번호가
                     전송되었습니다.'라는 메시지가 출력되면 입력창이 활성화됩니다.
                     <br>&nbsp; 메일 전송까지는 5~15초 정도 소요됩니다. 잠시만 기다려주세요.
                  </td>
               </tr>
               <tr>
                  <td></td>
                  <td style="color: gray; line-height: 16px;">*인증번호는 30분 내에
                     입력해야 하며, 30분이 초과될 시 로그인 화면으로 <br>&nbsp; 돌아갑니다.
                  </td>
               </tr>
               <tr>
                  <td>&nbsp;</td>
               </tr>
               <tr>
                  <td>&nbsp;</td>
               </tr>
               <tr>
                  <td colspan="2" style="text-align: center;"><input
                     type="submit" value="인증완료" id="certification_pass"></td>
               </tr>
            </table>
         </form>
      </div>
      <!-- 개발코드 끝 -->
   </section>
   <%@ include file="../include/footer.jsp"%>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="${path}/resources/js/header.js"></script>
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

  const Timer=document.getElementById('Timer'); //스코어 기록창-분
  let time= 1800000;
  let min=30;
  let sec=60;
  Timer.innerHTML=min+":"+'00'; 
  
  function TIMER(){
      PlAYTIME=setInterval(function(){
          time=time-1000; //1초씩 줄어듦
          min=time/(60*1000); //초를 분으로 나눠준다.
      
         if(sec>0){ //sec=60 에서 1씩 빼서 출력해준다.
              sec=sec-1;
              Timer.innerHTML=Math.floor(min)+':'+sec; //실수로 계산되기 때문에 소숫점 아래를 버리고 출력해준다.
          }
          if(sec===0){
              // 0에서 -1을 하면 -59가 출력된다.
              // 그래서 0이 되면 바로 sec을 60으로 돌려주고 value에는 0을 출력하도록 해준다.
              sec=60;
              Timer.innerHTML=Math.floor(min)+':'+'00'
          }     
      },1000); //1초마다 
     setTimeout(function(){
         clearInterval(PlAYTIME);
         alert("시간이 초과되어 로그인 화면으로 돌아갑니다!");
         location.href = "${path}/"
     },1800000);//30분이 되면 타이머를 삭제한다.
  }
  
//   메일 가져오기
   $("#email_id").blur(function(){
      totalemail();   
   });
   
   $("#domain-txt").blur(function(){
      totalemail();
   });

   function totalemail() {
      const useremail_id = $("#email_id").val();
      const useremail_domain = $("#domain-txt").val();
      
      if(useremail_id != "" && useremail_domain!= "") {
         $("#email").val(useremail_id+'@'+useremail_domain);
      }
   };
  
  let code = "";
  $('#mail-Check-Btn').click(function() {
      const email = $('#email_id').val() +'@'+ $('#domain-txt').val(); // 이메일 주소값 얻어오기!
      console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
      const checkInput = $('#certification_number') // 인증번호 입력하는곳 
      
      if ($('#email_id').val() == "" || $('#domain-txt').val() == ""){
         alert('이메일을 입력해주세요.');
      }
      else {
         $.ajax({
            type : 'get',
            url : '<c:url value ="/user/mailCheck?email="/>'+email, // GET방식이라 Url 뒤에 email을 붙일 수 있다.
            success : function (data) {
               console.log("data : " +  data);
               checkInput.attr('disabled',false);
               code = data;
               alert('인증번호가 전송되었습니다.');
            }         
         }); // end ajax
         TIMER();
      }
   }); // end send eamil
   
   // 인증번호 비교 
   $(document).ready(function() {
      $('#emailform').submit(function () {
         console.log(code);
         console.log($('#certification_number').val());
         if ($('#certification_number').val() !== code) {
            alert('인증번호가 일치하지 않습니다! 다시 확인해주세요!.');
            return false;
         }
         return true;
      });
   })
</script>
</html>