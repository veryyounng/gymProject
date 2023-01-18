package com.gym.ex_board.service;

import java.util.List;

import com.gym.ex_board.vo.Ex_BoardVO;

public interface Ex_BoardService {

	//게시물 목록
	public List<Ex_BoardVO> getList() throws Exception;
	
	//게시물 작성
	public void write(Ex_BoardVO evo) throws Exception;
	
	
	
}
