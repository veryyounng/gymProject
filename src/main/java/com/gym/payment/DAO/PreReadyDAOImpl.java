package com.gym.payment.DAO;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gym.payment.vo.PreReadyVO;

@Repository
public class PreReadyDAOImpl implements PreReadyDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.gym.mappers.kakaopay";
	
	// 제품정보 가져오기
	@Override
	public PreReadyVO getProduct(String proNum) throws Exception {
		return sql.selectOne(namespace + ".testready", proNum);
	}

	// 유저 회원권 기간 업데이트
	@Override
	public void upDate(String userId, Integer month) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("userId", userId);
		map.put("month", month);

		// null 또는 과거일자를 오늘로 업데이트
		sql.update(namespace + ".pastdate", map);
		
		// duedate 업데이트
		sql.update(namespace + ".upduedate", map); 
	}

}
