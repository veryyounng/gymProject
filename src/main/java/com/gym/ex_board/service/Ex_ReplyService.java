package com.gym.ex_board.service;

import java.util.List;

import com.gym.ex_board.vo.Ex_ReplyVO;

public interface Ex_ReplyService {

	// 댓글 조회
	public List<Ex_ReplyVO> exc_list(int ex_num, int displayPost, int postNum) throws Exception; 
	
	// 댓글 작성
	public void exc_write(Ex_ReplyVO ervo) throws Exception;
	
	// 댓글 수정
	public void exc_modify(Ex_ReplyVO ervo) throws Exception;
	
	// 댓글 삭제
	public void exc_delete(int exc_num) throws Exception;
	
	// 댓글 갯수 구하기
	public int exc_count(int exc_num) throws Exception;
	
	// 단일 댓글 조회
	public Ex_ReplyVO exc_replySelect(Ex_ReplyVO ervo) throws Exception;
}

