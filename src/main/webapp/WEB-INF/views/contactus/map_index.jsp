<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오시는 길</title>
</head>
<link rel="stylesheet" href="${path}/resources/mapstyle/css/map.css" />
<link rel="stylesheet" href="${path}/resources/css/styles.css">

<body>
	<%@ include file="../include/header.jsp" %>

	<div class="banana">
		<div class="container">
			<div class="map_title">
				<p>오시는 길</p>
			</div>
			<div id="map" style="width: 100%; height: 350px;"></div>
			<!-- <p><em>지도를 클릭해주세요!</em></p> -->
			<div id="clickLatlng"></div>
			<script type="text/javascript">
                    window.kakao = window.kakao || {}, window.kakao.maps = window.kakao.maps || {}, window.daum && window.daum.maps ? window.kakao.maps = window.daum.maps : (window.daum = window.daum || {}, window.daum.maps = window.kakao.maps), function () {
                        function a() { if (E.length) { t(I[E.shift()], a).start() } else e() } function t(a, t) {
                            var e = document.createElement("script"); return e.charset = "utf-8", e.onload = t, e.onreadystatechange = function () { /loaded|complete/.test(this.readyState) && t() }, {
                                start: function () {
                                    e.src = a || "",
                                    document.getElementsByTagName("head")[0].appendChild(e), e = null
                                }
                            }
                        } function e() { for (; c[0];)c.shift()(); o.readyState = 2 } var o = kakao.maps = kakao.maps || {}; if (void 0 === o.readyState) o.onloadcallbacks = [], o.readyState = 0; else if (2 === o.readyState) return; o.VERSION = {
                            ROADMAP: "2212ejo", ROADMAP_SUFFIX: "", HYBRID: "2212ejo", SR: "3.00", ROADVIEW: "7.00", ROADVIEW_FLASH: "200402", BICYCLE: "6.00", USE_DISTRICT: "2212ejo",
                            SKYVIEW_VERSION: "160114", SKYVIEW_HD_VERSION: "160107"
                        }, o.RESOURCE_PATH = { ROADVIEW_AJAX: "//t1.daumcdn.net/roadviewjscore/core/css3d/200204/standard/1580795088957/roadview.js", ROADVIEW_CSS: "//t1.daumcdn.net/roadviewjscore/core/openapi/standard/211122/roadview.js" }; for (var n, r = "https:" == location.protocol ? "https:" : "http:", s = "", i = document.getElementsByTagName("script"), d = i.length; n = i[--d];)if (/\/(beta-)?dapi\.kakao\.com\/v2\/maps\/sdk\.js\b/.test(n.src)) { s = n.src; break } i = null; var c = o.onloadcallbacks, E = ["v3"], S = "", I = {
                            v3: r + "//t1.daumcdn.net/mapjsapi/js/main/4.4.8/kakao.js", services: r + "//t1.daumcdn.net/mapjsapi/js/libs/services/1.0.2/services.js",
                            drawing: r + "//t1.daumcdn.net/mapjsapi/js/libs/drawing/1.2.6/drawing.js", clusterer: r + "//t1.daumcdn.net/mapjsapi/js/libs/clusterer/1.0.9/clusterer.js"
                        }, _ = function (a) { var t = {}; return a.replace(/[?&]+([^=&]+)=([^&]*)/gi, function (a, e, o) { t[e] = o }), t }(s); S = _.appkey, S && (o.apikey = S), o.version = "4.4.8"; var R = _.libraries; if (R && (E = E.concat(R.split(","))), "false" !== _.autoload) { for (var d = 0, l = E.length; d < l; d++)!function (a) { a && document.write('<script charset="UTF-8" src="' + a + '"><\/script>') }(I[E[d]]); o.readyState = 2 } o.load = function (t) {
                            switch (c.push(t), o.readyState) {
                                case 0: o.readyState = 1, a(); break
                                    ; case 2: e()
                            }
                        }
                    }();
                </script>
			<script>
                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                        mapOption = {
                            center: new kakao.maps.LatLng(37.500025097407985, 127.03547057103023), // 지도의 중심좌표
                            level: 3 // 지도의 확대 레벨
                        };

                    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

                    // 지도를 클릭한 위치에 표출할 마커입니다
                    var marker = new kakao.maps.Marker({
                        // 지도 중심좌표에 마커를 생성합니다 
                        position: map.getCenter()
                    });
                    // 지도에 마커를 표시합니다
                    marker.setMap(map);

                    // 지도에 클릭 이벤트를 등록합니다
                    // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
                    kakao.maps.event.addListener(map, 'click', function (mouseEvent) {

                        // 클릭한 위도, 경도 정보를 가져옵니다 
                        var latlng = mouseEvent.latLng;

                        // 마커 위치를 클릭한 위치로 옮깁니다
                        marker.setPosition(latlng);

                        var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
                        message += '경도는 ' + latlng.getLng() + ' 입니다';

                        // var resultDiv = document.getElementById('clickLatlng'); 
                        // resultDiv.innerHTML = message;

                    });
                </script>

			<!-- 주소박스 -->
			<div class="map_txt">
				<p class="map_t1">
					<img src="/resources/mapstyle/img/map_ic.png" alt=""> 서울 강남구 테헤란로 146 (현익빌딩
					3,4층)
				</p>
				<div class="map_tr">
					<p class="clfix">
						<span> <img src="/resources/mapstyle/img/전화.png" alt="" class="map_t1">
							<span class="map_t1"> <b>TEL</b> <br> 02-1234-1234
						</span>
						</span>
						<!-- after -->
					</p>
				</div>
				<!-- after -->
			</div>
			<!-- 교통편 -->
			<div class="map_txt2">
				<p>교통편</p>
				<ul class="clfix">
					<li class="map_t1">
						<p class="map_t1">
							<img src="/resources/mapstyle/img/버스.png" alt="">
						</p> <span class="map_t1"> <b>버스</b> <br> 역삼역 하차
					</span>
					</li>
					<li class="map_t1">
						<p class="map_t1">
							<img src="/resources/mapstyle/img/지하철.png" alt="">
						</p> <span class="map_t1"> <b>지하철</b> <br> 역삼역 3번 출구 도보로
							1분
					</span>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>