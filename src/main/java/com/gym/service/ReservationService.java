package com.gym.service;

import java.util.List;

import com.gym.domain.ReservationVO;

public interface ReservationService {

		// 예약일정 검색
		public List<ReservationVO> getList(String rv_date);
		// 예약 하기
		public int addRV(String userid, int rv_num);
		// 예약인원 ++
		public void plusRV(int rv_num);
		// 이미 예약되어있는지 확인
		public int findOverlap(String userid, int rv_num);
}
