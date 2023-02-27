package com.gym.dao;

import java.util.List;

import com.gym.domain.ReservationVO;

public interface ReservationDAO {
	
	// 예약일정 검색
	public List<ReservationVO> getList(String rv_date);
	
	// 예약 활성화
	public int addRV(String userid, int rv_num);
	
	// 예약인원 ++
	public void plusRV(int rv_num);

	// 예약인원 --
	public void minusRV(int rv_num);
	
	// 이미 예약되어있는지 확인
	public int findOverlap(String userid, int rv_num);
	
	// 예약일정 만들기
	public int insertReservation(ReservationVO vo);

	// 이미 존재하는 예약이 있는지 확인
	public ReservationVO selectReservation(ReservationVO vo);
	
	// 예약일정 삭제하기 위한 예약한 사람들 예약취소
	public void cancelReservation(int rv_num);
	
	// 만들어진 예약일정 삭제
	public int deleteReservation(int rv_num);
}
