package com.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gym.dao.FreeBoardDAO;
import com.gym.domain.FreeBoardVO;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {

 @Autowired
 private FreeBoardDAO dao;

 //게시판 총 갯수 세기
@Override
public int getFreeCnt() throws Exception {
   return dao.getFreeCnt();
}

//게시판 목록 불러오기
@Override
public List<FreeBoardVO> getFreelist(int displayPost, int postNum) throws Exception {
   return dao.getFreelist(displayPost,postNum);
}

//게시판 본문 보기
@Override
public FreeBoardVO getFreeDetail(int b_num) throws Exception {
   return dao.getFreeDetail(b_num);
}


}