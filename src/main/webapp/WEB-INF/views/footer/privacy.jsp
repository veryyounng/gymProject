<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="shortcut icon" href="${cp}/resources/img/파비콘.png" type="image/x-icon">
  <title>우리동네 올림픽</title>
  <link rel="stylesheet" href="${cp}/resources/css/reset.css">
  <link rel="stylesheet" href="${cp}/resources/css/styles.css">
  <link rel="stylesheet" href="${cp}/resources/css/policy.css">
</head>
<body>
  <%@ include file="../include/header.jsp" %>
  <section>

    <!-- 개발코드 시작 -->
    <div class="banana">
      <div class="banana_body">
        <div class="title_box">
          <h2>개인정보 처리방침</h2>
        </div>
        <div class="main_box">
          &lt;(주)우리동네 올림픽&gt; (이하 '회사'라 한다.)는 「개인정보보호법」 및 「정보통신망 이용촉진 및 정보보호 등에 관한
          법률」에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.<br><br>

          1. 개인정보의 수집·이용 목적, 수집하는 개인정보의 항목, 보유&middot;이용기간<br>

          2. 개인정보의 제3자 제공<br>

          3. 개인정보의 보유·이용 기간 및 파기<br>

          4. 개인정보 취급 위탁<br>

          5. 쿠키(cookie)의 운용<br>

          6. 이용자 및 법정대리인의 권리와 그 행사방법<br>

          7. 개인정보 보호책임자 및 담당자 정보<br>

          8. 개인정보처리방침의 변경 사항<br><br>

          1. 개인정보의 수집·이용 목적, 수집하는 개인정보의 항목, 보유&middot;이용기간<br>
          <table class="table">
            <colgroup>
              <col style="width:15%">
              <col style="width:20%">
              <col>
              <col style="width:30%">
            </colgroup>
            <tbody>
              <tr>
                <th>회원구분</th>
                <th>이용목적</th>
                <th>수집항목</th>
                <th>
                  <div><strong>보유&middot;이용기간</strong></div>
                </th>
              </tr>
              <tr>
                <td class="txt_center" align="center">신규회원</td>
                <td class="txt_center" align="left">스포애니 회원관리</td>
                <td class="txt_center" align="left">이메일, 이름, 휴대폰번호, 생년월일,<br> 성별, 주소
                  ,결제정보</td>
                <td rowspan="3" align="left">
                  <div style="font-size:1.2em"><strong>탈퇴 신청시 까지<br>
                      또는 서비스 이용 중단 후 3년<br>
                      <br>
                      *서비스 이용 중단 기준<br>
                      1. 회원권 종료일<br>
                      2. 마지막 로그인</strong></div>
                </td>
              </tr>
              <tr>
                <td class="txt_center" align="center">재등록 회원</td>
                <td class="txt_center" align="left">대금결제, 서비스 이용</td>
                <td class="txt_center" align="left">결제정보</td>
              </tr>
              <tr>
                <td class="txt_center" align="center">P.T</td>
                <td class="txt_center" align="left">대금결제, 서비스 이용</td>
                <td class="txt_center" align="left">결제정보</td>
              </tr>
            </tbody>
          </table>
          <br><br>

          3. 개인정보의 보유·이용 기간 및 파기<br>
          가. 회사는 이용자의 개인정보를 원칙적으로 고지 및 약정한 기간동안 보유 및 이용하며 개인정보의 수집 및 이용목적 달성하거나 이용자의 파기 요청이 있는 경우 지체없이
          파기합니다.<br>
          나. 아래의 개인정보에 대하여 명시한 기간 동안 보관합니다.<br><br>

          ① 관련법령에 따른 정보보유 사유<br>
          <table class="table">
            <colgroup>
              <col style="width:20%">
              <col style="">
            </colgroup>
            <tbody>
              <tr>
                <th>관련법률</th>
                <th>목적</th>
                <th>보유항목</th>
                <th>보유기간</th>
              </tr>
              <tr>
                <td class="txt_center" rowspan="3" align="left" valign="top">전자상거래 등에서의 <br>소비자 보호에 관한 법률 제6조</td>
                <td align="left" valign="top">소비자의 불만 또는 분쟁처리에 관한 기록</td>
                <td align="left" valign="top">온라인 (홈페이지 회원의 소리), 오프라인 (접수일자, 불만내용, 처리결과) 등</td>
                <td align="center">3년</td>
              </tr>
              <tr>
                <td align="left" valign="top">대금 결제 및 재화 등의 공급에 관한 기록</td>
                <td align="left" valign="top">금액, 날짜, 결제자 등</td>
                <td align="center">5년</td>
              </tr>
              <tr>
                <td align="left" valign="top">계약 또는 청약철회 등에 관한 기록</td>
                <td align="left" valign="top">처리일자, 철회자, 철회여부 등</td>
                <td align="center">5년</td>
              </tr>
              <tr>
                <td class="txt_center" rowspan="2" align="left" valign="top">국세기본법 제85조의 3</td>
                <td align="left" valign="top">국세 부과 제척기간 계산</td>
                <td align="left" valign="top">국세 증빙자료</td>
                <td align="center">10년</td>
              </tr>
              <tr>
                <td align="left" valign="top">국세징수권 등 소멸시효 계산</td>
                <td align="left" valign="top">과세표준과 세액의 신고자료 등</td>
                <td align="center">5년</td>
              </tr>
              <tr>
                <td align="left" valign="top">부가가치세법 제71조</td>
                <td align="left" valign="top">장부, 세금계산서, 영수증 등</td>
                <td align="left" valign="top">부가가치세의 과세표준과 세액의 신고자료 등</td>
                <td align="center">5년</td>
              </tr>
              <tr>
                <td align="left" valign="top">전자금융거래법 제22조</td>
                <td align="left" valign="top">전자금융 거래기록 확인</td>
                <td align="left" valign="top">전자금융거래에 관한 기록, 상대방에 관한 정보 등</td>
                <td align="center">5년</td>
              </tr>
            </tbody>
          </table>
          <br><br>


          4. 개인정보 취급 위탁<br>
          가. 회사는 원활하고 향상된 서비스를 제공하기 위해 다음과 같이 개인정보를 위탁합니다.<br>
          <table class="table">
            <colgroup>
              <col style="width:20%">
              <col style="">
            </colgroup>
            <tbody>
              <tr>
                <th>위탁하는 업무</th>
                <th>위탁항목</th>
                <th>수탁업체</th>
                <th>위탁기간</th>
                <th>담당자(연락처)</th>
              </tr>
              <tr>
                <td align="center">서버관리</td>
                <td align="center">홈페이지 서버 및 자료관리</td>
                <td align="center">(주)퓨처인포</td>
                <td align="center">2014년6월~</td>
                <td align="center">02-6340-2345</td>
              </tr>
            </tbody>
          </table>
          <br><br>


          5. 쿠키(cookie)의 운용<br>
          본사에서는 접속자의 쿠키를 사용하지 않습니다.
          <br><br>



          6. 이용자 및 법정대리인의 권리와 그 행사방법<br>
          가. 회원 및 법정대리인은 본사 또는 가입지점을 방문하여 개인정보를 열람, 정정, 삭제를 요청할 수 있으며 회원의 개인정보가 제3자에게 제공될 경우 회원은 본사 또는 가입지점을
          통하여
          파기를 요청할 수 있습니다. 회원카드번호, 생년월일, 성명 등은 정정할 수 없으나 개명으로 인한 성명은 예외적으로 허용할 수 있습니다. 정정 요청 시 정정 완료 시까지 해당
          개인정보를
          제3자에게 제공하지 않으며 기 제공한 개인정보는 정정을 요청합니다.<br>
          나. 이용자 및 법정대리인은 개인정보 처리정지를 요청할 수 있습니다. 단, 아래의 경우에 해당하는 경우 처리정지 요구를 거절할 수 있습니다<br>
          ① 법률에 특별한 규정이 있거나 법령상 의무를 준수하기 위하여 불가피한 경우<br>
          ② 다른 사람의 생명, 신체를 해할 우려가 있거나 다른 사람의 재산과 그 밖의 이익을 부당하게 침해할 우려가 있는 경우<br>
          ③ 개인정보를 처리하지 아니하면 정보주체와 약정한 서비스를 제공하지 못하는 등 계약의 이행이 곤란한 경우<br>
          다. 홈페이지 및 지점을 통해 개인정보의 수집·이용·제공 등에 대해 동의하신 내용을 언제든지 철회할 수 있습니다. 동의 철회는 가입지점을 방문하거나 전화, 서면 및 이메일로
          연락하시면
          지체 없이 개인정보의 삭제 등 필요한 조치를 하겠습니다. 다만, 법률 또는 약관의 규정에 따라 회사가 회원님의 개인정보를 보존하여야 하는 경우에는 처리가 제한될 수
          있습니다.<br><br>


          7. 개인정보 보호책임자 및 담당자 정보<br>
          <table class="table">
            <colgroup>
              <col style="width:20%">
              <col style="">
            </colgroup>
            <tbody>
              <tr>
                <th>구분</th>
                <th>부서</th>
                <th>직책</th>
                <th>성명</th>
                <th>연락처</th>
                <th>e-mail</th>
              </tr>
              <tr>
                <td>개인정보보호책임자</td>
                <td>영업지원</td>
                <td>이사</td>
                <td>최현영</td>
                <td>07043531668</td>
                <td>hychoi8998@koreait.com</td>
              </tr>
              <tr>
                <td>개인정보보호담당자</td>
                <td>전략기획팀</td>
                <td>팀장</td>
                <td>장승욱</td>
                <td>07043531681</td>
                <td>ymym455@koreait.com</td>
              </tr>
            </tbody>
          </table>
          <br><br>



          8. 고객은 개인정보침해로 인한 신고나 상담이 필요하신 경우 회사 또는 아래 기관에 문의하시기 바랍니다.<br>
          회사 영업지원부( 07043531668 )<br>
          개인정보분쟁조정위원회(www.kopico.or.kr / 02-405-5150)<br>
          한국인터넷진흥원 개인정보침해신고센터(privacy.kisa.or.kr / 국번 없이 118) <br>
          정보보호마크인증위원회 (www.eprivacy.or.kr / 02-580-0533~4)<br>
          대검찰청 첨단범죄수사과 (www.spo.go.kr / 02-3480-2000)<br>
          경찰청 사이버테러대응센터 (www.ctrc.go.kr / 02-392-0330<br><br>

          9. 개인정보처리방침의 변경 사항<br>
          ① 회사가 개인정보 처리방침을 변경하는 경우에는 변경 및 시행의 시기, 변경된 내용을 지속적으로 공개하며, 변경된 내용은 고객이 쉽게 확인할 수 있도록 변경 전·후를 비교할 수
          있도록
          공개합니다.<br><br>

          (제정) 2016. 12. 15 (최초 작성)


        </div>

      </div>
      <!-- 개발코드 끝 -->
  </section>
  
  <%@ include file="../include/footer.jsp" %>
</body>
</html>