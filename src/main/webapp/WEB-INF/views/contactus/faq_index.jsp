<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="icon" type="image/x-icon"
	href="${path}/resources/img/favicon.png" />
<link rel="stylesheet" href="${path}/resources/faqstyle/css/faq.css" />
<link rel="stylesheet"
	href="${path}/resources/faqstyle/css/awesome_min.css" />
<link rel="stylesheet" href="${path}/resources/faqstyle/css/faq2.css" />

<link rel="stylesheet"
	href="${path}/resources/faqstyle/fonts/FontAwesome.otf" />
<link rel="stylesheet"
	href="${path}/resources/faqstyle/fonts/fontawesome-webfont.eot" />
<link rel="stylesheet"
	href="${path}/resources/faqstyle/fonts/fontawesome-webfont.svg" />
<link rel="stylesheet"
	href="${path}/resources/faqstyle/fonts/fontawesome-webfont.ttf" />
<link rel="stylesheet"
	href="${path}/resources/faqstyle/fonts/fontawesome-webfont.woff" />
<link rel="stylesheet"
	href="${path}/resources/faqstyle/fonts/fontawesome-webfont.woff2" />

<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">


<link rel="stylesheet" href="${path}/resources/css/styles.css">
<style>
	a{
		text-decoration : none !important;
	}
</style>
<title>자주하는 질문</title>
</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<%@ include file="../include/header.jsp"%>
	<div class="banana"></div>



	<section class="module">
		<div class="container">
			<div class="row mb-60">
				<div class="col-sm-8 col-sm-offset-2">
					<form role="form">

						<div class="qs">
							<h1>FAQ</h1>
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-8 col-sm-offset-2">
					<div role="tabpanel">
						<ul class="nav nav-tabs font-alt" role="tablist">

							<li class="active"><a href="#support" data-toggle="tab"><span
									class="icon-tools-2"></span>자주하는질문</a></li>

						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="support">

								<!-- 제목,답변 하나로된것 -->
								<div class="panel-group" id="accordion">
									<!-- -------------------------------------------- -->
									<!-- 자주는하는질문 제목과 답변묶인것 -->
									<div class="panel panel-default">
										<!-- 자주하는질문 제목 -->
										<div class="panel-heading">
											<h4 class="panel-title font-alt">
												<a class="collapsed" data-toggle="collapse"
													data-parent="#accordion" href="#support1">G.X 프로그램이
													뭔가요?</a>
											</h4>
										</div>

										<!-- 자주하는질문 답변박스 -->
										<div class="panel-collapse collapse" id="support1">
											<!-- 자주하는질문 답변 -->
											<div class="panel-body">
												G.X란 그룹 엑서사이즈(Group exercise)의 약자로 요가, 필라테스, 댄스 등 다양한 단체 운동
												프로그램입니다. <br>
												<br> 더욱 만족도 높은 수업을 제공해 드리기 위하여 예약제로 운영되고 있으며, 예약 방식은 지점
												별로 상이할 수 있습니다.
											</div>
										</div>
									</div>
									<!-- -------------------------------------------- -->
									<!-- 자주는하는질문 제목과 답변묶인것 -->
									<div class="panel panel-default">
										<!-- 자주하는질문 제목 -->
										<div class="panel-heading">
											<h4 class="panel-title font-alt">
												<a class="collapsed" data-toggle="collapse"
													data-parent="#accordion" href="#support2">P.T가 뭔가요?</a>
											</h4>
										</div>

										<!-- 자주하는질문 답변박스 -->
										<div class="panel-collapse collapse" id="support2">
											<!-- 자주하는질문 답변 -->
											<div class="panel-body">
												P.T는 퍼스널 트레이닝(Personal Training)의 약자로 회원님의 체형, 체력, 운동 경력, 질병
												유무 등과 같은 신체 정보뿐만 아니라 다이어트, 체력 증진, 근력 강화, 재활운동 등의 운동 목적과
												회원님께서 지닌 잘못된 생활 습관이나 고민, 심리적인 상태까지 고려하여 회원님만을 위한 운동프로그램과 운동
												방향을 함께 설정하고 목표를 이루실 수 있도록 이끌어 드리는 과정입니다. <br>
												<br> 우리동네 올림픽에서는 체계적인 교육을 받은 트레이너들이 정형화된 프로그램이 아닌 회원님의,
												회원님에 의한, 회원님을 위한 맞춤 운동 프로그램을 처음부터 끝까지 제공해 드립니다.
											</div>
										</div>
									</div>
									<!-- -------------------------------------------- -->
									<!-- 자주는하는질문 제목과 답변묶인것 -->
									<div class="panel panel-default">
										<!-- 자주하는질문 제목 -->
										<div class="panel-heading">
											<h4 class="panel-title font-alt">
												<a class="collapsed" data-toggle="collapse"
													data-parent="#accordion" href="#support3">부가서비스(운동복/개인
													라커)를 꼭 신청해야 하나요?</a>
											</h4>
										</div>

										<!-- 자주하는질문 답변박스 -->
										<div class="panel-collapse collapse" id="support3">
											<!-- 자주하는질문 답변 -->
											<div class="panel-body">
												운동복과 개인 라커는 필수가 아닌 선택 서비스입니다. <br> 대여용 운동복을 이용하지 않으시는
												회원님께서는 개인 운동복을 꼭 지참해 주세요.<br> 개인 라커 내에는 운동화, 세면도구, 운동
												용품 등을 보관하실 수 있습니다. 개인 라커를 이용하지 않으시더라도 탈의실에 별도의 공용 라커가 마련되어
												있으니 당일 운동 시간 동안에는 공용 라커에 소지품을 보관해 주세요.
											</div>
										</div>
									</div>

									<!-- -------------------------------------------- -->
									<!-- 자주는하는질문 제목과 답변묶인것 -->
									<div class="panel panel-default">
										<!-- 자주하는질문 제목 -->
										<div class="panel-heading">
											<h4 class="panel-title font-alt">
												<a class="collapsed" data-toggle="collapse"
													data-parent="#accordion" href="#support4">기간 만료된 개인 라커
													짐은 언제까지 보관되나요?</a>
											</h4>
										</div>

										<!-- 자주하는질문 답변박스 -->
										<div class="panel-collapse collapse" id="support4">
											<!-- 자주하는질문 답변 -->
											<div class="panel-body">
												개인 라커 기간 만료 시 종료일에 맞춰 개인 소지품을 회수해야 하며 라커 종료일로부터 14일 경과 후에도
												소지품을 회수하지 않으실 경우 지점에서 라커 내 개인 소지품을 회수하여 별도로 보관합니다. 추가로 14일이
												경과한 후에도 소지품을 회수하지 않으실 경우 고지 없이 기부 또는 폐기 등 적정한 방법으로 처분합니다. <br>
												따라서 라커 이용 종료일로부터 28일 경과 시에는 소지품을 폐기하오니, 반드시 기간 내에 소지품을 회수해
												주세요.
											</div>
										</div>
									</div>
									<!-- -------------------------------------------- -->

									<!-- 자주는하는질문 제목과 답변묶인것 -->
									<div class="panel panel-default">
										<!-- 자주하는질문 제목 -->
										<div class="panel-heading">
											<h4 class="panel-title font-alt">
												<a class="collapsed" data-toggle="collapse"
													data-parent="#accordion" href="#support5">주차 가능한가요?</a>
											</h4>
										</div>

										<!-- 자주하는질문 답변박스 -->
										<div class="panel-collapse collapse" id="support5">
											<!-- 자주하는질문 답변 -->
											<div class="panel-body">
												지점별로 건물 사정에 따라 주차 가능 여부와 무료 주차 지원 시간이 상이합니다.<br> 우리동네
												올림픽 홈페이지를 통해 이용을 원하시는 지점의 주차 정보를 확인하실 수 있으며, 더 자세한 정보는 이용하고자
												하시는 지점으로 문의해 주세요.
											</div>
										</div>
									</div>


									<!-- -------------------------------------------- -->
									<!-- 자주는하는질문 제목과 답변묶인것 -->
									<div class="panel panel-default">
										<!-- 자주하는질문 제목 -->
										<div class="panel-heading">
											<h4 class="panel-title font-alt">
												<a class="collapsed" data-toggle="collapse"
													data-parent="#accordion" href="#support6">우리동네 올림픽 운영
													시간이 어떻게 되나요?</a>
											</h4>
										</div>

										<!-- 자주하는질문 답변박스 -->
										<div class="panel-collapse collapse" id="support6">
											<!-- 자주하는질문 답변 -->
											<div class="panel-body">
												우리동네 올림픽 Fitness Center Brand 전지점은 평일 24시간, 연중무휴 오픈을 원칙으로 운영
												중입니다. 단, 센터 사정으로 부득이하게 시설 및 운영시간 등이 조정되거나 변경될 수 있으며 회원님들께 사전
												공지해드립니다. <br>
												<br> (※ 전염병 등 특수한 상황에서는 정부의 정책에 따라 운영 제한 및 지침 변경될 수 있음)
												<br>
												<br> (우리동네 올림픽 Fitness Center Brand 운영시간) <br>
												<br> 평일 : 24시간 <br> 토요일(공휴일 전일) : 0시 ~ 23시 마감 <br>
												일요일(공휴일) : 10시 ~ 18시
											</div>
										</div>
									</div>

									<!-- -------------------------------------------- -->
									<!-- 자주는하는질문 제목과 답변묶인것 -->
									<div class="panel panel-default">
										<!-- 자주하는질문 제목 -->
										<div class="panel-heading">
											<h4 class="panel-title font-alt">
												<a class="collapsed" data-toggle="collapse"
													data-parent="#accordion" href="#support7">개인 라커 사용기간 만료
													시에는 물품을 언제까지 보관하나요?</a>
											</h4>
										</div>

										<!-- 자주하는질문 답변박스 -->
										<div class="panel-collapse collapse" id="support7">
											<!-- 자주하는질문 답변 -->
											<div class="panel-body">"이용 기간 종료 후 14일 경과 후에도 이용자가 소지품
												미회수 시 사업자는 사물함에 보관 중인 소지품을 회수하여 따로 보관할 수 있고, 그때로부터 다시 14일 경과
												후에도 이용자의 소지품을 미회수 시 사업자는 위 보관품을 폐기 등 적정한 방법으로 처분할 수 있습니다."</div>
										</div>
									</div>

									<!-- -------------------------------------------- -->
									<!-- 자주는하는질문 제목과 답변묶인것 -->
									<div class="panel panel-default">
										<!-- 자주하는질문 제목 -->
										<div class="panel-heading">
											<h4 class="panel-title font-alt">
												<a class="collapsed" data-toggle="collapse"
													data-parent="#accordion" href="#support8">운동을 처음 해보는데,
													어떻게 운동해야 하는지 모르겠어요.</a>
											</h4>
										</div>

										<!-- 자주하는질문 답변박스 -->
										<div class="panel-collapse collapse" id="support8">
											<!-- 자주하는질문 답변 -->
											<div class="panel-body">
												걱정하지 않으셔도 됩니다! <br> 우리동네 올림픽 신규 회원 등록 시, 전문적인 트레이너의 1:1
												운동 지도 2회를 제공해 드리고 있습니다. 뿐만 아니라, 센터 내에 상주하는 트레이너가 친절하게 도와드리고
												있으니 부담 갖지 마시고 언제라도 편하게 트레이너 및 데스크에 문의해 주세요.
											</div>
										</div>
									</div>

									<!-- -------------------------------------------- -->
									<!-- 자주는하는질문 제목과 답변묶인것 -->
									<div class="panel panel-default">
										<!-- 자주하는질문 제목 -->
										<div class="panel-heading">
											<h4 class="panel-title font-alt">
												<a class="collapsed" data-toggle="collapse"
													data-parent="#accordion" href="#support9">개인적으로 준비해야 할
													부분이 있을까요?</a>
											</h4>
										</div>

										<!-- 자주하는질문 답변박스 -->
										<div class="panel-collapse collapse" id="support9">
											<!-- 자주하는질문 답변 -->
											<div class="panel-body">
												1) 샤워 용품 센터에서는 수건과 비누를 제공하고 있습니다. 평소 사용하시는 샤워 용품이 있으시면 개인 지참
												부탁드립니다. <br>
												<br> 2) 실내 전용 운동화 신고 오신 운동화는 센터 내에서 착용하실 수 없기 때문에, 실내
												전용 운동화를 반드시 준비해주시기 바랍니다. <br>
												<br> 3) 개인 운동복 추가로, 대여용 운동복을 신청하지 않으신 경우에는 개인 운동복도 함께
												준비해주세요.
											</div>
										</div>
									</div>
									<!-- -------------------------------------------- -->

									<!-- 자주는하는질문 제목과 답변묶인것 -->
									<div class="panel panel-default">
										<!-- 자주하는질문 제목 -->
										<div class="panel-heading">
											<h4 class="panel-title font-alt">
												<a class="collapsed" data-toggle="collapse"
													data-parent="#accordion" href="#support10">사회적 거리두기 해제로
													지점 이용에 변동 사항이 있나요? (22.10.01 기준)</a>
											</h4>
										</div>

										<!-- 자주하는질문 답변박스 -->
										<div class="panel-collapse collapse" id="support10">
											<!-- 자주하는질문 답변 -->
											<div class="panel-body">
												1. 사회적 거리두기 해제로 우리동네 올림픽 전지점 24시간 운영이 재개되었습니다!! (22.04.18) <br>
												(우리동네 올림픽 Fitness Center Brand 정상 운영 시간 안내) 평일 : 24시간

												토요일(공휴일 전일) : 0시 ~ 23시 일요일(공휴일) : 10시 ~ 18시 <br>
												<br> 2. 시설 이용 시 실내체육시설업 방역 수칙을 준수해 주셔야 하며, 미준수 시 이용이
												제한될 수 있습니다. (22.10.01 기준) <br> - 탈의실 포함 센터 내 모든 공간 마스크
												착용 필수 - 시설 내 1M 거리두기 준수 - 음식 섭취 자제 - 가급적 개인 물품 사용 권장 - 구호,
												구령, 기합 등 자제 <br>
												<br> 3. 정부의 방역 지침에 따라 마스크 미착용 및 불량 착용 1회 적발 시 당일 이용이
												제한됩니다. <br>
												<br> 4. 고강도 운동(숨이 차오르는 운동)을 하실 경우 충분한 휴식시간을 가지시며 이용
												부탁드립니다. <br>
												<br> 5. 정부의 지침에 따라 운영시간 및 방역 수칙은 변동될 수 있습니다.
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>




	<div class="scroll-up">
		<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
	</div>

	<script src="/resources/faqstyle/js/jquery.js"></script>
	<script src="/resources/faqstyle/js/jquery_min.js"></script>
	<script src="/resources/faqstyle/js/jj.js"></script>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>