package com.gym.ex_board.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gym.ex_board.vo.Ex_ReplyVO;

@Repository
public class Ex_ReplyDAOImpl implements Ex_ReplyDAO {

	@Inject
	private SqlSession sql;
	
	String namespace = "com.gym.mappers.Ex_Reply";

	// 댓글 조회
	@Override
	public List<Ex_ReplyVO> exc_list(int ex_num, int displayPost, int postNum) throws Exception {
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		data.put("ex_num", ex_num);
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace + ".exc_ReplyList", data);
	}

	// 댓글 작성
	@Override
	public void exc_write(Ex_ReplyVO ervo) throws Exception {
		sql.insert(namespace + ".exc_ReplyWriter", ervo);
	}

	// 댓글 수정
	@Override
	public void exc_modify(Ex_ReplyVO ervo) throws Exception {
		sql.update(namespace + ".exc_ReplyModify", ervo);
	}

	// 댓글 삭제
	@Override
	public void exc_delete(int exc_num) throws Exception {
		sql.delete(namespace + ".exc_ReplyDelete", exc_num);
	}

	// 댓글 개수 구하기
	@Override
	public int exc_count(int ex_num) throws Exception {
		return sql.selectOne(namespace + ".exc_count", ex_num);
	}
	
	// 단일 댓글 조회
	@Override
	public Ex_ReplyVO exc_replySelect(Ex_ReplyVO ervo) throws Exception {
		return sql.selectOne(namespace + ".exc_replyselect", ervo);
	}

	// ajax 댓글 조회
	@Override
	public Ex_ReplyVO exc_modiview(int exc_num) throws Exception {
		return sql.selectOne(namespace + ".exc_modiview", exc_num);
	}

	// ajax 댓글 수정
	@Override
	public void exc_modireply(Ex_ReplyVO ervo) throws Exception {
		sql.update(namespace + ".exc_modireply", ervo);
	}

	
	
	
}
