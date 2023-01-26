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
 public List<FreeBoardVO> getFreelist(String keyword, String searchType, int displayPost, int postNum) throws Exception {
   return dao.getFreelist(keyword,searchType,displayPost,postNum);
 }

 //게시판 본문 보기
 @Override
 public FreeBoardVO getFreeDetail(int b_num) throws Exception {
   return dao.getFreeDetail(b_num);
 }
 
//게시물 조회수
 @Override
 public void FreeViewCnt(int b_num) throws Exception {
	 dao.FreeViewCnt(b_num);
}

 //게시물 글 작성
@Override
public void FreeWrite(FreeBoardVO vo) throws Exception {
	dao.Freewrite(vo);
	
}

//게시물 수정
@Override
public void FreeModify(FreeBoardVO vo) throws Exception {
	dao.FreeModify(vo);
	
}
//게시물 삭제
@Override
public void FreeDelete(int b_num) throws Exception {
	dao.FreeDelete(b_num);
}
//게시물 내용 검색
@Override
public int getSearchCnt(String keyword,String searchType) throws Exception {
	return dao.getSearchCnt(keyword,searchType);
}



}