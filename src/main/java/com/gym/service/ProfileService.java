package com.gym.service;

import java.util.List;

import com.gym.domain.FreeBoardVO;

public interface ProfileService {
//	마이페이지 게시글 목록
	public List<FreeBoardVO> my_exercise() throws Exception;
	
//	마이페이지 게시글 조회
	public FreeBoardVO my_exercise(int b_num) throws Exception;

//	마이페이지 게시글 수정
	public void mymodify(FreeBoardVO free);

//	마이페이지 게시글 삭제
	public void mydelete(int b_num);

}
