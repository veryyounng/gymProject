package com.gym.dao;

import java.util.List;

import com.gym.domain.FreeBoardVO;
import com.gym.domain.UserVO;
import com.gym.ex_board.vo.Ex_BoardVO;

public interface ProfileDAO {

//	마이페이지(자게) 게시글 조회
	public List<FreeBoardVO> my_freeboard() throws Exception;
	
//	마이페이지(운지공) 게시글 조회
	public List<Ex_BoardVO> my_exercise() throws Exception;
	
//	마이페이지(운지공) 게시글 목록
	public Ex_BoardVO my_exercise(int ex_num) throws Exception;
	
//	마이페이지(운지공) 게시글 수정
	public void my_exercise_modify(Ex_BoardVO ex) throws Exception;
	
//	마이페이지(운지공) 게시글 삭제
	public void my_exercise_delete(int ex_num) throws Exception;
}
