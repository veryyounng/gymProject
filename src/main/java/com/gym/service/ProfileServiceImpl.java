package com.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.dao.ProfileDAO;
import com.gym.domain.FreeBoardVO;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	private ProfileDAO pdao;

//	마이페이지(자게) 게시글 총 개수
	@Override
	public int getMyFreeCnt() throws Exception {
		return pdao.getMyFreeCnt();
	}

//	마이페이지(자게) 게시글 목록
	@Override
	public List<FreeBoardVO> getMyFreeList(String b_writer, int displayPost, int postNum) throws Exception {
		return pdao.getMyFreeList(b_writer, displayPost, postNum);
	}

//	마이페이지(자게) 게시글 조회

//	마이페이지(자게) 수정용 게시글 조회

//	마이페이지(자게) 게시글 작성

//	마이페이지(자게) 게시글 수정

//	마이페이지(자게) 게시글 삭제
	@Override
	public void myFreeDelete(int b_num) throws Exception {
		pdao.myFreeDelete(b_num);
	}

//	마이페이지(자게) 게시글 일괄 삭제
	@Override
	public void myFreeDeleteAll(String b_writer) throws Exception {
		pdao.myFreeDeleteAll(b_writer);
	}

//	마이페이지(자게) 댓글 조회

//	마이페이지(자게) 댓글 삭제

//	마이페이지(자게) 댓글 일괄 삭제	

}
