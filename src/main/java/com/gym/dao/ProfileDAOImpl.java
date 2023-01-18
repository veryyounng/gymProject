package com.gym.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.domain.FreeBoardVO;
import com.gym.domain.UserVO;

@Repository
public class ProfileDAOImpl implements ProfileDAO{
	
	@Autowired
	public SqlSession sql;
	
	private static String namespace = "com.gym.mappers.profile";
//	마이페이지 게시글 목록
	@Override
	public List<FreeBoardVO> my_exercise() throws Exception {
//		namespace.id
		return sql.selectList(namespace + ".getFreeList");
	}
	
//	마이페이지 게시글 조회
	@Override
	public FreeBoardVO my_exercise(int b_num) throws Exception {
		
		return sql.selectOne(namespace + ".getFreeDetail", b_num);
	}
	
//	마이페이지 게시글 수정
	@Override
	public void my_exercise_modify(FreeBoardVO free) {
		sql.update(namespace + ".my_exercise_modify", free);
	}
	
//	마이페이지 게시글 삭제
	@Override
	public void my_exercise_delete(int b_num) {
		sql.delete(namespace + ".my_exercise_delete", b_num);
	}
	
	
	
}
