<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 사이드바 시작 -->
    <div class="side-bar">
      <div class="mypage">
        <h4 class="h4">마이페이지</h4>
        <ul>
          <li><a href="${path}/profile/profile_check">프로필 보기</a></li>
          <li><a href="${path}/profile/profile_modify">프로필 수정</a></li>
          <li><a href="${path}/profile/profile_pw_modify">비밀번호 수정</a></li>
          <li><a href="${path}/profile/profile_delete_user">회원 탈퇴</a></li>
        </ul>
      </div>

      <div class="reservation"> 
        <h4 class="h4">예약</h4>
        <ul>
          <li><a href="${path}/profile/my_reserve_now?num=1">예약 현황</a></li>
          <li><a href="${path}/profile/my_reserve_past?num=1">예약 내역</a></li>
        </ul>
      </div>

      <div class="myboard">
        <h4 class="h4">내 글</h4>
        <ul>
          <li><a href="${path}/profile/my_free?num=1">자유 게시판</a></li>
          <li><a href="${path}/profile/my_exe?num=1">운동지식 공유</a></li>
        </ul>
      </div>

    </div>
    <!-- 사이드바 끝 -->