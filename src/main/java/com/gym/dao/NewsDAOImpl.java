package com.gym.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.domain.FreeBoardVO;
import com.gym.domain.NoticeVO;

@Repository
public class NewsDAOImpl implements NewsDAO {
	
	@Autowired
	private SqlSession sql;
	private static String namespace = "com.gym.mapper.news";

	@Override
	public List<NoticeVO> getNotiNews() throws Exception {
		return sql.selectList(namespace+".getNotiNews");
		
	}

	@Override
	public List<FreeBoardVO> getFreeNews() throws Exception {
		return sql.selectList(namespace+".getFreeNews");
	}

}
