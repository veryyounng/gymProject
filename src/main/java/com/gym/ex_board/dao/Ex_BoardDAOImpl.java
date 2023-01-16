package com.gym.ex_board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gym.ex_board.vo.Ex_BoardVO;

@Repository
public class Ex_BoardDAOImpl implements Ex_BoardDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.gym.mappers.Ex_Board";
	
	// 게시글 리스트
	@Override
	public List<Ex_BoardVO> getList() throws Exception {
		return sql.selectList(namespace + ".ex_list");
	}
}
