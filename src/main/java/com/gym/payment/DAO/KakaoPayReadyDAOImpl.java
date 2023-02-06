package com.gym.payment.DAO;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.gym.domain.KakaoPayReadyVO;

public class KakaoPayReadyDAOImpl implements KakaoPayReadyDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.gym.mappers.kakaopay";

	@Override
	public KakaoPayReadyVO getProduct(String proNum) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
}
