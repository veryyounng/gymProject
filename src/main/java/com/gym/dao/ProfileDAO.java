package com.gym.dao;

import java.util.List;

import com.gym.domain.FreeBoardVO;
import com.gym.domain.UserVO;

public interface ProfileDAO {

	public List<FreeBoardVO> my_exercise() throws Exception;
	
	public FreeBoardVO my_exercise(int b_num) throws Exception;
}
