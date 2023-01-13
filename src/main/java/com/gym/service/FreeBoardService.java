package com.gym.service;

import java.util.List;

import com.gym.domain.FreeBoardVO;

public interface FreeBoardService {
   
   //게시물 전체 갯수 select
   public int getFreeCnt() throws Exception;
      
   //게시물 목록 보기
   public List<FreeBoardVO> getFreelist() throws Exception;
      
   //게시물 본문 보기
   public FreeBoardVO getFreeDetail(int b_num) throws Exception;
}