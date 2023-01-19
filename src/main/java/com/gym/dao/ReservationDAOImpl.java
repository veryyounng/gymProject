package com.gym.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gym.domain.ReservationVO;

@Repository
public class ReservationDAOImpl implements ReservationDAO {

	@Autowired
	private SqlSession sql;
	
	private static String namespace = "com.gym.mappers.reservation";
	
	@Override
	public List<ReservationVO> getList(String rv_date) {
		return sql.selectList(namespace+".getList", rv_date);
	}
	
}
