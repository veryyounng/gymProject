package com.gym.dao;

import java.util.List;

import com.gym.domain.FreeBoardVO;
import com.gym.domain.UserVO;

public interface ProfileDAO {
//	마이페이지 게시글 조회
	public List<FreeBoardVO> my_exercise() throws Exception;
//	마이페이지 게시글 목록
	public FreeBoardVO my_exercise(int b_num) throws Exception;
//	마이페이지 게시글 수정
	public void my_exercise_modify(FreeBoardVO free);
//	마이페이지 게시글 삭제
	public void my_exercise_delete(int b_num);
}
