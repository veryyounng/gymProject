package com.gym.service;

import java.util.List;

import com.gym.domain.FreeBoardVO;

public interface FreeBoardService {
   
   //게시물 총 갯수 세기
   public int getFreeCnt() throws Exception;
      
   //게시물 목록 보기
   public List<FreeBoardVO> getFreelist(String keyword, String searchType, int display,int PostpostNum) throws Exception;
      
   //게시물 본문 보기
   public FreeBoardVO getFreeDetail(int b_num) throws Exception;

   //게시물 조회수 누적
   public void FreeViewCnt (int b_num) throws Exception;
   
   //게시물 글쓰기
   public void FreeWrite (FreeBoardVO vo) throws Exception;
   
   //게시물 수정
   public void FreeModify (FreeBoardVO vo) throws Exception;
   
   //게시물 삭제
   public void FreeDelete (int b_num) throws Exception;

   //게시물 내용 검색
   public int getSearchCnt(String keyword, String searchType) throws Exception;
}