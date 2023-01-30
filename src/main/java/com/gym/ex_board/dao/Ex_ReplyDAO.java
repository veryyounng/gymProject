package com.gym.ex_board.dao;

import java.util.List;

import com.gym.ex_board.vo.Ex_ReplyVO;

public interface Ex_ReplyDAO {

	// 댓글 조회
	public List<Ex_ReplyVO> exc_list(int ex_num) throws Exception;
	
	// 댓글 작성
	public void exc_write(Ex_ReplyVO ervo) throws Exception;
	
	// 댓글 수정
	public void exc_modify(Ex_ReplyVO ervo) throws Exception;
	
	// 댓글 삭제
	public void exc_delete(Ex_ReplyVO ervo) throws Exception;
	
	// 단일 댓글 조회
	public Ex_ReplyVO exc_replySelect(Ex_ReplyVO ervo) throws Exception;
	
}
