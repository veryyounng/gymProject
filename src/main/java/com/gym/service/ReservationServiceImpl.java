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
	
}
