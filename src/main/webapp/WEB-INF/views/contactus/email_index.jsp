<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="${path}/assets/favicon.ico" />

<!-- Bootstrap Icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />

<!-- SimpleLightbox plugin CSS-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />

<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" href="${path}/resources/contactusstyle/css/styles.css" />
<link rel="stylesheet" href="${path}/resources/css/styles.css">

<title>문의하기</title>
</head>
<body id="page-top">
   <%@ include file="../include/header.jsp"%>
        <!-- Contact-->
        <section class="page-section" id="contact">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8 col-xl-6 text-center">
                        <h2 class="mt-0">E-mail 문의</h2>
                        <hr class="divider" />
                        <p class="text-muted mb-5">궁금한 점이 있으시면 무엇이든 물어보세요.</p>
                    </div>
                </div>
                <div class="row gx-4 gx-lg-5 justify-content-center mb-5">
                    <div class="col-lg-6">
                        <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                            <!-- Name input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" type="text" placeholder="이름을 입력하세요.."
                                 data-sb-validations="required" />
                                <label for="name">이름 : </label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">이름을 입력하세요.</div>
                            </div>
                            <!-- Email address input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="email" type="email" placeholder="ex@example.com"
                                 data-sb-validations="required,email" />
                                <label for="email">이메일 : </label>
                                <div class="invalid-feedback" data-sb-feedback="email:required">이메일은 필수입력사항입니다.</div>
                                <div class="invalid-feedback" data-sb-feedback="email:email">이메일을 입력하세요.</div>
                            </div>
                            <!-- title input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="title" type="text" placeholder="제목을 입력하세요."
                                 data-sb-validations="required" />
                                <label for="title">제목 : </label>
                                <div class="invalid-feedback" data-sb-feedback="title:required">제목을 입력하세요.</div>
                            </div>
                            <!-- Message input-->
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="message" type="text" placeholder="내용을 입력하세요.."
                                 style="height: 10rem" data-sb-validations="required"></textarea>
                                <label for="message">내용 : </label>
                                <div class="invalid-feedback" data-sb-feedback="message:required">내용을 입력하세요.</div>
                            </div>
                            <!-- Submit success message-->
                            <!---->
                            <!-- This is what your users will see when the form-->
                            <!-- has successfully submitted-->
                            <div class="d-none" id="submitSuccessMessage">
                                <div class="text-center mb-3">
                                    <div class="fw-bolder">메일이 전송중입니다. 잠시만 기다려주세요.</div>
                                </div>
                            </div>
                            <!-- Submit error message-->
                            <!---->
                            <!-- This is what your users will see when there is-->
                            <!-- an error submitting the form-->
                            <div class="d-none" id="submitErrorMessage">
                               <div class="text-center text-danger mb-3">메일이 전송중입니다. 잠시 기다려주세요.</div>
                            </div>
                            <!-- Submit Button-->
                            <div class="d-grid">
                            <input class="btn btn-primary btn-xl disabled" id="submitButton" type="button" value="보내기" onclick="sendmail()">
                            </div>
                        </form>
                       
                    </div>
                </div>
            </div>
        </section>


<!-- send Mail function -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

<script type="text/javascript">
    function sendmail(){
        var username = $('#name').val();
        var email = $('#email').val();
        var title = $('#title').val();
        var message = $('#message').val();

        console.log(username);
        console.log(email);
        console.log(title);
        console.log(message);

      let jsonData = {"username" : username, "email" : email, "title" : title, "message" : message };
    
      $.ajax({
         type : "POST",
         url : "/contactus/send",
         data: JSON.stringify(jsonData),
         contentType: "application/json; charset=utf-8",
         success : function (data){
            console.log(data);
            if(data){
               alert("메일 발송 성공");
               location.href="/";
            } else {
               alert("메일 발송 실패");
            }
         }
      });


/*
      $.ajax({
      type : "GET",
      url : "/contactus/send?username=" + username + "&email=" + email + "&title=" + title + "&message=" + message,
      success : function (data){
         console.log(data);
         if(data){
            alert("메일 발송 성공");
         } else {
            alert("메일 발송 실패");
         }
      }
   });
*/
   
   
}
</script>
   
   <%@ include file="../include/footer.jsp"%>
</body>

</html>