<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 소개</title>
<link rel="shortcut icon" href="${path}/resources/img/파비콘.png"
   type="image/x-icon">
   
<link rel="stylesheet"
   href="${path}/resources/programstyle/css/program.css">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="${path}/resources/programstyle/js/programjs.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
   crossorigin="anonymous"></script>
<link rel="stylesheet" href="${path}/resources/css/styles.css">
<style>
.banana {
   margin: 0;
   width : 1440px;
}

section {
   margin-top: 0;
}
</style>
</head>

<body>
   <%@ include file="../include/header.jsp"%>
   <!-- 개발코드 시작 -->
   <section>
      <div class="banana">
         <section class="page-section bg-light" id="portfolio">
            <div class="container">
               <div class="text-center">
                  <h2 class="section-heading text-uppercase">프로그램 소개</h2>
                  <h3 class="section-subheading text-muted">Program
                     introduction</h3>
               </div>
               <div class="row">
                  <div class="col-lg-4 col-sm-6 mb-4">
                     <!-- Portfolio item 1-->
                     <div class="portfolio-item">
                        <a class="portfolio-link" data-bs-toggle="modal"
                           href="#portfolioModal1">
                           <div class="portfolio-hover">
                              <div class="portfolio-hover-content">
                                 <i class="fas fa-plus fa-3x"></i>
                              </div>
                           </div> <img class="img-fluid"
                           src="/resources/programstyle/img/요가2.jpg" alt="" />
                        </a>
                        <div class="portfolio-caption">
                           <div class="portfolio-caption-heading">요가</div>
                           <div class="portfolio-caption-subheading text-muted">Yoga</div>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-4 col-sm-6 mb-4">
                     <!-- Portfolio item 2-->
                     <div class="portfolio-item">
                        <a class="portfolio-link" data-bs-toggle="modal"
                           href="#portfolioModal2">
                           <div class="portfolio-hover">
                              <div class="portfolio-hover-content">
                                 <i class="fas fa-plus fa-3x"></i>
                              </div>
                           </div> <img class="img-fluid"
                           src="/resources/programstyle/img/스피닝2.jpg" alt="..." />
                        </a>
                        <div class="portfolio-caption">
                           <div class="portfolio-caption-heading">스피닝</div>
                           <div class="portfolio-caption-subheading text-muted">Spinning</div>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-4 col-sm-6 mb-4">
                     <!-- Portfolio item 3-->
                     <div class="portfolio-item">
                        <a class="portfolio-link" data-bs-toggle="modal"
                           href="#portfolioModal3">
                           <div class="portfolio-hover">
                              <div class="portfolio-hover-content">
                                 <i class="fas fa-plus fa-3x"></i>
                              </div>
                           </div> <img class="img-fluid"
                           src="/resources/programstyle/img/다이어트댄스2.jpg" alt="..." />
                        </a>
                        <div class="portfolio-caption">
                           <div class="portfolio-caption-heading">다이어트 댄스</div>
                           <div class="portfolio-caption-subheading text-muted">Diet
                              dance</div>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
                     <!-- Portfolio item 4-->
                     <div class="portfolio-item">
                        <a class="portfolio-link" data-bs-toggle="modal"
                           href="#portfolioModal4">
                           <div class="portfolio-hover">
                              <div class="portfolio-hover-content">
                                 <i class="fas fa-plus fa-3x"></i>
                              </div>
                           </div> <img class="img-fluid"
                           src="/resources/programstyle/img/줌바2.jpg" alt="..." />
                        </a>
                        <div class="portfolio-caption">
                           <div class="portfolio-caption-heading">줌바</div>
                           <div class="portfolio-caption-subheading text-muted">Zumba</div>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
                     <!-- Portfolio item 5-->
                     <div class="portfolio-item">
                        <a class="portfolio-link" data-bs-toggle="modal"
                           href="#portfolioModal5">
                           <div class="portfolio-hover">
                              <div class="portfolio-hover-content">
                                 <i class="fas fa-plus fa-3x"></i>
                              </div>
                           </div> <img class="img-fluid"
                           src="/resources/programstyle/img/필라테스2.jpg" alt="..." />
                        </a>
                        <div class="portfolio-caption">
                           <div class="portfolio-caption-heading">필라테스</div>
                           <div class="portfolio-caption-subheading text-muted">Pilates</div>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-4 col-sm-6">
                     <!-- Portfolio item 6-->
                     <div class="portfolio-item">
                        <a class="portfolio-link" data-bs-toggle="modal"
                           href="#portfolioModal6">
                           <div class="portfolio-hover">
                              <div class="portfolio-hover-content">
                                 <i class="fas fa-plus fa-3x"></i>
                              </div>
                           </div> <img class="img-fluid"
                           src="/resources/programstyle/img/에어로빅2.jpg" alt="..." />
                        </a>
                        <div class="portfolio-caption">
                           <div class="portfolio-caption-heading">에어로빅</div>
                           <div class="portfolio-caption-subheading text-muted">Aerobics</div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <section class="page-section bg-light" id="team">
            <div class="container">
               <div class="text-center">
                  <h2 class="section-heading text-uppercase">트레이너 프로필</h2>
                  <h3 class="section-subheading text-muted">trainer profile</h3>
               </div>
               <div class="row" id="trainerprofile">
                  <div class="swiper-container" style="overflow:hidden;">
                     <!-- 슬라이드 컨텐츠가 들어갈 부분 -->
                     <div class="swiper-wrapper" style="margin: 0px auto !important;">
                        <div class="swiper-slide">
                           <div class="col-lg-4">
                              <div class="team-member">
                                 <img class="mx-auto rounded-circle"
                                    src="/resources/programstyle/img/최현영.png" alt="..." />
                                 <h4>최현영</h4>
                                 <p class="text-muted">요가 트레이너</p>
                                 <a class="btn btn-dark btn-social mx-2"
                                    href="https://twitter.com/"
                                    aria-label="Parveen Anand Twitter Profile"><i
                                    class="fab fa-twitter"></i></a> <a
                                    class="btn btn-dark btn-social mx-2"
                                    href="https://facebook.com/"
                                    aria-label="Parveen Anand Facebook Profile"><i
                                    class="fab fa-facebook-f"></i></a> <a
                                    class="btn btn-dark btn-social mx-2"
                                    href="https://www.linkedin.com/"
                                    aria-label="Parveen Anand LinkedIn Profile"><i
                                    class="fab fa-linkedin-in"></i></a>
                              </div>
                           </div>
                        </div>
                        <div class="swiper-slide">
                           <div class="col-lg-4">
                              <div class="team-member">
                                 <img class="mx-auto rounded-circle"
                                    src="/resources/programstyle/img/장승욱.png" alt="..." />
                                 <h4>장승욱</h4>
                                 <p class="text-muted">다이어트 댄스 트레이너</p>
                                 <a class="btn btn-dark btn-social mx-2"
                                    href="https://twitter.com/"
                                    aria-label="Parveen Anand Twitter Profile"><i
                                    class="fab fa-twitter"></i></a> <a
                                    class="btn btn-dark btn-social mx-2"
                                    href="https://facebook.com/"
                                    aria-label="Parveen Anand Facebook Profile"><i
                                    class="fab fa-facebook-f"></i></a> <a
                                    class="btn btn-dark btn-social mx-2"
                                    href="https://www.linkedin.com/"
                                    aria-label="Parveen Anand LinkedIn Profile"><i
                                    class="fab fa-linkedin-in"></i></a>
                              </div>
                           </div>
                        </div>
                        <div class="swiper-slide">
                           <div class="col-lg-4">
                              <div class="team-member">
                                 <img class="mx-auto rounded-circle"
                                    src="/resources/programstyle/img/김철성.png" alt="..." />
                                 <h4>김철성</h4>
                                 <p class="text-muted">스피닝 트레이너</p>
                                 <a class="btn btn-dark btn-social mx-2"
                                    href="https://twitter.com/"
                                    aria-label="Parveen Anand Twitter Profile"><i
                                    class="fab fa-twitter"></i></a> <a
                                    class="btn btn-dark btn-social mx-2"
                                    href="https://facebook.com/"
                                    aria-label="Parveen Anand Facebook Profile"><i
                                    class="fab fa-facebook-f"></i></a> <a
                                    class="btn btn-dark btn-social mx-2"
                                    href="https://www.linkedin.com/"
                                    aria-label="Parveen Anand LinkedIn Profile"><i
                                    class="fab fa-linkedin-in"></i></a>
                              </div>
                           </div>
                        </div>
                        <div class="swiper-slide">
                           <div class="col-lg-4">
                              <div class="team-member">
                                 <img class="mx-auto rounded-circle"
                                    src="/resources/programstyle/img/박예찬.png" alt="..." />
                                 <h4>박예찬</h4>
                                 <p class="text-muted">줌바 트레이너</p>
                                 <a class="btn btn-dark btn-social mx-2"
                                    href="https://twitter.com/"
                                    aria-label="Parveen Anand Twitter Profile"><i
                                    class="fab fa-twitter"></i></a> <a
                                    class="btn btn-dark btn-social mx-2"
                                    href="https://facebook.com/"
                                    aria-label="Parveen Anand Facebook Profile"><i
                                    class="fab fa-facebook-f"></i></a> <a
                                    class="btn btn-dark btn-social mx-2"
                                    href="https://www.linkedin.com/"
                                    aria-label="Parveen Anand LinkedIn Profile"><i
                                    class="fab fa-linkedin-in"></i></a>
                              </div>
                           </div>
                        </div>
                        <div class="swiper-slide">
                           <div class="col-lg-4">
                              <div class="team-member">
                                 <img class="mx-auto rounded-circle"
                                    src="/resources/programstyle/img/이동엽.png" alt="..." />
                                 <h4>이동엽</h4>
                                 <p class="text-muted">필라테스 트레이너</p>
                                 <a class="btn btn-dark btn-social mx-2"
                                    href="https://twitter.com/"
                                    aria-label="Parveen Anand Twitter Profile"><i
                                    class="fab fa-twitter"></i></a> <a
                                    class="btn btn-dark btn-social mx-2"
                                    href="https://facebook.com/"
                                    aria-label="Parveen Anand Facebook Profile"><i
                                    class="fab fa-facebook-f"></i></a> <a
                                    class="btn btn-dark btn-social mx-2"
                                    href="https://www.linkedin.com/"
                                    aria-label="Parveen Anand LinkedIn Profile"><i
                                    class="fab fa-linkedin-in"></i></a>
                              </div>
                           </div>
                        </div>
                        <div class="swiper-slide">
                           <div class="col-lg-4">
                              <div class="team-member">
                                 <img class="mx-auto rounded-circle"
                                    src="/resources/programstyle/img/최소영.png" alt="..." />
                                 <h4>최소영</h4>
                                 <p class="text-muted">에어로빅 트레이너</p>
                                 <a class="btn btn-dark btn-social mx-2"
                                    href="https://twitter.com/"
                                    aria-label="Parveen Anand Twitter Profile"><i
                                    class="fab fa-twitter"></i></a> <a
                                    class="btn btn-dark btn-social mx-2"
                                    href="https://facebook.com/"
                                    aria-label="Parveen Anand Facebook Profile"><i
                                    class="fab fa-facebook-f"></i></a> <a
                                    class="btn btn-dark btn-social mx-2"
                                    href="https://www.linkedin.com/"
                                    aria-label="Parveen Anand LinkedIn Profile"><i
                                    class="fab fa-linkedin-in"></i></a>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>

               </div>
               <div class="row">
                  <div class="col-lg-8 mx-auto text-center">
                     <p class="large text-muted">
                        <strong>우리동네 올림픽 트레이너들은 회원님들의 건강을 책임지고<br>운동에 재미를
                           붙이며 운동을 진정으로 즐길 수 있도록 최선을 다하겠습니다.
                        </strong>
                     </p>
                  </div>
               </div>
            </div>
            <!-- 3개추가 끝 -->

            <!-- 포트폴리오에서 사진 누르면 들어가게 만들어주는것 -->
            <div class="portfolio-modal modal fade" id="portfolioModal1"
               tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="close-modal" data-bs-dismiss="modal">
                        <img src="/resources/programstyle/img/close-icon.svg"
                           alt="Close modal" />
                     </div>
                     <div class="container">
                        <div class="row justify-content-center">
                           <div class="col-lg-8">
                              <div class="modal-body">
                                 <!-- Project details-->
                                 <h2 class="text-uppercase">요가</h2>
                                 <p class="item-intro text-muted">
                                    명상과 호흡, 스트레칭이 어우러져 진행되는 운동으로 신체와 정신을 함께 단련하여<br> 심신 안정에
                                    도움이 되는 전신운동입니다.
                                 </p>
                                 <img class="img-fluid d-block mx-auto"
                                    src="/resources/programstyle/img/요가2.jpg" alt="..." />
                                 <p>
                                    (우리동네 올림픽 요가 종류)<br> 핫요가, 힐링요가, 파워요가, 비크람요가, 하타요가,
                                    빈야사요가, 플로우요가, 밴드요가, 이넥스요가, 스텝요가, 비트요가, 아디다스요가, 지바트마요가, 코어요가,
                                    아쉬탕가요가, 골반교정요가, 이지요가, 밸런스요가, 스피노요가
                                 </p>

                                 <button class="btn btn-primary btn-xl text-uppercase"
                                    data-bs-dismiss="modal" type="button">
                                    <i class="fas fa-xmark me-1"></i> 닫기
                                 </button>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Portfolio item 2 modal popup-->
            <div class="portfolio-modal modal fade" id="portfolioModal2"
               tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="close-modal" data-bs-dismiss="modal">
                        <img src="/resources/programstyle/img/close-icon.svg"
                           alt="Close modal" />
                     </div>
                     <div class="container">
                        <div class="row justify-content-center">
                           <div class="col-lg-8">
                              <div class="modal-body">
                                 <!-- Project details-->
                                 <h2 class="text-uppercase">스피닝</h2>
                                 <p class="item-intro text-muted">
                                    강사의 리드에 따라 하나의 그룹이 사이클링 훈련 시스템으로 진행되며 신나는 음악과 함께 다양한 방법으로 실내
                                    자전거를 타며 그룹 전체가 일체감을 느끼는 운동입니다. 유산소운동과 근력운동 모두 효과적이며 스트레스
                                    발산에도<br> 매우 도움이 됩니다.
                                 </p>
                                 <img class="img-fluid d-block mx-auto"
                                    src="/resources/programstyle/img/스피닝2.jpg" alt="..." />
                                 <p></p>

                                 <button class="btn btn-primary btn-xl text-uppercase"
                                    data-bs-dismiss="modal" type="button">
                                    <i class="fas fa-xmark me-1"></i> 닫기
                                 </button>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Portfolio item 3 modal popup-->
            <div class="portfolio-modal modal fade" id="portfolioModal3"
               tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="close-modal" data-bs-dismiss="modal">
                        <img src="/resources/programstyle/img/close-icon.svg"
                           alt="Close modal" />
                     </div>
                     <div class="container">
                        <div class="row justify-content-center">
                           <div class="col-lg-8">
                              <div class="modal-body">
                                 <!-- Project details-->
                                 <h2 class="text-uppercase">다이어트 댄스</h2>
                                 <p class="item-intro text-muted">비트감 있는 음악에 맞춰 쉽고 반복되는
                                    동작을 진행하여 자연스럽게 유산소운동을 진행할 수 있습니다. 열량 소모가 크기 때문에 다이어트와 전신운동에
                                    효과적인 운동입니다.</p>
                                 <img class="img-fluid d-block mx-auto"
                                    src="/resources/programstyle/img/다이어트댄스2.jpg" alt="..." />
                                 <p></p>

                                 <button class="btn btn-primary btn-xl text-uppercase"
                                    data-bs-dismiss="modal" type="button">
                                    <i class="fas fa-xmark me-1"></i> 닫기
                                 </button>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Portfolio item 4 modal popup-->
            <div class="portfolio-modal modal fade" id="portfolioModal4"
               tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="close-modal" data-bs-dismiss="modal">
                        <img src="/resources/programstyle/img/close-icon.svg"
                           alt="Close modal" />
                     </div>
                     <div class="container">
                        <div class="row justify-content-center">
                           <div class="col-lg-8">
                              <div class="modal-body">
                                 <!-- Project details-->
                                 <h2 class="text-uppercase">줌바댄스</h2>
                                 <p class="item-intro text-muted">
                                    에어로빅에 라틴댄스를 섞은 줌바댄스, 쉽고 반복적인 동작이 많으며 칼로리 소비가 커<br>다이어트에
                                    효과적인 운동입니다.
                                 </p>
                                 <img class="img-fluid d-block mx-auto"
                                    src="/resources/programstyle/img/줌바2.jpg" alt="..." />
                                 <p></p>

                                 <button class="btn btn-primary btn-xl text-uppercase"
                                    data-bs-dismiss="modal" type="button">
                                    <i class="fas fa-xmark me-1"></i> 닫기
                                 </button>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Portfolio item 5 modal popup-->
            <div class="portfolio-modal modal fade" id="portfolioModal5"
               tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="close-modal" data-bs-dismiss="modal">
                        <img src="/resources/programstyle/img/close-icon.svg"
                           alt="Close modal" />
                     </div>
                     <div class="container">
                        <div class="row justify-content-center">
                           <div class="col-lg-8">
                              <div class="modal-body">
                                 <!-- Project details-->
                                 <h2 class="text-uppercase">필라테스</h2>
                                 <p class="item-intro text-muted">
                                    부상당한 포로들의 건강과 재활을 위해 제1차 세계대전 당시 독일인 요제프 필라테스가 고안한 운동법으로 간단한<br>
                                    스트레칭부터 다양한 동작을 활용하여 통증 없이 근육 강화를 시켜주는 전신운동입니다.
                                 </p>
                                 <img class="img-fluid d-block mx-auto"
                                    src="/resources/programstyle/img/필라테스2.jpg" alt="..." />
                                 <p>
                                    (우리동네 올림픽 필라테스 종류)<br> 요가 필라테스, 필라테스 써클, 매트 필라테스, 소도구
                                    필라테스, 그룹 필라테스
                                 </p>

                                 <button class="btn btn-primary btn-xl text-uppercase"
                                    data-bs-dismiss="modal" type="button">
                                    <i class="fas fa-xmark me-1"></i> 닫기
                                 </button>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>


            <!-- Portfolio item 6 modal popup-->
            <div class="portfolio-modal modal fade" id="portfolioModal6"
               tabindex="-1" role="dialog" aria-hidden="true">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="close-modal" data-bs-dismiss="modal">
                        <img src="/resources/programstyle/img/close-icon.svg"
                           alt="Close modal" />
                     </div>
                     <div class="container">
                        <div class="row justify-content-center">
                           <div class="col-lg-8">
                              <div class="modal-body">
                                 <!-- Project details-->
                                 <h2 class="text-uppercase">에어로빅</h2>
                                 <p class="item-intro text-muted">댄스 형식의 유산소 운동으로 경쾌한 음악에
                                    맞추어 춤을 추면서 신체로 하여금 일정한 시간 동안에 많은 산소를 요구하는 운동입니다.</p>
                                 <img class="img-fluid d-block mx-auto"
                                    src="/resources/programstyle/img/에어로빅2.jpg" alt="..." />
                                 <p>
                                    (우리동네 올림픽 에어로빅 종류)<br> 에어로빅 댄스, 파워 에어로빅
                                 </p>

                                 <button class="btn btn-primary btn-xl text-uppercase"
                                    data-bs-dismiss="modal" type="button">
                                    <i class="fas fa-xmark me-1"></i> 닫기
                                 </button>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </section>
      </div>
   </section>


   <script>
      new Swiper('.swiper-container', {
         autoplay : {
            delay : 2000
         },
         loop : true,
         loopedSlides: 2,
         slidesPerView : 5,
         spaceBetween : 90,
         centeredSlides : true
      })
   </script>

   <%@ include file="../include/footer.jsp"%>
</body>
</html>