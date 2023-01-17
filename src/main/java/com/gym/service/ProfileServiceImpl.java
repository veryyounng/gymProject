package com.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.dao.ProfileDAO;
import com.gym.domain.FreeBoardVO;
import com.gym.domain.UserVO;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	private ProfileDAO pdao;
	
	@Override
	public List<FreeBoardVO> my_exercise() throws Exception {
		return pdao.my_exercise();
	}

	@Override
	public FreeBoardVO my_exercise(int b_num) throws Exception {
		
		return pdao.my_exercise(b_num);
	}
	
}
