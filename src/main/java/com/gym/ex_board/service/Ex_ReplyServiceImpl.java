package com.gym.ex_board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gym.ex_board.dao.Ex_ReplyDAO;
import com.gym.ex_board.vo.Ex_ReplyVO;

@Service
public class Ex_ReplyServiceImpl implements Ex_ReplyService {
	
	@Inject
	private Ex_ReplyDAO dao;

	// 댓글 조회
	@Override
	public List<Ex_ReplyVO> exc_list(int ex_num) throws Exception {
		return dao.exc_list(ex_num);
	}

	// 댓글 작성
	@Override
	public void exc_write(Ex_ReplyVO ervo) throws Exception {
		dao.exc_write(ervo);
	}

	// 댓글 수정
	@Override
	public void exc_modify(Ex_ReplyVO ervo) throws Exception {
		dao.exc_modify(ervo);
	}

	// 댓글 삭제
	@Override
	public void exc_delete(Ex_ReplyVO ervo) throws Exception {
		dao.exc_delete(ervo);
	}

	@Override
	public Ex_ReplyVO exc_replySelect(Ex_ReplyVO ervo) throws Exception {
		return dao.exc_replySelect(ervo);
	}

}
