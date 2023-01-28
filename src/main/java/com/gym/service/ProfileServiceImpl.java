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
	
//	마이페이지 게시글 목록
	@Override
	public List<FreeBoardVO> my_exercise() throws Exception {
		return pdao.my_exercise();
	}

//	마이페이지 게시글 조회
	@Override
	public FreeBoardVO my_exercise(int b_num) throws Exception {
		
		return pdao.my_exercise(b_num);
	}

//	마이페이지 게시글 수정
	@Override
	public void mymodify(FreeBoardVO free) {
		pdao.my_exercise_modify(free);
	}
	
//	마이페이지 게시글 삭제
	@Override
	public void mydelete(int b_num) {
		pdao.my_exercise_delete(b_num);
	}
	
}
