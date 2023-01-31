package com.gym.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.domain.FreeBoardVO;
import com.gym.domain.UserVO;
import com.gym.ex_board.vo.Ex_BoardVO;

@Repository
public class ProfileDAOImpl implements ProfileDAO{
	
	@Autowired
	public SqlSession sql;
	
	private static String namespace = "com.gym.mappers.profile";
	
//	마이페이지(자게) 게시글 목록
	@Override
	public List<FreeBoardVO> my_freeboard() throws Exception {
		return sql.selectList(namespace + ".getFreeList");
	}
	
//	마이페이지(운지공) 게시글 목록
	@Override
	public List<Ex_BoardVO> my_exercise() throws Exception {
//		namespace.id
		return sql.selectList(namespace + ".getExList");
	}
	
//	마이페이지(운지공) 게시글 조회
	@Override
	public Ex_BoardVO my_exercise(int ex_num) throws Exception {
		return sql.selectOne(namespace + ".getExDetail", ex_num);
	}
	
//	마이페이지(운지공) 게시글 수정
	@Override
	public void my_exercise_modify(Ex_BoardVO ex) throws Exception {
		sql.update(namespace + ".my_exercise_modify", ex);
	}
	
//	마이페이지(운지공) 게시글 삭제
	@Override
	public void my_exercise_delete(int ex_num) throws Exception {
		sql.delete(namespace + ".my_exercise_delete", ex_num);
	}
	
}
