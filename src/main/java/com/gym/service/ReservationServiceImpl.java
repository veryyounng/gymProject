package com.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.dao.ReservationDAO;
import com.gym.domain.ReservationVO;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	private ReservationDAO dao;
	
	@Override
	public List<ReservationVO> getList(String rv_date) {
		return dao.getList(rv_date);
	}

	@Override
	public int addRV(String userid, int rv_num) {
		return dao.addRV(userid, rv_num);
	}

	@Override
	public void plusRV(int rv_num) {
		dao.plusRV(rv_num);
	}

	@Override
	public int findOverlap(String userid, int rv_num) {
		return dao.findOverlap(userid, rv_num);
	}

	@Override
	public int insertReservation(ReservationVO vo) {
		return dao.insertReservation(vo);
	}

	@Override
	public ReservationVO selectReservation(ReservationVO vo) {
		return dao.selectReservation(vo);
	}

	@Override
	public void cancelReservation(int rv_num) {
		dao.cancelReservation(rv_num);
	}

	@Override
	public int deleteReservation(int rv_num) {
		return dao.deleteReservation(rv_num);
	}
}
