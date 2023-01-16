package com.gym.ex_board.dao;

import java.util.List;

import com.gym.ex_board.vo.Ex_BoardVO;

public interface Ex_BoardDAO {
	
	public List<Ex_BoardVO> getList() throws Exception;
	
}
