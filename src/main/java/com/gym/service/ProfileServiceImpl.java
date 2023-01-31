package com.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.dao.ProfileDAO;
import com.gym.domain.FreeBoardVO;
import com.gym.domain.UserVO;
import com.gym.ex_board.vo.Ex_BoardVO;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	private ProfileDAO pdao;
	
//	마이페이지(자게) 게시글 목록
	@Override
	public List<FreeBoardVO> my_freeboard() throws Exception {
		return pdao.my_freeboard();
	}
	
//	마이페이지(운지공) 게시글 목록
	@Override
	public List<Ex_BoardVO> my_exercise() throws Exception {
		return pdao.my_exercise();
	}

//	마이페이지(운지공) 게시글 조회
	@Override
	public Ex_BoardVO my_exercise(int ex_num) throws Exception {
		return pdao.my_exercise(ex_num);
	}

//	마이페이지(운지공) 게시글 수정
	@Override
	public void mymodify(Ex_BoardVO ex) throws Exception {
		pdao.my_exercise_modify(ex);
	}
	
//	마이페이지(운지공) 게시글 삭제
	@Override
	public void mydelete(int ex_num) throws Exception {
		pdao.my_exercise_delete(ex_num);
	}
	
}
