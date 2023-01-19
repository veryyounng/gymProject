package com.gym.dao;

import java.util.List;

import com.gym.domain.ReservationVO;

public interface ReservationDAO {
	
	// 예약일정 검색
	public List<ReservationVO> getList(String rv_date);
}
