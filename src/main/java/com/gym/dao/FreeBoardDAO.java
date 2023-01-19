package com.gym.dao;

import java.util.List;

import com.gym.domain.FreeBoardVO;

public interface FreeBoardDAO {
   
   //게시물 총 갯수 세기
   public int getFreeCnt() throws Exception;
   
   //게시물 목록 보기
   public List<FreeBoardVO> getFreelist(int display,int PostpostNum) throws Exception;
   
   //게시물 내용 보기
   public FreeBoardVO getFreeDetail(int b_num) throws Exception;

}