package com.gym.service;

import java.util.List;

import com.gym.domain.ReservationVO;

public interface ReservationService {

	// 예약일정 검색
		public List<ReservationVO> getList(String rv_date);
}
