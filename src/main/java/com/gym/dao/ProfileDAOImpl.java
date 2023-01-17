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

	@Override
	public List<FreeBoardVO> my_exercise() throws Exception {
//		namespace.id
		return sql.selectList(namespace + ".getFreeList");
	}

	@Override
	public FreeBoardVO my_exercise(int b_num) throws Exception {
		
		return sql.selectOne(namespace + ".getFreeDetail", b_num);
	}
}
