package com.gym.service;

import java.util.List;

import com.gym.domain.FreeBoardVO;

public interface ProfileService {

	public List<FreeBoardVO> my_exercise() throws Exception;
	
	public FreeBoardVO my_exercise(int b_num) throws Exception;

}
