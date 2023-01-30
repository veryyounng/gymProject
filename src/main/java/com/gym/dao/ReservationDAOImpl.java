package com.gym.dao;

import java.util.HashMap;
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

	@Override
	public int addRV(String userid, int rv_num) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("userid", userid);
		data.put("rv_num", rv_num);
		return sql.insert(namespace+".addRV",data);
	}

	@Override
	public void plusRV(int rv_num) {
		sql.update(namespace+".plusRV",rv_num);
	}

	@Override
	public int findOverlap(String userid, int rv_num) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("userid", userid);
		data.put("rv_num", rv_num);
		return sql.selectOne(namespace+".findOverlap",data);
	}

	@Override
	public int insertReservation(ReservationVO vo) {
		return sql.insert(namespace+".insertReservation",vo);
	}

	@Override
	public ReservationVO selectReservation(ReservationVO vo) {
		return sql.selectOne(namespace+".selectReservation",vo);
	}
	
}
