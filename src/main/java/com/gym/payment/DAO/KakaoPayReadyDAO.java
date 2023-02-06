package com.gym.payment.DAO;

import com.gym.domain.KakaoPayReadyVO;

public interface KakaoPayReadyDAO {
	
	// 상품정보 가져오기
	public KakaoPayReadyVO getProduct(String proNum) throws Exception;
	
	
}
