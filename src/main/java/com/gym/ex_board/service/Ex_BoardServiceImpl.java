package com.gym.ex_board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.ex_board.dao.Ex_BoardDAO;
import com.gym.ex_board.vo.Ex_BoardVO;

@Service
public class Ex_BoardServiceImpl implements Ex_BoardService {
	
	@Autowired
	private Ex_BoardDAO dao;

	@Override
	public List<Ex_BoardVO> getList() throws Exception {
		
		return dao.getList();
		
	}

	@Override
	public void write(Ex_BoardVO evo) throws Exception {
		dao.write(evo);
	}

}
