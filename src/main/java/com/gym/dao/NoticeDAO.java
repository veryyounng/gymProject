package com.gym.dao;

import java.util.List;

import com.gym.domain.NoticeVO;

public interface NoticeDAO {
	
	//게시물 전체 갯수 select
	public int getCnt() throws Exception;
	
	//게시물 목록보기
	public List<NoticeVO> getContent(int displayPost, int notice_num) throws Exception;
	
	//게시물 내용보기 
	public NoticeVO getDetail(int notice_num) throws Exception;
	
	//조회수 업데이트 
	public void notiViewCnt(int notice_num) throws Exception;
	
	//검색 게시물 갯수 
	public int getSearchCnt(String keyword) throws Exception; 
	
	//검색 게시물 목록보기
	public List<NoticeVO> getSearchList(int displayPost, int postNum, String keyword) throws Exception;
	
	//게시물 작성
	public void postWrite(NoticeVO nvo) throws Exception;
	
	//최신글 불러오기 
	public int getMaxNum() throws Exception; 
	
	//게시물 삭제
	public void notiDelete(int notice_num) throws Exception;

}
