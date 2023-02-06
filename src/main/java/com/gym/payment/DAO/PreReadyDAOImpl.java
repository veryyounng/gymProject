package com.gym.payment.DAO;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gym.payment.vo.PreReadyVO;

@Repository
public class PreReadyDAOImpl implements PreReadyDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.gym.mappers.kakaopay";
	
	@Override
	public PreReadyVO getProduct(String proNum) throws Exception {
		return sql.selectOne(namespace + ".testready", proNum);
	}

}
