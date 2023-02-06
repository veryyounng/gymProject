package com.gym.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gym.domain.UserVO;

public interface UserService {

//  회원가입
	public int join(UserVO vo) throws Exception;

//  id 중복 체크
	public int idchk(String userid) throws Exception;

//  회원정보 불러오기
	public void userlist(String userid) throws Exception;

//	회원정보 수정하기
	public int profile_modify(UserVO vo) throws Exception;
	 
//	비밀번호 수정하기
	public int pw_modify(UserVO vo) throws Exception;
	
//	회원 탈퇴
	public int delete_user(UserVO vo) throws Exception;

//	로그인
	boolean login(UserVO vo, HttpServletRequest req) throws Exception;

//	아이디 찾기
	public UserVO findId(String username, String email) throws Exception;

//	비밀번호 찾을 때 아이디랑 이메일 주소 확인하기
	public int findpw(String userid, String email) throws Exception;



}